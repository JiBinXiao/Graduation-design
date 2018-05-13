package com.trs.rwsc.modules.company.service;

import com.trs.rwsc.common.persistence.Page;
import com.trs.rwsc.common.service.CrudService;
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
public class Company_infoService extends CrudService<Company_InfoDao, Company_Info> {
    private Logger logger = LoggerFactory.getLogger(Company_infoService.class);

    @Autowired
    private Company_InfoDao company_InfoDao;

    @Autowired
    private ThreadPoolTaskExecutor executor;
    
	
	/**
	 * 查询回收站分页数据
	 * @param page 分页对象
	 * @param entity
	 * @return
	 */
	public Page<Company_Info> findPagebyDel(Page<Company_Info> page, Company_Info entity) {
		entity.setPage(page);
		page.setList(dao.findListbyDel());
		return page;
	}
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


	public Page<Company_Info> findbycustCfname(Page<Company_Info> page, Company_Info entity) {
		// TODO Auto-generated method stub
		entity.setPage(page);
		page.setList(company_InfoDao.getByCfname(entity));
		return page;
	}

	
	/**
	 * 检查全称是否可用
	 * @param custCfname
	 * @return
	 */
	public boolean checkNameisUse(String custCfname) {
		// TODO Auto-generated method stub
		int count=company_InfoDao.checkNameisUse(custCfname);
		if(count==1)
			return false;
		else
			return true;
	}
}
