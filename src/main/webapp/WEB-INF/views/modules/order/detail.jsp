<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>订单详情</title>
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
        /*.tab-content>.tab-pane{    padding: 30px 20px 10px 0;}*/
    </style>
</head>
<body>
<div class="wrapper wrapper-content">
    <div class="row">

        <div class="col-xs-12">
            <div class="table-responsive">
                <table class="table table-striped table-condensed table-bordered">
                  
                    <tbody>
                     
                      <tr>
                        <td>序号</td>
                        <td>${order.id}</td>
                  	  </tr>
                	  <tr>
                        <td>书名</td>
                     	 <td>  
                     	 
                     	${order.name}
                     	 
                     	 </td>
                  	  </tr>
                     <tr>
                       <td>来源</td>
                      
                         <td>   
                        
                     	 ${order.origin}
                     	 </td>
                  	  </tr>
                  	  <tr>
                        <td>数量</td>
                        <td>   
                        
                     	 	${order.num}
                     	 
                     	 </td>
                  	  </tr>
                 
                  	   <tr>
                        <td>价格</td>
              
                         <td>   
                        ${order.price}元
                     	 </td>
                  	  </tr>
                  	   <tr>
                        <td>状态</td>
                         <td>   
                         <c:choose>
                         	<c:when test="${order.st eq 1 }"> 待收货</c:when>
                         	<c:when test="${order.st eq -1 }"> 已删除</c:when>
                         	<c:when test="${order.st eq 2 }"> <span style='color:red'>已收货</span></c:when>
                         </c:choose>
                        	
                     	 </td>
                  	  </tr>
                  	  	   <tr>
                        <td>创建日期</td>
                         <td>   
                        	${order.createdate}
                     	 </td>
                  	  </tr>
                  	  	   <tr>
                        <td>收货单位</td>
                         <td>   
                        	${order.receivingUnit}
                     	 </td>
                  	  </tr>
                  	  	   <tr>
                        <td>收货人</td>
                         <td>   
                        	${order.receivingPerson}
                     	 </td>
                  	  </tr>
                  	  	   <tr>
                        <td>收货联系方式</td>
                         <td>   
                        	${order.receivingPhone}
                     	 </td>
                  	  </tr>	   <tr>
                        <td>收货地址</td>
                         <td>   
                        	${order.receivingAddress}
                     	 </td>
                  	  </tr>
                  	 <td>供应商</td>
                         <td>   
                        	${order.receivingAddress}
                     	 </td>
                  	  </tr>
            
                     
                    </tbody>
                </table>
            </div>

        </div>
    </div>
    <div class="row">
        <div class="fixed-table-pagination" style="display: block;">${page}</div>
    </div>
<script src="${ctxStatic}/js/jquery-1.12.0.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctxStatic}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctxStatic}/js/plugins/iCheck/icheck.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctxStatic}/js/content.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctxStatic}/js/plugins/datapicker/bootstrap-datetimepicker.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctxStatic}/js/plugins/datapicker/bootstrap-datetimepicker.zh-CN.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/js/findPageSize.js"></script>
<script>
    $(document).ready(function() {
        $(".i-checks").iCheck({
            checkboxClass: "icheckbox_square-green",
            radioClass: "iradio_square-green"
        })


        //查询
        $("#search").click(function(){
            debugger
            $("#searchForm").submit();
        });

        //重置
        $("#resetBtn").click(function(){
            $("#searchForm")[0].reset();
            $(':input','#searchForm')
                .not(':button, :submit, :reset, :hidden')
                .val('')
                .removeAttr('checked')
                .removeAttr('selected');
            $('#searchForm').attr('action',"${ctx}/factor/list");
            $('#searchForm').submit();
        });

    });

    function deleteFun(id) {
        top.$.jBox.confirm("确定删除吗？","系统提示",function(v, h,f) {
            if (v == "ok"){
                $.ajax({
                    url: "${ctx}/factor/delete?ran="+Math.random(),
                    type: "post",
                    data: {"id":id},
                    dataType:"json",
                    success:function(data){
                        if(data.success){
                            top.$.jBox.success("因子分析删除成功！！", "系统提示");
                            $('#search').trigger("click");
                        } else {
                            top.$.jBox.error("删除失败！！", "系统提示");
                            return false;
                        }
                    },
                    error : function(XMLHttpRequest, textStatus, errorThrown) {
                        top.$.jBox.error("系统内部错误！！", "系统提示");
                    }
                });
            }
        })
    }
    //停用、启用
    function updateStatus(id, status) {
        var msg = "确定启用吗？";
        if (status === '2') {
            msg = "确定停用吗？"
        }
        top.$.jBox.confirm(msg,"系统提示",function(v, h,f) {
            if (v == "ok"){
                $.ajax({
                    url: "${ctx}/factor/updateStatus?ran="+Math.random(),
                    type: "post",
                    data: {"id":id, "status":status},
                    dataType:"json",
                    success:function(data){
                        if(data.success){
                            top.$.jBox.success("状态修改成功！！", "系统提示");
                            $('#search').trigger("click");
                        } else {
                            top.$.jBox.error("状态修改失败！！", "系统提示");
                            return false;
                        }
                    },
                    error : function(XMLHttpRequest, textStatus, errorThrown) {
                        top.$.jBox.error("系统内部错误！！", "系统提示");
                    }
                });
            }
        })
    }
    //运算
    function calculate(id) {
        top.$.jBox.confirm("确定运算吗？","系统提示",function(v, h,f) {
            if (v == "ok"){
                $.ajax({
                    url: "${ctx}/factor/calculate?ran="+Math.random(),
                    type: "post",
                    data: {"id":id},
                    dataType:"json",
                    success:function(data){
                        if(data.success){
                            top.$.jBox.success(data.msg, "系统提示");
                            $('#search').trigger("click");
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
    }

    function expResult(id) {
        top.$.jBox.confirm("确定导出运算结果吗？","系统提示",function(v, h,f) {
            if (v == "ok"){
                window.open("${ctx}/modelinfo/getFile?id="+id, '_blank');
            }
        })
    }
    //分页
    function page(n,s){
        if(n) $("#pageNo").val(n);
        if(s) $("#pageSize").val(s);
        $("#searchForm").submit();
        return false;
    }
</script>
</body>
</html>
