package com.trs.rwsc.modules.supplier.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



import com.trs.rwsc.common.persistence.Page;

import com.trs.rwsc.common.web.BaseController;
import com.trs.rwsc.modules.book.entity.DangDang_Book;
import com.trs.rwsc.modules.book.service.DangDang_BookService;
import com.trs.rwsc.modules.company.entity.Company_Info;
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
    @RequestMapping(value = "insert" )
    public String insert(Supplier supplier,HttpServletRequest request, HttpServletResponse response, Model model) {
    	boolean flag=false;
    	supplier.setIsNewRecord(true);
    	int result=supplierService.save(supplier);
    	if(result == 1)
    		flag=true;
	    Page<Supplier> page = supplierService.findPage(new Page<Supplier>(request, response), supplier);
	    model.addAttribute("page", page);
    	return "supplier/list";
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
    
    /**
     * 前往更新页面
     * @param supplier
     * @param model
     * @return
     */
    @RequestMapping(value = "gotoUpdate")
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
    @RequestMapping(value = "gotoInsert")
    public String gotoInsert() {
    	
    	return "supplier/insert";
    }
 
    
    
    
   
    

}
