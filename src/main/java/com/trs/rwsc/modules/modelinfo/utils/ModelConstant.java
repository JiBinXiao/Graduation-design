package com.trs.rwsc.modules.modelinfo.utils;

/**
 * @author msy
 * @Title: 模型参数
 * @version: 1.0
 * @date 2018/3/24 15:08
 */
public class ModelConstant {
    public static final String TYPE = "type";  //模型类型
    public static final String TYPE_PRINCIPAL = "1";  //主成分析
    public static final String TYPE_FACTOR = "2";  //因子分析
    public static final String TYPE_ENTYOPY = "3";  //熵值法
    public static final String TYPE_HIREARCHY = "4";  //层次分析

    public static final String STATUS = "status";   //模型状态
    public static final String STATUS_NORMAL = "1";   //正常
    public static final String STATUS_STOP = "2";   //停用
    public static final String STATUS_OPERATING = "3";   //正在运算
    public static final String STATUS_COMPLETE = "4";   //运算完成

    public static final String SOURCETYPE = "sourcetype"; //数据源类型
    public static final String SOURCETYPE_TABLE = "1"; //表
    public static final String SOURCETYPE_VIEW = "2"; //视图


}
