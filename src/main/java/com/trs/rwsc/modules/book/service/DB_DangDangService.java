package com.trs.rwsc.modules.book.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.trs.rwsc.common.service.CrudService;
import com.trs.rwsc.modules.book.dao.DB_DangDangMapper;

import com.trs.rwsc.modules.book.entity.DB_DangDang;

@Service
@Transactional(readOnly = true)
public class DB_DangDangService extends CrudService<DB_DangDangMapper, DB_DangDang> {
	  private Logger logger = LoggerFactory.getLogger(DB_DangDangService.class);

	    @Autowired
	    private DB_DangDangMapper db_DangDangMapper;



		public  DB_DangDang get(int id) {
			// TODO Auto-generated method stub
			return db_DangDangMapper.get(id);
		}


		@Transactional( readOnly = false)
		public int deleteByType(String type) {
			// TODO Auto-generated method stub
			db_DangDangMapper.deleteByType(type);
			return 0;
		}
}
