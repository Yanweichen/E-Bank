<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>账户设置</title>
</head>
<body style="background-image: url('page/assets/img/bg_grid.png');">
	<!-- 头部导航 -->
	<jsp:include page="../../../page/head_foot/mybank_head.jsp"></jsp:include>
	
	<div class="container top20">
		<div class="row">
			<div class="col-sm-3">
				<div id="setlist" class="list-group touming6">
				  <a id="noviewa" href="javascript:void(0)" class="list-group-item">
				  	<i class="icon-mobile-phone " style="font-size: 20px;"></i>&nbsp;&nbsp;手机缴费充值
				  	<i class="icon-angle-right noviewi" style="float: right;"></i>
				  </a>
				  <a id="isviewa" href="msg/msgBox.action?state=isview&limit=5&offset=0" class="list-group-item">
				  	<i class="icon-heart " ></i>&nbsp;&nbsp;爱心捐赠
				  	<i class="icon-angle-right isviewi" style="float: right;"></i>
				  </a>
				   <a id="alla" href="msg/msgBox.action?limit=5&offset=0" class="list-group-item">
				  	<i class="icon-desktop "></i>&nbsp;&nbsp;有线电视缴费
				  	<i class="icon-angle-right alli" style="float: right;"></i>
				  </a>
				  <a id="alla" href="msg/msgBox.action?limit=5&offset=0" class="list-group-item">
				  	<i class="icon-tint "></i>&nbsp;&nbsp;水煤电缴费
				  	<i class="icon-angle-right alli" style="float: right;"></i>
				  </a>
				</div>
			</div>
			<div class="col-sm-9">
				<div class="panel panel-default touming6">
					<div class="panel-heading">
						<i class="icon-mobile-phone " style="font-size: 34px;color: #3f316d;padding-top: 5px;"></i><h4 class="nosingline" style="color: #3f316d;position: absolute;">&nbsp;&nbsp;手机缴费充值</h4>
				  	</div>
				  <div class="panel-body">
				  		<form>
						  <div class="form-group">
						    <label for="exampleInputEmail1">手机号</label>
						    <input type="text" class="form-control"  placeholder="手机号">
						  </div>
						  <div class="form-group">
						    <label for="exampleInputPassword1">缴费金额</label>
						    <input type="text" class="form-control"  placeholder="金额">
						  </div>
						  <button type="submit" class="btn btn-default btncolor">缴费</button>
						</form>
				  </div>
				</div>
			</div>
		</div>
	</div>
	<!-- foot -->
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<jsp:include page="../../../page/head_foot/foot.jsp"></jsp:include>
	<script src="page/assets/js/jquery.easing.1.3.js"></script>
	<script src="page/assets/js/bootstrap.min.js"></script>
</body>
</html>