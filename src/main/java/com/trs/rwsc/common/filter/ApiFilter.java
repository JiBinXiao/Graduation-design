/**
* @描述: 
*
* @author yangtr
* @创建日期： 2017年12月20日
* @version 1.0
* @修改人： 
* @修改日期：
* @Copyright: Copyright (c) Jnwat Soft 2017
* @备注：
*/
package com.trs.rwsc.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
* @描述: 
*
* @author yangtr
* @创建日期： 2017年12月20日
* @version 1.0
* @修改人： 
* @修改日期：
* @Copyright: Copyright (c) Jnwat Soft 2017
* @备注：
*/
public class ApiFilter implements Filter {

	/*
	(non-Javadoc)
	* @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
	*/
		
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("_______");
	}

	/*
	(non-Javadoc)
	* @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
	*/
		
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		chain.doFilter(request, response);  //让目标资源执行，放行
		System.out.println("----------");
	}

	/*
	(non-Javadoc)
	* @see javax.servlet.Filter#destroy()
	*/
		
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}



}
