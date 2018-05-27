package com.trs.rwsc.modules.book.entity;

import java.util.Date;

import com.trs.rwsc.common.persistence.DataEntity;

public class DB_DangDang extends DataEntity<DB_DangDang>{

    
    private String title;

    private String prnow;

    private String prpre;

    private String author;

    private String publish;

    private String desc1;

    private String isbn;
    
    private String reviewCount;

    private String link;

    private String type;

    private String sortType;



    public String getSortType() {
		return sortType;
	}

	public void setSortType(String sortType) {
		this.sortType = sortType;
	}

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

    public String getPrpre() {
        return prpre;
    }

    public void setPrpre(String prpre) {
        this.prpre = prpre == null ? null : prpre.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public String getPublish() {
        return publish;
    }

    public void setPublish(String publish) {
        this.publish = publish == null ? null : publish.trim();
    }

    public String getDesc1() {
        return desc1;
    }

    public void setDesc1(String desc1) {
        this.desc1 = desc1 == null ? null : desc1.trim();
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn == null ? null : isbn.trim();
    }

    

	public String getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(String reviewCount) {
		this.reviewCount = reviewCount;
	}

	public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link == null ? null : link.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }



    
}