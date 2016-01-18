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
<link rel="stylesheet" href="page/assets/css/bootstrap.css">
<link rel="stylesheet" href="page/assets/css/bootstrap-table.css">
<title>首页管理</title>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<table id="isputaway" data-toggle="table" data-width="50px" data-pagination="true" 
			   data-side-pagination="server"
		       data-show-refresh="true"
		       data-show-toggle="true"
		       data-show-columns="true">
			    <thead>
			        <tr>
			            <th data-field="index_id" data-align="center">ID</th>
			            <th data-field="index_type" data-align="right">类型</th>
			            <th data-field="index_title" data-align="center">标题</th>
			            <th data-field="index_content" data-align="">内容</th>
			            <th data-field="index_uptime_format" data-align="">上传时间</th>
			            <th data-field="upfrom" data-align="">上传者</th>
			        </tr>
			    </thead>
			</table>
		</div>
	</div>
</div>
<script src="page/assets/js/jquery-1.8.1.min.js"></script>
<script src="page/assets/js/bootstrap.min.js"></script>
<script src="page/assets/js/bootstrap-table.js"></script>
<script src="page/assets/js/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript">
$.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['zh-CN']);
$('#isputaway').bootstrapTable({
    url: 'index/indexnotice.action',
    queryParams: "type=0"
});
</script>
</body>
</html>