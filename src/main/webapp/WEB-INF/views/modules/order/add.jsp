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
                                      
                                    </ul>

                                    <div id="bar" class="progress progress-striped progress-sm active" role="progressbar">
                                        <div class="progress-bar progress-bar-primary"></div>
                                    </div>
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="step1">
                                            <div class="form-group">
                                                <label class="control-label col-md-3"><span class="red_text">*</span> 企业名称</label>
                                                <div class="col-md-7">
                                                    <input type="text" id="custCfname" class="form-control" name="custCfname" value="${company_Info.custCfname}" maxlength="100" placeholder="企业名称" data-bv-notempty data-bv-notempty-message="企业名称不能为空" />
                                                </div>
                                            </div>

                                 
                                        </div>

                                        <div class="tab-pane" id="step2">
                                         	<div class="form-group">
                                                <label class="control-label col-md-3"><span class="red_text">*</span> 企业名称</label>
                                                <div class="col-md-7">
                                                    <input id="name" disabled="disabled" type="text"  class="form-control"  maxlength="100" placeholder="企业名称" data-bv-notempty data-bv-notempty-message="企业名称不能为空" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3"> 企业简称</label>
                                                <div class="col-md-7">
                                                    <input type="text" id="modelname" class="form-control" name="custCsname" value="${company_Info.custCsname}" maxlength="100" placeholder="企业简称"  />
                                                </div>
                                            </div>
                                              <div class="form-group">
                                                <label class="control-label col-md-3">英文全称</label>
                                                <div class="col-md-7">
                                                    <input type="text" id="modelname" class="form-control" name="custEfname" value="${company_Info.custEfname}" maxlength="100" placeholder="英文全称"  />
                                                </div>
                                            </div>
                                              <div class="form-group">
                                                <label class="control-label col-md-3"> 英文简称</label>
                                                <div class="col-md-7">
                                                    <input type="text" id="modelname" class="form-control" name="custEsname" value="${company_Info.custEsname}" maxlength="100" placeholder="英文简称" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3"> 所在省份</label>
                                                <div class="col-md-7">
                                                    <input type="text" id="modelname" class="form-control" name="provinceName" value="${company_Info.provinceName}" maxlength="100" placeholder="所在省份" />
                                                </div>
                                            </div>
                                             <div class="form-group">
                                                <label class="control-label col-md-3"> 组织机构编号</label>
                                                <div class="col-md-7">
                                                    <input type="text" id="modelname" class="form-control" name="custOrgid" value="${company_Info.custOrgid}" maxlength="100" placeholder="组织机构编号" />
                                                </div>
                                            </div>
                                              <div class="form-group">
                                                <label class="control-label col-md-3"> 行业代码</label>
                                                <div class="col-md-7">
                                                    <input type="text" id="modelname" class="form-control" name="custIndustrycode" value="${company_Info.custIndustrycode}" maxlength="100" placeholder="行业代码" />
                                                </div>
                                            </div>
                                              <div class="form-group">
                                                <label class="control-label col-md-3"> 一级行业</label>
                                                <div class="col-md-7">
                                                    <input type="text" id="modelname" class="form-control" name="custIndustry1" value="${company_Info.custIndustry1}" maxlength="100" placeholder="一级行业" />
                                                </div>
                                            </div>
                                             <div class="form-group">
                                                <label class="control-label col-md-3"> 二级行业</label>
                                                <div class="col-md-7">
                                                    <input type="text" id="modelname" class="form-control" name="custIndustry2" value="${company_Info.custIndustry2}" maxlength="100" placeholder="二级行业" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3"> 企业类型</label>
                                                <div class="col-md-7">
                                                    <select id="database" name="cmtp" class="form-control" data-bv-notempty data-bv-notempty-message="企业类型不能为空">
                                                    
                                                        <option value="1">普通</option>
                                                        <option value="2">港股</option>
                                                        <option value="3">深圳主板</option>
                                                        <option value="4">深圳中小板</option>
                                                        <option value="5">深圳创业板</option>
                                                        <option value="6">上证主板</option>
                                                      
                                                     
                                                    </select>
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
                                                <a   id="next-step" href="javascript:;" class="btn btn-primary nextBtn btn-sm">
                                            		        下一步
                                                </a>
                                                 <a   id="resetStep" href="javascript:;" class="btn btn-success first_step btn-sm">
                                                 		  重置
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
    	
        FormWizard.init();
        $('#next-step').hide();
        $('#resetStep').hide();
     
        
      //验证全称是否可用是否正常
        $('#first_stepsave').click(function(){
            var custCfname = $("#custCfname").val();
            if( custCfname.length <4 ){
            	top.$.jBox.error("全称长度应大于4", "系统提示");
            	return false;
            }
            if (custCfname != "") {
                $.ajax({
                    url: "${ctx}/company_info/checkName",
                    type: "get",
                    data: {"custCfname":$("#custCfname").val()},
                    dataType:"json",
                    success:function(data){
                        if(data.success){
                        	$('#name').val(custCfname);
                        	$('#custCfname').attr("disabled","disabled");
                            top.$.jBox.success("企业名称可用！");
                            $('#next-step').show();
                            $('#resetStep').show();
                            return false;
                        } else {
                        	 $('#next-step').hide();
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
      
      
    });
    $('#resetStep').click(function(){
    	$('#custCfname').removeAttr("disabled");
    	 $('#next-step').hide();
    	 $('#resetStep').hide();
    });


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
                        url : "${ctx}/company_info/add",
                        data : params,
                        success : function(data) {
                            if (JSON.parse(data).success) {
                                top.$.jBox.success(JSON.parse(data).msg,'系统提示',{ closed: function () {
                                        location.href = "${ctx}/company_info/list";
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
