package com.trs.rwsc.modules.company.utils;

import com.trs.rwsc.common.utils.CacheUtils;
import com.trs.rwsc.common.utils.SpringContextHolder;
import com.trs.rwsc.modules.company.dao.Company_InfoDao;
import com.trs.rwsc.modules.company.entity.Company_Info;
import com.trs.rwsc.modules.sys.dao.UserDao;
import com.trs.rwsc.modules.sys.entity.User;

public class Company_infoUtils {
	public static Company_InfoDao company_InfoDao=SpringContextHolder.getBean(Company_InfoDao.class);
	
	public static final String COMPANY_INFO_CACHE = "company_infoCache";
	public static final String COMPANY_INFO_CACHE_ID = "id_";
	public static final String COMPANY_INFO_CACHE_CFNAME= "cn_";
	public static final String COMPANY_INFO_CACHE_LIST_BY_OFFICE_ID_ = "oid_";

//	public static final String CACHE_ROLE_LIST = "roleList";
//	public static final String CACHE_MENU_LIST = "menuList";
//	public static final String CACHE_AREA_LIST = "areaList";
//	public static final String CACHE_OFFICE_LIST = "officeList";
//	public static final String CACHE_OFFICE_ALL_LIST = "officeAllList";
//	//用户登陆后记录用户所属的煤矿信息
//	public static final String CACHE_COALMINE_INFO = "coalmineinfo";
	
	/**
	 * 通过id得到企业
	 * @param id
	 * @return
	 */
	public static Company_Info getCompany_info(Integer id) {
		if(id == null){
			return null;
		}		
		Company_Info company_Info=(Company_Info) CacheUtils.get(COMPANY_INFO_CACHE, COMPANY_INFO_CACHE_ID + id);
		if (company_Info ==  null){
			company_Info = company_InfoDao.get(id);
			if (company_Info == null){
				return null;
			}
			CacheUtils.put(COMPANY_INFO_CACHE, COMPANY_INFO_CACHE_ID + company_Info.getId(), company_Info);
			//CacheUtils.put(COMPANY_INFO_CACHE, COMPANY_INFO_CACHE_CFNAME + company_Info.getCUST_CFNAME(), company_Info);
		}
		return company_Info;
	}
	
	
	/**
	 * 通过全称得到企业
	 * @param cfname
	 * @return
	 */
	public static Company_Info getByCfname(String cfname) {
		Company_Info company_Info = (Company_Info)CacheUtils.get(COMPANY_INFO_CACHE, COMPANY_INFO_CACHE_CFNAME + cfname);
		if (company_Info == null){
		//	company_Info = company_InfoDao.getByCfname(new Company_Info(0, cfname));
			if (company_Info == null){
				return null;
			}
			CacheUtils.put(COMPANY_INFO_CACHE, COMPANY_INFO_CACHE_ID + company_Info.getId(), company_Info);
		//	CacheUtils.put(COMPANY_INFO_CACHE, COMPANY_INFO_CACHE_CFNAME + company_Info.getCUST_CFNAME(), company_Info);
		}
		return company_Info;
	}
}
