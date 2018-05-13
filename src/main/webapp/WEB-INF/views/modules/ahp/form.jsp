<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>新增熵值法模型</title>
    <link rel="stylesheet" href="${ctxStatic}/css/bootstrap.min.css" title="" />
    <!--<link rel="stylesheet" type="text/css" href="css/animate.css" />-->
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/admin.css" />
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/style.min.css" />
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/plugins/iCheck/custom.css" />
    <link href="${ctxStatic}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/plugins/BootstrapValidator/bootstrapValidator.css" />
    <!-- WIZARD（向导）-->
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/plugins/wizard/wizard.css" />
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/form_page.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/js/jquery-jbox/2.3/Skins/Blue/jbox.css?v=0232"/>
    <!--[if lt IE 9]>
    <script src="${ctxStatic}/js/html5shiv.js"></script>
    <script src="${ctxStatic}/js/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .steps.nav-pills li > a{line-height: normal;;}
        .steps li a .step-number{margin-bottom: 15px;}
        .steps li a .step-name{padding-left: 0;}
        .showInput{text-align: center; background: transparent !important; border: 0; box-shadow: none;}
        .blurInput{text-align: center;}
        .row .panel-body{ margin-left: 0;padding-top: 10px;     padding-bottom: 0;}
        .row .panel-heading { overflow: hidden; padding-bottom: 0; padding-left: 0;    background: transparent; border-bottom: 0;}
        .panel-heading .panel_title{ width: 100%; margin-bottom: 0;padding-left: 15px; padding-bottom:  10px; font-size: 16px; text-align:  left; font-weight: bold;color: #333;}
        .title_big{background: url(${ctxStatic}/img/title_bg.png);}
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
                            <a href="javascript:;" class="btn btn-warning pull-right btn-sm" id="">
                                <i class="fa fa-hand-pointer-o "></i> 运行
                            </a>

                            <i class="fa fa-slideshare"></i> 层次编辑
                        </h3>
                        <hr>
                        <form id="wizForm" action="#" class="form-horizontal" style=" padding: 30px 15px;">
                            <div class="wizard-form" id="formWizard">
                                <div class="wizard-content">
                                    <ul class="nav nav-pills nav-justified steps">
                                        <li>
                                            <a href="#step1" data-toggle="tab" class="wiz-step">
                                                <span class="step-number"> <img src="${ctxStatic}/img/step_one.png"/> </span>
                                                <span class="step-name">模型基本信息 </span>
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#step2" data-toggle="tab" class="wiz-step">
                                                <span class="step-number"><img src="${ctxStatic}/img/step_two.png"/></span>
                                                <span class="step-name">准则层</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#step3" data-toggle="tab" class="wiz-step">
                                                <span class="step-number"><img src="${ctxStatic}/img/step_thress.png"/></span>
                                                <span class="step-name">准则层赋权</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#step4" data-toggle="tab" class="wiz-step">
                                                <span class="step-number"><img src="${ctxStatic}/img/step_four.png"/></span>
                                                <span class="step-name">方案层</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#step5" data-toggle="tab" class="wiz-step">
                                                <span class="step-number"><img src="${ctxStatic}/img/step_five.png"/></span>
                                                <span class="step-name">模型构造</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#step6" data-toggle="tab" class="wiz-step">
                                                <span class="step-number"><img src="${ctxStatic}/img/step_six.png"/></span>
                                                <span class="step-name">模型判断矩阵</span>
                                            </a>
                                        </li>
                                    </ul>

                                    <div id="bar" class="progress progress-striped progress-sm active" role="progressbar">
                                        <div class="progress-bar progress-bar-primary"></div>
                                    </div>
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="step1">
                                            <div class="form-group">
                                                <label class="control-label col-md-3"><span class="red_text">*</span> 解决问题</label>
                                                <div class="col-md-7">
                                                    <textarea name="modelname" class="form-control" rows="" cols="" placeholder="解决问题"  data-bv-notempty data-bv-notempty-message="不能为空"></textarea>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-3"> 问题介绍</label>
                                                <div class="col-md-7">
                                                    <textarea name="modeldesc" rows="" cols="" placeholder="问题介绍" class="form-control"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="step2">
                                            <table class="table table-striped table-condensed table-bordered">
                                                <col width="270px"></col>
                                                <col width="170px"></col>
                                                <thead>
                                                <th>准则项 </th>
                                                <th>动作</th>
                                                </thead>
                                                <tbody id="setp2_tbody">
                                                <tr>
                                                    <td><input type="text" class="form-control blurInput rules" name="rules" placeholder="输入指标项"/></td>
                                                    <td><button type="button" class="hidden btn btn-outline btn-xs btn-danger delbtn"><i class="fa fa-trash"></i> 移除</button></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="tab-pane" id="step3">
                                            <table class="table tbody table-striped table-condensed table-bordered" id="ruleTab">
                                                <col width="170px"></col>
                                                <col width="170px"></col>
                                                <thead>
                                                <tr>
                                                    <th class=""> 准则指标项-准则指标项比重</th>
                                                    <th class="">值    （ 注i=j时 值=1  ）</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                            <!--提交字段-->
                                            <fieldset class="fileld-diy hidden">
                                                <legend><i class="glyphicon glyphicon-hand-down"></i> 提交字段</legend>
                                                <div class="col-xs-12" id="select_div">
                                                </div>
                                            </fieldset>

                                        </div>
                                        <div class="tab-pane" id="step4">
                                            <table class="table table-striped table-condensed table-bordered">
                                                <col width="270px"></col>
                                                <col width="170px"></col>
                                                <thead>
                                                <th>方案 </th>
                                                <th>动作</th>
                                                </thead>
                                                <tbody id="setp2_tbody">
                                                <tr>
                                                    <td><input type="text" class="form-control blurInput plans" name="plans" placeholder="输入方案..."/></td>
                                                    <td><button type="button" class="hidden btn btn-outline btn-xs btn-danger delbtn"><i class="fa fa-trash"></i> 移除</button></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="tab-pane" id="step5">
                                            <table class="table table-striped table-condensed table-bordered" id="planTab">
                                                <col width="70px"></col>
                                                <col width="170px"></col>
                                                <thead>
                                                <th>方案 </th>
                                                <th>准则层</th>
                                                </thead>
                                                <tbody id="setp2_tbody">
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="tab-pane" id="step6">
                                            <div class="col-lg-12" id="lastDiv">

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="wizard-buttons">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="col-md-offset-3 col-md-9">
                                                <a href="javascript:;" class="btn btn-default prevBtn btn-sm">
                                                    <i class="fa fa-arrow-circle-left"></i> 上一步
                                                </a>
                                                <a href="javascript:;" class="btn btn-success first_step btn-sm" id="first_stepsave">
                                                    <i class="fa fa-save"></i> 保存
                                                </a>
                                                <a href="javascript:;" class="btn btn-primary hidden two_step btn-sm" id="two_step2">
                                                    保存 <i class="fa fa-cloud-upload"></i>
                                                </a>
                                                <a href="javascript:;" class="btn btn-primary hidden three_step btn-sm" id="three_step">
                                                    一致性校验 <i class="fa fa-hourglass-half"></i>
                                                </a>
                                                <a href="javascript:;" class="btn btn-primary hidden three_step btn-sm" >
                                                    保存 <i class="fa fa-save"></i>
                                                </a>
                                                <a href="javascript:;" class="btn btn-primary hidden four_step btn-sm" id="four_step">
                                                    保存 <i class="fa fa-save"></i>
                                                </a>
                                                <a href="javascript:;" class="btn btn-primary hidden five_step btn-sm" id="five_step">
                                                    保存 <i class="fa fa-save"></i>
                                                </a>
                                                <a href="javascript:;" class="btn btn-primary hidden six_step btn-sm" id="six_step">
                                                    一致性校验 <i class="fa fa-hourglass-half"></i>
                                                </a>
                                                <a href="javascript:;" class="btn btn-primary nextBtn btn-sm">
                                                    下一步 <i class="fa fa-arrow-circle-right"></i>
                                                </a>
                                                <a href="javascript:;" class="btn btn-success submitBtn btn-sm">
                                                    提交 <i class="fa fa-arrow-circle-right "></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${ctxStatic}/js/jquery-1.12.0.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctxStatic}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctxStatic}/js/plugins/iCheck/icheck.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctxStatic}/js/plugins/validate/bootstrapValidator.js"></script>
