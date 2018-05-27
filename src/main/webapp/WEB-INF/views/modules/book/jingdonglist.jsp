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
            <blockquote class="text-primary gray-bg-high"><i class="fa fa-codepen text-primary"></i>采购列表——京东（${type}）（${sortType}）
                <form id="searchForm" action="${ctx}/book/jingdong" method="post" class="form-inline m-t-sm">
                    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
                    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
                    <input  name="type" type="hidden" value="${type}"/>
                    <div class="form-group">
                        <label  class="control-label">排序方式:</label>
                           <select class="form-control" name = 'sortType'  id='sortType'>
									 <option  value='综合' <c:if test="${sortType eq '综合'}">selected="selected"</c:if> >综合</option>		
									 <option  value='好评'  <c:if test="${sortType eq '好评'}">selected="selected"</c:if>>好评</option>		
									 <option  value='销售量'  <c:if test="${sortType eq '销售量'}">selected="selected"</c:if>>销售量</option>		
									 <option  value='价格升序'  <c:if test="${sortType eq '价格升序'}">selected="selected"</c:if>>价格升序</option>		
									 <option  value='价格降序'  <c:if test="${sortType eq '价格降序'}">selected="selected"</c:if>>价格降序</option>			       
						 </select>
                    </div>
                       <c:choose>
                       	<c:when test="${sortType eq '综合' }">  <a class="btn btn-sm btn-warning  m-l-sm pull-right" href="javascript:void(0)" onclick="onCrawl('${type}','综合')"><i class="fa fa-plus"></i> 按综合排序爬取</a></c:when>
                       	<c:when test="${sortType eq '好评' }">   <a class="btn btn-sm btn-warning  m-l-sm pull-right" href="javascript:void(0)" onclick="onCrawl('${type}','好评')"><i class="fa fa-plus"></i> 按好评排序爬取</a></c:when>
                       	<c:when test="${sortType eq '销售量' }"> <a class="btn btn-sm btn-warning  m-l-sm pull-right" href="javascript:void(0)" onclick="onCrawl('${type}','销售量')"><i class="fa fa-plus"></i> 按销售量降序排序爬取</a></c:when>
                       	<c:when test="${sortType eq '价格升序' }"> <a class="btn btn-sm btn-warning  m-l-sm pull-right" href="javascript:void(0)" onclick="onCrawl('${type}','价格升序')"><i class="fa fa-plus"></i> 按价格升序排序爬取</a></c:when>
                       	<c:when test="${sortType eq '价格降序' }"> <a class="btn btn-sm btn-warning  m-l-sm pull-right" href="javascript:void(0)" onclick="onCrawl('${type}','价格降序')"><i class="fa fa-plus"></i> 按价格降序排序爬取</a></c:when>
                       </c:choose>
					   <div class="form-group">
                       <input class="btn btn-sm btn-warning  m-l-sm pull-right" type="submit" value="查询"  /> 
                         
                    </div>
                    <a class="btn btn-sm  btn-success btn-outline m-l-sm pull-right" href="${ctx}/book/dangdang?type=${type}"><i class="fa fa-plus"></i> 当当</a>

                  
                </form>
            </blockquote>
        </div>
        <div class="col-xs-12">
            <div class="table-responsive">
                <table class="table table-striped table-condensed table-bordered">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>书名</th>
                        <th>现价</th>
                        
                        
                        <th>出版社</th>
                     
                         <th>ISBN号</th>
                         <th>好评率</th>
                         <th>评论数</th>
                         <th>爬取时间</th>
                         <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:if test="${empty page.list }">
                            <tr><td colspan="8" class="text-center">没有符合条件的数据</td></tr>
                        </c:if>
                        <c:forEach items="${page.list}" var="info" varStatus="vs">
                            <tr>
                                <td> ${vs.index+1}</td>
                                <td><a href="${info.link}"  target="_blank" >${info.title}</a> </td>
                             	<td>${info.prnow} </td>

                                <td>${info.publish} </td>
                      
                             	<td>${info.isbn} </td>
                         	    <td>${info.goodRateShow}% </td>
                         	    <td>${info.goodCountStr} </td>
                             	<td>${info.createDate} </td>
                        
                             	<td>   <a class="btn btn-xs btn-success btn-outline" href="${ctx}/books/add?origin=jingdong&id=${info.id}"  ><i class="fa fa-edit"></i> 采购</a></td>
                            </tr>
                        </c:forEach>
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

    
    //运算
    function onCrawl(type,sortType) {
    	
        top.$.jBox.confirm("确定爬取吗？","系统提示",function(v, h,f) {
            if (v == "ok"){
                $.ajax({
                    url: "${ctx}/book/crwal",
                    type: "post",
                    data: {"keyword":type,"type":"jingdong","sortType":sortType},
                    dataType:"json",
                    success:function(data){
                        if(data.success){
                            
                            top.$.jBox.success(data.msg,'系统提示',{ closed: function () {
                                location.href = "${ctx}/book/jingdong?type="+type+"&sortType="+sortType;
                            }
                            });
                            
                        } else {
                            top.$.jBox.error("爬取失败！！", "系统提示");
                            
                            return false;
                        }
                    },
                    error : function(XMLHttpRequest, textStatus, errorThrown) {
                        top.$.jBox.error("系统内部错误！！", "系统提示");
                    }
                });
            }
        })
    };
    
    

    function expResult(id) {
        top.$.jBox.confirm("确定导出运算结果吗？","系统提示",function(v, h,f) {
            if (v == "ok"){
                window.open("${ctx}/modelinfo/getFile?id="+id, '_blank');
            }
        })
    };
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
