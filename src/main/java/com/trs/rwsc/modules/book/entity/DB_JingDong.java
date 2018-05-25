package com.trs.rwsc.modules.book.entity;

import java.util.Date;

import com.trs.rwsc.common.persistence.DataEntity;

public class DB_JingDong extends DataEntity<DB_JingDong>{

    
    private String title;

    private String prnow;

    private String publish;

    private String isbn;

    private String link;
    
    private String goodRateShow;
    
    private String goodCountStr;


    private Date createdate;

    private String type;


    
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

    public String getPublish() {
        return publish;
    }

    public void setPublish(String publish) {
        this.publish = publish == null ? null : publish.trim();
    }

    public String getIsbn() {
        return isbn;
    }
    
    

    public String getGoodRateShow() {
		return goodRateShow;
	}

	public void setGoodRateShow(String goodRateShow) {
		this.goodRateShow = goodRateShow == null ? null : goodRateShow.trim();
	}

	public String getGoodCountStr() {
		return goodCountStr;
	}

	public void setGoodCountStr(String goodCountStr) {
		this.goodCountStr = goodCountStr == null ? null : goodCountStr.trim();
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

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

    
}