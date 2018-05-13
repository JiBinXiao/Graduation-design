package com.trs.rwsc.modules.modelinfo.utils;

import com.trs.rwsc.common.mapper.JsonMapper;
import com.trs.rwsc.common.utils.SpringContextHolder;
import com.trs.rwsc.modules.modelinfo.dao.ModelDatabaseDao;
import com.trs.rwsc.modules.modelinfo.dao.ModelinfoDao;
import com.trs.rwsc.modules.modelinfo.entity.ModelDatabase;
import com.trs.rwsc.modules.modelinfo.entity.Modelinfo;
import com.trs.zgs.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;


/**
 * @author msy
 * @Title: 主成分析处理
 * @date 2018/3/2415:49
 */
public class ModelInfoThread implements Runnable {
    private Logger logger = LoggerFactory.getLogger(getClass());

    private ModelinfoDao modelinfoDao = SpringContextHolder.getBean(ModelinfoDao.class);
    private ModelDatabaseDao databaseDao = SpringContextHolder.getBean(ModelDatabaseDao.class);

    private String modelType;
    private Modelinfo modelinfo;

    public ModelInfoThread(){}

    public ModelInfoThread(String modelType, Modelinfo modelinfo) {
        this.modelType = modelType;
        this.modelinfo = modelinfo;
    }

