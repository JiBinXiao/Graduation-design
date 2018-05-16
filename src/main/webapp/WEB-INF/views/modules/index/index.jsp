<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html lang="zh-cn">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="renderer" content="webkit">
	<title>基于网络爬虫的图书采购推荐系统</title>
	<link rel="stylesheet" href="${ctxStatic}/css/bootstrap.min.css" title="" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/animate.min.css" />
	<!--[if lt IE 9]>
	<script src="${ctxStatic}/js/html5shiv.js"></script>
	<script src="${ctxStatic}/js/respond.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/js/PIE.js"></script>
	<![endif]-->
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/style.min.css"/>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/admin.css"/>
	<link href="${ctxStatic}/css/font-awesome.min93e3.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/iconfont.css"/>
	<link type="text/css" rel="stylesheet" href="${ctxStatic}/js/jquery-jbox/2.3/Skins/Blue/jbox.css?v=0232"/>
	<style type="text/css">
		.loading-div{height: 100%;  position:relative;}
		.loading-div>.loading-imgBox>img{width: 50px;margin-bottom: 20px;}
		.loading-div .loading-imgBox{width:170px; height: 172px; position: absolute; left: 50%; top: 50%;margin-left: -85px; margin-top: -120px;text-align:center;}
	</style>
</head>

<body style="background-color:#f2f9fd;font-family: '微软雅黑';" class="fixed-sidebar full-height-layout gray-bg">
<div id="wrapper">
	<!--导航条-->
	<div class="left-main left-full">
		<div class="sidebar-fold">
			<div class="img_box">
				<img src="${ctxStatic}/img/user_photo.png"/>
			</div>
			<span class="glyphicon glyphicon-menu-hamburger"> 菜单列表</span>
		</div>
		<div class="subNavBox">
			<!--主成分析-->
			<div class="sBox">
				<div class="subNav subNav_no  active">
					<a href="${ctx}/book/list" target="right" class="J_menuItem J_tabShowActive">
						<i class="fa fa-empire" title="采购管理"></i>
						<span class="sublist-title">采购管理</span><span class="glyphicon glyphicon-chevron-up" style="display: none;"></span>
					</a>
				</div>
			</div>
			
			
			<div class="sBox">
				<div class="subNav subNav_no  active">
					<a href="${ctx}/orders/list" target="right" class="J_menuItem J_tabShowActive">
						<i class="fa fa-empire" title="订单管理"></i>
						<span class="sublist-title">订单管理</span><span class="glyphicon glyphicon-chevron-up" style="display: none;"></span>
					</a>
				</div>
			</div>
			
		<div class="sBox">
				<div class="subNav subNav_no  active">
					<a href="${ctx}/supplier/list" target="right" class="J_menuItem J_tabShowActive">
						<i class="fa fa-empire" title="供应商管理"></i>
						<span class="sublist-title">供应商管理</span><span class="glyphicon glyphicon-chevron-up" style="display: none;"></span>
					</a>
				</div>
			</div>
			
			
		</div>
	</div>
	<!--框架-->
	<div id="page-wrapper" class="gray-bg dashbard-1" >
		<!--导航条-->
		<div class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0;">
			<div class="navbar-header">
				<h4 class="navbar-brand">基于网络爬虫的图书采购推荐系统</h4>
			</div>
			<ul class="nav navbar-top-links navbar-right" >
				<li class="userPhoto text-right"><img src="${ctxStatic}/img/admin.png" alt="" class="img-circle" id="divcss5"></li>
				<li class="dropdown" >
					<a href="#" class="dropdown-toggle " data-toggle="dropdown" style="padding-left: 52px;">
						${user.username}
					</a>
					<%--<ul class="dropdown-menu">
						<li><a href="">修改头像</a></li>
						<li><a href="">个人资料</a></li>
						<li><a href="">联系我们</a></li>
						<li><a href="">信箱</a></li>
						<li class="divide"></li>
					</ul>--%>
				</li>
				<!-- 退出-->
				<li class="dropdown" >
					<a href="${ctx }/logout" class="dropdown-toggle" >
						<i class="fa fa fa-sign-out"></i> 退出
					</a>
				</li>
			</ul>
		</div>


		<!--tab页签-->
		<div class="row content-tabs" id="tabNav">
			<button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
			</button>
			<div class="page-tabs J_menuTabs">
				<div class="page-tabs-content">
					<a href="javascript:;" id="homeTab" class="active J_menuTab" data-id="${ctx}/book/list" >采购管理</a>
				</div>
			</div>
			<button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
			</button>
			<div class="btn-group roll-nav roll-right">
				<button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

				</button>
				<ul role="menu" class="dropdown-menu dropdown-menu-right">
					<li class="J_tabShowActive"><a>定位当前选项卡</a>
					</li>
					<li class="divider"></li>
					<li class="J_tabCloseAll"><a>关闭全部选项卡</a>
					</li>
					<li class="J_tabCloseOther"><a>关闭其他选项卡</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="row J_mainContent" id="content-main">
			<div class="loading-div">
				<div class="loading-imgBox">
					<img src="${ctxStatic}/img/loading11.gif" alt="" />
					<p>数据加载中,请稍后...</p>
				</div>
			</div>
			<iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${ctx}/book/list" frameborder="0" data-id="${ctx}/book/list" seamless></iframe>
		</div>
		<%--<div class="footer">
			<div class="text-right">主办单位： &nbsp;&nbsp;&nbsp;&copy 技术支持：
			</div>
		</div>--%>
	</div>
