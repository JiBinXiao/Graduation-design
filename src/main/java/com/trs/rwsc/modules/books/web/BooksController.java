package com.trs.rwsc.modules.books.web;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.trs.rwsc.modules.book.entity.DB_DangDang;
import com.trs.rwsc.modules.book.entity.DB_JingDong;
import com.trs.rwsc.modules.book.service.DB_DangDangService;
import com.trs.rwsc.modules.book.service.DB_JingDongService;
import com.trs.rwsc.modules.books.entity.Books;
import com.trs.rwsc.modules.books.service.*;
import com.trs.rwsc.modules.supplier.entity.Supplier;
import com.trs.rwsc.modules.supplier.service.SupplierService;

@Controller
@RequestMapping(value = "${adminPath}/books/")
public class BooksController {
	
	@Autowired
	private SupplierService supplierService;
	
	@Autowired
	private BooksService booksService;
	
	@Autowired
	private DB_DangDangService db_DangDangService;
	
	@Autowired
	private DB_JingDongService db_JingDongService;

	@RequestMapping(value="add")
	public String add(HttpServletRequest request, HttpServletResponse response, Model model) {
		String origin=request.getParameter("origin");
		String id=request.getParameter("id");
	
		Books books=new Books();
		if( "dangdang".equals(origin) ){
			DB_DangDang dangDang_Book= db_DangDangService.get(Integer.parseInt(id));
			if(dangDang_Book !=null ) {
				
				books.setName(dangDang_Book.getTitle());
				books.setAuthor(dangDang_Book.getAuthor());
				books.setDec1(dangDang_Book.getDesc1());
				books.setIsbn(dangDang_Book.getIsbn());
				books.setLinkurl(dangDang_Book.getLink());
				books.setPublish(dangDang_Book.getPublish());
				String price=dangDang_Book.getPrnow();
				
				price=price.substring(1);
				books.setPrice(price);
				books.setOrigin("当当网");
			
			}
			
		}
		if( "jingdong".equals(origin)) {
			DB_JingDong db_JingDong=db_JingDongService.get(Integer.parseInt(id));
			if(db_JingDong != null) {
				books.setName(db_JingDong.getTitle());
				books.setPublish(db_JingDong.getPublish());
				books.setIsbn(db_JingDong.getIsbn());
				books.setLinkurl(db_JingDong.getLink());
				String price=db_JingDong.getPrnow();
				
				price=price.substring(1);
				books.setPrice(price);
				books.setOrigin("京东网");
			}
		}
		
		Books newbooks=booksService.get(books.getName());
		if(newbooks==null)
			booksService.add(books);
		books=booksService.get(books.getName());
		 
		
		List<Supplier> suppliers= supplierService.findList();
		model.addAttribute("books",books);
		model.addAttribute("suppliers",suppliers);
		
		return "modules/books/add";
	}
}