    @Override
    public void run() {
        logger.info("执行" + modelinfo.getModeltype() + "计算");
        double[][] sampledatas = null;
        int errorCode = 0;
        //根据不同的分析方法调用不同的处理类
        switch (modelinfo.getModeltype()) {
            //主成分析
            case ModelConstant.TYPE_PRINCIPAL :
                sampledatas = getData(modelinfo);
                //样本属性的数目- 降维数目
                int k = modelinfo.getSourcefields().split(",").length - new Double(modelinfo.getModelparam3()).intValue();
                PCAResult pcaResult = null;
                if (sampledatas != null) {
                    try {
                        pcaResult = PCA.operation(sampledatas, modelinfo.getModelparam1(), modelinfo.getModelparam2(), k);
                    } catch (Exception e) {
                        errorCode = 1;
                        e.printStackTrace();
                    }
                }
                //返回结果存数据库
                this.savePca(pcaResult, errorCode);
                break;
            //因子分析
            case ModelConstant.TYPE_FACTOR :
                sampledatas = getData(modelinfo);
                FactorResult factorResult = null;
                if (sampledatas != null) {
                    try {
                        factorResult = FactorAnalysis.operation(sampledatas, new Double(modelinfo.getModelparam1()).intValue());
                    } catch (Exception e) {
                        errorCode = 1;
                        e.printStackTrace();
                    }
                }
                //返回结果存数据库
                this.saveFactor(factorResult, errorCode);
                break;
            //熵值法
            case ModelConstant.TYPE_ENTYOPY :
                sampledatas = getData(modelinfo);
                EntropyResult entropyResult = null;
                String param = modelinfo.getModelparam7();
                String[] parms = param.split(",");
                //指标方向数组
                int[] ints = new int[parms.length];
                for (int i = 0; i < parms.length; i++) {
                    ints[i] = Integer.parseInt(parms[i]);
                }
                if (sampledatas != null) {
                    try {
                        entropyResult = Entropy.operation(sampledatas, ints);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                //返回结果存数据库
                this.saveEntropy(entropyResult, errorCode);
                break;
            //层次分析
            case ModelConstant.TYPE_HIREARCHY :
                break;
            default:
                System.out.println("没有这种类型，怎么执行啊！！！");
        }

        logger.info("执行完成后更新模型状态为计算完成");
        modelinfo.setStatus(ModelConstant.STATUS_COMPLETE);
        modelinfoDao.updateStatus(modelinfo);
    }

    /**
     * getData
     * @描述  获取需要计算的数据信息
     * @author    msy
     * @version
     * @param modelinfo
     * @return    double[][]
     * @exception
     * @date  2018/3/27 16:46
     */
    public double[][] getData(Modelinfo modelinfo) {
        double[][] ret = null;
        //查询模型所关联数据库
        int dataBaseId = modelinfo.getBaseid();
        ModelDatabase dataBase = new ModelDatabase();
        dataBase.setId(dataBaseId);
        dataBase = databaseDao.get(dataBaseId);
        if (dataBase != null) {
            Connection conn = null;
            Statement st = null;
            ResultSet rs = null;
            try {
                //1.加载驱动程序
                Class.forName("com.mysql.jdbc.Driver");
                //2.获得数据库链接
                conn = DriverManager.getConnection(dataBase.getUrl(), dataBase.getUsername(), dataBase.getPassword());
                //3.通过数据库的连接操作数据库，实现增删改查（使用Statement类）
                st = conn.createStatement();
                //查询计算需要的数据
                String fields = modelinfo.getSourcefields();
                rs = st.executeQuery("SELECT " + fields + " FROM " + modelinfo.getSourcename());
                //数据行数
                rs.last();
                int rows = rs.getRow();
                if (rows != 0) {
                    //查询字段个数
                    int length = fields.split(",").length;
                    //返回二维数组初始化
                    ret = new double[rows][length];
                    int i = 0;
                    rs.beforeFirst();
                    while (rs.next()) {
                        for (int j = 0; j < length; j++) {
                            ret[i][j] = rs.getDouble(j+1);
                        }
                        i++;
                    }
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                //关闭资源
                try {
                    rs.close();
                    st.close();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

        }
        return ret;
    }


    /**
     * saveFactor
     * @描述  因子分析保存
     * @author    msy
     * @version
     * @param factorResult
     * @return    void
     * @exception
     * @date  2018/3/27 15:51
     */
    private void saveFactor(FactorResult factorResult, int errorCode) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (errorCode == 1) {
            map.put("error", "因子分析计算抛出异常！");
        } else {
            if (factorResult != null) {
                map.put("协方差矩阵_relv", factorResult.getRelv());
                map.put("特征值比率_eigensratio", factorResult.getEigensratio());
                map.put("特征值对应矩阵_eigenVectors", factorResult.getEigenVectors());
                map.put("因子载荷矩阵_eigenSdVectors", factorResult.getEigenSdVectors());
                map.put("因子模型_factorModelStr", factorResult.getFactorModelStr());
            } else {
                map.put("error", "数据源数据为空！");
            }
        }
        modelinfo.setResult(JsonMapper.toJsonString(map));
        modelinfo.setStatus(ModelConstant.STATUS_COMPLETE);
        modelinfoDao.update(modelinfo);
    }


    /**
     * savePca
     * @描述  主成分析保存
     * @author    msy
     * @version
     * @param pcaResult
     * @param errorCode
     * @return    void
     * @exception
     * @date  2018/3/27 16:59
     */
    private void savePca(PCAResult pcaResult, int errorCode) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (errorCode == 1) {
            map.put("error", "主成分析计算抛出异常！");
        } else {
            if (pcaResult != null) {
                map.put("样本平均值处理后矩阵_dataAdjust", pcaResult.getDataAdjust());
                map.put("协方差矩阵_cov", pcaResult.getCov());
                map.put("特征值比率_eigensratio", pcaResult.getEigensratio());
                map.put("特征值对应矩阵_eigenVectors", pcaResult.getEigenVectors());
                map.put("选择特征值矩阵_eigenSdVectors", pcaResult.getEigenSdVectors());
                map.put("最终结果_factorModelStr", pcaResult.getFinalData());
            } else {
                map.put("error", "数据源数据为空！");
            }
        }
        modelinfo.setResult(JsonMapper.toJsonString(map));
        modelinfo.setStatus(ModelConstant.STATUS_COMPLETE);
        modelinfoDao.update(modelinfo);
    }

    /**
     * saveEntropy
     * @描述  熵值法保存
     * @author    msy
     * @version
     * @param entropyResult
     * @param errorCode
     * @return    void
     * @exception
     * @date  2018/4/8 14:43
     */
    private void saveEntropy(EntropyResult entropyResult, int errorCode) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (errorCode == 1) {
            map.put("error", "熵值法计算抛出异常！");
        } else {
            if (entropyResult == null) {
                map.put("error", "数据源数据为空！");
            } else {
                map.put("样本标准化处理后的矩阵_startardDatas", entropyResult.getStartardDatas());
                map.put("信息效用值_effectiveArray", entropyResult.getEffectiveArray());
                map.put("熵值_entropyArray", entropyResult.getEntropyArray());
                map.put("权值矩阵_rightArray", entropyResult.getRightArray());
                map.put("综合评价值_scoreArray", entropyResult.getScoreArray());
            }
        }
        modelinfo.setResult(JsonMapper.toJsonString(map));
        modelinfo.setStatus(ModelConstant.STATUS_COMPLETE);
        modelinfoDao.update(modelinfo);
    }

}
