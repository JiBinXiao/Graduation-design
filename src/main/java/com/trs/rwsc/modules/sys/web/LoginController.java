/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.trs.rwsc.modules.sys.web;

import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;
import com.trs.rwsc.common.config.Global;
import com.trs.rwsc.common.security.shiro.session.SessionDAO;
import com.trs.rwsc.common.servlet.ValidateCodeServlet;
import com.trs.rwsc.common.utils.*;
import com.trs.rwsc.common.web.BaseController;
import com.trs.rwsc.modules.sys.entity.User;
import com.trs.rwsc.modules.sys.security.FormAuthenticationFilter;
import com.trs.rwsc.modules.sys.security.SystemAuthorizingRealm;
import com.trs.rwsc.modules.sys.utils.LogUtils;
import com.trs.rwsc.modules.sys.utils.UserUtils;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.Map;

/**
 * 登录Controller
 * @author ThinkGem
 * @version 2013-5-31
 */
@Controller
public class LoginController extends BaseController {
	private static final int maxLoinField = 5;// 最大登陆失败次数
	@Autowired
	private SessionDAO sessionDAO;
	/**
	 * 管理登录
	 */
	@RequestMapping(value = "${adminPath}/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes) {
		SystemAuthorizingRealm.Principal principal = UserUtils.getPrincipal();

//		// 默认页签模式
//		String tabmode = CookieUtils.getCookie(request, "tabmode");
//		if (tabmode == null){
//			CookieUtils.setCookie(response, "tabmode", "1");
//		}

		if (logger.isDebugEnabled()){
			logger.debug("login, active session size: {}", sessionDAO.getActiveSessions(false).size());
		}

		// 如果已登录，再次访问主页，则退出原账号。
		if (Global.TRUE.equals(Global.getConfig("notAllowRefreshIndex"))){
			CookieUtils.setCookie(response, "LOGINED", "false");
		}

		Map<String, String> map = (Map<String, String>) redirectAttributes.getFlashAttributes();
		model.addAttribute("msg", map.get("msg"));
		// 如果已经登录，则跳转到管理首页
		if(principal != null){
			return "redirect:" + adminPath;
		}
//		String view;
//		view = "/WEB-INF/views/modules/index/sysLogin.jsp";
//		view = "classpath:";
//		view += "jar:file:/D:/GitHub/jeesite/src/main/webapp/WEB-INF/lib/jeesite.jar!";
//		view += "/"+getClass().getName().replaceAll("\\.", "/").replace(getClass().getSimpleName(), "")+"view/sysLogin";
//		view += ".jsp";
		return "modules/index/login";
	}

