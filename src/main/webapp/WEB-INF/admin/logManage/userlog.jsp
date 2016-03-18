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
<link rel="stylesheet" href="page/assets/css/bootstrap-table.css">

<title>用户日志</title>
</head>
<body>
	<div class="container top20">
		<div class="row">
			<div id="userlogtoolbar"><h4 class="top20">用户日志列表</h4></div>
			<table id="userlog" data-toggle="table"
					   data-width="50px" 
					   data-pagination="true" 
					   data-side-pagination="server"
				       data-show-refresh="true"
				       data-page-list="[5, 10, 20, 50, 100, 200]"
				       data-show-toggle="true"
				       data-show-columns="true"
				       data-toolbar="#userlogtoolbar"
				       >
				    <thead>
				        <tr>
				            <th data-field="log_user_id" data-align="center" >用户ID</th>
				            <th data-field="log_user_name" data-align="center">用户姓名</th>
				            <th data-field="log_msg" data-align="center" >用户操作</th>
				            <th data-field="log_time_fmt" data-align="center">操作时间</th>
				            <th data-field="log_ip" data-align="center">操作IP</th>
				        </tr>
				    </thead>
			</table>
		</div>
	</div>
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<script src="page/assets/js/bootstrap.min.js"></script>
	<script src="page/assets/js/bootstrap-table.js"></script>
	<script src="page/assets/js/bootstrap-table-zh-CN.js"></script>
	<script type="text/javascript">
		$('#userlog').bootstrapTable({
		    url: 'log/findAllLog.action?type=user',
		});
	</script>
</body>
</html>