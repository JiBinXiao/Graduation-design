<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>采购图书</title>
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
                          

                            <i class="fa fa-slideshare"></i> 图书采购
                        </h3>
                        <hr>
                        <form id="wizForm" action="#" class="form-horizontal" style=" padding: 30px 15px;">
                      
                            <div class="wizard-form" id="formWizard">
                                <div class="wizard-content">
                                    <ul class="nav nav-pills nav-justified steps">
                                        <li>
                                            <a href="#step1" data-toggle="tab" class="wiz-step">
                                                <span class="step-number"> <img src="${ctxStatic}/img/step_one.png"/> </span>
                                                <span class="step-name">填写订单 </span>
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#step2" data-toggle="tab" class="wiz-step">
                                                <span class="step-number"><img src="${ctxStatic}/img/step_two.png"/></span>
                                                <span class="step-name">确定订单</span>
                                            </a>
                                        </li>
                                      
                                    </ul>

                                    <div id="bar" class="progress progress-striped progress-sm active" role="progressbar">
                                        <div class="progress-bar progress-bar-primary"></div>
                                    </div>
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="step1">
                                         <input type="hidden"  class="form-control" name="bookId" value="${books.id }"  />
                                            <div class="form-group">
                                                <label class="control-label col-md-3"><span class="red_text">*</span> 数量</label>
                                                <div class="col-md-7">
                                                    <input id="num" type="text"  class="form-control" name="num" maxlength="100" placeholder="数量" data-bv-notempty data-bv-notempty-message="数量不能为空" />
                                                	 <input id="price1" name= "price" type="hidden"  class="form-control" value="${books.price }"/>
                                                	  <input id="origin"  name= "origin" type="hidden"  class="form-control" value="${books.origin }"/>
                                                </div>
                                            </div>
                                              <div class="form-group">
                                                <label class="control-label col-md-3"><span class="red_text">*</span> 收货单位</label>
                                                <div class="col-md-7">
                                                    <input id="receivingUnit" type="text"  class="form-control" name="receivingUnit" value="" maxlength="100" placeholder="收货单位" data-bv-notempty data-bv-notempty-message="收货单位不能为空" />
                                                </div>
                                            </div>
                                              <div class="form-group">
                                                <label class="control-label col-md-3"><span class="red_text">*</span> 收货人</label>
                                                <div class="col-md-7">
                                                    <input id="receivingPerson" type="text"  class="form-control" name="receivingPerson" value="" maxlength="100" placeholder="收货人" data-bv-notempty data-bv-notempty-message="收货人不能为空" />
                                                </div>
                                            </div>
                                              <div class="form-group">
                                                <label class="control-label col-md-3"><span class="red_text">*</span> 收货地址</label>
                                                <div class="col-md-7">
                                                    <input id="receivingAddress" type="text"  class="form-control" name="receivingAddress" value="" maxlength="100" placeholder="收货地址" data-bv-notempty data-bv-notempty-message="收货地址不能为空" />
                                                </div>
                                            </div>
                                              <div class="form-group">
                                                <label class="control-label col-md-3"><span class="red_text">*</span> 联系方式</label>
                                                <div class="col-md-7">
                                                    <input id="receivingPhone"  type="text"  class="form-control" name="receivingPhone" value="" maxlength="100" placeholder="联系方式" data-bv-notempty data-bv-notempty-message="联系方式不能为空" />
                                                </div>
                                            </div>
                                             

                                 
                                        </div>

                                        <div class="tab-pane" id="step2">
                                         	<div class="form-group">
                                                <label class="control-label col-md-3"><span class="red_text">*</span>图书名称</label>
                                                <div class="col-md-7">
                             		                  <span > ${books.name}</span>
                             		                  <input name="name" type="hidden" value=" ${books.name}" />
                                                 
                                                </div>
                                            </div>
                                              	<div class="form-group">
                                                <label class="control-label col-md-3"><span class="red_text">*</span>作者</label>
                                                <div class="col-md-7">
                                                    ${books.author}
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3"> 图书价格</label>
                                                <div class="col-md-7">
                                                   ${books.price}
                                                </div>
                                            </div>
                                              <div class="form-group">
                                                <label class="control-label col-md-3">ISBN号</label>
                                                <div class="col-md-7">
                                                    ${books.isbn}
                                                </div>
                                            </div>
                                              <div class="form-group">
                                                <label class="control-label col-md-3">来源</label>
                                                <div class="col-md-7">
                                              
                                                  ${books.origin}
                                                  
                                                </div>
                                            </div>
                                              <div class="form-group">
                                                <label class="control-label col-md-3"> 数量</label>
                                                <div class="col-md-7">
                                                  <span id="num2"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3"> 总金额</label>
                                                <div class="col-md-7">
                                                   <span id="total"></span>
                                                </div>
                                            </div>
                                             <div class="form-group">
                                                <label class="control-label col-md-3"> 收货单位</label>
                                                <div class="col-md-7">
                                                   <span id="unit"></span>
                                                </div>
                                            </div>
                                              <div class="form-group">
                                                <label class="control-label col-md-3"> 收货人</label>
                                                <div class="col-md-7">
                                                       <span id="person"></span>
                                                </div>
                                            </div>
                                              <div class="form-group">
                                                <label class="control-label col-md-3"> 收货地址</label>
                                                <div class="col-md-7">
                                                       <span id="address"></span>
                                                </div>
                                            </div>
                                             <div class="form-group">
                                                <label class="control-label col-md-3"> 联系方式</label>
                                                <div class="col-md-7">
                                                      <span id="phone"></span>
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
                                           
                                                <a  id="next-step"  href="javascript:;" class="btn btn-primary nextBtn btn-sm">
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
  
    });
    
    $('#resetStep').click(function(){
    	
    	  $("#num");
    });
	
    $('#next-step').click(function(){
    	
    	 var num = $("#num").val();
         var origin = $("#origin").val();
         var price =parseFloat( $("#price1").val());
         var receivingUnit = $("#receivingUnit").val();
         var receivingPerson = $("#receivingPerson").val();
         var receivingAddress = $("#receivingAddress").val();
         var receivingPhone = $("#receivingPhone").val();
	
  	
         $('#num2').html(num);
         $('#origin2').html(origin);
    	 $('#total').html(price*num+'元');
    	 $('#address').html(receivingAddress);
    	 $('#person').html(receivingPerson);
    	 $('#unit').html(receivingUnit);
    	 $('#phone').html(receivingPhone);
   
    	
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
            top.$.jBox.confirm("确定提交订单吗","系统提示",function(v, h,f) {
                if (v == "ok"){
                    var params = $("#wizForm").serialize();
                    debugger
                    $.ajax({
                        type : "POST",
                        url : "${ctx}/orders/add",
                        data : params,
                        
                        success : function(data) {
                            if (JSON.parse(data).success) {
                                top.$.jBox.success(JSON.parse(data).msg,'系统提示',{ closed: function () {
                                        location.href = "${ctx}/orders/list";
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
