package com.trs.rwsc.modules.book.entity;

import com.trs.rwsc.common.persistence.DataEntity;


public class JD_Book extends DataEntity<JD_Book> {
		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;



	 private String title;

	    private String prnow;

	    private String pb;

	    private String isbn;

	    private String link;

	

	    public String getTitle() {
	        return title;
	    }

	    public void setTitle(String title) {
	        this.title = title == null ? null : title.trim();
	    }

	    public String getPrnow() {
	        return prnow;
	    }

	    public void setPrnow(String prnow) {
	        this.prnow = prnow == null ? null : prnow.trim();
	    }

	    public String getPb() {
	        return pb;
	    }

	    public void setPb(String pb) {
	        this.pb = pb == null ? null : pb.trim();
	    }

	    public String getIsbn() {
	        return isbn;
	    }

	    public void setIsbn(String isbn) {
	        this.isbn = isbn == null ? null : isbn.trim();
	    }

	    public String getLink() {
	        return link;
	    }

	    public void setLink(String link) {
	        this.link = link == null ? null : link.trim();
	    }
}
