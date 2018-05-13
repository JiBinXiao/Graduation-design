package com.trs.rwsc.modules.modelinfo.web;

import com.trs.rwsc.common.persistence.Page;
import com.trs.rwsc.common.utils.RtnResult;
import com.trs.rwsc.common.web.BaseController;
import com.trs.rwsc.modules.modelinfo.entity.ModelDatabase;
import com.trs.rwsc.modules.modelinfo.entity.Modelinfo;
import com.trs.rwsc.modules.modelinfo.service.ModelDatabaseService;
import com.trs.rwsc.modules.modelinfo.service.ModelinfoService;
import com.trs.rwsc.modules.modelinfo.utils.ModelConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * @author msy
 * @version 1.0
 * @Title: 熵值法模型信息控制类
 * @date 2018/3/2414:50
 */
@Controller
@RequestMapping(value = "${adminPath}/entropy/")
public class EntropyController extends BaseController {

    @Autowired
    private ModelinfoService modelinfoService;
    @Autowired
    private ModelDatabaseService modelDatabaseService;

    @ModelAttribute
    public Modelinfo get(@RequestParam(required=false) Integer id) {
        Modelinfo entity = null;
        if (id!=null && id!=0){
            entity = modelinfoService.get(id);
        }
        if (entity == null){
            entity = new Modelinfo();
        }
        return entity;
    }


    /**
     * list
     * @描述  熵值法列表
     * @author    msy
     * @version 1.0
     * @param modelinfo 模型信息
     * @param request
     * @param response
     * @param model
     * @return    java.lang.String
     * @exception
     * @date  2018/4/3 14:58
     */
    @RequestMapping(value = {"list", ""})
    public String list(Modelinfo modelinfo, HttpServletRequest request, HttpServletResponse response, Model model) {
        String[] status = request.getParameterValues("status");
        String statu = "";
        if (status != null && status.length > 0) {
            for (int i = 0; i < status.length; i++) {
                statu += ",'" + status[i] + "'";
            }
            modelinfo.setStatus(statu.substring(1));
        }
        modelinfo.setModeltype(ModelConstant.TYPE_ENTYOPY);
        Page<Modelinfo> page = modelinfoService.findPage(new Page<Modelinfo>(request, response), modelinfo);
        model.addAttribute("modelinfo", modelinfo);
        model.addAttribute("page", page);
        return "modules/entropy/list";
    }

    /**
     * form
     * @描述  新增、修改初始化
     * @author    msy
     * @version 1.0
     * @param modelinfo 模型信息
     * @param model
     * @param request
     * @return    java.lang.String
     * @exception
     * @date  2018/4/3 14:58
     */
    @RequestMapping(value = "form")
    public String form(Modelinfo modelinfo, Model model,HttpServletRequest request) {
        //查询数据源配置信息
        List<ModelDatabase> databaseList = modelDatabaseService.findList(new ModelDatabase());
        //数据源名称列表
        List<Map<String, String>> tabList = null;
        //如果是修改操作，需查询表名或者视图名称
        if (modelinfo.getBaseid() != 0) {
            ModelDatabase modelDatabase = new ModelDatabase();
            modelDatabase.setId(modelinfo.getBaseid());
            modelDatabase = modelDatabaseService.get(modelDatabase);
            //查询视图
            if (modelinfo.getSourcetype().equals(ModelConstant.SOURCETYPE_VIEW)) {
                try {
                    tabList = modelDatabaseService.getViews(modelDatabase);
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } else {  //查询表
                try {
                    tabList = modelDatabaseService.getTables(modelDatabase);
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        if (modelinfo != null && modelinfo.getSourcefields() != null) {
            model.addAttribute("fields", modelinfo.getSourcefields());
        }
        model.addAttribute("tabList", tabList);
        model.addAttribute("databaseList", databaseList);
        model.addAttribute("modelinfo", modelinfo);
        return "modules/entropy/form";
    }


    /**
     * save
     * @描述  模型信息保存、更新
     * @author    msy
     * @version 1.0
     * @param modelinfo
     * @param model
     * @return    java.lang.String
     * @exception
     * @date  22018/4/3 14:58
     */
    @RequestMapping(value = "save")
    @ResponseBody
    public String save(Modelinfo modelinfo, Model model) {
        String msg = "保存失败！";
        modelinfo.setModeltype(ModelConstant.TYPE_ENTYOPY);
        modelinfo.setStatus(ModelConstant.STATUS_NORMAL);
        modelinfo.setUsername(modelinfo.getCurrentUser().getUsername());
        int ret = modelinfoService.save(modelinfo);
        if(ret==1){
            msg = "保存成功！";
        }
        return RtnResult.successInfo(msg, null);
    }

    /**
     * updateStatus
     * @描述  更新模型状态
     * @author    msy
     * @version
     * @param modelinfo
     * @return    java.lang.String
     * @exception
     * @date  2018/4/3 14:58
     */
    @RequestMapping(value = "updateStatus")
    @ResponseBody
    public String updateStatus(Modelinfo modelinfo) {
        String msg = "修改状态失败！";
        int ret = modelinfoService.updateStatus(modelinfo);
        if (ret == 1) {
            msg = "修改状态成功！";
        }
        return RtnResult.successInfo(msg,null);
    }

    /**
     * delete
     * @描述  删除模型信息
     * @author    msy
     * @version
     * @param modelinfo
     * @return    java.lang.String
     * @exception
     * @date  2018/4/3 14:58
     */
    @RequestMapping(value = "delete")
    @ResponseBody
    public String delete(Modelinfo modelinfo) {
        int result = modelinfoService.delete(modelinfo);
        if(result>0){
            return RtnResult.successInfo("删除成功！", "");
        } else {
            return RtnResult.errorInfo("删除失败！", "");
        }
    }

    /**
     * saveAndCalculate
     * @描述  保存并运行
     * @author    msy
     * @version
     * @param modelinfo
     * @return    java.lang.String
     * @exception
     * @date  2018/4/3 14:44
     */
    @RequestMapping(value = "saveAndCalculate")
    @ResponseBody
    public String saveAndCalculate(Modelinfo modelinfo) {
        String msg = "已启动运算…………";
        modelinfo.setModeltype(ModelConstant.TYPE_ENTYOPY);
        modelinfo.setStatus(ModelConstant.STATUS_NORMAL);
        modelinfo.setUsername(modelinfo.getCurrentUser().getUsername());
        try {
            modelinfoService.saveAndCalculate(modelinfo);
        } catch (Exception e) {
            e.printStackTrace();
            return RtnResult.errorInfo("", null);
        }
        return RtnResult.successInfo(msg, null);
    }


    /**
     * calculate
     * @描述  计算
     * @author    msy
     * @version 1.0
     * @param modelinfo
     * @return    java.lang.String
     * @exception
     * @date  2018/4/3 14:58
     */
    @RequestMapping(value = "calculate")
    @ResponseBody
    public String calculate(Modelinfo modelinfo) {
        try {
            modelinfoService.calculate(modelinfo);
        } catch (Exception e) {
            e.printStackTrace();
            return RtnResult.errorInfo("计算失败", null);
        }
        return RtnResult.successInfo("已启动运算……", null);
    }
}