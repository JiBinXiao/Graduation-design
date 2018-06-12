package com.trs.rwsc.modules.book.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.valves.CrawlerSessionManagerValve;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.trs.rwsc.common.persistence.Page;
import com.trs.rwsc.common.utils.RtnResult;
import com.trs.rwsc.common.web.BaseController;
import com.trs.rwsc.modules.book.entity.DB_DangDang;
import com.trs.rwsc.modules.book.entity.DB_JingDong;
import com.trs.rwsc.modules.book.service.DB_DangDangService;
import com.trs.rwsc.modules.book.service.DB_JingDongService;
import com.trs.rwsc.modules.book.util.CrwalUtil;




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
    	String sortType=request.getParameter("sortType");
    	if(sortType!=null && !"".equals(sortType))
    		db_DangDang.setSortType(sortType);
    	else {
    		sortType="综合";
    		db_DangDang.setSortType(sortType);
    	}
    		
    	db_DangDang.setType(type);

        Page<DB_DangDang> page = db_DangDangService.findPage(new Page<DB_DangDang>(request, response), db_DangDang);

        model.addAttribute("page", page);
        model.addAttribute("type", type);
        model.addAttribute("sortType", sortType);
        return "modules/book/dangdanglist";
    }
    
    
    
    @RequestMapping(value = "jingdong")
    public String jingDonglist(DB_JingDong db_JingDong, HttpServletRequest request, HttpServletResponse response, Model model) {
    	String type=request.getParameter("type");
    	String sortType=request.getParameter("sortType");
    	db_JingDong.setType(type);
    	if(sortType!=null && !"".equals(sortType))
    		db_JingDong.setSortType(sortType);
    	else {
    		sortType="综合";
    		db_JingDong.setSortType(sortType);
    	}
    		
        Page<DB_JingDong> page = dB_JingDongService.findPage(new Page<DB_JingDong>(request, response), db_JingDong);

        model.addAttribute("page", page);
        model.addAttribute("sortType", sortType);
        model.addAttribute("type", type);
        return "modules/book/jingdonglist";
    }
    
    @RequestMapping(value = "list")
    public String list( HttpServletRequest request, HttpServletResponse response, Model model) {

      
        return "modules/book/list";
    }
    
    
    /**
     * 删除旧的数据 爬去新的数据
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value= "crwal")
    @ResponseBody
    public String crwal(HttpServletRequest request, HttpServletResponse response, Model model) {
    	String type=request.getParameter("type");
    	String keyword=request.getParameter("keyword");
    	String sum=request.getParameter("sum");
    	String sortType=request.getParameter("sortType");
    	if("jingdong".equals(type)) {
    		int res=dB_JingDongService.deleteByType(keyword,sortType);

    	}
    	
    	if("dangdang".equals(type)) {
    		int res=db_DangDangService.deleteByType(keyword,sortType);
    		
    	}
    	String pythonpath=request.getSession().getServletContext().getRealPath("static\\python");
		CrwalUtil crwalUtil=new CrwalUtil();
		if(sum==null)
			sum="11";
			
		int re=crwalUtil.crwal(type, keyword,sortType,pythonpath,Integer.parseInt(sum));
		
		
    	String msg="成功爬取出"+(re-1)+"条数据";
    	if( re==-1)
    		msg="无法爬取";
    	return RtnResult.successInfo(msg, null);
    }
    
    
    
   
    

}
