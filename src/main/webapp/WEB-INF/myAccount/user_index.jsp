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
<link href="page/assets/css/animated-menu.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon"
	href="page/assets//img/tubiao.ico" />
<style type="text/css">
.noborderradius{
	border-radius: 0px 0px 0px 0px;
}
.list-group-item{
	border:0;
	background-color: #3f314d;
	cursor:pointer;
}
.hand{
	cursor:pointer;
}
.colgb{
	color: #bbbbbb;
}
.nosingline{
	display: inline;
}
.top20{
	margin-top: 20px
}
.top10{
	margin-top: 10px
}
.top5{
	margin-top: 5px
}
.btncolor {
	background-color: #3f316d;
	border-color: #3f316d;
}
.bordera{border-right: 1px solid #2d2d3d;border-bottom: 1px solid #2d2d3d;} 
.borderb{border-bottom: 1px solid #2d2d3d;} 
.borderc{border-right: 1px solid #2d2d3d;} 

a.list-group-item:hover{
	background-color: #3f313d;
}
a:hover {text-decoration: none;}		/* 鼠标移动到链接上 */
</style>
<title>我的E-Bank</title>
</head>
<body style="background-image: url('page/assets/img/bg_grid.png');">
	<canvas id="cas" style="position: absolute;z-index: -999"></canvas>
	<script src="page/assets/js/pointbg.js"></script>
	<!-- 头部导航 -->
		<nav class="navbar navbar-divider noborderradius" style="background-color:#3f314d;margin-bottom: 0px;min-height: 30px">
			<div class="container" style="padding-top: 5px;">
				<!-- Brand and toggle get grouped for better mobile display -->
				<a style="color: white;letter-spacing: 10px;" href="page/index.jsp">e-bank</a>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	<!-- 头部导航end -->
	<hr width="100%" style="border:1px solid #3f315d;margin: 0;"/>
	<div style="background-color: #3f314d;height: 150px;position: relative;z-index: 2" >
		<ul>
			<li class="blackpurple">
				<h4 class="daohang"><a href="#">我的E-Bank</a></h4>
				<div class="subtext">
					<div class="list-group">
						<a class="list-group-item" style="color: white;"> 账户设置 </a>
						<a class="list-group-item" style="color: white;"> 我的账单 </a>
						<a class="list-group-item" style="color: white;"> 对账单 </a>
					</div>
				</div>
			</li>
			<li class="blackpurple">
				<h4 class="daohang">财富中心</h4>
				<div class="subtext">
					<div class="list-group">
						<a class="list-group-item" style="color: white;"> 账户设置 </a>
						<a class="list-group-item" style="color: white;"> 我的账单 </a>
						<a class="list-group-item" style="color: white;"> 对账单 </a>
					</div>
				</div>
			</li>
			<li class="blackpurple" id="userinfo">
				<img class="img-circle" style="width: 100px;height: 100px;margin-top: 20px" src="page/assets/img/touxiang_zhushou.jpg">
				<div class="subtext">
					<div class="row">
						<h5 class="colgb">阎伟晨</h5>
					</div>
					<div class="row">
						<h5 class="colgb">13279379235</h5>
					</div>
					<div class="row" style="margin: 10px 20px 0 20px;">
						<div class="col-sm-3"><a href="#" rel="relname"><img id="usercheck" src="page/assets/img/circle-profle.png" style="height: 20px;width: 20px;"></a></div>
						<div class="col-sm-3"><a href="#" rel="phone"><img src="page/assets/img/circle-smartphone.png" style="height: 20px;width: 20px;"></a></div>
						<div class="col-sm-3"><a href="#" rel="safe"><img src="page/assets/img/circle-security.png" style="height: 20px;width: 20px;"></a></div>
						<div class="col-sm-3"><a href="#" rel="setting"><img src="page/assets/img/circle-locked.png" style="height: 20px;width: 20px;"></a></div>
					</div>
					<div class="row" style="margin: 10px 20px 0 20px;">
						<div class="col-sm-6 bordera">
							<h5 class="colgb">银行卡</h5>
							<h5 class="colgb">3</h5>
						</div>
						<div class="col-sm-6 borderb">
							<h5 class="colgb">银行卡</h5>
							<h5 class="colgb">3</h5>
						</div>
					</div>
					<div class="row" style="margin: 0px 20px 0 20px;">
						<div class="col-sm-6 borderc">
							<h5 class="colgb">银行卡</h5>
							<h5 class="colgb">3</h5>
						</div>
						<div class="col-sm-6">
							<h5 class="colgb">银行卡</h5>
							<h5 class="colgb">3</h5>
						</div>
					</div>
				</div>
			</li>
			<li class="blackpurple">
				<h4 class="daohang">生活服务</h4>
				<div class="subtext">
					<div class="list-group">
						<a class="list-group-item" style="color: white;"> 账户设置 </a>
						<a class="list-group-item" style="color: white;"> 我的账单 </a>
						<a class="list-group-item" style="color: white;"> 对账单 </a>
					</div>
				</div>
			</li>
			<li class="blackpurple">
				<h4 class="daohang">账户管理</h4>
				<div class="subtext" >
					<div class="list-group">
						<a class="list-group-item" style="color: white;"> 账户设置 </a>
						<a class="list-group-item" style="color: white;"> 我的账单 </a>
						<a class="list-group-item" style="color: white;"> 对账单 </a>
					</div>
				</div>
			</li>
		</ul>
	</div>
	<div class="container" >
		<div class="row top20" >
			<div class="col-sm-6 " >
				<div class="panel panel-default" style="border-radius: 10px 10px 10px 10px;background-color:rgba(255,255,255,0.6);">
					<div class="panel-body">
						<div class="row" >
							<div class="col-sm-4" >
								<h4>财富看板</h4>
							</div>
							<div class="col-sm-5 col-sm-offset-3">
								<h5 style="float: left;margin-left: 80px;color: #999999">单位:元<a href="#"  style="margin-left: 10px;">财富总览</a></h5>
							</div>
						</div>
						<hr width="100%" style="border-top:1px solid #cccccc;margin: 0px;"/>
						<div class="row">
							<div class="col-sm-4 top20" style="text-align: center;">
								<h5 class="top20">账户余额</h5>
								<h3 class="top20">0.00</h3>
								<button type="button" class="btn btn-primary btncolor top10">&nbsp;&nbsp;&nbsp;&nbsp;充值&nbsp;&nbsp;&nbsp;&nbsp;</button>
								<h5 class="top10">提现</h5>
							</div>
							<div class="col-sm-4 top20" style="text-align: center;">
								<h5 class="top20">账户余额</h5>
								<h3 class="top20">0.00</h3>
								<button type="button" class="btn btn-primary btncolor top10">&nbsp;&nbsp;&nbsp;&nbsp;充值&nbsp;&nbsp;&nbsp;&nbsp;</button>
								<h5 class="top10">提现</h5>
							</div>
							<div class="col-sm-4 top20" style="text-align: center;">
								<h5 class="top20">账户余额</h5>
								<h3 class="top20">0.00</h3>
								<button type="button" class="btn btn-primary btncolor top10">&nbsp;&nbsp;&nbsp;&nbsp;充值&nbsp;&nbsp;&nbsp;&nbsp;</button>
								<h5 class="top10">提现</h5>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="panel panel-default" style="border-radius: 10px 10px 10px 10px;background-color:rgba(255,255,255,0.6);">
					 <div class="panel-body">
						<div class="row" >
							<div class="col-sm-4" >
								<h4 >生活服务</h4>
							</div>
							<div class="col-sm-5 col-sm-offset-3">
								<h5 style="float: left;margin-left: 80px;">管理&nbsp;&nbsp;&nbsp;|&nbsp;<a href="#"  style="margin-left: 5px;">我的服务</a></h5>
							</div>
						</div>
						<hr width="100%" style="border-top:1px solid #cccccc;margin: 0px;"/>
						<div class="row">
							<div class="col-sm-3 top10" style="text-align: center;">
								<span class="glyphicon glyphicon-cloud" style="color: #3f316d;font-size: 50px;"></span>
								<h5>转账到E-Bank</h5>
								<span class="glyphicon glyphicon-cloud top5" style="color: #3f316d;font-size: 50px;"></span>
								<h5>转账到E-Bank</h5>
							</div>
							<div class="col-sm-3 top10" style="text-align: center;">
								<span class="glyphicon glyphicon-cloud" style="color: #3f316d;font-size: 50px;"></span>
								<h5>转账到E-Bank</h5>
								<span class="glyphicon glyphicon-cloud top5" style="color: #3f316d;font-size: 50px;"></span>
								<h5>转账到E-Bank</h5>
							</div>
							<div class="col-sm-3 top10" style="text-align: center;">
								<span class="glyphicon glyphicon-cloud" style="color: #3f316d;font-size: 50px;"></span>
								<h5>转账到E-Bank</h5>
								<span class="glyphicon glyphicon-cloud top5" style="color: #3f316d;font-size: 50px;"></span>
								<h5>转账到E-Bank</h5>
							</div>
							<div class="col-sm-3 top10" style="text-align: center;">
								<span class="glyphicon glyphicon-cloud" style="color: #3f316d;font-size: 50px;"></span>
								<h5>转账到E-Bank</h5>
								<span class="glyphicon glyphicon-cloud top5" style="color: #3f316d;font-size: 50px;"></span>
								<h5>转账到E-Bank</h5>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- foot -->
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<jsp:include page="../../page/head_foot/foot.html"></jsp:include>
	<script src="page/assets/js/bootstrap.min.js"></script>
	<script src="page/assets/js/jquery.easing.1.3.js"></script>
	<script src="page/assets/js/animated-menu.js"></script>
	<script type="text/javascript">
	     $(function(){
	         $("[rel=relname]").popover({
	             trigger:'manual',
	             placement : 'right', //placement of the popover. also can use top, bottom, left or right
	             title : '<h5 class="colgb" style="width:120px;">已经通过实名认证</h5>', //this is the top title bar of the popover. add some basic css
	             html: 'true', //needed to show html of course
	             content : '<h5 class="colgb" align="center">查看详情</h5>', //this is the content of the html box. add the image here or anything you want really.
	             animation: false
	         }).on("mouseenter", function () {
	                     var _this = this;
	                     $(this).popover("show");
	                     $(this).siblings(".popover").on("mouseleave", function () {
	                         $(_this).popover('hide');
	                     });
	                 }).on("mouseleave", function () {
	                     var _this = this;
	                     setTimeout(function () {
	                         if (!$(".popover:hover").length) {
	                             $(_this).popover("hide")
	                         }
	                     }, 100);
	                 });
	     });
	     $(function(){
	         $("[rel=phone]").popover({
	             trigger:'manual',
	             placement : 'top', //placement of the popover. also can use top, bottom, left or right
	             title : '<h5 class="colgb" style="width:120px;">已经通过实名认证</h5>', //this is the top title bar of the popover. add some basic css
	             html: 'true', //needed to show html of course
	             content : '<h5 class="colgb" align="center">查看详情</h5>', //this is the content of the html box. add the image here or anything you want really.
	             animation: false
	         }).on("mouseenter", function () {
	                     var _this = this;
	                     $(this).popover("show");
	                     $(this).siblings(".popover").on("mouseleave", function () {
	                         $(_this).popover('hide');
	                     });
	                 }).on("mouseleave", function () {
	                     var _this = this;
	                     setTimeout(function () {
	                         if (!$(".popover:hover").length) {
	                             $(_this).popover("hide")
	                         }
	                     }, 100);
	                 });
	     });
	     $(function(){
	         $("[rel=safe]").popover({
	             trigger:'manual',
	             placement : 'top', //placement of the popover. also can use top, bottom, left or right
	             title : '<h5 class="colgb" style="width:120px;">已经通过实名认证</h5>', //this is the top title bar of the popover. add some basic css
	             html: 'true', //needed to show html of course
	             content : '<h5 class="colgb" align="center">查看详情</h5>', //this is the content of the html box. add the image here or anything you want really.
	             animation: false
	         }).on("mouseenter", function () {
	                     var _this = this;
	                     $(this).popover("show");
	                     $(this).siblings(".popover").on("mouseleave", function () {
	                         $(_this).popover('hide');
	                     });
	                 }).on("mouseleave", function () {
	                     var _this = this;
	                     setTimeout(function () {
	                         if (!$(".popover:hover").length) {
	                             $(_this).popover("hide")
	                         }
	                     }, 100);
	                 });
	     });
	     $(function(){
	         $("[rel=setting]").popover({
	             trigger:'manual',
	             placement : 'left', //placement of the popover. also can use top, bottom, left or right
	             title : '<h5 class="colgb" style="width:120px;">已经通过实名认证</h5>', //this is the top title bar of the popover. add some basic css
	             html: 'true', //needed to show html of course
	             content : '<h5 class="colgb" align="center">查看详情</h5>', //this is the content of the html box. add the image here or anything you want really.
	             animation: false
	         }).on("mouseenter", function () {
	                     var _this = this;
	                     $(this).popover("show");
	                     $(this).siblings(".popover").on("mouseleave", function () {
	                         $(_this).popover('hide');
	                     });
	                 }).on("mouseleave", function () {
	                     var _this = this;
	                     setTimeout(function () {
	                         if (!$(".popover:hover").length) {
	                             $(_this).popover("hide")
	                         }
	                     }, 100);
	                 });
	     });
	</script>
</body>
</html>