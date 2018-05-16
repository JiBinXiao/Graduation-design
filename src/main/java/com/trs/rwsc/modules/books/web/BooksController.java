package com.trs.rwsc.modules.books.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.trs.rwsc.modules.book.entity.DangDang_Book;
import com.trs.rwsc.modules.book.service.DangDang_BookService;
import com.trs.rwsc.modules.books.entity.Books;
import com.trs.rwsc.modules.books.service.*;

@Controller
@RequestMapping(value = "${adminPath}/books/")
public class BooksController {
	
	@Autowired
	private BooksService booksService;
	
	@Autowired
	private DangDang_BookService dangDang_BookService;

	@RequestMapping(value="add")
	public String add(HttpServletRequest request, HttpServletResponse response, Model model) {
		String type=request.getParameter("type");
		String id=request.getParameter("id");
	
		Books books=new Books();
		if( "dangdang".equals(type) ){
			DangDang_Book dangDang_Book= dangDang_BookService.get(Integer.parseInt(id));
			if(dangDang_Book !=null ) {
				System.out.println(dangDang_Book);
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
		Books newbooks=booksService.get(books.getName());
		if(newbooks==null)
			booksService.add(books);
		books=booksService.get(books.getName());
		model.addAttribute("books",books);
		
		
		return "modules/books/add";
	}
}
