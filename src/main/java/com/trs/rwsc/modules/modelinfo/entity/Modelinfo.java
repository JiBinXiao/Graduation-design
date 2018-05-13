package com.trs.rwsc.modules.modelinfo.entity;

import com.trs.rwsc.common.persistence.DataEntity;

import java.util.Date;

/**
 * @author msy
 * @Title: 模型信息表
 * @Description: ${todo}
 * @date 2018/3/2414:14
 */
public class Modelinfo extends DataEntity<Modelinfo> {
    private  int baseid;
    private String sourcetype;
    private String modeltype;
    private String modelname;
    private String modeldesc;
    private String sourcename;
    private String sourcedesc;
    private String sourcefields;
    private Double modelparam1;
    private Double modelparam2;
    private Double modelparam3;
    private Double modelparam4;
    private Double modelparam5;
    private Double modelparam6;
    private String modelparam7;
    private String status;
    private String username;
    private String lastuser;
    private Date lasttime;
    private String result; //计算结果，保存为json格式的字符串

    public int getBaseid() {
        return baseid;
    }

    public void setBaseid(int baseid) {
        this.baseid = baseid;
    }

    public String getSourcetype() {
        return sourcetype;
    }

    public void setSourcetype(String sourcetype) {
        this.sourcetype = sourcetype;
    }

    public String getModeltype() {
        return modeltype;
    }

    public void setModeltype(String modeltype) {
        this.modeltype = modeltype;
    }

    public String getModelname() {
        return modelname;
    }

    public void setModelname(String modelname) {
        this.modelname = modelname;
    }

    public String getModeldesc() {
        return modeldesc;
    }

    public void setModeldesc(String modeldesc) {
        this.modeldesc = modeldesc;
    }

    public String getSourcename() {
        return sourcename;
    }

    public void setSourcename(String sourcename) {
        this.sourcename = sourcename;
    }

    public String getSourcedesc() {
        return sourcedesc;
    }

    public void setSourcedesc(String sourcedesc) {
        this.sourcedesc = sourcedesc;
    }

    public String getSourcefields() {
        return sourcefields;
    }

    public void setSourcefields(String sourcefields) {
        this.sourcefields = sourcefields;
    }

    public Double getModelparam1() {
        return modelparam1;
    }

    public void setModelparam1(Double modelparam1) {
        this.modelparam1 = modelparam1;
    }

    public Double getModelparam2() {
        return modelparam2;
    }

    public void setModelparam2(Double modelparam2) {
        this.modelparam2 = modelparam2;
    }

    public Double getModelparam3() {
        return modelparam3;
    }

    public void setModelparam3(Double modelparam3) {
        this.modelparam3 = modelparam3;
    }

    public Double getModelparam4() {
        return modelparam4;
    }

    public void setModelparam4(Double modelparam4) {
        this.modelparam4 = modelparam4;
    }

    public Double getModelparam5() {
        return modelparam5;
    }

    public void setModelparam5(Double modelparam5) {
        this.modelparam5 = modelparam5;
    }

    public Double getModelparam6() {
        return modelparam6;
    }

    public void setModelparam6(Double modelparam6) {
        this.modelparam6 = modelparam6;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getLastuser() {
        return lastuser;
    }

    public void setLastuser(String lastuser) {
        this.lastuser = lastuser;
    }

    public Date getLasttime() {
        return lasttime;
    }

    public void setLasttime(Date lasttime) {
        this.lasttime = lasttime;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getModelparam7() {
        return modelparam7;
    }

    public void setModelparam7(String modelparam7) {
        this.modelparam7 = modelparam7;
    }
}
