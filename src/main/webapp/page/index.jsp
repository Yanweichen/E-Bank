<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	// 获得项目完全路径（假设你的项目叫MyApp，那么获得到的地址就是 http://localhost:8080/MyApp/）:
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="<%=basePath%>page/assets//img/tubiao.ico" />
<link href="<%=basePath%>page/assets/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="<%=basePath%>page/assets/css/fakeloader.css">
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

.tabbg {
	background-color: white;
	margin-left: 1px;
	border-radius: 0px 15px 20px 25px;
}

.centerpanel {
	margin-top: 10px;
	height: 400px;
	border-radius: 0px 15px 20px 25px;
}

.touxiang {
	margin-top: 30px;
}

.btncolor {
	background-color: #3f316d;
	border-color: #3f316d;
	margin-right: 10px;
}

.tabradio {
	border-radius: 15px 15px 0px 0px;
}

#login_on {
	display: none;
	position: absolute;
	width: 90%
}

#login_off {
	position: absolute;
	width: 90%
}

#login_box {
	position: relative;
}
/* Custom Styles */
ul.nav-tabss {
	width: 140px;
	margin-top: 20px;
	border-radius: 4px;
	border: 1px solid #ddd;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
}

ul.nav-tabss li {
	margin: 0;
	border-top: 1px solid #ddd;
}

ul.nav-tabss li:first-child {
	border-top: none;
}

ul.nav-tabss li a {
	margin: 0;
	padding: 8px 16px;
	border-radius: 0;
}

ul.nav-tabss li.active a, ul.nav-tabs li.active a:hover {
	color: #fff;
	background: #3f316d;
	border: 1px solid #3f316d;
}

ul.nav-tabss li:first-child a {
	border-radius: 4px 4px 0 0;
}

ul.nav-tabss li:last-child a {
	border-radius: 0 0 4px 4px;
}

