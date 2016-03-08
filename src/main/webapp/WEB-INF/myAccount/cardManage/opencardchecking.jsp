<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	// 获得项目完全路径（假设你的项目叫MyApp，那么获得到的地址就是 http://localhost:8080/MyApp/）:
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<base href=" <%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="page/assets//img/tubiao.ico" />
<link href="page/assets/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="page/assets/css/mybankbase.css">
<link href="page/assets/css/animated-menu.css" rel="stylesheet">

<link href="http://cdn.bootcss.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
<title>办理银行卡</title>
<style type="text/css">
</style>
</head>
<body style="background-image: url('page/assets/img/bg_grid.png');">
	<!-- 头部导航 -->
	<jsp:include page="../../../page/head_foot/mybank_head.jsp"></jsp:include>
	<div class="container top20">
		<div class="panel panel-default touming6" style="height: 200px;">
		  <div class="panel-body">
		  		<h3 style="color: #666666;margin-top: 50px;" align="center"><i class="icon-ok" style="color: green;font-size: 30px;"></i>&nbsp;&nbsp;&nbsp;您的银行卡已提交审核,1-3个工作日内办理,请注意查看您的站内信</h3> 
		  		<h4 align="center">
		  			<i class="icon-reply" style="color: #3f316d;font-size: 20px;"></i>&nbsp;&nbsp;<a href="myAccount/mybank.action">回到我的E-Bank</a>&nbsp;&nbsp;
			  		<i class="icon-credit-card" style="color: #3f316d;font-size: 20px;"></i>&nbsp;&nbsp;<a href="myAccount/userCardList.action">查看我的银行卡</a>
		  		</h4>
		  </div>
		</div>
	</div>
	<!-- foot -->
	<jsp:include page="../../../page/head_foot/foot.jsp"></jsp:include>
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<script src="page/assets/js/jquery.easing.1.3.js"></script>
	<script src="page/assets/js/bootstrap.min.js"></script>
</body>
</html>