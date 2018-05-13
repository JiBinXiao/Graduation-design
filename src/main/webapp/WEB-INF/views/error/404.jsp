<%
response.setStatus(404);

// 如果是异步请求或是手机端，则直接返回信息
if (Servlets.isAjaxRequest(request)) {
	out.print("页面不存在.");
}

//输出异常信息页面
else {
%>
<%@page import="com.trs.rwsc.common.web.Servlets"%>
<%@page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>404 - 页面不存在</title>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
	<link rel="stylesheet" href="${ctxStatic}/css/bootstrap.min.css" title="" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/animate.min.css" />
	<!--[if lt IE 9]>
	<script src="${ctxStatic}/js/html5shiv.js"></script>
	<script src="${ctxStatic}/js/respond.min.js"></script>
	<![endif]-->
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/style.min.css"/>
	<style type="text/css">
		.middle-div{max-width: 400px; z-index: 100; margin: 0 auto; padding-top: 10%;}
	</style>
</head>
<body class="gray-bg">
	<div class="middle-div text-center animated fadeInDown">
		<a href="javascript:void(0)" onclick="parent.location.reload()"><img src="${ctxStatic}/img/404.png"/></a>
	</div>
	<script src="${ctxStatic}/js/jquery-1.3.2.min.js"></script>
	<script src="${ctxStatic}/js/bootstrap.min.js?v=3.3.6"></script>
</body>
<%--<body>
	<div class="container-fluid">
		<div class="page-header"><h1>页面不存在.</h1></div>
		<div><a href="javascript:" onclick="history.go(-1);" class="btn">返回上一页</a></div>
		<script>try{$.jBox.closeTip();}catch(e){}</script>
	</div>
</body>--%>
</html>
<%
out.print("<!--"+request.getAttribute("javax.servlet.forward.request_uri")+"-->");
} out = pageContext.pushBody();
%>