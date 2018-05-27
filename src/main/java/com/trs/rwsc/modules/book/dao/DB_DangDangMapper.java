package com.trs.rwsc.modules.book.dao;

import com.trs.rwsc.common.persistence.CrudDao;
import com.trs.rwsc.common.persistence.annotation.MyBatisDao;
import com.trs.rwsc.modules.book.entity.DB_DangDang;

@MyBatisDao

public interface DB_DangDangMapper extends CrudDao<DB_DangDang>{
 

    int insertSelective(DB_DangDang db_DangDang);
    
    long findAllCount(DB_DangDang db_DangDang);

	void deleteByType(String type,String sortType);
}