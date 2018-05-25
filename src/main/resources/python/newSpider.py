from bs4 import BeautifulSoup
from datetime import datetime
import re, requests, pymysql, threading, os, traceback
import sys

try:
    conn = pymysql.connect(host='127.0.0.1', port=3306, user='root', passwd='trsadmin', db='book', charset="utf8")
    cursor = conn.cursor()
except:
    print('\n错误：数据库连接失败')


# 返回指定页面的html信息
def getHTMLText(url):
    try:
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36'}
        r = requests.get(url, headers=headers)
        r.raise_for_status()
        r.encoding = r.apparent_encoding
        return r.text
    except:
        return ''
    # 返回指定url的Soup对象


def getSoupObject(url):
    try:
        html = getHTMLText(url)
        soup = BeautifulSoup(html, 'html.parser')
        return soup
    except:
        return ''
    # 获取该关键字在图书网站上的总页数


def getPageLength(webSiteName, url):
    try:
        soup = getSoupObject(url)
        if webSiteName == 'DangDang':
            a = soup('a', {'name': 'bottom-page-turn'})
            return a[-1].string
        elif webSiteName == 'Amazon':
            a = soup('span', {'class': 'pagnDisabled'})
            return a[-1].string
    except:
        print('\n错误：获取{}总页数时出错...'.format(webSiteName))
        return -1


# 根据关键字爬去当当网 图书信息 并存入数据库
def dangDangCrwal(keyword, num):

    count = 1
    length = int(getPageLength('DangDang', 'http://search.dangdang.com/?key={}'.format(keyword)))  # 总页数
    # tableName = 'db_{}_dangdang'.format(self.keyword)
    tableName = 'db_dangdang'
    try:
        # cursor.execute('create table {} (id int ,title text,prNow text,prPre text,author text,publish text,desc1 text,isbn text,link text,type text)'.format(tableName))
        print('\n提示,开始爬取当当网页面...')
        for i in range(1, int(length)):
            url = 'http://search.dangdang.com/?key={}&page_index={}'.format(keyword, i)
            soup = getSoupObject(url)
            lis = soup('li', {'class': re.compile(r'line'), 'id': re.compile(r'p')})
            for li in lis:
                # 标题+链接
                a = li.find_all('a', {'name': 'itemlist-title', 'dd_name': '单品标题'})
                # 现在的价格
                pn = li.find_all('span', {'class': 'search_now_price'})
                # 之前的价格
                pp = li.find_all('span', {'class': 'search_pre_price'})
                # 作者
                ar = li.find_all('a', {'name': 'itemlist-author', 'dd_name': '单品作者'})
                # 出版社
                pb = li.find_all('a', {'name': 'P_cbs', 'dd_name': '单品出版社'})
                # 描述
                dc = li.find_all('p', {'class': 'detail'})

                if not len(a) == 0:
                    link = a[0].attrs['href']
                    title = a[0].attrs['title'].strip()
                else:
                    link = 'NULL'
                    title = 'NULL'

                # ISBN号
                soup_link = getSoupObject(link)
                isbn_all = soup_link.find('ul', {'class': 'key clearfix'}).find_all('li')[8].text
                isbn = isbn_all.split("：")[1]

                if not len(pn) == 0:
                    prNow = pn[0].string
                else:
                    prNow = 'NULL'

                if not len(pp) == 0:
                    prPre = pp[0].string
                else:
                    prPre = 'NULL'

                if not len(pb) == 0:
                    publish = pb[0].attrs['title'].strip()
                else:
                    publish = 'NULL'

                if not len(ar) == 0:
                    author = ar[0].attrs['title'].strip()
                else:
                    author = 'NULL'

                if not len(dc) == 0:
                    desc = dc[0].get_text()
                else:
                    desc = 'NULL'

                sql = "insert into {} (title,prNow,prPre,author,publish,desc1,isbn,link,type,createdate) values ('{}','{}','{}','{}','{}','{}','{}','{}','{}','{}')".format(
                    tableName,
                    title,
                    prNow,
                    prPre,
                    author,
                    publish,
                    desc,
                    isbn,
                    link, keyword, datetime.now())
               
                cursor.execute(sql)
              
                count += 1

                conn.commit()
                if count == num:
                    break
            if count == num:
                break
		print(count)
    except:
        print(count)


