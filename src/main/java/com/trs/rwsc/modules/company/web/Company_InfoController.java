package com.trs.rwsc.modules.company.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.trs.rwsc.common.mapper.JsonMapper;
import com.trs.rwsc.common.persistence.Page;
import com.trs.rwsc.common.utils.PinYinUtils;
import com.trs.rwsc.common.utils.RtnResult;
import com.trs.rwsc.common.web.BaseController;
import com.trs.rwsc.modules.company.entity.Company_Info;
import com.trs.rwsc.modules.company.service.Company_infoService;

@Controller
@RequestMapping(value = "${adminPath}/company_info/")
public class Company_InfoController extends BaseController {
	
    @Autowired
    private Company_infoService company_infoService;
	  
    
    
    /**
     * 根据企业名称查询
     * @param company_Info
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "seachbyName")
    public String company_infoseachbyName(Company_Info company_Info, HttpServletRequest request, HttpServletResponse response, Model model) {

        Page<Company_Info> page = company_infoService.findbycustCfname(new Page<Company_Info>(request, response), company_Info);

        model.addAttribute("page", page);
        
        return "modules/company_info/company_infolist";
    }
    
    /**
     * 企业分析
     * @param modelinfo
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "list")
    public String company_infolist(Company_Info company_Info, HttpServletRequest request, HttpServletResponse response, Model model) {

        Page<Company_Info> page = company_infoService.findPage(new Page<Company_Info>(request, response), company_Info);

        model.addAttribute("page", null);
        
        return "modules/company_info/company_infolist";
    }
    
    @RequestMapping(value = "delList")
    public String company_infoDellist(Company_Info company_Info, HttpServletRequest request, HttpServletResponse response, Model model) {

        Page<Company_Info> page = company_infoService.findPagebyDel(new Page<Company_Info>(request, response), company_Info);

        model.addAttribute("page", page);
        
        return "modules/company_info/company_infoDellist";
    }
    
    
    
    /**
     * 查看企业详情
     * @param company_Info
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "detail")
    public String company_infoDetail(Company_Info company_Info, HttpServletRequest request, HttpServletResponse response, Model model) {
    	
    	company_Info=company_infoService.get(company_Info);
        model.addAttribute("company_Info", company_Info);
     
     
        return "modules/company_info/detail";
    }
    
    /**
     * 更新企业
     * @param company_Info
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "update")
    public String company_infoUpdate(Company_Info company_Info, HttpServletRequest request, HttpServletResponse response, Model model) {
    	company_Info.setIsNewRecord(false);
    	company_infoService.save(company_Info);
        Page<Company_Info> page = company_infoService.findPage(new Page<Company_Info>(request, response), company_Info);

        model.addAttribute("page", page);
     
        return "modules/company_info/company_infolist";
    }
    
    /**
     * 恢复企业 更新delflag字段为 1
     * @param company_Info
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "recover")
    public String company_infoRecover(Company_Info company_Info, HttpServletRequest request, HttpServletResponse response, Model model) {
    	
    	company_Info=company_infoService.get(company_Info);
    	company_Info.setIsNewRecord(false);
    	company_Info.setDelflag(1);
    	System.out.println(company_Info.toString());
    	company_infoService.save(company_Info);
        Page<Company_Info> page = company_infoService.findPage(new Page<Company_Info>(request, response), company_Info);
 
        model.addAttribute("page", page);
     
        return "modules/company_info/company_infolist";
    }
    
    
    
    /**
     * 删除企业 逻辑删除
     * @param company_Info 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "delete")
    public String company_infoDelete(Company_Info company_Info, HttpServletRequest request, HttpServletResponse response, Model model) {
    	company_Info.setDelflag(-1);
    	company_infoService.delete(company_Info);
        Page<Company_Info> page = company_infoService.findPage(new Page<Company_Info>(request, response), company_Info);
        model.addAttribute("page", page);
     
        return "modules/company_info/company_infolist";
    }
    
    /**
     * 物理删除数据 从数据库中删除
     * @param company_Info
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "deleteData")
    public String company_infoDeleteData(Company_Info company_Info, HttpServletRequest request, HttpServletResponse response, Model model) {
    	
    	company_infoService.deleteData(company_Info);
        Page<Company_Info> page = company_infoService.findPage(new Page<Company_Info>(request, response), company_Info);

        model.addAttribute("page", page);
     
        return "modules/company_info/company_infoDellist";
    }
    
    
    /**
     * 新增企业
     * @param company_Info
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "add")
    @ResponseBody
    public String company_infoAdd(Company_Info company_Info, HttpServletRequest request, HttpServletResponse response, Model model) {
    	
    	
    		company_Info.setCustOrgid("1");
        	company_Info.setDelflag(1);
        	company_Info.setIsNewRecord(true);
        	char pinyin=PinYinUtils.getAlpha(company_Info.getCustCfname()).toCharArray()[0];
        	company_Info.setPinyin(pinyin);
        	int ret=company_infoService.save(company_Info);
    
        	String msg="保存失败";
            if(ret==1){
                msg = "保存成功！";
            }
            return RtnResult.successInfo(msg, null);

    }
    
    @RequestMapping(value = "checkName")
    @ResponseBody
    public String company_infoCheckName(Company_Info company_Info, HttpServletRequest request, HttpServletResponse response, Model model) {
    	
        boolean flag=company_infoService.checkNameisUse(company_Info.getCustCfname());
        model.addAttribute("company_Info", company_Info);	
        if( flag ) 
        	 return RtnResult.successInfo("",null);
        else
        	 return RtnResult.errorInfo("", null);

    }
    
    /**
     * 前往增加页面
     * @param company_Info
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "gotoadd")
    public String company_infoGotoadd(Company_Info company_Info, HttpServletRequest request, HttpServletResponse response, Model model) {
    	
    	
        return "modules/company_info/add";
    }
    
    
    /**
     * 前往更新页面
     * @param company_Info
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "gotoupdate")
    public String company_infoGotoupdate(Company_Info company_Info, HttpServletRequest request, HttpServletResponse response, Model model) {
    	company_Info=company_infoService.get(company_Info);
    
    	 model.addAttribute("company_Info", company_Info);
        return "modules/company_info/update";
    }
    

}