</div>
<script src="${ctxStatic}/js/jquery-1.12.0.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctxStatic}/js/bootstrap.min.js"></script>
<script src="${ctxStatic}/js/jquery.nicescroll.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctxStatic}/js/public.js" type="text/javascript" charset="utf-8"></script>
<!--web弹层组件-->
<script type="text/javascript" src="${ctxStatic}/js/contabs.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/jquery-migrate-1.1.1.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/jquery-jbox/2.3/jquery.jBox-2.3.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/jquery-jbox/2.3/i18n/jquery.jBox-zh-CN.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/cmsp/cmsp.dialog.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/jquery.form.js"></script>
<script type="text/javascript">
    //面包屑导航
    $(function() {
        if(navigator.userAgent.indexOf("MSIE") != -1) {
            $("#content-main").height($("#wrapper").height()-80);
        }
        $("#homeTab").trigger("click");
        /*左侧导航栏显示隐藏功能*/
        $(".subNav").click(function() {
            /*显示*/
            if($(this).find("span:last-child").attr('class') == "glyphicon glyphicon-chevron-down") {

                $(this).find("span:last-child").removeClass("glyphicon-chevron-down");
                $(this).find("span:last-child").addClass("glyphicon-chevron-up");
                $(this).removeClass("sublist-down");
                $(this).addClass("sublist-up");
            }
            /*隐藏*/
            else {
                var openEle = $('.subNav.sublist-down');
                $('.subNav.sublist-down').find("span:last-child").removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
                if(openEle) {
                    $('.subNav.sublist-down').next().hide();
                    $('.subNav.sublist-down').addClass("sublist-up").removeClass("sublist-down");
                }
                $(this).find("span:last-child").removeClass("glyphicon-chevron-up");
                $(this).find("span:last-child").addClass("glyphicon-chevron-down");
                $(this).removeClass("sublist-up");
                $(this).addClass("sublist-down");
            }
            // 修改数字控制速度， slideUp(500)控制卷起速度
            $(this).next(".navContent").slideToggle(300).siblings(".navContent").slideUp(300);
        })
        /*左侧导航栏缩进功能*/
        OpenClose($(".left-main .sidebar-fold"));

        //鼠标点击事件
        $(".sBox .subNav_no a").click(function() {
            if(!$(this).parents("subNav.subNav_no").hasClass('active')) {
                console.log($(".subNav.subNav_no.active"));
                $(".subNav.subNav_no.active").removeClass('active');
                $(this).parent().addClass('active');
            }

        });
        //左侧导航条滚动事件
        $('.left-main').niceScroll({
            cursorwidth: 3,
            cursorborder: "none",
            cursorcolor: "#999",
            hidecursordelay: 0,
            horizrailenabled: false,
            zindex: 10001
        });


    });
</script>
</body>

</html>