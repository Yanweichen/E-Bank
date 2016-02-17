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
		  	<div class="col-sm-6" style="text-align: center;margin-top: 80px;">
				<img class="img-rounded" src="${cardtype.card_face}" style="height: 150px;width: 230px">
		  		<h4 class="top20">${cardtype.card_name}</h4> 
		  	</div>
		  	<div class="col-sm-6">
		  		<div class="form-group ">
  					<label for="user_name">办理人</label>
						<input class="form-control" type="text" placeholder="<c:if test="${!empty user}">${user.user_name}</c:if>" readonly>
					</div>
					<div class="form-group ">
  						<label for="user_name">身份证号码</label>
						<input class="form-control" type="text" placeholder="<c:if test="${!empty user}">${user.user_idcard}</c:if>" readonly>
					</div>
					<div class="form-group ">
  						<label for="user_name">预留电话</label>
						<input class="form-control" name="user_phone" type="text" placeholder="<c:if test="${!empty user}">${user.user_phone}</c:if>" readonly>
					</div>
					<div class="form-group ">
						<label for="user_name">自助设备转账开关</label>
						<label class="radio-inline">
						  <input type="radio" name="inlineRadioOptions1" id="inlineRadio1" checked="checked" value="1"> 开
						</label>
						<label class="radio-inline">
						  <input type="radio" name="inlineRadioOptions1" id="inlineRadio2" value="0"> 关
						</label>
					</div>
					<div class="form-group ">
						<label for="user_name">自助设备取现开关</label>
						<label class="radio-inline">
						  <input type="radio" name="inlineRadioOptions2" id="inlineRadio1" checked="checked" value="1"> 开
						</label>
						<label class="radio-inline">
						  <input type="radio" name="inlineRadioOptions2" id="inlineRadio2" value="0"> 关
						</label>
					</div>
					<div class="form-group ">
						<label for="user_name">POS转账消费开关</label>
						<label class="radio-inline">
						  <input type="radio" name="inlineRadioOptions3" id="inlineRadio1" checked="checked" value="1"> 开
						</label>
						<label class="radio-inline">
						  <input type="radio" name="inlineRadioOptions3" id="inlineRadio2" value="0"> 关
						</label>
					</div>
					<div class="col-sm-4 col-sm-offset-4" >
						<form action="card/opencardcheck.action">
							<input type="hidden" name="cardCheckCardtype" value="${cardtype.card_id}">
							<input type="hidden" name="cardCheckUser" value="${user.user_id}">
						 	<button type="submit" class="btn btncolor btn-default btn-block">办理</button>
						</form>
					</div>
		  	</div>
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