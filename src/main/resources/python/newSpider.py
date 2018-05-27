from bs4 import BeautifulSoup
from datetime import datetime
import re, requests, pymysql, json
import urllib
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

            if len(a) == 0:
                return 2
            else:
                return a[-1].string
        elif webSiteName == 'Amazon':
            a = soup('span', {'class': 'pagnDisabled'})
            return a[-1].string
    except:
        print('\n错误：获取{}总页数时出错...'.format(webSiteName))
        return -1


# 根据关键字爬去当当网 图书信息 并存入数据库
def dangDangCrwal(keyword, num,sortType):
    count = 1
    # sort_default 综合默认降序  sort_sale_amt_desc 按照销量降序
    # sort_score_desc 按照好评率降序  sort_pubdate_desc按照出版时间降序
    #  sort_xlowprice_asc按照价格升序  sort_xlowprice_desc 按照价格降序

    switcher = {
            "综合": "sort_default",
            "价格降序": "sort_xlowprice_desc",
            "价格升序": "sort_xlowprice_asc",
            "销售量": "sort_sale_amt_desc",
            "好评": "sort_score_descv",

        }
    sort_type = switcher.get(sortType,"sort_default")


    length = int(getPageLength('DangDang', 'http://search.dangdang.com/?key={}&sort_type={}'.format(keyword,sort_type)))  # 总页数
    print('http://search.dangdang.com/?key={}&sort_type={}'.format(keyword,sort_type))
    # tableName = 'db_{}_dangdang'.format(self.keyword)
    tableName = 'db_dangdang'
    try:
        # cursor.execute('create table {} (id int ,title text,prNow text,prPre text,author text,publish text,desc1 text,isbn text,link text,type text)'.format(tableName))
        print('\n提示：开始爬取当当网页面...')
        for i in range(1, int(length)):
            url = 'http://search.dangdang.com/?key={}&page_index={}&sort_type={}'.format(keyword, i, sort_type )

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

                #评论数
                review_count = li.find('a', {'name': 'itemlist-review' ,'dd_name' : '单品评论'})

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

                if not len(review_count) == 0:
                    review_count = review_count.get_text()
                else:
                    review_count = 'NULL'

                sql = "insert into {} (title,prNow,prPre,author,publish,desc1,isbn,review_count,link,type,createDate,sortType) values ('{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}')".format(
                    tableName,
                    title,
                    prNow,
                    prPre,
                    author,
                    publish,
                    desc,
                    isbn,
                    review_count,
                    link, keyword, datetime.now(),sortType)
                #print(sql)
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


# 根据关键字爬去京东的图书信息
def JDCrwal(keyword, num ,sortType):
    count = 0
    try:
        # 0:综合 1:价格降序 2:价格升序 3:销量降序 4:评论数降序 5：评论数升序 6：出版时间降序
        switcher = {
            "综合": 0,
            "价格降序": 1,
            "价格升序": 2,
            "销售量": 3,
            "好评": 4,

        }
        psort = switcher.get(sortType, "0")
        tableName = 'db_jingdong'
        # print('\n提示：正在创建JD表...')
        # cursor.execute('create table {} (id int,title text,prNow text,pb text,isbn text,link text)'.format(tableName))
        print('\n提示：开始爬取京东页面...')
        for i in range(1, 20):

            url = 'https://search.jd.com/Search?keyword={}&page={}&psort={}&enc=utf-8'.format(keyword, i , psort)
            print(url)
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

                if len(link) > 128:
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
                    # 商品编号
                    productId = detail_all[0].find_all('li')[3].get_text().split("：")[1].strip()
                else:
                    pb = 'NULL'
                    isbn = 'NULL'

                goodRateShow, goodCountStr=crwalJDcomment(productId)

                sql = "insert into {} (title,prNow,publish,isbn,link,goodRateShow,goodCountStr,createDate,type,sortType) " \
                  "values ('{}','{}','{}','{}','{}','{}','{}','{}','{}','{}')".format(tableName, title, prNow, pb, isbn,
                                                                       link ,goodRateShow,goodCountStr, datetime.now(), keyword,sortType)

                print(sql)
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

# 爬去京东的好评率 好评数 以及所有评论
def crwalJDcomment(productId):
    s = requests.session()

    url = 'https://sclub.jd.com/comment/productPageComments.action'
    data = {
        #'callback' : 'fetchJSON_comment98vv849',
        'productId' : productId,
        'score' : 0,
        'sortType': 5,
        'pageSize': 10,
        'isShadowSku': 0,
        'page': 0
    }

    flag = True

    while flag:
        t = s.get(url, params = data).text
        '''
        try:

            t = re.search(r'(?<=fetchJSON_comment98vv849\().*(?=\);)',t).group(0)

        except Exception as e:
            break
        '''
        j = json.loads(t)
        commentSummary = j['comments']
        productCommentSummary= j['productCommentSummary']

        # 好评率
        goodRateShow = productCommentSummary['goodRateShow']
        # 评论数
        goodCountStr = productCommentSummary['goodCountStr']
        #print(goodRateShow,goodCountStr)
        # 取出各个评论
        flag = False
        for comment in commentSummary:
            c_content = comment['content']
            c_time = comment['referenceTime']
            c_name = comment['nickname']
            c_client = comment['userClientShow']
            #print('{} {} {}\n{}\n'.format(c_name, c_time, c_client, c_content))
        data['page'] += 1
    return goodRateShow, goodCountStr


def closeDB():
    global conn, cursor
    conn.close()
    cursor.close()


def testcrwal(type, keyword,sortType, num):
    print(type,keyword,sortType,num)
    c=int(num)
    if type == 'jingdong':
        print('go jingdong')
        JDCrwal(keyword, c, sortType)

    if type == 'dangdang':
        print('go dangdang')
        dangDangCrwal(keyword,c, sortType)
    closeDB()
    # os.system('pause')


testcrwal(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4])
#testcrwal("jingdong", "[美] Al Sweigart 斯维加特",'好评',"3")