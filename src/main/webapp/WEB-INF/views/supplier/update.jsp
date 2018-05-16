<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>修改供应商</title>
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
                     
                      <form  action="${ctx}/supplier/update" method="post" >
                      <input type="hidden" name="id" value="${supplier.id}" /> 
                	  <tr>
                        <td>名称</td>
                     	 <td>  
                     	  	<input name="sname" type="text"  size="40"   style="text-align:left"
                     	  	value="<c:choose><c:when test="${supplier.sname eq '-1'}"></c:when><c:otherwise>${supplier.sname}</c:otherwise></c:choose>" />
                     	  		
                     	 </td>
                  	  </tr>
                  	  <tr>
                        <td>所在地址</td>
                        <td>  
                     	  	 	<input name="address" type="text"  size="40" value="<c:choose><c:when test="${supplier.address eq '-1'}"></c:when><c:otherwise>${supplier.address}</c:otherwise></c:choose>" />
                     	 </td>
                  	  </tr>
                  	    <tr>
                       <td>联系电话</td>
                         <td>  
                     	  	 	<input name="phone" type="text"  size="40" value="<c:choose><c:when test="${supplier.phone eq '-1'}"></c:when><c:otherwise>${supplier.phone}</c:otherwise></c:choose>" />
                     	 </td>
                  	  </tr>
                  	   <tr>
                        <td>描述</td>
              			 <td>  
                     	  	 	<input name="sdec" type="text"  size="40" value="<c:choose><c:when test="${supplier.sdec eq '-1'}"></c:when><c:otherwise>${supplier.sdec}</c:otherwise></c:choose>" />
                     	 </td>
                  	  </tr>
                  
                        <td><input type="submit"></td>
                        <td><input type="reset"></td>
                  	  </tr>
                  	   
            		 </form>
                  
                    </tbody>
                
                </table>
            </div>

        </div>
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
            $('#searchForm').attr('action',"${ctx}/supplier/list");
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
