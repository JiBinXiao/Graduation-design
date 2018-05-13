<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html lang="zh-cn">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1"/>
<meta name="renderer" content="webkit">
<title>主页</title>
<link rel="shortcut icon" href="favicon.ico">
<link href="${ctxStatic}/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctxStatic}/css/font-awesome.min93e3.css" rel="stylesheet">
<link href="${ctxStatic}/css/animate.min.css" rel="stylesheet">
<link rel="stylesheet" href="${ctxStatic}/css/bootstrap.min.css" title="" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/style.min.css"/>
<!--[if lt IE 9]>
<script src="${ctxStatic}/${ctxStatic}/js/html5shiv.js"></script>
<script src="${ctxStatic}/${ctxStatic}/js/respond.min.js"></script>
<![endif]-->
<style type="text/css">
    .jqstooltip {
        position: absolute;
        left: 0px;
        top: 0px;
        visibility: hidden;
        background: rgb(0, 0, 0) transparent;
        background-color: rgba(0, 0, 0, 0.6);
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);
        -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
        color: white;
        font: 10px arial, san serif;
        text-align: left;
        white-space: nowrap;
        padding: 5px;
        border: 1px solid white;
        z-index: 10000;
    }

    .jqsfield {
        color: white;
        font: 10px arial, san serif;
        text-align: left;
    }
</style>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-success pull-right">月</span>
                    <h5><i class="fa fa-cubes text-error"></i> 隐患排查</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins">40 886,200</h1>
                    <div class="stat-percent font-bold text-success">98% <i class="fa fa-bolt"></i>
                    </div>
                    <small>总数量</small>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-info pull-right">全年</span>
                    <h5><i class="fa fa-random"></i> 煤矿核查</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins">275,800</h1>
                    <div class="stat-percent font-bold text-info">20% <i class="fa fa-level-up"></i>
                    </div>
                    <small>重大设备检测</small>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-primary pull-right">今天</span>
                    <h5><i class="fa fa-bell text-primary"></i> 消息通知</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins">10</h1>
                    <div class="stat-percent font-bold text-navy">44% <i class="fa fa-level-up"></i>
                    </div>
                    <small>重要消息</small>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-warning pull-right">最近一个月</span>
                    <h5><i class="fa fa-heartbeat"></i> 应急救援</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins">80</h1>
                    <div class="stat-percent font-bold text-danger">38% <i class="fa fa-level-down"></i>
                    </div>
                    <small>8月</small>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5><i class="fa fa-bar-chart"></i> 统计分析</h5>
                    <div class="pull-right">
                        <div class="btn-group">
                            <button type="button" class="btn btn-xs btn-white active">天</button>
                            <button type="button" class="btn btn-xs btn-white">月</button>
                            <button type="button" class="btn btn-xs btn-white">年</button>
                        </div>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-sm-9">
                            <div id="main" style="width: 100%;height:200px;"></div>
                        </div>
                        <div class="col-sm-3">
                            <ul class="stat-list">
                                <li>
                                    <h2 class="no-margins">1346</h2>
                                    <small>年增长数量</small>
                                    <div class="stat-percent">48% <i class="fa fa-level-up text-navy"></i>
                                    </div>
                                    <div class="progress progress-mini">
                                        <div style="width: 48%;" class="progress-bar"></div>
                                    </div>
                                </li>
                                <li>
                                    <h2 class="no-margins ">422</h2>
                                    <small>月增长数量</small>
                                    <div class="stat-percent">60% <i class="fa fa-level-down text-navy"></i>
                                    </div>
                                    <div class="progress progress-mini">
                                        <div style="width: 60%;" class="progress-bar"></div>
                                    </div>
                                </li>
                                <li>
                                    <h2 class="no-margins ">180</h2>
                                    <small>最近一个月增长数量</small>
                                    <div class="stat-percent">22% <i class="fa fa-bolt text-navy"></i>
                                    </div>
                                    <div class="progress progress-mini">
                                        <div style="width: 22%;" class="progress-bar"></div>
                                    </div>
                                </li>
                            </ul></div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-4">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5><i class="fa fa-xing-square"></i> 消息</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content ibox-heading">
                    <h3><i class="fa fa-envelope-o"></i> 新消息</h3>
                    <small><i class="fa fa-tim"></i> 您有22条未读消息</small>
                </div>
                <div class="ibox-content">
                    <div class="feed-activity-list">

                        <div class="feed-element">
                            <div>
                                <small class="pull-right text-navy">1月前</small>
                                <strong>井幽幽</strong>
                                <div>有人说：“一辈子很长，要跟一个有趣的人在一起”。我想关注我的人，应该是那种喜欢找乐子也乐意分享乐趣的人，你们一定挺优秀的。所以单身的应该在这条留言，互相勾搭一下。特别有钱人又帅可以直接私信我！</div>
                                <small class="text-muted">4月11日 00:00</small>
                            </div>
                        </div>

                        <div class="feed-element">
                            <div>
                                <small class="pull-right">5月前</small>
                                <strong>老刀99</strong>
                                <div>昨天评论里你见过最“温暖和感人”的诗句，整理其中经典100首，值得你收下学习。</div>
                                <small class="text-muted">11月8日 20:08 </small>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-8">
            <div class="row">
                <div class="col-sm-6">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5><i class="fa fa-hourglass-half"></i> 工程进度列表</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                                <a class="close-link">
                                    <i class="fa fa-times"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <table class="table table-hover no-margins">
                                <thead>
                                <tr>
                                    <th>状态</th>
                                    <th>日期</th>
                                    <th>用户</th>
                                    <th>值</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><small>进行中...</small>
                                    </td>
                                    <td><i class="fa fa-clock-o"></i> 11:20</td>
                                    <td>青衣5858</td>
                                    <td class="text-navy"> <i class="fa fa-level-up"></i> 24%</td>
                                </tr>
                                <tr>
                                    <td><span class="label label-warning pull-left">已取消</span>
                                    </td>
                                    <td><i class="fa fa-clock-o"></i> 10:40</td>
                                    <td>徐子崴</td>
                                    <td class="text-navy"> <i class="fa fa-level-up"></i> 66%</td>
                                </tr>
                                <tr>
                                    <td><small>进行中...</small>
                                    </td>
                                    <td><i class="fa fa-clock-o"></i> 01:30</td>
                                    <td>姜岚昕</td>
                                    <td class="text-navy"> <i class="fa fa-level-up"></i> 54%</td>
                                </tr>
                                <tr>
                                    <td><small>进行中...</small>
                                    </td>
                                    <td><i class="fa fa-clock-o"></i> 02:20</td>
                                    <td>武汉大兵哥</td>
                                    <td class="text-navy"> <i class="fa fa-level-up"></i> 12%</td>
                                </tr>
                                <tr>
                                    <td><small>进行中...</small>
                                    </td>
                                    <td><i class="fa fa-clock-o"></i> 09:40</td>
                                    <td>荆莹儿</td>
                                    <td class="text-navy"> <i class="fa fa-level-up"></i> 22%</td>
                                </tr>
                                <tr>
                                    <td><span class="label label-primary pull-left">已完成</span>
                                    </td>
                                    <td><i class="fa fa-clock-o"></i> 04:10</td>
                                    <td>栾某某</td>
                                    <td class="text-navy"> <i class="fa fa-level-up"></i> 66%</td>
                                </tr>
                                <tr>
                                    <td><small>进行中...</small>
                                    </td>
                                    <td><i class="fa fa-clock-o"></i> 12:08</td>
                                    <td>范范范二妮</td>
                                    <td class="text-navy"> <i class="fa fa-level-up"></i> 23%</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5><i class="fa fa-tasks"></i> 任务列表</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                                <a class="close-link">
                                    <i class="fa fa-times"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <ul class="todo-list m-t small-list ui-sortable">
                                <li >
                                    <i class="fa fa-check-square text-success"></i>
                                    <span class="m-l-xs todo-completed">开会</span>
                                </li>
                                <li>
                                    <a href="model/coalBasicInfo/coalFaceInfo.html" class="check-link J_menuItem text-success" data-ispage="true"><i class="fa fa-check-square"></i> <span class="m-l-xs  todo-completed">项目开发</span></a>
                                </li>
                                <li class="clear">
                                    <a href="#" class="check-link pull-left"><i class="fa fa-square-o text-success pull-left"></i> </a>
                                    <span class="m-l-xs pull-left">修改bug</span>
                                    <small class="label label-primary pull-left"><i class="fa fa-clock-o"></i> 1小时</small>
                                </li>
                                <li class="clear">
                                    <a href="#" class="check-link pull-left"><i class="fa fa-square-o"></i> </a>
                                    <span class="m-l-xs pull-left">修改bug</span>
                                    <small class="label label-primary pull-left"><i class="fa fa-clock-o"></i> 1小时</small>
                                </li>
                                <li class="clear">
                                    <a href="#" class="check-link pull-left"><i class="fa fa-square-o"></i> </a>
                                    <span class="m-l-xs pull-left">修改bug</span>
                                    <small class="label label-primary pull-left"><i class="fa fa-clock-o"></i> 1小时</small>
                                </li>
                                <li class="clear">
                                    <a href="#" class="check-link pull-left"><i class="fa fa-square-o"></i> </a>
                                    <span class="m-l-xs pull-left">修改bug</span>
                                    <small class="label label-primary pull-left"><i class="fa fa-clock-o"></i> 1小时</small>
                                </li>
                                <li class="clear">
                                    <a href="#" class="check-link pull-left"><i class="fa fa-square-o"></i> </a>
                                    <span class="m-l-xs pull-left">修改bug</span>
                                    <small class="label label-primary pull-left"><i class="fa fa-clock-o"></i> 1小时</small>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${ctxStatic}/js/jquery-1.12.0.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctxStatic}/js/bootstrap.min.js"></script>
