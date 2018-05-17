package com.trs.rwsc.modules.book.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



import com.trs.rwsc.common.persistence.Page;

import com.trs.rwsc.common.web.BaseController;
import com.trs.rwsc.modules.book.entity.DB_DangDang;
import com.trs.rwsc.modules.book.entity.DB_JingDong;
import com.trs.rwsc.modules.book.service.DB_DangDangService;
import com.trs.rwsc.modules.book.service.DB_JingDongService;




@Controller
@RequestMapping(value = "${adminPath}/book/")
public class BookController extends BaseController {
	
    @Autowired
    private DB_DangDangService db_DangDangService;
	  
    @Autowired
    private DB_JingDongService dB_JingDongService;
    

    @RequestMapping(value = "dangdang")
    public String dangDanglist(DB_DangDang db_DangDang, HttpServletRequest request, HttpServletResponse response, Model model) {
    	String type=request.getParameter("type");
    	db_DangDang.setType(type);
    	
        Page<DB_DangDang> page = db_DangDangService.findPage(new Page<DB_DangDang>(request, response), db_DangDang);

        model.addAttribute("page", page);
        model.addAttribute("type", type);
        
        return "modules/book/dangdanglist";
    }
    
    
    
    @RequestMapping(value = "jingdong")
    public String jingDonglist(DB_JingDong db_JingDong, HttpServletRequest request, HttpServletResponse response, Model model) {
    	String type=request.getParameter("type");
    	db_JingDong.setType(type);
        Page<DB_JingDong> page = dB_JingDongService.findPage(new Page<DB_JingDong>(request, response), db_JingDong);

        model.addAttribute("page", page);
        model.addAttribute("type", type);
        return "modules/book/jingdonglist";
    }
    
    @RequestMapping(value = "list")
    public String list( HttpServletRequest request, HttpServletResponse response, Model model) {

      
        return "modules/book/list";
    }
    
 
    
    
    
   
    

}
