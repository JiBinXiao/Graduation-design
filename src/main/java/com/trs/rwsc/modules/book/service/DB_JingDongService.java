package com.trs.rwsc.modules.book.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.trs.rwsc.common.service.CrudService;
import com.trs.rwsc.modules.book.dao.DB_DangDangMapper;
import com.trs.rwsc.modules.book.dao.DB_JingDongMapper;
import com.trs.rwsc.modules.book.entity.DB_DangDang;
import com.trs.rwsc.modules.book.entity.DB_JingDong;

@Service
@Transactional(readOnly = true)
public class DB_JingDongService extends CrudService<DB_JingDongMapper, DB_JingDong>{

	@Autowired
	private DB_JingDongMapper db_JingDongMapper;
	@Transactional(readOnly = false)
	public int deleteByType(String type,String sortType) {
		// TODO Auto-generated method stub
		db_JingDongMapper.deleteByType(type, sortType);
		return 0;
	}

}
