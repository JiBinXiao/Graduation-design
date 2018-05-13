package com.trs.rwsc.modules.supplier.service;

import com.trs.rwsc.common.persistence.Page;
import com.trs.rwsc.common.service.CrudService;
import com.trs.rwsc.modules.book.dao.DangDang_BookDao;
import com.trs.rwsc.modules.book.entity.DangDang_Book;
import com.trs.rwsc.modules.company.dao.Company_InfoDao;
import com.trs.rwsc.modules.company.entity.Company_Info;
import com.trs.rwsc.modules.modelinfo.dao.ModelDatabaseDao;
import com.trs.rwsc.modules.modelinfo.dao.ModelinfoDao;
import com.trs.rwsc.modules.modelinfo.entity.Modelinfo;
import com.trs.rwsc.modules.modelinfo.utils.ModelConstant;
import com.trs.rwsc.modules.modelinfo.utils.ModelInfoThread;
import com.trs.rwsc.modules.supplier.dao.SupplierDao;
import com.trs.rwsc.modules.supplier.entity.Supplier;

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
public class SupplierService extends CrudService<SupplierDao, Supplier> {
    private Logger logger = LoggerFactory.getLogger(SupplierService.class);

    @Autowired
    private SupplierDao supplierDao;

    @Autowired
    private ThreadPoolTaskExecutor executor;
    
	

//    /**
//     * saveAndCalculate
//     * @描述  保存并计算
//     * @author    msy
//     * @version
//     * @param modelinfo
//     * @return
//     * @exception
//     * @date  2018/4/3 14:57
//     */
//    @Transactional(readOnly = false)
//    public void saveAndCalculate(Modelinfo modelinfo) throws Exception {
//        this.save(modelinfo);
//        this.calculate(modelinfo);
//    }




	

}
