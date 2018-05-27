package com.trs.rwsc.modules.book.dao;

import com.trs.rwsc.common.persistence.CrudDao;
import com.trs.rwsc.common.persistence.annotation.MyBatisDao;
import com.trs.rwsc.modules.book.entity.DB_JingDong;

@MyBatisDao
public interface DB_JingDongMapper extends CrudDao<DB_JingDong>{
    int deleteByPrimaryKey(Integer id);


    int insertSelective(DB_JingDong db_JingDong);


	void deleteByType(String type,String sortType);

  
}