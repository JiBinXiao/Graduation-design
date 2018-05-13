package com.trs.rwsc.modules.book.service;

import com.trs.rwsc.common.persistence.Page;
import com.trs.rwsc.common.service.CrudService;
import com.trs.rwsc.modules.book.dao.DangDang_BookDao;
import com.trs.rwsc.modules.book.dao.JD_BookDao;
import com.trs.rwsc.modules.book.entity.DangDang_Book;
import com.trs.rwsc.modules.book.entity.JD_Book;
import com.trs.rwsc.modules.company.dao.Company_InfoDao;
import com.trs.rwsc.modules.company.entity.Company_Info;
import com.trs.rwsc.modules.modelinfo.dao.ModelDatabaseDao;
import com.trs.rwsc.modules.modelinfo.dao.ModelinfoDao;
import com.trs.rwsc.modules.modelinfo.entity.Modelinfo;
import com.trs.rwsc.modules.modelinfo.utils.ModelConstant;
import com.trs.rwsc.modules.modelinfo.utils.ModelInfoThread;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * @author msy
 * @Title: 模型信息业务处理类
 * @date 2018/3/2414:40
 */
@Service
@Transactional(readOnly = true)
public class JD_BookService extends CrudService<JD_BookDao, JD_Book> {
    private Logger logger = LoggerFactory.getLogger(JD_BookService.class);

    @Autowired
    private JD_BookDao bookDao;

    @Autowired
    private ThreadPoolTaskExecutor executor;
    
	



}
