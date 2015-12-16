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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=basePath%>page/assets/css/bootstrap.css" rel="stylesheet">
<title>e-bank</title>
<style type="text/css">
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
	background-color: #3f316d;
	border-color: #3f316d;
	margin-right: 10px;
}
.tabradio{
	border-radius:15px 15px 0px 0px;
}

  /* Custom Styles */
    ul.nav-tabss{
        width: 140px;
        margin-top: 20px;
        border-radius: 4px;
        border: 1px solid #ddd;
        box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
    }
    ul.nav-tabss li{
        margin: 0;
        border-top: 1px solid #ddd;
    }
    ul.nav-tabss li:first-child{
        border-top: none;
    }
    ul.nav-tabss li a{
        margin: 0;
        padding: 8px 16px;
        border-radius: 0;
    }
    ul.nav-tabss li.active a, ul.nav-tabs li.active a:hover{
        color: #fff;
        background: #3f316d;
        border: 1px solid #3f316d;
    }
    ul.nav-tabss li:first-child a{
        border-radius: 4px 4px 0 0;
    }
    ul.nav-tabss li:last-child a{
        border-radius: 0 0 4px 4px;
    }
    ul.nav-tabss.affix{
        top: 30px; /* Set the top position of pinned element */
    }
</style>
</head>
<body data-spy="scroll" data-target="#myScrollspy" style="background-image: url('<%=basePath%>page/assets/img/bg_grid.png');">
	<!-- 头部导航 -->
	<jsp:include page="head_foot/head.html"></jsp:include>
	<!-- 头部 -->
	<div class="container" id="section-4">
		<div class="row">
			<div class="col-sm-3">
				<div class="thumbnail yuanjiao">
					<img src="<%=basePath%>page/assets/img/touxiang_zhushou.jpg" class="img-circle touxiang" alt="...">
					<div class="caption">
						<h3 class="text-center">Hello,Root</h3>
						<p align="center">
							<a href="<%=basePath%>page/bus_index.jsp" target="_blank" class="btn btn-primary btncolor" onfocus=this.blur() role="button">我的银行</a> 
							<a href="#" class="btn btn-default" role="button">退出</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
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
							<img src="<%=basePath%>page/assets/img/chrome-big.png" class="yuanjiao" alt="pic1">
						</div>
						<div class="item">
							<img src="<%=basePath%>page/assets/img/safari-big.png" class="yuanjiao"  alt="pic2">
						</div>
						<div class="item">
							<img src="<%=basePath%>page/assets/img/opera-big.png" class="yuanjiao"  alt="pic3">
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-1" id="myScrollspy" style="z-index: 1">
				<ul class="nav nav-tabss nav-stacked" id="myNav" data-spy="affix" data-offset-top="125">
					<li class="active"><a href="#section-1">快捷服务</a></li>
					<li><a href="#section-2">今日热点</a></li>
					<li><a href="#section-3">关于本行</a></li>
					<li><a href="#section-4">回到顶部</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 主体部分  -->
	<div class="container">
		<div class="row">
		<div class="col-sm-11" id="section-1">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#home"
					aria-controls="home" role="tab" onfocus=this.blur()
					data-toggle="tab" style="border-radius:10px 10px 0px 0px;">快捷服务</a></li>
				<li role="presentation"><a href="#profile"
					aria-controls="profile" role="tab" onfocus=this.blur()
					data-toggle="tab" style="border-radius:10px 10px 0px 0px;">近期活动</a></li>
				<li role="presentation"><a href="#messages"
					aria-controls="messages" role="tab" onfocus=this.blur()
					data-toggle="tab" style="border-radius:10px 10px 0px 0px;">近期公告</a></li>
				<li role="presentation"><a href="#settings"
					aria-controls="settings" role="tab" onfocus=this.blur()
					data-toggle="tab" style="border-radius:10px 10px 0px 0px;">金融信息</a></li>
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
		<div class="col-sm-1"></div>
		</div>
	</div>
	
	<div class="container" id="section-2">
		<div class="row">
			<div class="col-sm-11">
				<div class="panel panel-default centerpanel">
					<div class="panel-body">Basic panel example</div>
				</div>
			</div>
			<div class="col-sm-1"></div>
		</div>
		
	</div>
	
	<!-- 底部 -->
	<div class="container touxiang" id="section-3">
		<div class="row">
			<div class="col-sm-6">
				<div class="panel panel-default tabbg">
					<div class="panel-body">Basic panel example</div>
				</div>
			</div>
			<div class="col-sm-5">
				<div class="panel panel-default tabbg">
					<div class="panel-body">Basic panel example</div>
				</div>
			</div>
			<div class="col-sm-1">
			</div>
		</div>
	</div>
	<!-- foot -->
	<div id="foot" class="container">
	<div class="row">
		<div class="col-sm-6 col-sm-offset-3">
			<p align="center">
				<a id="E-Bank" href="<%=basePath%>page/index.jsp" target="_blank">E-Bank</a> | <a href="#" target="_blank">Bank
					Online</a> | Complaint Guidelines | 审核时间[2015]-070
			</p>
			<p align="center">Copyright &copy; 2015 - e-bank.All Rights
				Reserved.
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Yanweichen| 版权所有</p>
		</div>
	</div>
	</div>
	<script src="<%=basePath%>page/assets/js/jquery-1.8.1.min.js"></script>
	<script src="<%=basePath%>page/assets/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#myNav").affix({
				offset : {
					top : 125
				}
			});
		});
		//启动轮播
		$('#carousel-example-generic').carousel('cycle')
	</script>
</body>
</html>