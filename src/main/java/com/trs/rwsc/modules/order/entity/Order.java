package com.trs.rwsc.modules.order.entity;

import java.util.Date;

import com.trs.rwsc.common.persistence.DataEntity;
import com.trs.rwsc.common.persistence.Page;

public class Order extends DataEntity<Order>{

	private String name;

    private Integer num;

    private String origin;

    private Double price;

    private Integer st;

    private Date createdate;

    private String receivingUnit;

    private String receivingPerson;
    
    private String receivingAddress;
    

    private String receivingPhone;

    private Integer bookId;

    private Integer supplierId;



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

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
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

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public Integer getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Integer supplierId) {
        this.supplierId = supplierId;
    }
    


	@Override
	public String toString() {
		return "Order [id=" + id + ", num=" + num + ", origin=" + origin + ", price=" + price + ", st=" + st
				+ ", createdate=" + createdate + ", receivingUnit=" + receivingUnit + ", receivingPerson="
				+ receivingPerson + ", receivingAddress=" + receivingAddress + ", receivingPhone=" + receivingPhone
				+ ", bookId=" + bookId + ", supplierId=" + supplierId + "]";
	}
    
    
}