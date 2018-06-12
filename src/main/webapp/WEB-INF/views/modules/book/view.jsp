%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>主成分析</title>
    <link rel="stylesheet" href="${ctxStatic}/css/bootstrap.min.css" title="" />
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/plugins/datapicker/bootstrap-datetimepicker.css" />
    <!--<link rel="stylesheet" type="text/css" href="css/animate.css" />-->
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/admin.css" />
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/style.min.css" />
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/plugins/iCheck/blue.css" />
    <link href="${ctxStatic}//css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="${ctxStatic}/js/html5shiv.js"></script>
    <script src="${ctxStatic}/js/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .row .panel-body{ margin-left: 0;padding-top: 10px; }
        .row .panel-heading { overflow: hidden; padding-bottom: 0; padding-left: 0;    background: transparent; border-bottom: 0;}
        .panel-heading .panel_title{ width: 100%; margin-bottom: 0;padding-left: 15px; padding-bottom:  10px; font-size: 16px; text-align:  left; font-weight: bold;color: #333;}
        .title_big{background: url(../../img/title_bg.png);}
        .table-bordered>thead>tr>th{background-color: #f3f3f4; color: #333;}
        .panel-title .blue_block{color: #3b85bf; display: inline-block; width: 5px; background: #3b85bf; height: 22px; float: left; margin-right: 6px;}
    </style>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div id="content" class="col-lg-12">
            <!-- 带tab切换盒子 -->
            <div class="col-xs-12">
                <div class="ibox">
                    <div class="ibox-content">
                        <h3>
                            <a href="javascript:history.go(-1);" class="m-l-sm btn btn-primary pull-right btn-sm" id="">
                                <i class="fa fa-reply "></i> 返回
                            </a>
                            <i class="fa fa-slideshare"></i> 主成信息结果
                        </h3>
                        <hr>
                        <div  class="row">
                            <div class="col-lg-6">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <p class="panel_title">
                                            <i class="fa fa-pinterest-square" style=" color: #3b85bf; "></i> 协方差矩阵
                                        </p>
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-condensed table-bordered">
                                                <tbody>
                                                <tr>
                                                    <td>0.6165555555555555</td>
                                                    <td>0.6154444444444443 </td>
                                                </tr>
                                                <tr>
                                                    <td>0.6165555555555555</td>
                                                    <td>0.6154444444444443 </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <p class="panel_title">
                                            <i class="fa fa-twitch" title="主成分析" style=" color: #3b85bf; "></i> 特征向量
                                        </p>
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-condensed table-bordered">
                                                <tbody>
                                                <tr>
                                                    <td>0.6165555555555555</td>
                                                    <td>0.6154444444444443 </td>
                                                </tr>
                                                <tr>
                                                    <td>0.6165555555555555</td>
                                                    <td>0.6154444444444443 </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <p class="panel_title">
                                            <i class="fa fa-xing-square" title="主成分析" style=" color: #3b85bf; "></i> 特征值
                                        </p>
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-condensed table-bordered">
                                                <thead>
                                                <tr>
                                                    <th>属性名称</th>
                                                    <th>特征值</th>
                                                    <th>占比</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>X</td>
                                                    <td>1.284028 </td>
                                                    <td>99.93% </td>
                                                </tr>
                                                <tr>
                                                    <td>Y</td>
                                                    <td>1.284028 </td>
                                                    <td>99.93% </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <p class="panel_title" >
                                            <i class="fa fa-simplybuilt" title="主成分析" style=" color: #3b85bf; "></i> 二降一维投影结果
                                        </p>
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-condensed table-bordered">
                                                <thead>
                                                <tr>
                                                    <th>序号</th>
                                                    <th>X</th>
                                                    <th>Y</th>
                                                    <th>投影结果</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>0.3900000000000001</td>
                                                    <td>0.9900000000000002 </td>
                                                    <td>0.26437062542592465 </td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>0.3900000000000001</td>
                                                    <td>0.9900000000000002 </td>
                                                    <td>0.26437062542592465 </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
