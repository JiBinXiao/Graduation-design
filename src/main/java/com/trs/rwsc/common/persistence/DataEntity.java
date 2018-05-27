/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.trs.rwsc.common.persistence;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.trs.rwsc.modules.sys.entity.User;
import com.trs.rwsc.modules.sys.utils.UserUtils;
import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.Length;

import java.sql.Timestamp;
import java.util.Date;

/**
 * 数据Entity类
 * @author ThinkGem
 * @version 2014-05-16
 */
public abstract class DataEntity<T> extends BaseEntity<T> {

	private static final long serialVersionUID = 1L;
	
	protected String remark;	// 备注
	protected User createBy;	// 创建者
	protected java.sql.Timestamp createDate;	// 创建日期
	protected User updateBy;	// 更新者
	protected java.sql.Timestamp updateDate;	// 更新日期
	protected int delflag; 	// 删除标记（1：正常；-1：删除）
	
	public DataEntity() {
		super();
		this.delflag = DEL_FLAG_NORMAL;
	}
	
	public DataEntity(int id) {
		super(id);
	}
	
	/**
	 * 插入之前执行方法，需要手动调用
	 */
	@Override
	public void preInsert(){
		// 不限制ID为UUID，调用setIsNewRecord()使用自定义ID
		/*if (!this.isNewRecord){
			setId(IdGen.uuid());
			//setIsNewRecord(true);
		}*/
		User user = UserUtils.getUser();
		if (user != null && StringUtils.isNotBlank(user.getId()+"")){
			this.updateBy = user;
			this.createBy = user;
		}
		this.updateDate = new Timestamp(System.currentTimeMillis()); 
		this.createDate = this.updateDate;
	}
	
	/**
	 * 更新之前执行方法，需要手动调用
	 */
	@Override
	public void preUpdate(){
		User user = UserUtils.getUser();
		if (user.getId() != 0){
			this.updateBy = user;	
		}
		this.updateDate =new  Timestamp(System.currentTimeMillis()); 
	}
	
	@Length(min=0, max=255)
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = StringEscapeUtils.unescapeHtml(remark);
	}
	
	@JsonIgnore
	public User getCreateBy() {
		return createBy;
	}

	public void setCreateBy(User createBy) {
		this.createBy = createBy;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateDate() {
		return createDate;
	}

	
	@JsonIgnore
	public User getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(User updateBy) {
		this.updateBy = updateBy;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdateDate() {
		return updateDate;
	}

	



	public void setCreateDate(java.sql.Timestamp createDate) {
		this.createDate = createDate;
	}

	public void setUpdateDate(java.sql.Timestamp updateDate) {
		this.updateDate = updateDate;
	}

	@JsonIgnore
	@Length(min=1, max=1)
	public int getDelflag() {
		return delflag;
	}

	public void setDelflag(int delflag) {
		this.delflag = delflag;
	}

}
