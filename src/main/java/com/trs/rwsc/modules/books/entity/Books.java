package com.trs.rwsc.modules.books.entity;

public class Books {
    private Integer id;

    private String name;
    
    private String price;

    private String author;

    private String publish;

    private String dec1;

    private String isbn;

    private String linkurl;

    private String origin;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
    
    


	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
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

    

    public String getDec1() {
		return dec1;
	}

	public void setDec1(String dec1) {
		this.dec1 = dec1;
	}

	public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn == null ? null : isbn.trim();
    }

    public String getLinkurl() {
        return linkurl;
    }

    public void setLinkurl(String linkurl) {
        this.linkurl = linkurl == null ? null : linkurl.trim();
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin == null ? null : origin.trim();
    }

	@Override
	public String toString() {
		return "Books [id=" + id + ", name=" + name + ", price=" + price + ", author=" + author + ", publish=" + publish
				+ ", dec1=" + dec1 + ", isbn=" + isbn + ", linkurl=" + linkurl + ", origin=" + origin + "]";
	}
    
    
}