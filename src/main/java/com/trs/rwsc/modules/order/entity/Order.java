package com.trs.rwsc.modules.order.entity;

import java.sql.Timestamp;
import java.util.Date;

import com.trs.rwsc.common.persistence.DataEntity;
import com.trs.rwsc.common.persistence.Page;
import com.trs.rwsc.modules.books.entity.Books;
import com.trs.rwsc.modules.supplier.entity.Supplier;

public class Order extends DataEntity<Order>{

	private String name;

    private Integer num;

    private String origin;

    private Double price;

    private Integer st;



    private String receivingUnit;

    private String receivingPerson;
    
    private String receivingAddress;
    

    private String receivingPhone;

    private String bookId;
    private String supplierId;


    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin == null ? null : origin.trim();
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getSt() {
        return st;
    }

    public String getReceivingAddress() {
		return receivingAddress;
	}

	public void setReceivingAddress(String receivingAddress) {
		this.receivingAddress = receivingAddress;
	}

	public void setSt(Integer st) {
        this.st = st;
    }



	public String getReceivingUnit() {
        return receivingUnit;
    }

    public void setReceivingUnit(String receivingUnit) {
        this.receivingUnit = receivingUnit == null ? null : receivingUnit.trim();
    }

    public String getReceivingPerson() {
        return receivingPerson;
    }

    public void setReceivingPerson(String receivingPerson) {
        this.receivingPerson = receivingPerson == null ? null : receivingPerson.trim();
    }

    public String getReceivingPhone() {
        return receivingPhone;
    }
    
    

  

	public void setReceivingPhone(String receivingPhone) {
        this.receivingPhone = receivingPhone == null ? null : receivingPhone.trim();
    }

	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}


	
    


	

    
    
}