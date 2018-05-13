/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.trs.rwsc.modules.modelinfo.dao;

import com.trs.rwsc.common.persistence.CrudDao;
import com.trs.rwsc.common.persistence.annotation.MyBatisDao;
import com.trs.rwsc.modules.modelinfo.entity.Modelinfo;

/**
 * 用户DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface ModelinfoDao extends CrudDao<Modelinfo> {
	/**
     * 更新模型的状态
	 * @param modelinfo
     * @return
     */
	int updateStatus(Modelinfo modelinfo);
}
