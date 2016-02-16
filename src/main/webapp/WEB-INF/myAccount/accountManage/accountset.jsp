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
<style type="text/css">
#setlist .list-group-item{
	border:0;
	background-color: rgba(255,255,255,0.3);
	cursor:pointer;
}
#setlist .list-group-item:hover{
	border:0;
	background-color: rgba(255,255,255,0.9);
	cursor:pointer;
}
</style>
<title>账户设置</title>
</head>
<body style="background-image: url('page/assets/img/bg_grid.png');">
	<!-- 头部导航 -->
	<jsp:include page="../../../page/head_foot/mybank_head.jsp"></jsp:include>
	
	<div class="container top20">
		<div class="row">
			<div class="col-sm-3">
				<div id="setlist" class="list-group touming6">
				  <a href="javascript:void(0)" class="list-group-item" style="background-color: #3f316d;border-color: #3f316d;color: white;">
				  	<i class="icon-user" style="font-size: 20px;color: white;"></i>&nbsp;&nbsp;基本信息
				  	<i class="icon-angle-right" style="font-size: 20px;color: white;float: right;"></i>
				  </a>
				  <a href="myAccount/faceSet.action" class="list-group-item">
				  	<i class="icon-github-alt" style="font-size: 19px;color: #3f316d"></i>&nbsp;&nbsp;修改头像
				  	<i class="icon-angle-right" style="font-size: 20px;color: #3f316d;float: right;"></i>
				  </a>
				</div>
			</div>
			<div class="col-sm-9">
				<div class="panel panel-default touming6">
				  <div class="panel-body">
				    	<form>
							<div class="form-group ">
		  						<label for="user_name">注册姓名</label>
								<input class="form-control" type="text" placeholder="<c:if test="${!empty user}">${user.user_name}</c:if>" readonly>
							</div>
							<div class="form-group ">
		  						<label for="user_name">开户城市</label>
								<input class="form-control" type="text" placeholder="<c:if test="${!empty user}">${user.user_city}</c:if>" readonly>
							</div>
							<div class="form-group ">
		  						<label for="user_name">预留信息</label>
								<input class="form-control" type="text" value="<c:if test="${!empty user}">${user.user_obligate_info}</c:if>" >
							</div>
							<div class="form-group ">
		  						<label for="user_name">身份证号码</label>
								<input class="form-control" type="text" placeholder="<c:if test="${!empty user}">${user.user_idcard}</c:if>" readonly>
							</div>
							<div class="form-group ">
		  						<label for="user_name">预留电话</label>
								<input class="form-control" type="text" value="<c:if test="${!empty user}">${user.user_phone}</c:if>" >
							</div>
							<div class="form-group ">
		  						<label for="user_name">预留信箱</label>
								<input class="form-control" type="text" value="<c:if test="${!empty user}">${user.user_email}</c:if>" >
							</div>
							<div class="col-sm-4 col-sm-offset-4" >
							 	<button type="submit" class="btn btncolor btn-default btn-block">保存</button>
							</div>
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