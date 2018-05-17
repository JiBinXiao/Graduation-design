<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>采购管理</title>
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
            <blockquote class="text-primary gray-bg-high"><i class="fa fa-codepen text-primary"></i>采购列表——分析
                <form id="searchForm" action="${ctx}/factor/list" method="post" class="form-inline m-t-sm">
                    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
                    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
                    <div class="form-group">
                        <label  class="control-label">书籍名称:</label>
                        <input type="text" placeholder="请输入书籍名称" name="modelname" value="${modelinfo.modelname}" class="form-control">
                    </div>
                
                  
                </form>
            </blockquote>
        </div>
        <div class="col-xs-12">
            <div class="table-responsive">
                <table class="table table-striped table-condensed table-bordered">
                    <thead>
                    <tr>
                        <th>热搜词排行</th>
                        <th>借阅记录排行</th>
                       
                    </tr>
                    </thead>
                    <tbody>
                       
                        <c:forEach items="${page.list}" var="info" varStatus="vs">
                            <tr>
                                <td> ${vs.index+1}</td>
                                <td><a href="${info.link}"  target="_blank" >${info.title}</a> </td>
                             	<td>${info.prnow} </td>
                                <td>${info.prpre} </td>
                           	    <td>${info.author} </td>
                                <td>${info.publish} </td>
                        	    <td>${info.desc1} </td>
                             	<td>${info.isbn} </td>
                        
                             	<td>   <a class="btn btn-xs btn-success btn-outline" href="${ctx}/books/add?type=dangdang&id=${info.id}"><i class="fa fa-edit"></i> 采购</a></td>
                            </tr>
                        </c:forEach>
                         <tr>
                                <td><a href="${ctx}/book/dangdang?type=python"> python</a></td>
                                <td><a href="${ctx}/book/dangdang?type=python">python </a></td>

                         </tr>
                         <tr>
                               <td> <a href="${ctx}/book/dangdang?type=java"> java</a></td>
                               <td>爬虫 </td>

                        </tr>
                            <tr>
                                <td><a href="${ctx}/book/dangdang?type=python"> java</a></td>
                                <td>英语 </td>

                         </tr>
                             <tr>
                                <td><a href="${ctx}/book/dangdang?type=python"> html</a></td>
                                <td>c </td>

                         </tr>
                             <tr>
                                <td><a href="${ctx}/book/dangdang?type=python"> 高数</a></td>
                                <td>信息系统分析 </td>

                         </tr>
                             <tr>
                                <td><a href="${ctx}/book/dangdang?type=python"> python</a></td>
                                <td>考研 </td>

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
