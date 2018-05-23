package com.trs.rwsc.modules.supplier.service;

import com.trs.rwsc.common.persistence.Page;
import com.trs.rwsc.common.service.CrudService;


import com.trs.rwsc.modules.supplier.dao.SupplierDao;
import com.trs.rwsc.modules.supplier.entity.Supplier;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

/**
 * 供应商管理 业务层
 * @author xjb
 *
 */
@Service
@Transactional(readOnly = true)
public class SupplierService extends CrudService<SupplierDao, Supplier> {
    private Logger logger = LoggerFactory.getLogger(SupplierService.class);

    @Autowired
    private SupplierDao supplierDao;

	/**
	 * 查询分页数据
	 * @param page 分页对象
	 * @param entity
	 * @return
	 */
	public Page<Supplier> findPage(Page<Supplier> page,Supplier supplier) {
		supplier.setPage(page);
		page.setList(dao.findList(supplier));
		return page;
	}

    
    /**
     * 新增供应商
     * @param supplier
     * @return
     */
	@Transactional(readOnly = false)
	public int insert(Supplier supplier) {
		// TODO Auto-generated method stub
		return supplierDao.insert(supplier);
	}


	/**
	 * 更新供应商
	 * @param supplier
	 * @return
	 */
	@Transactional(readOnly = false)
	public int update(Supplier supplier) {
		// TODO Auto-generated method stub
		return supplierDao.update(supplier);
	}


	/**
	 * 查询分页数据
	 * @param page 分页对象
	 * @param entity
	 * @return
	 */
	public Page<Supplier> findDelPage(Page<Supplier> page,Supplier supplier) {
		supplier.setPage(page);
		page.setList(dao.findDelList(supplier));
		return page;
	}


	public boolean checkNameisUse(Supplier supplier) {
		// TODO Auto-generated method stub
		int f=supplierDao.checkNameisUse(supplier);
		if(f==1)
			return false;
		else
			return true;
	}


	public List<Supplier> findList() {
		// TODO Auto-generated method stub
		return supplierDao.findList();
	}


    
	





	

}
