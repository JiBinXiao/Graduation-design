package com.trs.rwsc.modules.modelinfo.service;

import com.trs.rwsc.common.service.CrudService;
import com.trs.rwsc.modules.modelinfo.dao.ModelDatabaseDao;
import com.trs.rwsc.modules.modelinfo.dao.ModelinfoDao;
import com.trs.rwsc.modules.modelinfo.entity.Modelinfo;
import com.trs.rwsc.modules.modelinfo.utils.ModelConstant;
import com.trs.rwsc.modules.modelinfo.utils.ModelInfoThread;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * @author msy
 * @Title: 模型信息业务处理类
 * @date 2018/3/2414:40
 */
@Service
@Transactional(readOnly = true)
public class ModelinfoService extends CrudService<ModelinfoDao, Modelinfo> {
    private Logger logger = LoggerFactory.getLogger(ModelinfoService.class);

    @Autowired
    private ModelinfoDao modelinfoDao;
    @Autowired
    private ModelDatabaseDao databaseDao;
    @Autowired
    private ThreadPoolTaskExecutor executor;

    /**
     * updateStatus
     * @描述  更新模型状态
     * @author    msy
     * @version
     * @param modelinfo
     * @return    int
     * @exception
     * @date  2018/3/24 14:45
     */
    @Transactional(readOnly = false)
    public int updateStatus(Modelinfo modelinfo) {
        return modelinfoDao.updateStatus(modelinfo);
    }


    /**
     * calculate
     * @描述  计算
     * @author    msy
     * @version
     * @param modelinfo
     * @return    void
     * @exception
     * @date  2018/3/24 15:41
     */
    @Transactional(readOnly = false)
    public void calculate(Modelinfo modelinfo) throws Exception {
        //修改模型状态为正在计算
        modelinfo.setLasttime(new Date());
        modelinfo.setLastuser(modelinfo.getCurrentUser().getUsername());
        modelinfo.setStatus(ModelConstant.STATUS_OPERATING);
        this.updateStatus(modelinfo);
        //开启子线程进行计算
        switch (modelinfo.getModeltype()) {
            //主成分析
            case ModelConstant.TYPE_PRINCIPAL :
                executor.execute(new ModelInfoThread(ModelConstant.TYPE_PRINCIPAL, modelinfo));
                //new Thread(new ModelInfoThread(ModelConstant.TYPE_PRINCIPAL, modelinfo)).start();
                break;
            //因子分析
            case ModelConstant.TYPE_FACTOR :
                executor.execute(new Thread(new ModelInfoThread(ModelConstant.TYPE_FACTOR, modelinfo)));
                //new Thread(new ModelInfoThread(ModelConstant.TYPE_FACTOR, modelinfo)).start();
                break;
            //熵值法
            case ModelConstant.TYPE_ENTYOPY :
                executor.execute( new Thread(new ModelInfoThread(ModelConstant.TYPE_ENTYOPY, modelinfo)));
                //new Thread(new ModelInfoThread(ModelConstant.TYPE_ENTYOPY, modelinfo)).start();
                break;
            //层次分析
            case ModelConstant.TYPE_HIREARCHY :
                executor.execute(new Thread(new ModelInfoThread(ModelConstant.TYPE_HIREARCHY, modelinfo)));
                //new Thread(new ModelInfoThread(ModelConstant.TYPE_HIREARCHY, modelinfo)).start();
                break;
            default:
                System.out.println("没有这种类型哦！！！");
        }
    }

    /**
     * saveAndCalculate
     * @描述  保存并计算
     * @author    msy
     * @version
     * @param modelinfo
     * @return
     * @exception
     * @date  2018/4/3 14:57
     */
    @Transactional(readOnly = false)
    public void saveAndCalculate(Modelinfo modelinfo) throws Exception {
        this.save(modelinfo);
        this.calculate(modelinfo);
    }
}
