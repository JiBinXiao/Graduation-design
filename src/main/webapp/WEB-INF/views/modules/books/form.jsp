<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>新增企业</title>
    <link rel="stylesheet" href="${ctxStatic}/css/bootstrap.min.css" title="" />
    <!--<link rel="stylesheet" type="text/css" href="css/animate.css" />-->
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/admin.css" />
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/style.min.css" />
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/plugins/iCheck/custom.css" />
    <link href="${ctxStatic}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/plugins/BootstrapValidator/bootstrapValidator.css" />
    <!-- WIZARD（向导）-->
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/plugins/wizard/wizard.css" />
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/js/jquery-jbox/2.3/Skins/Blue/jbox.css?v=0232"/>
    <!--[if lt IE 9]>
    <script src="${ctxStatic}/js/html5shiv.js"></script>
    <script src="${ctxStatic}/js/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .tab-content>.tab-pane {
            padding: 30px 20px 10px 0;
        }

        .ibox .ibox-title {
            min-height: 55px;
        }

        .ibox .ibox-title>h5 {
            margin-top: 5px;
        }

        .ibox-tools a {
            color: #fff;
        }

        .nav.nav-pills.steps {
            position: absolute;
            top: -22px;
        }

        .nav.steps>li.active {
            background: transparent;
        }

        .steps.nav-pills li>a {
            background: transparent;
            line-height: 50px;
            text-align: left;
            width: 90%;
            text-align: center;
        }

        .nav-pills>li.active>a:focus,
        .nav-pills>li.active>a:hover {
            background: transparent;
        }

        .steps li.done a {
        }

        .steps li a .step-number {
            display: block;
            font-size: 22px;
            width: 45px;
            color: #fff;
            font-weight: bold;
            margin: auto;
            text-align: center;
            height: 45px;
            line-height: 45px;
        }
        .steps li a .step-number img{
            width: 45px;
            height: 45px;
        }

        .steps li a .step-name {
            font-size: 16px;
            padding-left: 15px;
            color: #555;
            text-align: center;
        }
        .tab-content{clear: both; margin-top: 70px;}
        .wizard-form{position: relative;}
        .table-bordered>thead>tr>td, .table-bordered>thead>tr>th{
            background-color: #ccc;
            color: #333;
        }
        .fileld-diy{    padding-bottom: 20px;}
        .fileld-diy legend{font-size: 18px;}
        .fileld-diy .sel_span{
            border: 1px solid #ddd;
            cursor: pointer;
            padding: 5px;
            margin-right: 5px;
        }
        .fileld-diy .sel_span:hover{    background: #f8ac59; color: #fff;}
        .fileld-diy .sel_span b{color:#fda210}
        .fileld-diy .sel_span:hover b{color: #fff;}
        .table-head{padding-right:17px;    background-color: #ccc;}
        .scrollTable .table{
            margin-bottom: 0;
        }

        /*能带滚动条的表身*/
        /*div的第二个子元素*/
        #scrollTable .table_div{
            width:100%;
            max-height:150px;
            overflow-y:scroll;/*必需*/
        }

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
                          

                            <i class="fa fa-slideshare"></i> 新增企业
                        </h3>
                        <hr>
                        <form id="wizForm" action="#" class="form-horizontal" style=" padding: 30px 15px;">
                      
                            <div class="wizard-form" id="formWizard">
                                <div class="wizard-content">
                                    <ul class="nav nav-pills nav-justified steps">
                                        <li>
                                            <a href="#step1" data-toggle="tab" class="wiz-step">
                                                <span class="step-number"> <img src="${ctxStatic}/img/step_one.png"/> </span>
                                                <span class="step-name">企业名称 </span>
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#step2" data-toggle="tab" class="wiz-step">
                                                <span class="step-number"><img src="${ctxStatic}/img/step_two.png"/></span>
                                                <span class="step-name">企业基本信息</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#step3" data-toggle="tab" class="wiz-step">
                                                <span class="step-number"><img src="${ctxStatic}/img/step_thress.png"/></span>
                                                <span class="step-name">数据字段设置</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#step4" data-toggle="tab" class="wiz-step">
                                                <span class="step-number"><img src="${ctxStatic}/img/step_four.png"/></span>
                                                <span class="step-name">模型参数设置</span>
                                            </a>
                                        </li>
                                    </ul>

                                    <div id="bar" class="progress progress-striped progress-sm active" role="progressbar">
                                        <div class="progress-bar progress-bar-primary"></div>
                                    </div>
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="step1">
                                            <div class="form-group">
                                                <label class="control-label col-md-3"><span class="red_text">*</span> 企业名称</label>
                                                <div class="col-md-7">
                                                    <input type="text" id="modelname" class="form-control" name="custCfname" value="${company_Info.custCfname}" maxlength="100" placeholder="企业名称" data-bv-notempty data-bv-notempty-message="企业名称不能为空" />
                                                </div>
                                            </div>

                                 
                                        </div>

                                        <div class="tab-pane" id="step2">
                                            <div class="form-group">
                                                <label class="control-label col-md-3"> 企业简称</label>
                                                <div class="col-md-7">
                                                    <input type="text" id="modelname" class="form-control" name="custCfname" value="${company_Info.custCfname}" maxlength="100" placeholder="企业简称"  />
                                                </div>
                                            </div>
                                              <div class="form-group">
                                                <label class="control-label col-md-3">英文全称</label>
                                                <div class="col-md-7">
                                                    <input type="text" id="modelname" class="form-control" name="custCfname" value="${company_Info.custCfname}" maxlength="100" placeholder="英文全称"  />
                                                </div>
                                            </div>
                                              <div class="form-group">
                                                <label class="control-label col-md-3"> 英文简称</label>
                                                <div class="col-md-7">
                                                    <input type="text" id="modelname" class="form-control" name="custCfname" value="${company_Info.custCfname}" maxlength="100" placeholder="英文简称" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3"> 企业类型</label>
                                                <div class="col-md-7">
                                                    <input type="text" id="modelname" class="form-control" name="custCfname" value="${company_Info.custCfname}" maxlength="100" placeholder="企业类型" />
                                                </div>
                                            </div>
                               
                                        </div>
                                        <div class="tab-pane" id="step3">
                                            <div class="scrollTable m-b-md" id="scrollTable">
                                                <div class="table-head">
                                                    <table class="table table-striped table-condensed table-bordered">
                                                        <col width="170px"></col>
                                                        <col width="170px"></col>
                                                        <col width="170px"></col>
                                                        <thead>
                                                        <tr>
                                                            <th class="">序号</th>
                                                            <th class="">字段名称</th>
                                                            <th class="">字段说明</th>
                                                        </tr>
                                                        </thead>
                                                    </table>
                                                </div>
                                                <div class="table_div">
                                                    <table id="colTab" class="table tbody table-striped table-condensed table-bordered">
                                                        <col width="170px"></col>
                                                        <col width="170px"></col>
                                                        <col width="170px"></col>
                                                        <tbody>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <!--提交字段-->
                                            <fieldset class="fileld-diy hidden">
                                                <legend><i class="glyphicon glyphicon-hand-down"></i> 提交字段</legend>
                                                <div class="col-xs-12" id="select_div">
                                                </div>
                                            </fieldset>

                                        </div>
                                        <div class="tab-pane" id="step4">
                                            <div class="form-group">
                                                <label class="control-label col-md-3"><span class="red_text">*</span> 所选特征数</label>
                                                <div class="col-md-7">
                                                    <input type="text" name="modelparam1" value="<c:if test="${empty modelinfo.modelparam1 }">1</c:if><c:if test="${not empty modelinfo.modelparam1 }">${modelinfo.modelparam1}</c:if>" class="form-control" placeholder="特征系数" data-bv-notempty data-bv-notempty-message="不能为空" data-bv-regexp="true" data-bv-regexp-regexp="(^[0-9]\d*$)" data-bv-regexp-message="只能输入正整数"/>
                                                </div>
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
                                                    <i class="fa fa-save"></i> 验证全称是否可用
                                                </a>
                                                <a href="javascript:;" class="btn btn-primary hidden two_step btn-sm" id="two_step1">
                                                    测试 <i class="fa fa-cloud-upload"></i>
                                                </a>
                                                <%--<a href="javascript:;" class="btn btn-primary hidden two_step btn-sm" id="two_step2">
                                                    提交 <i class="fa fa-cloud-upload"></i>
                                                </a>--%>
                                               <%-- <a href="javascript:;" class="btn btn-primary hidden three_step btn-sm" id="three_step">
                                                    提交选择字段 <i class="fa fa-cloud-upload"></i>
                                                </a>--%>
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
<script src="${ctxStatic}/js/plugins/wizard/form-step.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/js/jquery-migrate-1.1.1.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/jquery-jbox/2.3/jquery.jBox-2.3.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/jquery-jbox/2.3/i18n/jquery.jBox-zh-CN.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/cmsp/cmsp.dialog.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/jquery.form.js"></script>
<script>
    $(document).ready(function() {
        $('#colTab tbody').on('click','input', function(event){
            $(".fileld-diy").removeClass("hidden");
            var rowId=$(this).attr("id");
            if($(this).is(':checked')){
                var targetHtml=$(this).parents("td").next().html();
                var html='<span class="sel_span" data-id='+rowId+'><input type="hidden" name="sourcefields" value='+targetHtml+'><em>'+targetHtml+'<b>×</b></em></span>';
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

        FormWizard.init();
        /*$(".i-checks").iCheck({
            checkboxClass: "icheckbox_square-green",
            radioClass: "iradio_square-green"
        })*/
        //数据源类型点击事件处理
        $("input[name='sourcetype']").click(function(){
            var database = $("#database").val();
            if(database == '' ) {
            } else {
                $.ajax({
                    url: "${ctx}/modelinfo/getTabs?ran="+Math.random(),
                    type: "get",
                    data: {"database":$("#database").val(),"sourcetype":$("input[name='sourcetype']:checked").val()},
                    dataType:"json",
                    success:function(data){
                        if(data.success){
                            $("#sourcename option").remove();
                            var json = JSON.parse(data.data);
                            $("#sourcename").append("<option value=''>请选择数据源</option>")
                            $.each(json, function (index, item) {
                                $("#sourcename").append("<option value='"+item.table_name+"'>"+item.table_name+"_"+item.table_comment+"</option>")
                            })
                        }
                    },
                    error : function(XMLHttpRequest, textStatus, errorThrown) {
                        top.$.jBox.error("系统内部错误！！", "系统提示");
                    }
                })
            }
        });
        //验证全称是否可用是否正常
        $('#first_stepsave').click(function(){
            var baseid = $("#custCfname").val();
            if (baseid != "") {
                $.ajax({
                    url: "${ctx}/company_info/add?ran="+Math.random(),
                    type: "get",
                    data: {"custCfname":$("#custCfname").val()},
                    dataType:"json",
                    success:function(data){
                        if(data.success){
                            top.$.jBox.success("企业名称可用！");
                            return false;
                        } else {
                            top.$.jBox.error("此企业已经存在！");
                            return false;
                        }
                    },
                    error : function(XMLHttpRequest, textStatus, errorThrown) {
                        top.$.jBox.error("系统内部错误！！", "系统提示");
                    }
                })
            }
        });
        //测试数据源连接是否正常
        $('#two_step1').click(function(){
            var baseid = $("#custCfname").val();
            if (baseid != "") {
                $.ajax({
                    url: "${ctx}/company_Info?ran="+Math.random(),
                    type: "get",
                    data: {"custCfname":$("#custCfname").val()},
                    dataType:"json",
                    success:function(data){
                        if(data.success){
                            top.$.jBox.success("企业名称正确！");
                            return false;
                        } else {
                            top.$.jBox.error("此企业已经存在！");
                            return false;
                        }
                    },
                    error : function(XMLHttpRequest, textStatus, errorThrown) {
                        top.$.jBox.error("系统内部错误！！", "系统提示");
                    }
                })
            }
        });
        //在form中点击运行
        $("#run").click(function () {
            //1、查询数据源是否已设置
            var database = $("#database").val();
            if(database == '' ) {
                top.$.jBox.error("数据源未配置,无法运行！");
                return false;
            }
            var sourcename = $("#sourcename").val();
            if (sourcename === '') {
                top.$.jBox.error("数据源未配置,无法运行！");
                return　false;
            }
            //2、查询字段是否已经添加
            var fields = $("input[name='sourcefields']").length;
            if (fields == 0 && $("#fields").val() == '') {
                top.$.jBox.error("数据字段未设置,无法运行！");
                return　false;
            }

            top.$.jBox.confirm("确定运算吗？","系统提示",function(v, h,f) {
                var params = $("#wizForm").serialize();
                if (v == "ok"){
                    $.ajax({
                        url: "${ctx}/factor/saveAndCalculate?ran="+Math.random(),
                        type: "post",
                        data: params,
                        dataType:"json",
                        success:function(data){
                            if(data.success){
                                top.$.jBox.success(data.msg, "系统提示");
                                location.href = "${ctx}/factor/list";
                            } else {
                                top.$.jBox.error("模型运算启动失败！！", "系统提示");
                                return false;
                            }
                        },
                        error : function(XMLHttpRequest, textStatus, errorThrown) {
                            top.$.jBox.error("系统内部错误！！", "系统提示");
                        }
                    });
                }
            })

        })

    });

    //数据库变更时动态变更数据源
    function changeDataBase(value) {
        if (value != '') {
            $.ajax({
                    url: "${ctx}/modelinfo/getTabs?ran="+Math.random(),
                    type: "get",
                    data: {"database":value,"sourcetype":$("input[name='sourcetype']:checked").val()},
                    dataType:"json",
                    success:function(data){
                        if(data.success){
                            $("#sourcename option").remove();
                            var json = JSON.parse(data.data);
                            $("#sourcename").append("<option value=''>请选择数据源</option>")
                            $.each(json, function (index, item) {
                                $("#sourcename").append("<option value='"+item.table_name+"'>"+item.table_name+"_"+item.table_comment+"</option>")
                            })
                        }
                    },
                    error : function(XMLHttpRequest, textStatus, errorThrown) {
                        top.$.jBox.error("系统内部错误！！", "系统提示");
                    }
            })
        }
    }
    //获取数据库字段信息
    function getFileds() {
        $.ajax({
            url: "${ctx}/modelinfo/getFields?ran="+Math.random(),
            type: "get",
            data: {"id":$("#database").val(),"sourcetype":$("input[name='sourcetype']:checked").val(),"sourcename":$("#sourcename").val()},
            dataType:"text",
            success:function(data){
                $("#colTab tbody").html("");
                $("#colTab tbody").prepend(data);
                var html = "";
                if ($("input[name='sourcefields']").length > 0) {
                    $("input[name='sourcefields']").each(
                        function () {
                            var value = $(this).val();
                            var id = $(this).prev().attr("data-id");

                            $(".i-checks").each(function () {
                                var targetHtml=$(this).parents("td").next().html();
                                if (targetHtml === value) {
                                    $(this).attr("checked", "checked");
                                    html += '<span class="sel_span" data-id="'+$(this).attr("id")+'"><input type="hidden" name="sourcefields" ' +
                                        'value='+value+'><em>'+value+'<b>×</b></em></span>';
                                }
                            })
                        }
                    );
                } else {
                    if ($("#fields").val() != '' && $("#fields").val() != 'undefined') {
                        var fieldsArr = new Array();
                        fieldsArr = $("#fields").val().split(",");
                        for (var i = 0; i < fieldsArr.length; i++) {
                            $(".i-checks").each(function () {
                                var targetHtml=$(this).parents("td").next().html();
                                var value=fieldsArr[i];
                                if (targetHtml === value) {
                                    $(this).attr("checked", "checked");
                                    html += '<span class="sel_span" data-id="'+$(this).attr("id")+'"><input type="hidden" name="sourcefields" ' +
                                        'value='+value+'><em>'+value+'<b>×</b></em></span>';
                                }
                            })
                        }
                    }
                }
                if (html != "") {
                    $(".fileld-diy").removeClass("hidden");
                }
                $("#select_div").html("");
                $("#select_div").append(html);
            },
            error : function(XMLHttpRequest, textStatus, errorThrown) {
                $.jBox.error("系统内部错误！！", "系统提示");
            }

        })
    }

    function formSubmit(){
        $("#wizForm").bootstrapValidator({
            feedbackIcons:{
                valid:"glyphicon glyphicon-ok",
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields:{
                remark : {
                    validators: {
                        stringLength: {
                            max: 200,
                            message: '备注不得超过200字'
                        }
                    }
                }
            }
        });
        var data=$('#wizForm').bootstrapValidator('validate')
        if($('#wizForm').data("bootstrapValidator").isValid()){
            top.$.jBox.confirm("确定提交吗？","系统提示",function(v, h,f) {
                if (v == "ok"){
                    var params = $("#wizForm").serialize();
                    debugger
                    $.ajax({
                        type : "POST",
                        url : "${ctx}/factor/save",
                        data : params,
                        success : function(data) {
                            if (JSON.parse(data).success) {
                                top.$.jBox.success(JSON.parse(data).msg,'系统提示',{ closed: function () {
                                        location.href = "${ctx}/factor/list";
                                    }
                                });
                            }else{
                                top.$.jBox.error("保存失败!" + JSON.parse(data).msg,'系统提示');
                            }
                        }
                    });
                }
            })
        } else {
            return false;
        }
    }

</script>
</body>
</html>
