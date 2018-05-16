<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>因子分析</title>
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
            <blockquote class="text-primary gray-bg-high"><i class="fa fa-codepen text-primary"></i> 企业分析-回收站
                <form id="searchForm" action="${ctx}/company_info/seachbyName" method="post" class="form-inline m-t-sm">
                    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
                    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
                    <div class="form-group">
                        <label  class="control-label">企业名称:</label>
                        <input type="text" placeholder="请输入企业名称" name="custCfname" value="${company_Info.custCfname}" class="form-control">
                    </div>
                  
                    <a class="btn btn-sm btn-warning  m-l-sm pull-right"  href="${ctx}/company_info/gotoadd" ><i class="fa fa-plus"></i> 新增</a>
                    <a id="resetBtn" class="btn btn-sm  btn-success btn-outline m-l-sm pull-right"><i class="fa fa-refresh"></i> 重置</a>
                    <a href="#" class="btn btn-success btn-sm m-l-md pull-right" id="search"><i class="fa fa-search"></i> 查询</a>
                     <a href="${ctx}/company_info/list" class="btn btn-success btn-sm m-l-md pull-right" id="search"><i class="fa fa-search"></i> 返回</a>
                </form>
            </blockquote>
        </div>
       
          <div class="col-xs-12">
            <div class="table-responsive">
                <table class="table table-striped table-condensed table-bordered">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>全称</th>
                        <th>简称</th>
                        <th>省份</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:if test="${empty page.list }">
                            <tr><td colspan="6" class="text-center">没有符合条件的数据</td></tr>
                        </c:if>
                        <c:forEach items="${page.list}" var="info" varStatus="vs">
                            <tr>
                                <td>${vs.index+1}</td>
                                <td>${info.custCfname} </td>
                                <td>${info.custCsname} </td>
                                <td>${info.provinceName}</td>
                                <td>
                                    <a class="btn btn-xs btn-success btn-outline" href="${ctx}/company_info/detail?custId=${info.custId}" ><i class="fa fa-edit"></i> 查看详情</a>
                                   <a class="btn btn-xs btn-success btn-outline" href="${ctx}/company_info/recover?custId=${info.custId}" onclick="return confirm('确定恢复当前数据?');" ><i class="fa fa-edit"></i> 恢复</a>
                                   <a class="btn btn-xs btn-success btn-outline" href="${ctx}/company_info/deleteData?custId=${info.custId}" onclick="return confirm('确定从数据库中删除当前数据?');"><i class="fa fa-edit"></i> 删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

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
