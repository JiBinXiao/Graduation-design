package com.trs.rwsc.modules.book.dao;



import com.trs.rwsc.common.persistence.CrudDao;
import com.trs.rwsc.common.persistence.annotation.MyBatisDao;
import com.trs.rwsc.modules.book.entity.DangDang_Book;
import com.trs.rwsc.modules.book.entity.JD_Book;
import com.trs.rwsc.modules.supplier.entity.Supplier;


@MyBatisDao
public interface JD_BookDao extends CrudDao<JD_Book> {

	

}