/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.trs.rwsc.modules.sys.web;

import com.trs.rwsc.common.persistence.Page;
import com.trs.rwsc.common.utils.DateUtils;
import com.trs.rwsc.common.web.BaseController;
import com.trs.rwsc.modules.sys.entity.Log;
import com.trs.rwsc.modules.sys.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

/**
 * 日志Controller
 * @author ThinkGem
 * @version 2013-6-2
 * @修改人： chent
 * @修改日期：2017-2-7
 * @备注：将查询的结束日期改为所选日期的最后时刻
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/log")
public class LogController extends BaseController {

	@Autowired
	private LogService logService;
	
	/*@RequiresPermissions("sys:log:view")*/
	@RequestMapping(value = {"list", ""})
	public String list(Log log, HttpServletRequest request, HttpServletResponse response, Model model) {
		//判断结束日期是否为空
		if(log.getEndDate() != null){
			//将结束日期转化为yyyy-MM-dd的字符串
			String endDateString = DateUtils.formatDate(log.getEndDate());
			//在结束日期的字符串后拼接最后的时刻
			endDateString += " 23:59:59";
				//将拼接好的结束日期字符串转化为Date格式存入log实体中
				Date endDate = DateUtils.parseDate(endDateString);
				log.setEndDate(endDate);
		}
		
        Page<Log> page = logService.findPage(new Page<Log>(request, response), log);
        model.addAttribute("page", page);
		return "modules/sys/logList";
	}
	
	/**
	 * 
	* detail
	* @描述: 日志详情
	* @param log 日志实体【传入id】
	* @param request
	* @param response
	* @param model
	* @return
	* @异常:
	* @author mishiyin
	* @创建日期： 2018年3月7日
	 */
	@RequestMapping(value = "detail")
	public String detail(Log log, HttpServletRequest request, HttpServletResponse response, Model model) {
		log = logService.findList(log).get(0);
		model.addAttribute("log", log);
		return "modules/sys/log_detail";
	}

}
