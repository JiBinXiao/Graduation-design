package com.trs.rwsc.common.web;

import com.trs.rwsc.common.config.Global;
import com.trs.rwsc.common.utils.ConstantUtils;
import com.trs.rwsc.common.utils.RtnResult;
import com.trs.rwsc.common.utils.StringUtils;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

/* @描述:
*
* @author li_hp
* @创建日期： 2017/2/24 0024
* @version 1.0
* @修改人： 
* @修改日期：
* @Copyright: Copyright (c) Jnwat Soft 2017
* @备注：
*/
public class HttpRequest {
    private static String requestUrl = Global.getConfig(ConstantUtils.REQUEST_URL);

    /**
     * 描述:
     * 方法名 sendGet
     *
     * @param url
     * @param param
     * @return java.lang.String
     * @author li_hp
     * @创建日期： 2017-02-24
     * @version 1.0
     * @修改人：
     * @修改日期：
     * @Copyright: Copyright (c) Jnwat Soft 2017
     * @备注：
     **/
    public static String sendGet(String url, String param) {
        String result = "";
        BufferedReader in = null;
        String getParam = "";
        if (StringUtils.isNotBlank(param)) {
            try {
                param = URLEncoder.encode(param, "utf-8");
            } catch (UnsupportedEncodingException e) {
                param = "";
                e.printStackTrace();
            }
            getParam = "?param=" + param;
        }
        try {
            String urlNameString = requestUrl + url + getParam;
            URL realUrl = new URL(urlNameString);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 建立实际的连接
            connection.connect();
            // 获取所有响应头字段
            Map<String, List<String>> map = connection.getHeaderFields();
            // 遍历所有的响应头字段
//            for (String key : map.keySet()) {
//                System.out.println(key + "--->" + map.get(key));
//            }
            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream(), "utf-8"));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            result = RtnResult.errorInfo("保存异常！", "");
            System.out.println("发送GET请求出现异常！" + e);
            e.printStackTrace();
        }
        // 使用finally块来关闭输入流
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }

    /**
     * 描述:
     * 方法名 sendPost
     *
     * @param url
     * @param param
     * @return java.lang.String
     * @author li_hp
     * @创建日期： 2017-02-24
     * @version 1.0
     * @修改人：
     * @修改日期：
     * @Copyright: Copyright (c) Jnwat Soft 2017
     * @备注：
     **/
    public static String sendPost(String url, String param) {
        PrintWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            String urlNameString = requestUrl + url + "?param=" + param;
            URL realUrl = new URL(urlNameString);
            // 打开和URL之间的连接
            URLConnection conn = realUrl.openConnection();
            // 设置通用的请求属性
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            // 获取URLConnection对象对应的输出流
            out = new PrintWriter(conn.getOutputStream());
            // 发送请求参数
            out.print(param);
            // flush输出流的缓冲
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送 POST 请求出现异常！" + e);
            e.printStackTrace();
        }
        //使用finally块来关闭输出流、输入流
        finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }
}
