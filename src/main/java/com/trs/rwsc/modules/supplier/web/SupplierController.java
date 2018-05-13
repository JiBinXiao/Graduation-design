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


@Controller
@RequestMapping(value = "${adminPath}/supplier/")
public class SupplierController extends BaseController {
	
    @Autowired
    private SupplierService supplierService;
	  
    
    /**
     * 
     * @param modelinfo
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "list")
    public String company_infolist(Supplier supplier, HttpServletRequest request, HttpServletResponse response, Model model) {

        Page<Supplier> page = supplierService.findPage(new Page<Supplier>(request, response), supplier);

        model.addAttribute("page", page);
        
        return "modules/supplier/list";
    }
    
 
    
    
    
   
    

}
