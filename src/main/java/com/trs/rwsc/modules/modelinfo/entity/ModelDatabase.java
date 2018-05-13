package com.trs.rwsc.modules.modelinfo.entity;

import com.trs.rwsc.common.persistence.DataEntity;

/**
 * @author msy
 * @Title: ${file_name}
 * @Package ${package_name}
 * @Description: ${todo}
 * @date 2018/3/27 14:14
 */
public class ModelDatabase extends DataEntity<ModelDatabase> {
    private String schema;
    private String name;
    private String url;
    private String username;
    private String password;

    public String getSchema() {
        return schema;
    }

    public void setSchema(String schema) {
        this.schema = schema;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
