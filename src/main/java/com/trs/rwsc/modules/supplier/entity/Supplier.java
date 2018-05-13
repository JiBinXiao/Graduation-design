package com.trs.rwsc.modules.supplier.entity;

import java.util.Date;

import com.trs.rwsc.common.persistence.DataEntity;


public class Supplier extends DataEntity<Supplier> {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;





	    private String sname;

	    private String address;

	    private String phone;

	    private String sdec;

	

	  
	    public String getSname() {
	        return sname;
	    }

	    public void setSname(String sname) {
	        this.sname = sname == null ? null : sname.trim();
	    }

	    public String getAddress() {
	        return address;
	    }

	    public void setAddress(String address) {
	        this.address = address == null ? null : address.trim();
	    }

	    public String getPhone() {
	        return phone;
	    }

	    public void setPhone(String phone) {
	        this.phone = phone == null ? null : phone.trim();
	    }

	    public String getSdec() {
	        return sdec;
	    }

	    public void setSdec(String sdec) {
	        this.sdec = sdec == null ? null : sdec.trim();
	    }

	   

	    public String getRemark() {
	        return remark;
	    }

	    public void setRemark(String remark) {
	        this.remark = remark == null ? null : remark.trim();
	    }


}