package com.trs.rwsc.modules.book.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



import com.trs.rwsc.common.persistence.Page;

import com.trs.rwsc.common.web.BaseController;
import com.trs.rwsc.modules.book.entity.DangDang_Book;
import com.trs.rwsc.modules.book.entity.JD_Book;
import com.trs.rwsc.modules.book.service.DangDang_BookService;
import com.trs.rwsc.modules.book.service.JD_BookService;
import com.trs.rwsc.modules.company.entity.Company_Info;


@Controller
@RequestMapping(value = "${adminPath}/book/")
public class BookController extends BaseController {
	
    @Autowired
    private DangDang_BookService douBan_BookService;
    
    @Autowired
    private JD_BookService jd_BookService;
	  
    
    /**
     * 
     * @param modelinfo
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "dangdang")
    public String dangDanglist(DangDang_Book douBan_Book, HttpServletRequest request, HttpServletResponse response, Model model) {

        Page<DangDang_Book> page = douBan_BookService.findPage(new Page<DangDang_Book>(request, response), douBan_Book);

        model.addAttribute("page", page);
        
        return "modules/book/dangdanglist";
    }
    
    @RequestMapping(value = "jingdong")
    public String jingDonglist(JD_Book jd_Book, HttpServletRequest request, HttpServletResponse response, Model model) {

        Page<JD_Book> page = jd_BookService.findPage(new Page<JD_Book>(request, response), jd_Book);

        model.addAttribute("page", page);
        
        return "modules/book/jingdonglist";
    }
    
 
    
    
    
   
    

}