	/**
	 * 登录失败，真正登录的POST请求由FormAuthenticationFilter完成
	 */
	@RequestMapping(value = "${adminPath}/login", method = RequestMethod.POST)
	public String loginFail(HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes) {
		// 如果已经登录，则跳转到管理首页
		SystemAuthorizingRealm.Principal principal = UserUtils.getPrincipal();
		if(principal != null){
			return "redirect:" + adminPath;
		}
		//获取前台的用户登录信息
		String watvalue = WebUtils.getCleanParam(request, "watvalue").trim();
		//base解密
		/*try {
			//watvalue = DESHelper.base64Decode1(watvalue);
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		String[] value = watvalue.split(",");
		String username = value[0];
		/*String username = WebUtils.getCleanParam(request, FormAuthenticationFilter.DEFAULT_USERNAME_PARAM);*/
		boolean rememberMe = WebUtils.isTrue(request, FormAuthenticationFilter.DEFAULT_REMEMBER_ME_PARAM);
		boolean mobile = WebUtils.isTrue(request, FormAuthenticationFilter.DEFAULT_MOBILE_PARAM);
		String exception = (String)request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
		String message = (String)request.getAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM);
		String errorType = "";
		//判断用户是否锁定
		User currentUser = UserUtils.getByLoginName(username);
		Date currentDate = new Date();
		//判断返回信息
		if (StringUtils.isBlank(message) || StringUtils.equals(message, "null")){
			message = "用户或密码错误, 请重试.";
		}else {
			if (!message.equals("用户或密码错误, 请重试.")) {
				if(!message.equals("该账号已禁止登录")){
					JSONObject jsonObject = JSONObject.parseObject(message);
					message = jsonObject.getString("msg");
					errorType = jsonObject.getString("errorType");
				}
			}
		}
		//获取要传递的参数
		model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, username);
		model.addAttribute(FormAuthenticationFilter.DEFAULT_REMEMBER_ME_PARAM, rememberMe);
		model.addAttribute(FormAuthenticationFilter.DEFAULT_MOBILE_PARAM, mobile);
		model.addAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME, exception);
		model.addAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM, message);

		if (logger.isDebugEnabled()){
			logger.debug("login fail, active session size: {}, message: {}, exception: {}",
					sessionDAO.getActiveSessions(false).size(), message, exception);
		}

		// 非授权异常，登录失败，验证码加1。
		if (!UnauthorizedException.class.getName().equals(exception)){
			//处理5次登陆锁定及30分钟内不使用功能
			boolean isLoginField = false;
			if(message.equals("用户或密码错误, 请重试.")&&currentUser!=null){
				isLoginField = isValidateCodeLogin(username, true, false);
			}
			model.addAttribute("isValidateCodeLogin",isLoginField);
			if (errorType.equals(ConstantUtils.COUNT_ERROR_TYPE_VALIDE)) {//用户已过期
				message = "用户 "+username+" 已过期！";
			}else if(message.equals("该账号已禁止登录")){//用户没有登录权限
				message = "账号 "+username+" 没有登录权限！";
			}else if(currentUser==null){//账号不存在
				message="您输入的用户"+username+"不存在！请核对后再登录！";
			}else {//登录用户小于五次
				message = "用户名或密码输入错误！" /*+ maxLoinField + "次帐号：" + username + "将锁定,您还有"
						  + (maxLoinField - getLoginFailNum(username) + "次机会！")*/;
			}
			model.addAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM, message);
			LogUtils.saveLog(request, null, null, message);
		}
		// 验证失败清空验证码
		request.getSession().setAttribute(ValidateCodeServlet.VALIDATE_CODE, IdGen.uuid());
		return "modules/index/login";
	}

	/**
	 * 登录成功，进入管理首页
	 */
	//@RequiresPermissions("user")
	@RequestMapping(value = "${adminPath}")
	public String index(HttpServletRequest request, HttpServletResponse response,Model model) {
		SystemAuthorizingRealm.Principal principal = UserUtils.getPrincipal();
		//当前时间大于锁定时间   解锁
		Date currentDate = new Date();
		User currentUser = UserUtils.getByLoginName(principal.getUsername());
		// 登录成功后，验证码计算器清零
		isValidateCodeLogin(principal.getUsername(), false, true);
		
		if (logger.isDebugEnabled()){
			logger.debug("show index, active session size: {}", sessionDAO.getActiveSessions(false).size());
		}
		
		// 如果已登录，再次访问主页，则退出原账号。
		if (Global.TRUE.equals(Global.getConfig("notAllowRefreshIndex"))){
			String logined = CookieUtils.getCookie(request, "LOGINED");
			if (StringUtils.isBlank(logined) || "false".equals(logined)){
				CookieUtils.setCookie(response, "LOGINED", "true");
			}else if (StringUtils.equals(logined, "true")){
				UserUtils.getSubject().logout();
				return "redirect:" + adminPath + "/login";
			}
		} 
		
		
		//获取附件表当前头像图片 add by 2017-10-18

		model.addAttribute("user", currentUser);
		model.addAttribute("loginName", currentUser.getUsername());
		return "modules/index/index";
	}
	
	/**
	 * 获取主题方案
	 */
	@RequestMapping(value = "/theme/{theme}")
	public String getThemeInCookie(@PathVariable String theme, HttpServletRequest request, HttpServletResponse response){
		if (StringUtils.isNotBlank(theme)){
			CookieUtils.setCookie(response, "theme", theme);
		}else{
			theme = CookieUtils.getCookie(request, "theme");
		}
		return "redirect:"+request.getParameter("url");
	}
	
	/**
	 * 
	* home
	* @描述: 跳转home页面
	*
	* @return
	* @异常:
	* @author mishiyin
	* @创建日期： 2017年9月1日
	* @修改人： 
	* @修改日期：
	* @备注：
	 */
	@RequestMapping(value = "${adminPath}/home")
	public String home() {
		return "modules/index/home";
	}
	
	/**
	 * 是否是验证码登录
	 * @param useruame 用户名
	 * @param isFail 计数加1
	 * @param clean 计数清零
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static boolean isValidateCodeLogin(String useruame, boolean isFail, boolean clean){
		Map<String, Integer> loginFailMap = (Map<String, Integer>) CacheUtils.get("loginFailMap");
		if (loginFailMap==null){
			loginFailMap = Maps.newHashMap();
			CacheUtils.put("loginFailMap", loginFailMap);
		}
		Integer loginFailNum = loginFailMap.get(useruame);
		if (loginFailNum==null){
			loginFailNum = 0;
		}
		if (isFail){
			loginFailNum++;
			loginFailMap.put(useruame, loginFailNum);
		}
		if (clean){
			loginFailMap.remove(useruame);
		}
		return loginFailNum >= maxLoinField;
	}
	private int getLoginFailNum(String useruame) {
		Map<String, Integer> loginFailMap = (Map<String, Integer>) CacheUtils.get("loginFailMap");
		if (loginFailMap == null) {
			loginFailMap = Maps.newHashMap();
			CacheUtils.put("loginFailMap", loginFailMap);
		}
		Integer loginFailNum = loginFailMap.get(useruame);
		return loginFailNum;
	}
}
