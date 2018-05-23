package com.trs.rwsc.modules.books.dao;

import com.trs.rwsc.common.persistence.annotation.MyBatisDao;
import com.trs.rwsc.modules.books.entity.Books;

@MyBatisDao
public interface BooksMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Books record);

    int insertSelective(Books record);

    Books selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Books record);

    int updateByPrimaryKey(Books record);

	Books get(String name);
	
	Books getById(int id);
}