<script src="${ctxStatic}/js/plugins/echarts/echarts-all.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctxStatic}/js/plugins/echarts/echarts.common.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctxStatic}/js/content.min.js?v=1.0.0"></script>
<script src="${ctxStatic}/js/contabs.min.js" type="text/javascript" charset="utf-8"></script>
<!--<script src="${ctxStatic}/js/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="${ctxStatic}/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="${ctxStatic}/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="${ctxStatic}/js/plugins/easypiechart/jquery.easypiechart.js"></script>-->
<script>
    $(document).ready(function() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        var option = {
            title : {
                text: '管控措施失效数量变化趋势图',
                subtext: '纯属虚构'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['总计','重大危险源']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:'总计',
                    type:'bar',
                    data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name: '平均值'}
                        ]
                    }
                },
                {
                    name:'重大危险源',
                    type:'bar',
                    data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3],
                    label: {
                        normal: {
                            show: true,
                            position:"top"
                        }
                    },

                    markPoint : {
                        data : [
                            {name : '年最高', value : 182.2, xAxis: 7, yAxis: 183, symbolSize:18},
                            {name : '年最低', value : 2.3, xAxis: 11, yAxis: 3}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name : '平均值'}
                        ]
                    }
                }
            ]
        };
        myChart.setOption(option);
        $(window).resize(function() {
            myChart.resize();
        });

    });
</script>
<div class="jvectormap-label"></div>
</body>
</html>