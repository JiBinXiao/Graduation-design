package com.trs.rwsc.modules.books.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.trs.rwsc.modules.books.dao.BooksMapper;
import com.trs.rwsc.modules.books.entity.Books;

@Service
@Transactional(readOnly = true)
public class BooksService {

	@Autowired
	private BooksMapper booksMapper;

	@Transactional(readOnly = false)
	public void add(Books books) {
		// TODO Auto-generated method stub
		booksMapper.insertSelective(books);
		
	}

	
	public Books get(String string) {
		// TODO Auto-generated method stub
		return booksMapper.get(string);
	}
	
	public Books getById(int id) {
		// TODO Auto-generated method stub
		return booksMapper.getById(id);
	}
}
