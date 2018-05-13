package com.trs.rwsc.common.utils;

import com.alibaba.fastjson.JSONObject;

/* @描述:
*
* @创建日期： 2017/2/27 0027
* @version 1.0
* @修改人： 
* @修改日期：
* @Copyright: Copyright (c) Jnwat Soft 2017
* @备注：
*/
public class RtnResult {
    private static int STATUS_SUCCESS = 200;//返回成功
    private static int STATUS_FAIL = 400;//返回失败
    private static int STATUS_NOFILE = 404;//无法找到文件或方法

    /**
     * 描述:成功返回信息
     * 方法名 successMsg
     *
     * @param msg
     * @param data
     * @return java.lang.String
     * @创建日期： 2017-02-27
     * @version 1.0
     * @修改人：
     * @修改日期：
     * @Copyright: Copyright (c) Jnwat Soft 2017
     * @备注：
     **/
    public static String successInfo(String msg, String data) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("success", true);
        jsonObject.put("msg", msg);
        jsonObject.put("status", STATUS_SUCCESS);
        jsonObject.put("data", data);
        return jsonObject.toString();
    }

    /**
     * 描述:返回错误信息
     * 方法名 errorInfo
     *
     * @param msg
     * @param data
     * @return java.lang.String
     * @创建日期： 2017-02-27
     * @version 1.0
     * @修改人：
     * @修改日期：
     * @Copyright: Copyright (c) Jnwat Soft 2017
     * @备注：
     **/
    public static String errorInfo(String msg, String data) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("success", false);
        jsonObject.put("msg", msg);
        jsonObject.put("status", STATUS_FAIL);
        jsonObject.put("data", data);
        return jsonObject.toString();
    }

//    public static String noFileInfo(String msg, String data) {
//        JSONObject jsonObject = new JSONObject();
//        jsonObject.put("success", false);
//        jsonObject.put("msg", msg);
//        jsonObject.put("status", STATUS_NOFILE);
//        jsonObject.put("data", data);
//        return jsonObject.toString();
//    }
}
