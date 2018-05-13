<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1"/>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<title>登录</title>
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/login.css"/>
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/plugins/BootstrapValidator/bootstrapValidator.css"/>
		<!--[if lt IE 9]>
		<script src="${ctxStatic}/js/html5s	hiv.js"></script>
		<script src="${ctxStatic}/js/respond.min.js"></script>
		<![endif]-->
	</head>
	<body>
	<!--主体-->
	<div class="container-fluid main_body">
		<!--表单-->
		<div class="login-box">
			<div class="form_header">
				<img src="${ctxStatic}/img/login_img.png" />
				<h4 style="color: #062f41;" class="sys_title">采购管理平台</h4>
			</div>
			<form action="${ctx}/login" method="post" id="loginForm" class="login_form">
				<input type="hidden" id="watvalue" name="watvalue">
				<!--账号-->
				<div class="form-group">
					<div class="input-group">
						<div class="input-group-addon"><span class="glyphicon glyphicon-user"></span></div>
						<input type="text" class="form-control" id="uname" placeholder="请输入您的用户名" name="uname" data-bv-notempty data-bv-notempty-message="用户名不能为空">
					</div>
				</div>
				<!--密码-->
				<div class="form-group">
					<div class="input-group">
						<div class="input-group-addon"><span class="glyphicon glyphicon glyphicon-lock"></span></div>
						<input type="password" class="form-control"  placeholder="请输入您的密码" id="upwd" name="upwd" data-bv-notempty data-bv-notempty-message="密码不能为空">
					</div>
				</div>
				<a class="btn btn-block btn-primary loginbtn" href="#" id="loginBtn">登录</a>
				<div> <p id="messageBox" style="color: red">${fns:escapeHtml(message)}</p></div>
			</form>
		</div>
	</div>
	<script src="${ctxStatic}/js/jquery-1.12.0.js" type="text/javascript" charset="utf-8"></script>
	<script src="${ctxStatic}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="${ctxStatic}/js/jquery-placeholder.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="${ctxStatic}/js/base64.js"></script>
	<script src="${ctxStatic}/js/plugins/validate/bootstrapValidator.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
        if(window !=top){
            top.location.href=location.href;
        }
        $(function () {
            $('input, textarea').placeholder();
            $('#loginBtn').click(function() {
                var data=$('#loginForm').bootstrapValidator('validate');
                if($('#loginForm').data("bootstrapValidator").isValid()){//判断表单是否符合验证规则
                    var txtV1 = document.getElementById("uname");
                    var txtV2 = document.getElementById("upwd");
                    var b = new Base64();
                    var jsonstr = txtV1.value + ',' + txtV2.value;
                    document.getElementById('watvalue').value = jsonstr;
                    document.getElementById("loginForm").submit();
                }else{
                    return false;
                }
            });
        });
	</script>
	</body>

</html>
