package com.trs.rwsc.modules.modelinfo.service;

import com.trs.rwsc.common.service.CrudService;
import com.trs.rwsc.modules.modelinfo.dao.ModelDatabaseDao;
import com.trs.rwsc.modules.modelinfo.entity.ModelDatabase;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author msy
 * @Title: 模型信息业务处理类
 * @date 2018/3/2414:40
 */
@Service
@Transactional(readOnly = true)
public class ModelDatabaseService extends CrudService<ModelDatabaseDao, ModelDatabase> {
    private Logger logger = LoggerFactory.getLogger(ModelDatabaseService.class);

    @Autowired
    private ModelDatabaseDao modelDatabaseDao;

    /**
     * getTables
     * @描述  根据数据库配置查询数据表信息
     * @author    msy
     * @param dataBase
     * @return    java.util.List<java.util.Map<java.lang.String,java.lang.String>>
     * @exception
     * @date  2018/3/27 15:06
     */
    public List<Map<String, String>> getTables(ModelDatabase dataBase) throws ClassNotFoundException,SQLException {
        //1.加载驱动程序
        Class.forName("com.mysql.jdbc.Driver");
        //2.获得数据库链接
        Connection conn = DriverManager.getConnection(dataBase.getUrl(), dataBase.getUsername(), dataBase.getPassword());
        //3.通过数据库的连接操作数据库，实现增删改查（使用Statement类）
        Statement st = conn.createStatement();
        //查询数据库表名
        ResultSet rs = st.executeQuery("select table_name,table_comment from information_schema.tables where table_schema = '" + dataBase.getSchema() + "'");
        //返回的表
        List<Map<String, String>> tableList = new ArrayList<Map<String, String>>();
        Map<String, String> map = null;
        while (rs.next()) {
            map = new HashMap<String, String>();
            map.put("table_name", rs.getString(1));
            map.put("table_comment", rs.getString(2));
            tableList.add(map);
        }
        //关闭资源
        rs.close();
        st.close();
        conn.close();

        return tableList;
    }

    /**
     * getViews
     * @描述  获取配置数据库下的视图信息
     * @author    msy
     * @param dataBase
     * @return    java.util.List<java.util.Map<java.lang.String,java.lang.String>>
     * @exception
     * @date  2018/3/27 15:08
     */
    public List<Map<String, String>> getViews(ModelDatabase dataBase) throws ClassNotFoundException,SQLException {
        //1.加载驱动程序
        Class.forName("com.mysql.jdbc.Driver");
        //2.获得数据库链接
        Connection conn = DriverManager.getConnection(dataBase.getUrl(), dataBase.getUsername(), dataBase.getPassword());
        //3.通过数据库的连接操作数据库，实现增删改查（使用Statement类）
        Statement st = conn.createStatement();
        //查询数据库表名
        ResultSet rs = st.executeQuery("SELECT table_name, VIEW_DEFINITION as table_comment FROM INFORMATION_SCHEMA.views where table_schema = '" + dataBase.getSchema() + "'");
        //返回的表
        List<Map<String, String>> viewList = new ArrayList<Map<String, String>>();
        Map<String, String> map = null;
        while (rs.next()) {
            map = new HashMap<String, String>();
            map.put("table_name", rs.getString(1));
            map.put("table_comment", rs.getString(2));
            viewList.add(map);
        }
        //关闭资源
        rs.close();
        st.close();
        conn.close();

        return viewList;
    }

    /**
     * getTableColumns
     * @描述  获取表的列信息
     * @author    msy
     * @version
     * @param dataBase
     * @param tableName
     * @return    java.util.List<java.util.Map<java.lang.String,java.lang.String>>
     * @exception
     * @date  2018/3/27 15:14
     */
    public List<Map<String, String>> getTableColumns(ModelDatabase dataBase, String tableName) throws ClassNotFoundException, SQLException {
        //1.加载驱动程序
        Class.forName("com.mysql.jdbc.Driver");
        //2.获得数据库链接
        Connection conn = DriverManager.getConnection(dataBase.getUrl(), dataBase.getUsername(), dataBase.getPassword());
        //3.通过数据库的连接操作数据库，实现增删改查（使用Statement类）
        Statement st = conn.createStatement();
        //查询数据库表名
        ResultSet rs = st.executeQuery("SELECT column_name,column_comment,data_type FROM information_schema.COLUMNS WHERE table_schema = '" + dataBase.getSchema() + "' AND table_name = '" + tableName + "'");
        //返回的表
        List<Map<String, String>> columnList = new ArrayList<Map<String, String>>();
        Map<String, String> map = null;
        while (rs.next()) {
            //只展示数值类型的字段
            if (rs.getString(3).equals("decimal") || rs.getString(3).equals("double")
                    || rs.getString(3).equals("float") || rs.getString(3).equals("int")
                    || rs.getString(3).equals("integer") || rs.getString(3).equals("numberic")){
                map = new HashMap<String, String>();
                map.put("column_name", rs.getString(1));
                map.put("column_comment",rs.getString(2));
                columnList.add(map);
            }
        }
        //关闭资源
        rs.close();
        st.close();
        conn.close();

        return columnList;
    }

    /**
     * testConn
     * @描述  测试配置的数据库链接是否正确
     * @author    msy
     * @version
     * @param dataBase
     * @return    void
     * @exception
     * @date  2018/3/29 15:51
     */
    public void testConn(ModelDatabase dataBase)  throws ClassNotFoundException, SQLException {
        //1.加载驱动程序
        Class.forName("com.mysql.jdbc.Driver");
        //2.获得数据库链接
        Connection conn = DriverManager.getConnection(dataBase.getUrl(), dataBase.getUsername(), dataBase.getPassword());
        conn.close();
    }
}
