<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	// 获得项目完全路径（假设你的项目叫MyApp，那么获得到的地址就是 http://localhost:8080/MyApp/）:
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<base href=" <%=basePath%>">
<title>我的银行</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="page/assets//img/tubiao.ico" />
<link rel="shortcut icon" type="image/x-icon"
	href="page/assets//img/tubiao.ico" />
<link href="page/assets/css/dpl-min.css" rel="stylesheet"
	type="text/css" />
<link href="page/assets/css/bui-min.css" rel="stylesheet"
	type="text/css" />
<link href="page/assets/css/main-min.css" rel="stylesheet"
	type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.touxiang {
	float: left;
	margin: 0px 10px 5px 0px;
}
</style>
</head>
<body>
	<div class="header" style="height: 55px">
		<div class="dl-title">
			<h1 id="logo"
				style="cursor: pointer; color: white; margin: 15px 15px 15px 15px; font-size: 22px; letter-spacing: 3px;">e-bank后台管理系统</h1>
		</div>
		<div style="float: right;">
			<img alt="" src="page/assets/img/touxiang_zhushou.jpg"
				class="img-circle touxiang">
			<div class="dl-log" style="float: right;">
				管理员，<span class="dl-log-user">${admin.admin_name}</span><a id="logout"
					href="admin/logout.action" title="退出系统"
					class="dl-log-quit">[退出]</a>
			</div>
		</div>
	</div>
	<div class="content">
		<div class="dl-main-nav">
			<ul id="J_Nav" class="nav-list ks-clear"
				style="background-image: url('page/assets/img/main-nav-bg21.png');">
				<li class="nav-item dl-selected">
					<div class="nav-item-inner nav-home">首页管理</div>
				</li>
				<li class="nav-item dl-selected">
					<div class="nav-item-inner nav-order">审核管理</div>
				</li>
				<li class="nav-item dl-selected">
					<div class="nav-item-inner nav-order">用户管理</div>
				</li>
				<li class="nav-item dl-selected">
					<div class="nav-item-inner nav-order">运行日志</div>
				</li>
<!-- 				<li class="nav-item dl-selected"> -->
<!-- 					<div class="nav-item-inner nav-order">关于本行</div> -->
			</ul>
		</div>
		<ul id="J_NavContent" class="dl-tab-conten">

		</ul>
	</div>
	<script type="text/javascript" src="page/assets/js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="page/assets/js/bui-min.js"></script>
	<script type="text/javascript" src="page/assets/js/common/main-min.js"></script>
	<script type="text/javascript" src="page/assets/js/config-min.js"></script>
	<script>
		BUI.use('common/page');
		BUI.use('common/main', function() {
			var config = [ {
				id : '1',
				homePage : 'updateIndex',
				menu : [ {
					text : '首页管理',
					items : [ {
						id : 'updateIndex',
						text : '更新公告',
						href : 'admin/updateIndex.action'
					}, {
						id : '12',
						text : '添加文章',
						href : 'admin/AddIndex.action'
					}]
				} ]
			}, {
				id : '7',
				homePage : '9',
				menu : [ {
					text : '审核管理',
					items : [ {
						id : '9',
						text : '用户申请办卡审核',
						href : 'card/checkcard.action'
					}
// 					, {
// 						id : '9',
// 						text : '用户申请信用卡审核',
// 						href : 'page/enterprise/index.html'
// 					}
					]
				} ]
			}
			, {
				id : '15',
				homePage : '16',
				menu : [ {
					text : '用户管理',
					items : [ {
						id : '16',
						text : '用户列表',
						href : 'admin/userlist.action'
					}, {
						id : '16',
						text : '解封IP',
						href : 'admin/iplist.action'
					}
// 					, {
// 						id : '16',
// 						text : '发送站内信',
// 						href : 'page/student/index.html'
// 					} 
					]
				} ]
			}, 
			  {
				id : '17',
				homePage : '18',
				menu : [ {
					text : '运行日志',
					items : [ {
						id : '18',
						text : '用户日志',
						href : 'admin/userlog.action'
					}, {
						id : '19',
						text : '系统日志',
						href : 'admin/systemlog.action'
					}]
				} ]
			}
// 			, {
// 				id : '20',
// 				homePage : '21',
// 				menu : [ {
// 					text : '虚拟学生管理',
// 					items : [ {
// 						id : '21',
// 						text : '学生管理',
// 						href : 'page/virtualstudent/index.html'
// 					}, {
// 						id : '23',
// 						text : '学生注册',
// 						href : 'page/virtualstudent/studentRegister.html'
// 					} ]
// 				} ]
// 			} 
			];
			new PageUtil.MainPage({
				modulesConfig : config
			});
		});
		$(window).resize(function() {
			var height = BUI.viewportHeight() - 70;
			$('.dl-second-nav,.bui-nav-tab,.bui-nav-tab-hover').height(height);
			$('.tab-content-container').height(height - 21);
		});
		//首页跳转
		$("#logo").click(function() {
			location.href = "page/index.jsp"
		})
		$("#btn_out").click(function() {
			$.post("user/logout.action", function(result) {
				$(".fakeloader").fakeLoader({
	                spinner:"spinner2",
	                show:true
	            });
				if (result.error == 200) {
					$.Velocity.RunSequence(seqOut);
					location.href = "page/index.jsp"
				} else {
					alert(result.msg)
				}
			})
		})
	</script>
	<div style="text-align: center;">
		<p></p>
	</div>
</body>
</html>