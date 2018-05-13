package com.trs.rwsc.modules.supplier.dao;


/**
 * 供应商管理业务层
 */
import java.util.List;

import com.trs.rwsc.common.persistence.CrudDao;
import com.trs.rwsc.common.persistence.Page;
import com.trs.rwsc.common.persistence.annotation.MyBatisDao;
import com.trs.rwsc.modules.book.entity.DangDang_Book;
import com.trs.rwsc.modules.supplier.entity.Supplier;


@MyBatisDao
public interface SupplierDao extends CrudDao<Supplier> {
	/**
	 * 查询delflag为 -1的企业
	 * @param supplier
	 * @return
	 */
	Page<Supplier> findDelList( Supplier supplier);
	



	

}