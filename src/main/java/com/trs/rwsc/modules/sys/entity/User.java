/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.trs.rwsc.modules.sys.entity;

import com.trs.rwsc.common.persistence.DataEntity;

/**
 *
 * @描述 用户实体类
 * @author    msy
 * @version
 * @return
 * @exception
 * @date  2018/3/23 16:53
 */
public class User extends DataEntity<User> {
	private static final long serialVersionUID = 1L;

	private String username;
	private String password;

	public User() {
		super();
	}
	
	public User(Integer id){
		super(id);
	}

	public User(int id, String username){
		super(id);
		this.username = username;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}