ul.nav-tabss.affix {
	top: 30px; /* Set the top position of pinned element */
}
a.indexicon:link {color: #4C9ED9;text-decoration: none;}		/* 未访问的链接 */
a.indexicon:visited {color: #4C9ED9;text-decoration: none;}	/* 已访问的链接 */
a.indexicon:hover {color: #CC0000;text-decoration: none;}		/* 鼠标移动到链接上 */
a.indexicon:active {color: #4C9ED9;text-decoration: none;}    /* 选定的链接 */

a.topstyle:link {color: #B22222;text-decoration: none;}		/* 未访问的链接 */
a.topstyle:visited {color: #B22222;text-decoration: none;}	/* 已访问的链接 */
a.topstyle:hover {color: #FF7F00;text-decoration: none;}		/* 鼠标移动到链接上 */
a.topstyle:active {color: #B22222;text-decoration: none;}    /* 选定的链接 */

ul.news{list-style:none;padding-left: 0px;}
ul.news li{ background:url('<%=basePath%>page/assets/img/digest.gif') no-repeat left 4px; padding-left:20px; font-size:14px;line-height:22px;margin-left: 0px;}
ul.news li a { color: #000000; text-decoration: none;}
ul.news li a:link {color: #000000;text-decoration: none;}
ul.news li a:active {color: #000000;text-decoration: none;}
ul.news li a:visited {color: #000000;text-decoration: none;}
ul.news li a:hover {color: #bc0021;text-decoration: underline;}
ul.news li p{float:right; color:#000000}

.overstep{
	text-overflow:ellipsis; 
	white-space:nowrap;
	overflow:hidden;
}
.textbottom{
	vertical-align:bottom;
}
.timestyle{
	color: #666666;
}
.hand{
	cursor:pointer
}
</style>
</head>
<body data-spy="scroll" data-target="#myScrollspy"
	style="background-image: url('<%=basePath%>page/assets/img/bg_grid.png');">
	<canvas id="cas"
		style="position: absolute; z-index: -1; height: 100%; width: 100%;"></canvas>
	<script src="<%=basePath%>page/assets/js/pointbg.js"></script>

	<!-- 头部导航  -->
	<nav class="navbar navbar-divider"
		style="background-image: url('<%=basePath%>page/assets/img/main-nav-bg2.png');"
		id="section-4">
		<div class="container" id="section-4">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<a class="navbar-brand" style="color: white; letter-spacing: 10px;"
					href="<%=basePath%>index/index.action">e-bank</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<form class="navbar-form navbar-right" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="搜&nbsp;索">
					</div>
					<button id="adminlogin" type="button" class="btn btn-default btnwindth">管理员入口</button>
				</form>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<!-- 头部 -->

	<div class="container">
		<div class="row">
			<div class="col-sm-3" id="login_box">
				<div class="thumbnail yuanjiao" id="login_on">
					<img src="<%=basePath%>page/assets/img/touxiang_zhushou.jpg"
						class="img-circle touxiang" alt="...">
					<div class="caption">
						<h3 class="text-center" id="login_user_name">
							<c:if test="${!empty user}">Hello,${user.user_name}</c:if>
						</h3>
						<p align="center">
							<a href="<%=basePath%>index/myBank.action" target="_blank"
								class="btn btn-primary btncolor" onfocus=this.blur()
								role="button">我的银行</a> <a href="#" id="btn_out"
								class="btn btn-default" role="button">退出</a>
						</p>
					</div>
				</div>
				<div class="thumbnail yuanjiao" id="login_off">
					<img src="<%=basePath%>page/assets/img/default_head_img.png"
						class="img-circle touxiang" alt="...">
					<div class="caption">
						<h3 class="text-center">Please Login</h3>
						<p align="center">
							<a id="login" target="_blank" class="btn btn-primary btncolor"
								onfocus=this.blur() role="button">登陆</a> <a
								href="<%=basePath%>page/regist/regist_1.jsp"
								class="btn btn-default" role="button">注册</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<!-- 轮播巨幕 -->
				<div id="carousel-example-generic"
					class="carousel slide jumuhight yuanjiao touxiang"
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
							<img src="<%=basePath%>page/assets/img/chrome-big.png"
								class="yuanjiao" alt="pic1">
						</div>
						<div class="item">
							<img src="<%=basePath%>page/assets/img/safari-big.png"
								class="yuanjiao" alt="pic2">
						</div>
						<div class="item">
							<img src="<%=basePath%>page/assets/img/opera-big.png"
								class="yuanjiao" alt="pic3">
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-1" id="myScrollspy" style="z-index: 1">
				<ul class="nav nav-tabss nav-stacked" id="myNav" data-spy="affix"
					data-offset-top="125">
					<li class="active"><a href="#section-1">快捷服务</a></li>
					<li><a href="#section-2">今日热点</a></li>
					<li><a href="#section-3">关于本行</a></li>
					<li><a href="#section-4">回到顶部</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 主体部分  -->
	<div class="container" style="margin-top: 30px;">
		<div class="row">
			<div class="col-sm-11" id="section-1">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#home"
						aria-controls="home" role="tab" onfocus=this.blur()
						data-toggle="tab" style="border-radius: 10px 10px 0px 0px;">快捷服务</a></li>
					<li role="presentation"><a href="#settings"
						aria-controls="settings" role="tab" onfocus=this.blur()
						data-toggle="tab" style="border-radius: 10px 10px 0px 0px;">金融信息</a></li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active tabbg" id="home" style="padding-top: 5%;height: 170px">
						<div class="row" align="center" >
							<div class="col-sm-2">
								<dl>
									<a class="indexicon" onmouseover="document.getElementById('icon_1').src='<%=basePath%>page/assets/img/e-bank_index_icon/e-pay-hover.gif';" 
										 onmouseout="document.getElementById('icon_1').src='<%=basePath%>page/assets/img/e-bank_index_icon/e-pay.gif';" 
										 href="www.baidu.com">
									<dt>
										<img id="icon_1" 
										 src="<%=basePath%>page/assets/img/e-bank_index_icon/e-pay.gif" class="img-responsive" alt="Responsive image">
									</dt>
									<dd><h5>e支付</h5></dd>
									</a>
								</dl>
							</div>
							<div class="col-sm-2">
								<dl>
									<a class="indexicon" onmouseover="document.getElementById('icon_2').src='<%=basePath%>page/assets/img/e-bank_index_icon/zhuanzhang-hover.gif';" 
										 onmouseout="document.getElementById('icon_2').src='<%=basePath%>page/assets/img/e-bank_index_icon/zhuanzhang.gif';" 
										 href="www.baidu.com">
									<dt>
										<img id="icon_2" 
										 src="<%=basePath%>page/assets/img/e-bank_index_icon/zhuanzhang.gif" class="img-responsive" alt="Responsive image">
									</dt>
									<dd><h5>e转账</h5></dd>
									</a>
								</dl>
							</div>
							<div class="col-sm-2">
								<dl>
									<a class="indexicon" onmouseover="document.getElementById('icon_3').src='<%=basePath%>page/assets/img/e-bank_index_icon/open-card-hover.gif';" 
										 onmouseout="document.getElementById('icon_3').src='<%=basePath%>page/assets/img/e-bank_index_icon/open-card.gif';" 
										 href="www.baidu.com">
									<dt>
										<img id="icon_3" 
										 src="<%=basePath%>page/assets/img/e-bank_index_icon/open-card.gif" class="img-responsive" alt="Responsive image">
									</dt>
									<dd><h5>e开卡</h5></dd>
									</a>
								</dl>
							</div>
							<div class="col-sm-2">
								<dl>
									<a class="indexicon" onmouseover="document.getElementById('icon_4').src='<%=basePath%>page/assets/img/e-bank_index_icon/loan-hover.gif';" 
										 onmouseout="document.getElementById('icon_4').src='<%=basePath%>page/assets/img/e-bank_index_icon/loan.gif';" 
										 href="www.baidu.com">
									<dt>
										<img id="icon_4" 
										 src="<%=basePath%>page/assets/img/e-bank_index_icon/loan.gif" class="img-responsive" alt="Responsive image">
									</dt>
									<dd><h5>e存款</h5></dd>
									</a>
								</dl>
							</div>
							<div class="col-sm-2">
								<dl>
									<a class="indexicon" onmouseover="document.getElementById('icon_5').src='<%=basePath%>page/assets/img/e-bank_index_icon/deposit-hover.gif';" 
										 onmouseout="document.getElementById('icon_5').src='<%=basePath%>page/assets/img/e-bank_index_icon/deposit.gif';" 
										 href="www.baidu.com">
									<dt>
										<img id="icon_5" 
										 src="<%=basePath%>page/assets/img/e-bank_index_icon/deposit.gif" class="img-responsive" alt="Responsive image">
									</dt>
									<dd><h5>e贷款</h5></dd>
									</a>
								</dl>
							</div>
							<div class="col-sm-2">
								<dl>
									<a class="indexicon" 
										 onmouseover="document.getElementById('icon_6').src='<%=basePath%>page/assets/img/e-bank_index_icon/jsq-hover.gif';" 
										 onmouseout="document.getElementById('icon_6').src='<%=basePath%>page/assets/img/e-bank_index_icon/jsq.gif';" 
										 href="www.baidu.com">
									<dt>
										<img id="icon_6" 
										 src="<%=basePath%>page/assets/img/e-bank_index_icon/jsq.gif" class="img-responsive" alt="Responsive image">
									</dt>
									<dd><h5>e计算</h5></dd>
									</a>
								</dl>
							</div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane tabbg" id="profile">B</div>
				</div>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
	
	<div class="container touxiang" id="section-3">
		<div class="row">
			<div class="col-sm-4">
				<div class="panel panel-default tabbg">
					<div class="panel-body">
						<div class="row" style="margin-left: 3px">
							<div class="col-sm-4"><h5 style="font-weight: bold; letter-spacing: 2px;">重要公告</h5></div>
							
							<div class="col-sm-3 col-sm-offset-5"><h5><a target="_blank" href="<%=basePath%>page/article/articlelist.jsp?pid=1">更多>></a></h5></div>
						</div>
						<div class="overstep" >
							<img  alt="" style="height: 20px;width: 20px" src="<%=basePath%>page/assets/img/indextopicon.png">
							<a target='_blank' id="topnoticeA"style='margin-left: 3px;color: #B22222' class="topstyle hand textbottom"></a>
						</div>
						<div id="notice">
							
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-7">
				<div class="panel panel-default tabbg">
					<div class="panel-body">
						<div class="row" style="margin-left: 0px">
							<div class="col-sm-4"><h5 style="font-weight: bold; letter-spacing: 2px;">近期活动</h5></div>
							
							<div class="col-sm-3 col-sm-offset-5"><h5 style="float:right; margin-right: 10px"><a target="_blank" href="<%=basePath%>page/article/articlelist.jsp?pid=2">更多>></a></h5></div>
						</div>
						<div class="overstep" >
							<img  alt="" style="height: 20px;width: 20px" src="<%=basePath%>page/assets/img/indextopicon.png">
							<a target='_blank' id="topactivityA"style='margin-left: 3px;color: #B22222' class="topstyle hand textbottom"></a>
						</div>
						<div id="activity">
							
						</div>
					</div> 
				</div>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
	<!-- 底部 -->
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
	<!-- foot -->
	<div id="foot" class="container">
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<p align="center">
					<a id="E-Bank" href="<%=basePath%>page/index.jsp" target="_blank">E-Bank</a>
					| <a href="#" target="_blank">Bank Online</a> | Complaint
					Guidelines | 审核时间[2015]-070
				</p>
				<p align="center">Copyright &copy; 2015 - e-bank.All Rights
					Reserved.
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Yanweichen| 版权所有</p>
			</div>
		</div>
	</div>
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">登陆</h4>
				</div>
				<form id="loginfrom" action="<%=basePath%>/user/login.action"
					method="post">
					<div class="modal-body">
						<div class="container">
							<div class="row">
								<div class="form-group">
									<label for="recipient-name" class="control-label">电话/身份证号/邮箱:</label>
									<div class="input-group col-sm-5">
										<input type="text" class="form-control" name="user_account">
									</div>
								</div>
								<div class="form-group">
									<label for="message-text" class="control-label">密码:</label>
									<div class="input-group col-sm-5">
										<input type="password" class="form-control"
											name="user_password">
									</div>
								</div>
								<div class="form-group">
									<label for="message-text" class="control-label">验证码:</label>
									<div class="row">
										<div class="col-sm-3">
											<input type="text" class="form-control" id="user_code"
												name="user_code" placeholder="验证码">
										</div>
										<div class="col-sm-3">
											<img src="<%=basePath%>Kaptcha.jpg" id="codeimg" alt="..."
												class="img-rounded" style="height: 33px; width: 130px;">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer" style="z-index: -1">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" id="btn_login"
							class="btn btn-primary btncolor">登陆</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="fakeloader"></div>
	<script src="<%=basePath%>page/assets/js/jquery-1.8.1.min.js"></script>
	<script src="<%=basePath%>page/assets/js/bootstrap.min.js"></script>
	<script src="<%=basePath%>page/assets/js/velocity.min.js"></script>
	<script src="<%=basePath%>page/assets/js/velocity.ui.min.js"></script>
	<script src="<%=basePath%>page/assets/js/bootstrapValidator.min.js"></script>
	<script src="<%=basePath%>page/assets/js/fakeloader.js"></script>
	<script type="text/javascript">
	function queryParams(type,tbname,pid){
		return {
			    search:type,
			    index_pid:pid,
				limit:5,
				offset:0,
				tableName:tbname,
				timefmt:"MM/dd"
		}
	}
	//获取公告
		$.getJSON("<%=basePath%>/index/Allnotice.action", queryParams(null,"index_entry_view",1), function(json){
			var top = json.top;
			$("#topnoticeA").append(top.index_title)
			$("#topnoticeA").attr("href","<%=basePath%>index/articledetail.action?id="+top.index_id);
			$.each(json.rows,function(i,jo){
				var title = jo.index_title;
					var src;
					if (jo.index_state=="01"||jo.index_state=="11") {
						src = 'indexhoticon.png';
					} else {
						src = 'indexnomalicon.png';
					}
					$("#notice").append("<div class='row' > <div class='col-sm-10 overstep' style='padding-right: 0px;margin-top: 5px' > <img  alt='' style='height: 20px;width: 20px' src='<%=basePath%>page/assets/img/"+src+"'> <a target='_blank' href=<%=basePath%>index/articledetail.action?id="+jo.index_id+" id='topnoticeA'style='margin-left: 3px;' class='hand textbottom'>"+title+" </a> </div> <div class='col-sm-1 timestyle' style='padding: 6px 0px 0px 0px;'>"+jo.index_uptime_format+"</div> </div>")
			});
		});
	//获取活动
		$.getJSON("<%=basePath%>/index/Allnotice.action", queryParams(null,"index_entry_view",2), function(json){
			var top = json.top;
			$("#topactivityA").append(top.index_title)
			$("#topactivityA").attr("href","<%=basePath%>index/articledetail.action?id="+top.index_id);
			$.each(json.rows,function(i,jo){
				var title = jo.index_title;
				var src;
				if (jo.index_state=="01"||jo.index_state=="11") {
					src = 'indexhoticon.png';
				} else {
					src = 'indexnomalicon.png';
				}
				$("#activity").append("<div class='row' > <div class='col-sm-11 overstep' style='padding-right: 0px;margin-top: 5px' > <img  alt='' style='height: 20px;width: 20px' src='<%=basePath%>page/assets/img/"+src+"'> <a target='_blank' href=<%=basePath%>index/articledetail.action?id="+jo.index_id+" id='topnoticeA'style='margin-left: 3px;' class='hand textbottom'>"+title+" </a> </div> <div class='col-sm-1 timestyle' style='padding: 6px 0px 0px 0px;'>"+jo.index_uptime_format+"</div> </div>")
			});
		});
		$(document).ready(function() {
			$("#myNav").affix({
				offset : {
					top : 125
				}
			});
		});
		//启动轮播
		$('#carousel-example-generic').carousel('cycle')
		//刷新验证码
		$("#codeimg").click( function () {
			$(this).attr("src","<%=basePath%>Kaptcha.jpg?r=" + new Date());
			;
		});
		//出场动画
		$.Velocity.RegisterUI('linxin.slideUpIn', {
			defaultDuration : 500,
			calls : [ [ {
				opacity : [ 1, 0 ],
				translateY : [ 0, 100 ]
			} ] ]
		});

		$.Velocity.RegisterUI('linxin.slideDownOut', {
			defaultDuration : 500,
			calls : [ [ {
				opacity : [ 0, 1 ],
				translateY : [ 100, 0 ]
			} ] ]
		});

		$.Velocity.RegisterUI('linxin.scaleIn', {
			defaultDuration : 300,
			calls : [ [ {
				opacity : [ 1, 0 ],
				scale : [ 1, 0.3 ]
			} ] ]
		});

		$.Velocity.RegisterUI('linxin.scaleOut', {
			defaultDuration : 300,
			calls : [ [ {
				opacity : [ 0, 1 ],
				scale : [ 0.3, 1 ]
			} ] ]
		});
		var seqOut;
		$(function() {
			seqOut = [ {
				elements : $("#login_on"),
				properties : 'linxin.scaleOut',
				options : {
					sequenceQueue : false
				}
			}, {
				elements : $("#login_off"),
				properties : 'linxin.scaleIn',
				options : {
					delay : 10
				}
			}, ];
		})
		var seqLogin;
		$(function() {
			seqLogin = [ {
				elements : $("#login_off"),
				properties : 'linxin.scaleOut',
				options : {
					sequenceQueue : false
				}
			}, {
				elements : $("#login_on"),
				properties : 'linxin.scaleIn',
				options : {
					delay : 10
				}
			}, ];
		})
		$("#btn_out").click(function() {
			$.post("<%=basePath%>user/logout.action", function(result) {
				$(".fakeloader").fakeLoader({
	                spinner:"spinner2",
	                show:true
	            });
				if (result.error == 200) {
					$.Velocity.RunSequence(seqOut);
					window.location.reload();//刷新当前页面.
				} else {
					alert(result.msg)
				}
			})
		})
		
		$("#login").click(function() {
			$('#loginModal').modal('show')
		})
		
		
		$(document).ready(function() {$('#loginfrom').bootstrapValidator({
			message : 'This value is not valid',
			submitButtons : 'button[type="submit"]',
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				user_account : {
					validators : {
						notEmpty : {
							message : '用户名不能为空'
						},
					}
				},
				user_password : {
					validators : {
						notEmpty : {
							message : '密码不能为空'
						},
					}
				},
				user_code : {
					threshold : 5,
					validators : {
						notEmpty : {
							message : '验证码不能为空'
						},
						remote : {
							url : '<%=basePath%>user/verifyCode.action',
								type : "post",
								async : true,
								data : {
									user_account : function(
											validator) {
										return $(
												'#loginfrom :input[name="user_code"]')
												.val();
									},
								},
							},
						}
					},
	
				}
			}).on(
			'success.form.bv',
			function(e) {
				// Prevent form submission
				e.preventDefault();
	
				// Get the form instance
				var $form = $(e.target);
	
				// Get the BootstrapValidator instance
				var bv = $form
						.data('bootstrapValidator');
				$(".fakeloader").fakeLoader({
	                spinner:"spinner2",
	                show:true
	            });
				// Use Ajax to submit form data
				$.post($form.attr('action'),$form.serialize(),
								function(result) {
									$(".fakeloader").fakeLoader({
						                spinner:"spinner2",
						                show:false
						            });
									if (result.error == 203) {
										alert(result.msg)
									} else {
										$('#loginModal').modal('hide')
										$.Velocity.RunSequence(seqLogin);
										$("#login_user_name").append("Hello,"+ result.msg)
									}
								}, 'json');});
							});
		$("#adminlogin").click(function() {
			window.open('<%=basePath%>page/admin_login.jsp') 
		})

	</script>
	<!-- 如果登陆 -->
	<c:if test="${!empty user}">
		<script type="text/javascript">
			$("#login_off").css({
				"display" : "none"
			})
			$("#login_on").css({
				"display" : "inline-block"
			})
		</script>
	</c:if>
</body>
</html>