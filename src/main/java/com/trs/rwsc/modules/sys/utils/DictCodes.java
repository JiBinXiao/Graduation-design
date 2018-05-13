package com.trs.rwsc.modules.sys.utils;

/**
 * 
* @描述: 数据字典配置表
*
* @author mishiyin
* @创建日期： 2018年3月26日
* @version 1.0
* @修改人： 
* @修改日期：
* @Copyright: Copyright (c) Jnwat Soft 2017
* @备注：
 */
public class DictCodes {
	/**
	 * 是否允许用户登录
	 */
	 public static final String login_flag="005";
	 public static final String login_flag_yes="1";//启用
	 public static final String login_flag_no="0";//不启用


	 /**
	  * 接口返回状态码
	  */
	 public static final String SUCCESS = "0";//请求成功
	 public static final String LOGIN_NO = "301";//用户名没启用，无法登陆
	 public static final String LOGIN_FAIL = "401";//登录失败
	 public static final String INTER_ERROR = "501";//服务器内部错误
}
