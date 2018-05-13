/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.trs.rwsc.common.service;

import com.trs.rwsc.common.persistence.CrudDao;
import com.trs.rwsc.common.persistence.DataEntity;
import com.trs.rwsc.common.persistence.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Service基类
 * @author ThinkGem
 * @version 2014-05-16
 */
@Transactional(readOnly = true)
public abstract class CrudService<D extends CrudDao<T>, T extends DataEntity<T>> extends BaseService {
	
	/**
	 * 持久层对象
	 */
	@Autowired
	protected D dao;
	
	/**
	 * 获取单条数据
	 * @param id
	 * @return
	 */
	public T get(int id) {
		return dao.get(id);
	}
	
	/**
	 * 获取单条数据
	 * @param entity
	 * @return
	 */
	public T get(T entity) {
		return dao.get(entity);
	}
	
	/**
	 * 查询列表数据
	 * @param entity
	 * @return
	 */
	public List<T> findList(T entity) {
		return dao.findList(entity);
	}
	
	/**
	 * 查询分页数据
	 * @param page 分页对象
	 * @param entity
	 * @return
	 */
	public Page<T> findPage(Page<T> page, T entity) {
		entity.setPage(page);
		page.setList(dao.findList(entity));
		return page;
	}
	

	/**
	 * 保存数据（插入或更新）
	 * @param entity
	 * @return 
	 */
	@Transactional(readOnly = false)
	public int save(T entity) {
		int result = 0;
		if (entity.getIsNewRecord()){
			
			entity.preInsert();
			
			result = dao.insert(entity);
		}else{
			
			entity.preUpdate();
			result = dao.update(entity);
		}
		return result;		
	}
	
	/**
	 * 删除逻辑数据
	 * @param entity
	 * @return 
	 */
	@Transactional(readOnly = false)
	public int delete(T entity) {
		return dao.delete(entity);
	}
	
	/**
	 * 删除物理数据
	 * @param entity
	 * @return 
	 */
	@Transactional(readOnly = false)
	public int deleteData(T entity) {
		return dao.deleteData(entity);
	}

}
