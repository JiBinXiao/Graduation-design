<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="name" type="java.lang.String" required="true" description="验证码输入框名称"%>
<%@ attribute name="inputCssStyle" type="java.lang.String" required="false" description="验证框样式"%>
<%@ attribute name="imageCssStyle" type="java.lang.String" required="false" description="验证码图片样式"%>
<%@ attribute name="buttonCssStyle" type="java.lang.String" required="false" description="看不清按钮样式"%>
<input type="text" class="form-control" id="" placeholder="请输入验证码"  id="${name}" name="${name}" data-bv-notempty data-bv-notempty-message="验证码不能为空" onkeyup="onMobTelBlurHandler();">
<div class="input-group-addon yzm"><img src="${pageContext.request.contextPath}/servlet/validateCodeServlet?height=34" onclick="$('.${name}').attr('src','${pageContext.request.contextPath}/servlet/validateCodeServlet?'+new Date().getTime());" class="mid ${name}" style="${imageCssStyle}"/></div>