<!-- WIZARD（基于Bootstrap实现的上一步下一步表单向导插件Wizard.js） -->
<script src="${ctxStatic}/js/plugins/wizard/jquery.bootstrap.wizard.js" charset="utf-8"></script>
<script src="${ctxStatic}/js/formStep.js" type="text/javascript" charset="utf-8"></script>
<script>
    $(document).ready(function() {
        $('input').on('ifClicked', function(event){
            $(".fileld-diy").removeClass("hidden");
            var rowId=$(this).attr("id");
            if(!$(this).is(':checked')){
                var targetHtml=$(this).parents("td").next().html();
                var html='<span class="sel_span" data-id='+rowId+'><em>'+targetHtml+'<b>×</b></em></span>';
                $("#select_div").append(html);
            }else{
                $("span[data-id="+rowId+"]").remove();
                if($(".sel_span").length<=0){
                    $(".fileld-diy").addClass("hidden");
                }
            }
        });
        $(".fileld-diy").on("click",".sel_span",function(){
            var targetIdRow=$(this).data("id");
            $("#"+targetIdRow).iCheck('uncheck');
            $(this).remove();
            if($(".sel_span").length<=0){
                $(".fileld-diy").addClass("hidden");
            }
        })
        $(".i-checks").iCheck({
            checkboxClass: "icheckbox_square-green",
            radioClass: "iradio_square-green"
        })
        FormWizard.init();
        //新增一行
        $(".table").on("blur",".rules",function(){
            if($(this).val()){
                $(this).attr("readonly",true);
                $(this).removeClass("blurInput").addClass("showInput");
                $(this).parents("td").next().find(".delbtn").removeClass("hidden");
                $(this).parents("tbody").append('<tr> <td><input type="text" class="form-control blurInput rules"  name="rules"  placeholder="输入指标项"/></td> <td><button type="button" class="btn btn-outline btn-xs btn-danger hidden delbtn"><i class="fa fa-trash"></i> 移除</button></td> </tr>');
            }
        })
        //新增一行
        $(".table").on("blur",".plans",function(){
            if($(this).val()){
                $(this).attr("readonly",true);
                $(this).removeClass("blurInput").addClass("showInput");
                $(this).parents("td").next().find(".delbtn").removeClass("hidden");
                $(this).parents("tbody").append('<tr> <td><input type="text" class="form-control blurInput plans"  name="plans"  placeholder="输入指标项"/></td> <td><button type="button" class="btn btn-outline btn-xs btn-danger hidden delbtn"><i class="fa fa-trash"></i> 移除</button></td> </tr>');
            }
        })
        //移除
        $("tbody").on("click",".delbtn",function(){
            var delTr=$(this).parents("tr");
            top.$.jBox.confirm("确定删除吗？","系统提示",function(v, h,f) {
                if (v == "ok"){
                    delTr.remove();
                    top.$.jBox.success("已删除", '系统提示');
                }else {
                    return true; //close
                }
            })
        })
    });

    function genRuleWeight() {
        var rules = $("input[name='rules']");
        var ruleArr = new Array();
        for(var i = 0; i < rules.length-2; i++) {
            ruleArr[i] = new Array();
            var m = 0;
            for(var j = i+1; j < rules.length-1; j++) {
                ruleArr[i][m] = ($(rules[i]).val()+"-"+$(rules[j]).val());
                m++;
            }
        }

        var html = "";
        for(var i = 0; i < ruleArr.length; i++) {
            for(var j = 0; j < ruleArr[i].length; j++) {
                html += "<tr><td>" + ruleArr[i][j] + "</td><td><input type='text' class='form-control' name='' id='' value='' /></td></tr>"
            }
        }

        $("#ruleTab tbody").html(html);
    }

    function genModel(){
        var plans = $("input[name='plans']");
        var rules = $("input[name='rules']");

        var html = "";
        for (var i = 0; i < plans.length-1; i++) {
            html += "<tr><td>"+$(plans[i]).val()+"</td><td>";
            for (var j = 0; j < rules.length-1; j++) {
                html += '&nbsp;<input type="checkbox" name="sel'+i+'" id="" value="'+$(rules[j]).val()+'" />'+$(rules[j]).val();
            }
            html += "</td></tr>";
        }

        $("#planTab tbody").html(html);
    }

    function genModelMatrix(){
        //方案
        var plans = $("input[name='plans']");
        //准则
        var rules = $("input[name='rules']");
        var planMap = {};
        for (var i = 0; i < rules.length; i++) {
            var planArr = new Array();
            for (var k = 0; k < plans.length; k++) {
                $.each($("input[name='sel"+k+"']:checked"),function(){
                    if ($(this).val() === $(rules[i]).val()) {
                        planArr.push($(plans[k]).val());
                    }
                });
                planMap[$(rules[i]).val()] = planArr;
            }
        }

        var modelMap = {};
        for (var i = 0; i < rules.length; i++) {
            if (planMap[$(rules[i]).val()].length > 0) {
                var newArr = new Array();
                var arr = planMap[$(rules[i]).val()];
                for (var m = 0; m < arr.length; m++){
                    var n = 0;
                    newArr[m] = new Array();
                    for(var j = m+1; j <= arr.length-1; j++) {
                        newArr[m][n] = (arr[m]+"-"+arr[j]);
                        n++;
                    }
                }
                modelMap[$(rules[i]).val()] = newArr;
            }
        }

        var html = "";
        debugger
        for (var x = 0; x < rules.length; x++) {
            if (modelMap[$(rules[x]).val()] != undefined && modelMap[$(rules[x]).val()].length > 0) {
                html += "<div class='panel panel-default'><div class='panel-heading'><p class='panel_title'>" +
                    "<i class='fa fa-xing-square' style=' color: #3b85bf; '></i>"+$(rules[x]).val()+"</p></div>" +
                    "<div class='panel-body'><div class='table-responsive'><table class='table table-striped table-condensed table-bordered' id='lastTab'>" +
                    "<thead><tr><th>方案指标项-方案指标项比重</th><th>值    （ 注i=j时 值=1  ）</th></tr></thead><tbody>";
                var arr = modelMap[$(rules[x]).val()];
                for(var i = 0; i < arr.length; i++) {
                    for(var j = 0; j < arr[i].length; j++) {
                        html += "<tr><td>" + arr[i][j] + "</td><td><input type='text' class='form-control' name='' id='' value='' /></td></tr>"
                    }
                }
                html += "</tbody></table></div></div></div>";
            }
        }
        $("#lastDiv").html(html);
    }

</script>
</body>
</html>
