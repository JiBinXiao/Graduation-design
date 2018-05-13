package com.trs.rwsc.modules.company.dao;

import java.util.List;

import com.trs.rwsc.common.persistence.CrudDao;
import com.trs.rwsc.common.persistence.annotation.MyBatisDao;
import com.trs.rwsc.modules.company.entity.Company_Info;


@MyBatisDao
public interface Company_InfoDao extends CrudDao<Company_Info> {

	/**
	 * 根据企业全称查询企业
	 * @param company_Info
	 * @return
	 */
	public List<Company_Info> getByCfname(Company_Info company_Info) ;
	
	/**
	 * 查询回收站的企业
	 * @return
	 */
	public List<Company_Info> findListbyDel();
	

	/**
	 * 查询全称是否可用
	 * @return
	 */
	public int checkNameisUse(String custCfname);

}