class AmazonThread(threading.Thread):
    def __init__(self, keyword):
        threading.Thread.__init__(self)
        self.keyword = keyword

    def run(self):
        print('\n提示：开始爬取亚马逊数据...')
        count = 0
        length = getPageLength('Amazon', 'https://www.amazon.cn/s/keywords={}'.format(self.keyword))  # 总页数
        tableName = 'db_{}_amazon'.format(self.keyword)

        try:
            print('\n提示：正在创建Amazon表...')
            cursor.execute('create table {} (id int ,title text,prNow text,link text)'.format(tableName))

            print('\n提示：开始爬取亚马逊页面...')
            for i in range(1, int(length)):
                url = 'https://www.amazon.cn/s/keywords={}&page={}'.format(self.keyword, i)
                soup = getSoupObject(url)
                lis = soup('li', {'id': re.compile(r'result_')})
                for li in lis:
                    a = li.find_all('a', {'class': 'a-link-normal s-access-detail-page a-text-normal'})
                    pn = li.find_all('span', {'class': 'a-size-base a-color-price s-price a-text-bold'})
                    if not len(a) == 0:
                        link = a[0].attrs['href']
                        title = a[0].attrs['title'].strip()
                    else:
                        link = 'NULL'
                        title = 'NULL'

                    if not len(pn) == 0:
                        prNow = pn[0].string
                    else:
                        prNow = 'NULL'

                    sql = "insert into {} (id,title,prNow,link) values ({},'{}','{}','{}')".format(tableName, count,
                                                                                                   title, prNow, link)
                    cursor.execute(sql)
                    print('\r提示：正在存入亚马逊数据,当前处理id：{}'.format(count), end='')
                    count += 1

                    conn.commit()
        except:
            pass


# 根据关键字爬去京东的图书信息
def JDCrwal(keyword,num):
    count = 0
    try:

        tableName = 'db_jingdong'
        # print('\n提示：正在创建JD表...')
        # cursor.execute('create table {} (id int,title text,prNow text,pb text,isbn text,link text)'.format(tableName))
        print('\n提示,开始爬取京东页面...')
        for i in range(1, 20):
            url = 'https://search.jd.com/Search?keyword={}&page={}'.format(keyword, i)
            soup = getSoupObject(url)
            lis = soup('li', {'class': 'gl-item'})
            for li in lis:
                # 名称
                a = li.find_all('div', {'class': 'p-name'})
                # 价钱
                pn = li.find_all('div', {'class': 'p-price'})[0].find_all('i')

                if not len(a) == 0:
                    link = 'http:' + a[0].find_all('a')[0].attrs['href']
                    title = a[0].find_all('em')[0].get_text()
                else:
                    link = 'NULL'
                    title = 'NULL'

                if len( link ) > 128 :
                    link = 'TooLong'

                if not len(pn) == 0:
                    prNow = '￥' + pn[0].string
                else:
                    prNow = 'NULL'
                # 进入链接 爬取更多详情
                soup_link = getSoupObject(link)
                detail_all = soup_link('ul', {'id': 'parameter2'})
                # 出版社 有广告 判断过滤一下
                if not len(detail_all) == 0:
                    pb = detail_all[0].find_all('li')[0].get_text().split("：")[1].strip()
                    # ISBN号
                    isbn = detail_all[0].find_all('li')[1].get_text().split("：")[1].strip()

                else:
                    pb = 'NULL'
                    isbn = 'NULL'

                sql = "insert into {} (title,prNow,publish,isbn,link,createdate,type) " \
                      "values ('{}','{}','{}','{}','{}','{}','{}')".format(tableName, title, prNow, pb, isbn,
                                                                           link, datetime.now(), keyword)

                cursor.execute(sql)
               
                count += 1
                conn.commit()
                if num == count:
                    break
            if num == count:
                break
		print(count)
    except:
        print(count)


def closeDB():
    global conn, cursor
    conn.close()
    cursor.close()


def testcrwal(type, keyword, num):

    if type == 'jingdong':
        jdThread = JDCrwal(keyword,num)

    if type == 'dangdang':
        dangDangCrwal(keyword,num)
    closeDB()

    #os.system('pause')

testcrwal(sys.argv[1], sys.argv[2],sys.argv[3])
#testcrwal("jingdong", "python",10)