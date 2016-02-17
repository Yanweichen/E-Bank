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
		<div class="panel panel-default touming6">
		  <div class="panel-body">
		  		<table id="cardtable" class="table table-striped">
				 	<thead>
				 		<tr>
				 			<th>卡片名称</th>
				 			<th>发行地区</th>
				 			<th>币种</th>
				 			<th style="text-align: center;">卡面</th>
				 			<th>卡片特点</th>
				 			<th>操作</th>
				 		</tr>
				 	</thead>
				 	<tbody>
				 	<c:forEach var="card" items="${cardlist}">
				 		<tr>
				 			<td>${card.card_name}</td>
				 			<td>${card.card_location}</td>
				 			<td>${card.card_currency}</td>
				 			<td style="text-align: center;"><img class="img-rounded" src="${card.card_face}"></td>
				 			<td>${card.card_info}</td>
				 			<td><a href='card/getcardtype.action?id=${card.card_id}'>申请</a></td>
				 		</tr>
				 	</c:forEach>
				 	</tbody>
				</table>
		  </div>
		</div>
	</div>
	<!-- foot -->
	<jsp:include page="../../../page/head_foot/foot.html"></jsp:include>
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<script src="page/assets/js/jquery.easing.1.3.js"></script>
	<script src="page/assets/js/bootstrap.min.js"></script>
</body>
</html>