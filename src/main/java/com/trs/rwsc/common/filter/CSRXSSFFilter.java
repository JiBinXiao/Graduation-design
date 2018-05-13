package com.trs.rwsc.common.filter;


import java.util.Enumeration;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.ehcache.constructs.blocking.LockTimeoutException;
import net.sf.ehcache.constructs.web.AlreadyCommittedException;
import net.sf.ehcache.constructs.web.AlreadyGzippedException;
import net.sf.ehcache.constructs.web.filter.Filter;
import net.sf.ehcache.constructs.web.filter.FilterNonReentrantException;
/* @描述: CSRXSSF
*
* @创建日期： ${date}
* @version 1.0
* @修改人： 
* @修改日期：
* @备注：
*/

public class CSRXSSFFilter extends Filter {
    private String encoding;
    private String[] legalNames;
    private String[] illegalChars;

    public void doInit(FilterConfig filterConfig) {
        encoding = filterConfig.getInitParameter("encoding");
        legalNames = filterConfig.getInitParameter("legalNames").split(",");
        illegalChars = filterConfig.getInitParameter("illegalChars").split(",");
    }

    protected void doDestroy() {
        encoding = null;
        legalNames = null;
        illegalChars = null;
    }

    protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws AlreadyGzippedException, AlreadyCommittedException, FilterNonReentrantException, LockTimeoutException, Exception {
        String referer = request.getHeader("Referer"); //REFRESH
        String tempURL = request.getRemoteAddr();

        String requestUrl = request.getRequestURL().toString();
        String baseUrl=requestUrl.substring(0,requestUrl.indexOf("/","http://".length()));
        if (referer != null && referer.indexOf(baseUrl) < 0) {
            request.getRequestDispatcher(request.getRequestURI()).forward(request, response);
        }
        //必须手动指定编码格式
        request.setCharacterEncoding(encoding);

        //log.info(tempURL);
        Enumeration params = request.getParameterNames();

        //是否执行过滤  true：执行过滤  false：不执行过滤
        boolean executable = true;

        //非法状态  true：非法  false；不非法
        boolean illegalStatus = false;
        String illegalChar = "";
        //对参数名与参数进行判断
        w:
        while (params.hasMoreElements()) {

            String paramName = (String) params.nextElement();

            executable = true;

            //密码不过滤
           /* if(paramName.toLowerCase().contains("password")){
                executable = false;
            }else{
                //检查提交参数的名字，是否合法，即不过滤其提交的值
                f:for(int i=0;i<legalNames.length;i++){
                    if(legalNames[i].equals(paramName)){
                        executable = false;
                        break f;
                    }
                }
            }*/

            if (executable) {
                String[] paramValues = request.getParameterValues(paramName);

                f1:
                for (int i = 0; i < paramValues.length; i++) {

                    String paramValue = paramValues[i];

                    f2:
                    for (int j = 0; j < illegalChars.length; j++) {

                        illegalChar = illegalChars[j];

                        if (paramValue.indexOf(illegalChar) != -1) {
                            illegalStatus = true;//非法状态
                            break f2;
                        }
                    }

                    if (illegalStatus) {
                        break f1;
                    }

                }
            }

            if (illegalStatus) {
                break w;
            }
        }
        //对URL进行判断
        for (int j = 0; j < illegalChars.length; j++) {

            illegalChar = illegalChars[j];

            if (tempURL.indexOf(illegalChar) != -1) {
                illegalStatus = true;//非法状态
                break;
            }
        }
        if (illegalStatus) {
            //必须手动指定编码格式
            response.setContentType("text/html;charset=" + encoding);
            response.setCharacterEncoding(encoding);
            response.getWriter().print("<script>window.alert('当前链接中存在非法字符');window.history.go(-1);</script>");
        } else {
            chain.doFilter(request, response);
        }
    }
}
