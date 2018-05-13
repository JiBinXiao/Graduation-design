package com.trs.rwsc.modules.modelinfo.web;

import com.trs.rwsc.common.persistence.Page;
import com.trs.rwsc.common.utils.RtnResult;
import com.trs.rwsc.common.web.BaseController;
import com.trs.rwsc.modules.modelinfo.entity.Modelinfo;
import com.trs.rwsc.modules.modelinfo.service.ModelinfoService;
import com.trs.rwsc.modules.modelinfo.utils.ModelConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author msy
 * @version 1.0
 * @Title: 熵值法模型信息控制类
 * @date 2018/3/2414:50
 */
@Controller
@RequestMapping(value = "${adminPath}/entyopy/")
public class EntyopyController extends BaseController {

    @Autowired
    private ModelinfoService modelinfoService;

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
     * @描述  主成分析列表
     * @author    msy
     * @version 1.0
     * @param modelinfo 模型信息
     * @param request
     * @param response
     * @param model
     * @return    java.lang.String
     * @exception
     * @date  2018/3/24 14:58
     */
    @RequestMapping(value = {"list", ""})
    public String list(Modelinfo modelinfo, HttpServletRequest request, HttpServletResponse response, Model model) {
        modelinfo.setModeltype(ModelConstant.TYPE_ENTYOPY);
        Page<Modelinfo> page = modelinfoService.findPage(new Page<Modelinfo>(request, response), modelinfo);
        model.addAttribute("modelinfo", modelinfo);
        model.addAttribute("page", page);
        return "modules/principal/list";
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
     * @date  2018/3/24 15:03
     */
    @RequestMapping(value = "form")
    public String form(Modelinfo modelinfo, Model model,HttpServletRequest request) {
        model.addAttribute("modelinfo", modelinfo);
        return "modules/principal/form";
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
     * @date  2018/3/24 15:05
     */
    @RequestMapping(value = "save")
    public String save(Modelinfo modelinfo, Model model) {
        String msg = "保存失败！";
        modelinfo.setModeltype(ModelConstant.TYPE_ENTYOPY);
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
     * @date  2018/3/24 15:24
     */
    @RequestMapping(value = "updateStatus")
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
     * @date  2018/3/24 15:21
     */
    @RequestMapping(value = "delete")
    public String delete(Modelinfo modelinfo) {
        int result = modelinfoService.delete(modelinfo);
        if(result>0){
            return RtnResult.successInfo("删除成功！", "");
        } else {
            return RtnResult.errorInfo("删除失败！", "");
        }
    }



}
