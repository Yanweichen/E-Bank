<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	// 获得项目完全路径（假设你的项目叫MyApp，那么获得到的地址就是 http://localhost:8080/MyApp/）:
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style>
.msgboxclass{
	height: 50px;
	width: 300px;
	background-color: #3f314d;
	position: absolute;top: 40px;right: 20px;
	display: none;
	border: 2px solid #FFF;
	border-radius: 10px 10px 10px 10px;
	z-index: 999
}
.msgcontent{
	position: relative;
	top: 5px;
	left: 20px;
	color: white;
}
</style>
<link href="http://cdn.bootcss.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
	<canvas id="cas" style="position: absolute;z-index: -1"></canvas>
	<script src="page/assets/js/pointbg.js"></script>
	<!-- 头部导航 -->
		<nav id="navhead" class="navbar navbar-divider noborderradius" style="background-color:#3f314d;min-height: 30px;border-radius: 0;">
			<div class="container" style="padding-top: 5px;">
				<!-- Brand and toggle get grouped for better mobile display -->
				<i class="icon-github-alt" style="font-size: 20px;color: white;"></i>&nbsp;&nbsp;
				<a style="color: white;letter-spacing: 10px;" href="page/index.jsp">e-bank</a>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<!-- /.navbar-collapse -->
				<h5 id="logintitle" style="float: right; color: white;margin: 0px;display: none;">
					你好,<span id="headloginusername">&nbsp;${user.user_name}</span>&nbsp;&nbsp;<a class="hand" id="titleout" style="color: white;">退出</a>&nbsp;
					<i class="icon-credit-card"></i>&nbsp;<a href="myAccount/mybank.action" style="color: white;">我的银行</a>&nbsp;
					<a style="color: white;" href="msg/msgBox.action?state=noview&limit=5&offset=0"><i class="icon-envelope"></i>&nbsp;消息&nbsp;<span id="newmsg" style="display: none;" class="badge">New</span></a>
				</h5>
			</div>
			<!-- /.container-fluid -->
		</nav>
		<div id="headmsgbox" class="msgboxclass">
			<h5 class="msgcontent"><i class="icon-envelope"></i>&nbsp;&nbsp;<a id="headmsg" style="color: white;text-decoration: none;" href="msg/msgBox.action?state=noview&limit=5&offset=0"></a> </h5>
		</div>
	<!-- 头部导航end -->


