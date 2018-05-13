package com.trs.rwsc.modules.company.entity;

import java.util.Date;

import com.trs.rwsc.common.persistence.DataEntity;

public class Company_Info  extends DataEntity<Company_Info> {


	private static final long serialVersionUID = 1L;
    private Long custId;

    private String custCfname;

    private String custCsname;

    private String custEfname;

    private String custEsname;

    private String custOrgid;

    private String custIndustrycode;

    private String custIndustry1;

    private String custIndustry2;

    private String areaCode;

    private String districtName;

    private String provinceName;

    private String cityName;

    private char pinyin;

    private Integer dataSource;

    private String icCode;

    private String stockCode;

    private Integer cmtp;


    public Long getCustId() {
        return custId;
    }

    public void setCustId(Long custId) {
        this.custId = custId;
    }

    public String getCustCfname() {
        return custCfname;
    }

    public void setCustCfname(String custCfname) {
        this.custCfname = custCfname == null ? null : custCfname.trim();
    }

    public String getCustCsname() {
        return custCsname;
    }

    public void setCustCsname(String custCsname) {
        this.custCsname = custCsname == null ? null : custCsname.trim();
    }

    public String getCustEfname() {
        return custEfname;
    }

    public void setCustEfname(String custEfname) {
        this.custEfname = custEfname == null ? null : custEfname.trim();
    }

    public String getCustEsname() {
        return custEsname;
    }

    public void setCustEsname(String custEsname) {
        this.custEsname = custEsname == null ? null : custEsname.trim();
    }

    public String getCustOrgid() {
        return custOrgid;
    }

    public void setCustOrgid(String custOrgid) {
        this.custOrgid = custOrgid == null ? null : custOrgid.trim();
    }

    public String getCustIndustrycode() {
        return custIndustrycode;
    }

    public void setCustIndustrycode(String custIndustrycode) {
        this.custIndustrycode = custIndustrycode == null ? null : custIndustrycode.trim();
    }

    public String getCustIndustry1() {
        return custIndustry1;
    }

    public void setCustIndustry1(String custIndustry1) {
        this.custIndustry1 = custIndustry1 == null ? null : custIndustry1.trim();
    }

    public String getCustIndustry2() {
        return custIndustry2;
    }

    public void setCustIndustry2(String custIndustry2) {
        this.custIndustry2 = custIndustry2 == null ? null : custIndustry2.trim();
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode == null ? null : areaCode.trim();
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName == null ? null : districtName.trim();
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName == null ? null : provinceName.trim();
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName == null ? null : cityName.trim();
    }



    public char getPinyin() {
		return pinyin;
	}

	public void setPinyin(char pinyin) {
		this.pinyin = pinyin;
	}



    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }



    public Integer getDataSource() {
        return dataSource;
    }

    public void setDataSource(Integer dataSource) {
        this.dataSource = dataSource;
    }

    public String getIcCode() {
        return icCode;
    }

    public void setIcCode(String icCode) {
        this.icCode = icCode == null ? null : icCode.trim();
    }

    public String getStockCode() {
        return stockCode;
    }

    public void setStockCode(String stockCode) {
        this.stockCode = stockCode == null ? null : stockCode.trim();
    }

    public Integer getCmtp() {
        return cmtp;
    }

    public void setCmtp(Integer cmtp) {
        this.cmtp = cmtp;
    }

	@Override
	public String toString() {
		return "Company_Info [custId=" + custId + ", custCfname=" + custCfname + ", custCsname=" + custCsname
				+ ", custEfname=" + custEfname + ", custEsname=" + custEsname + ", custOrgid=" + custOrgid
				+ ", custIndustrycode=" + custIndustrycode + ", custIndustry1=" + custIndustry1 + ", custIndustry2="
				+ custIndustry2 + ", areaCode=" + areaCode + ", districtName=" + districtName + ", provinceName="
				+ provinceName + ", cityName=" + cityName + ", pinyin=" + pinyin + ", dataSource=" + dataSource
				+ ", icCode=" + icCode + ", stockCode=" + stockCode + ", cmtp=" + cmtp + "]";
	}
}