package com.trs.rwsc.modules.modelinfo.web;

import com.trs.rwsc.common.mapper.JsonMapper;
import com.trs.rwsc.common.utils.RtnResult;
import com.trs.rwsc.common.web.BaseController;
import com.trs.rwsc.modules.modelinfo.entity.ModelDatabase;
import com.trs.rwsc.modules.modelinfo.entity.Modelinfo;
import com.trs.rwsc.modules.modelinfo.service.ModelDatabaseService;
import com.trs.rwsc.modules.modelinfo.service.ModelinfoService;
import com.trs.rwsc.modules.modelinfo.utils.ModelConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * @author msy
 * @Title: 模型管理公用控制类
 * @Package ${package_name}
 * @date 2018/3/2915:46
 */
@Controller
@RequestMapping(value = "${adminPath}/modelinfo/")
public class ModelInfoController extends BaseController {
    @Autowired
    private ModelDatabaseService modelDatabaseService;
    @Autowired
    private ModelinfoService modelinfoService;

    /**
     * testDataBase
     * @描述  测试配置的数据库连接是否正常
     * @author    msy
     * @version
     * @param baseid 数据库配置表的id
     * @return    java.lang.String
     * @exception
     * @date  2018/3/29 15:53
     */
    @RequestMapping(value = "testDataBase")
    @ResponseBody
    public String testDataBase(Integer baseid) {
        boolean test = true;
        ModelDatabase database = new ModelDatabase();
        database.setId(baseid);
        database = modelDatabaseService.get(database);
        if (database != null) {
            try {
                modelDatabaseService.testConn(database);
            } catch (ClassNotFoundException e) {
                test = false;
                e.printStackTrace();
            } catch (SQLException e) {
                test = false;
            }
        }

        if (test) {
            return RtnResult.successInfo("",null);
        } else {
            return RtnResult.errorInfo("", null);
        }
    }

    /**
     *
     * getFile
     * @描述: 获取服务器上的文件
     *
     * @param modelinfo
     * @param response
     * @throws IOException
     * @异常:
     * @author mishiyin
     * @创建日期： 2017年9月7日
     * @修改人：
     * @修改日期：
     * @备注：
     */
    @RequestMapping(value = "getFile")
    public void getFile(Modelinfo modelinfo, HttpServletResponse response) throws IOException {
        String changeLine = "\r\n";
        modelinfo = modelinfoService.get(modelinfo);
        StringBuffer expSb = new StringBuffer();
        if (modelinfo != null) {
            String result = modelinfo.getResult();
            Map<String, Object> map = (Map<String, Object>) JsonMapper.fromJsonString(result, Map.class);

            for(Map.Entry<String, Object> entry : map.entrySet()) {
                expSb.append(entry.getKey() + changeLine);
                expSb.append(entry.getValue() + changeLine);
            }
        }
        String fileName = new String((modelinfo.getModelname()+"运算结果").getBytes("gb2312"), "ISO8859-1");
        response.setCharacterEncoding("utf-8");
        //设置响应内容的类型
        response.setContentType("text/plain");
        //设置文件的名称和格式
        response.addHeader(
                "Content-Disposition",
                "attachment; filename="+fileName
                        + ".txt");//通过后缀可以下载不同的文件格式
        BufferedOutputStream buff = null;
        ServletOutputStream outStr = null;
        try {
            outStr = response.getOutputStream();
            buff = new BufferedOutputStream(outStr);
            buff.write(expSb.toString().getBytes("UTF-8"));
            buff.flush();
            buff.close();
        } catch (Exception e) {
            logger.error("导出文件文件出错，e:{}",e);
        } finally {try {
            buff.close();
            outStr.close();
        } catch (Exception e) {
            logger.error("关闭流对象出错 e:{}",e);
        }
        }
    }

    /**
     * getFields
     * @描述  获取字段列表
     * @author    msy
     * @version
     * @param id 配置数据库id
     * @param sourcetype 数据源类型 1-表 2-视图
     * @param sourcename 表名或视图名称
     * @return    java.lang.String
     * @exception
     * @date  2018/4/3 14:58
     */
    @RequestMapping(value = "getFields")
    @ResponseBody
    public String getFields(Integer id, String sourcetype, String sourcename) {
        List<Map<String, String>> columns = null;
        //获取数据库配置
        ModelDatabase database = new ModelDatabase();
        database.setId(id);
        database = modelDatabaseService.get(database);
        try {
            columns = modelDatabaseService.getTableColumns(database, sourcename);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        StringBuffer sb = new StringBuffer();
        if (columns != null) {
            for (int i = 0; i < columns.size(); i++) {
                Map<String, String> map = columns.get(i);
                sb.append("<tr><td><input type=\"checkbox\" class=\"i-checks\" id=\"checks_"+(i+1)+"\">"+(i+1)+"</td>");
                sb.append("<td>"+map.get("column_name")+"</td>");
                sb.append("<td>"+map.get("column_comment")+"</td></tr>");
            }
        }
        return sb.toString();
    }
    /**
     * getEnFields
     * @描述  获取熵值法字段列表
     * @author    msy
     * @version
     * @param id 配置数据库id
     * @param sourcetype 数据源类型 1-表 2-视图
     * @param sourcename 表名或视图名称
     * @return    java.lang.String
     * @exception
     * @date  2018/4/3 14:58
     */
    @RequestMapping(value = "getEnFields")
    @ResponseBody
    public String getEnFields(Integer id, String sourcetype, String sourcename) {
        List<Map<String, String>> columns = null;
        //获取数据库配置
        ModelDatabase database = new ModelDatabase();
        database.setId(id);
        database = modelDatabaseService.get(database);
        try {
            columns = modelDatabaseService.getTableColumns(database, sourcename);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        StringBuffer sb = new StringBuffer();
        if (columns != null) {
            for (int i = 0; i < columns.size(); i++) {
                Map<String, String> map = columns.get(i);
                sb.append("<tr><td><input type=\"checkbox\" class=\"i-checks\" id=\"checks_"+(i+1)+"\">"+(i+1)+"</td>");
                sb.append("<td>"+map.get("column_name")+"</td>");
                sb.append("<td>"+map.get("column_comment")+"</td>");
                sb.append("<td><input type='radio' name='checks_"+(i+1)+"' value='1' checked='checked'/>正向指标&nbsp;&nbsp;&nbsp;&nbsp;<input type='radio' name='checks_"+(i+1)+"' value='0'/>负向指标</td></tr>");
            }
        }
        return sb.toString();
    }

    /**
     * getTabs
     * @描述  获取表或视图列表
     * @author    msy
     * @version
     * @param database 数据源id
     * @param sourcetype 数据源类型
     * @return    java.lang.String
     * @exception
     * @date  2018/4/3 14:58
     */
    @RequestMapping(value = "getTabs")
    @ResponseBody
    public String getTabs(@RequestParam(value = "database", required = true) Integer database, String sourcetype) {
        List<Map<String, String>> tabList = null;
        ModelDatabase modelDatabase = new ModelDatabase();
        modelDatabase.setId(database);
        modelDatabase = modelDatabaseService.get(modelDatabase);
        if (modelDatabase != null) {
            if (ModelConstant.SOURCETYPE_TABLE.equals(sourcetype)) {
                try {
                    tabList = modelDatabaseService.getTables(modelDatabase);
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } else {
                try {
                    tabList = modelDatabaseService.getViews(modelDatabase);
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return RtnResult.successInfo("333", JsonMapper.toJsonString(tabList));
    }
}
