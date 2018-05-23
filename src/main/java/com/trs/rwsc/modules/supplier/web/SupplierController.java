package com.trs.rwsc.modules.supplier.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.trs.rwsc.common.persistence.Page;
import com.trs.rwsc.common.utils.RtnResult;
import com.trs.rwsc.common.web.BaseController;


import com.trs.rwsc.modules.supplier.entity.Supplier;
import com.trs.rwsc.modules.supplier.service.SupplierService;

/**
 * 供应商管理 控制层
 * @author xjb
 *
 */
@Controller
@RequestMapping(value = "${adminPath}/supplier/")
public class SupplierController extends BaseController {
	
    @Autowired
    private SupplierService supplierService;
	  
    
    /**
     * 显示所有回收站的供应商
     * @param modelinfo
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "dellist")
    public String dellist(Supplier supplier,HttpServletRequest request, HttpServletResponse response, Model model) {

        Page<Supplier> page = supplierService.findDelPage(new Page<Supplier>(request, response), supplier);

        model.addAttribute("page", page);
        
        return "supplier/dellist";
    }
    
    /**
     * 显示所有供应商
     * @param modelinfo
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "list")
    public String list(Supplier supplier,HttpServletRequest request, HttpServletResponse response, Model model) {

        Page<Supplier> page = supplierService.findPage(new Page<Supplier>(request, response), supplier);

        model.addAttribute("page", page);
        
        return "supplier/list";
    }
    
    /**
     * 新增供应商
     * @param supplier
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "add" )
    @ResponseBody
    public String insert(Supplier supplier,HttpServletRequest request, HttpServletResponse response, Model model) {
    
    	supplier.setIsNewRecord(true);
    
    	supplier.setDelflag(1);
    	int ret=supplierService.save(supplier);
        
    	String msg="保存失败";
        if(ret==1){
            msg = "保存成功！";
        }
        return RtnResult.successInfo(msg, null);

    }
    
    @RequestMapping(value = "detail" )
    public String detail(Supplier supplier, Model model) {

    	supplier=supplierService.get(supplier.getId());
	    model.addAttribute("supplier", supplier);
    	return "supplier/detail";
    }
    
    
    /**
     * 更新企业
     * @param supplier
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "update" )
    public String update(Supplier supplier,HttpServletRequest request, HttpServletResponse response, Model model) {
    	boolean flag=false;
    	supplier.setIsNewRecord(false);
    	int result=supplierService.save(supplier);
    	if(result == 1)
    		flag=true;
	    Page<Supplier> page = supplierService.findPage(new Page<Supplier>(request, response), supplier);
	    model.addAttribute("page", page);
    	return "supplier/list";
    }
    
    /**
     * 恢复企业
     * @param supplier
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "recover" )
    public String recover(Supplier supplier,HttpServletRequest request, HttpServletResponse response, Model model) {
    	boolean flag=false;
    	supplier.setDelflag(1);
    	int result=supplierService.delete(supplier);
    	if(result == 1)
    		flag=true;
	    Page<Supplier> page = supplierService.findPage(new Page<Supplier>(request, response), supplier);
	    model.addAttribute("page", page);
	    return "supplier/list";
    }
    
    /**
     * 逻辑删除 修改delflag 为 -1 放入回收站
     * @param supplier
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "delete")
    public String deleteData(Supplier supplier,HttpServletRequest request, HttpServletResponse response, Model model) {
    	boolean flag=false;
    	supplier.setDelflag(-1);
    	int result=supplierService.delete(supplier);
    	if(result == 1)
    		flag=true;
	    Page<Supplier> page = supplierService.findPage(new Page<Supplier>(request, response), supplier);
	    model.addAttribute("page", page);
    	
    	return "supplier/list";
    }
    
    /**
     * 物理删除 将回收站的数据从数据库中删除
     * @param supplier
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "deleteData")
    public String delete(Supplier supplier,HttpServletRequest request, HttpServletResponse response, Model model) {
    	boolean flag=false;
    	int result=supplierService.deleteData(supplier);
    	if(result == 1)
    		flag=true;
	    Page<Supplier> page = supplierService.findPage(new Page<Supplier>(request, response), supplier);
	    model.addAttribute("page", page);
    	
    	return "supplier/list";
    }
    
    @RequestMapping(value = "checkName")
    @ResponseBody
    public String CheckName(Supplier supplier, HttpServletRequest request, HttpServletResponse response, Model model) {
    	
        boolean flag=supplierService.checkNameisUse(supplier);
        model.addAttribute("supplier", supplier);	
        if( flag ) 
        	 return RtnResult.successInfo("",null);
        else
        	 return RtnResult.errorInfo("", null);

    }
    
    /**
     * 前往更新页面
     * @param supplier
     * @param model
     * @return
     */
    @RequestMapping(value = "gotoupdate")
    public String gotoUpdate(Supplier supplier, Model model) {
    	supplier=supplierService.get(supplier.getId());
    	model.addAttribute("supplier",supplier);
    	return "supplier/update";
    }
 
    /**
     * 前往插入页面
     * @param supplier
     * @param model
     * @return
     */
    @RequestMapping(value = "gotoadd")
    public String gotoInsert() {
    	
    	return "supplier/add";
    }
 
    
    
    
   
    

}
