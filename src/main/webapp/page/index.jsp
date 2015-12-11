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
<link href="page/assets/css/bootstrap.css" rel="stylesheet">
<title>e-bank</title>
<style type="text/css">
.bg {
	background-image: url("page/assets/img/main-nav-bg2.png");
}

.font-white {
	color: white;
	letter-spacing: 10px
}

.btnwindth {
	margin-left: 10px;
}

a:HOVER {
	color: #AAA;
}

.jumuhight {
	height: 338px;
}

.yuanjiao {
	border-radius: 20px;
}
.tabbg{
	background-color: white;
	margin-left:1px;
	height: 200px;
	border-radius:0px 15px 20px 25px;
}
.centerpanel{
	margin-top:40px;
	height: 400px;
	border-radius:0px 15px 20px 25px;
}
.touxiang{
	margin-top: 20px;
}
.btncolor{
	background-color: #6A5ACD;
	border-color: #6A5ACD;
	margin-right: 10px;
}
</style>
</head>
<body style="background-image: url('page/assets/img/bg_grid.png');">
	<!-- 导航   -->
	<nav class="navbar navbar-divider bg">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<a class="navbar-brand font-white" href="#">e-bank</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<form class="navbar-form navbar-right" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="搜&nbsp;&nbsp;索">
					</div>
					<button type="submit" class="btn btn-default btnwindth">搜&nbsp;&nbsp;索</button>
				</form>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<!-- 头部 -->
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<div class="thumbnail yuanjiao">
					<img src="page/assets/img/touxiang_zhushou.jpg" class="img-circle touxiang" alt="...">
					<div class="caption">
						<h3 class="text-center">Hello,Root</h3>
						<p align="center">
							<a href="page/bus_index.jsp" target="_blank" class="btn btn-primary btncolor" onfocus=this.blur() role="button">我的银行</a> 
							<a href="#" class="btn btn-default" role="button">退出</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-9">
			<!-- 轮播巨幕 -->
				<div id="carousel-example-generic" class="carousel slide jumuhight yuanjiao touxiang"
					data-ride="carousel">
					<!--展示下面小圆点-->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>
					<!--展示主体-->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="page/assets/img/chrome-big.png" class="yuanjiao" alt="pic1">
						</div>
						<div class="item">
							<img src="page/assets/img/safari-big.png" class="yuanjiao"  alt="pic2">
						</div>
						<div class="item">
							<img src="page/assets/img/opera-big.png" class="yuanjiao"  alt="pic3">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 主体部分  -->
	<div class="container">
		<div>
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#home"
					aria-controls="home" role="tab" onfocus=this.blur()
					data-toggle="tab">快捷服务</a></li>
				<li role="presentation"><a href="#profile"
					aria-controls="profile" role="tab" onfocus=this.blur()
					data-toggle="tab">近期活动</a></li>
				<li role="presentation"><a href="#messages"
					aria-controls="messages" role="tab" onfocus=this.blur()
					data-toggle="tab">近期公告</a></li>
				<li role="presentation"><a href="#settings"
					aria-controls="settings" role="tab" onfocus=this.blur()
					data-toggle="tab">金融信息</a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active tabbg" id="home">
				A
				</div>
				<div role="tabpanel" class="tab-pane tabbg" id="profile">B</div>
				<div role="tabpanel" class="tab-pane tabbg" id="messages">C</div>
				<div role="tabpanel" class="tab-pane tabbg" id="settings">D</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="panel panel-default centerpanel">
			<div class="panel-body">Basic panel example</div>
		</div>
	</div>
	
	<!-- 底部 -->
	<div class="container touxiang">
		<div class="row">
			<div class="col-sm-6">
				<div class="panel panel-default tabbg">
					<div class="panel-body">Basic panel example</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="panel panel-default tabbg">
					<div class="panel-body">Basic panel example</div>
				</div>
			</div>
		</div>
	</div>
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<script src="page/assets/js/bootstrap.min.js"></script>
</body>
</html>