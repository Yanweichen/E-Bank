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
<title>办卡审核</title>
<style type="text/css">
.userface{
	height: 50px;
	width: 50px;
}
.cardface{
	height: 50px;
	width: 100px;
}
</style>
</head>
<body>
	<div class="container">
		<table id="all" data-toggle="table"
				   data-width="50px" 
				   data-pagination="true" 
				   data-side-pagination="server"
			       data-show-refresh="true"
			       data-page-list="[5, 10, 20, 50, 100, 200]"
			       data-show-toggle="true"
			       data-show-columns="true">
			    <thead>
			        <tr>
			            <th data-field="user_id" data-visible="false" data-align="center" >头像</th>
			            <th data-field="card_id" data-visible="false" data-align="center" >头像</th>
			            <th data-field="user_face" data-align="center" >头像</th>
			            <th data-field="user_name" data-align="right">用户姓名</th>
			            <th data-field="user_city" data-align="center">开户城市</th>
			            <th data-field="user_idcard" data-align="" >身份证号</th>
			            <th data-field="user_regist_time_fmt" data-align="">注册时间</th>
			            <th data-field="card_name" data-align="">申请卡种</th>
			            <th data-field="card_face" data-align="">卡面</th>
			            <th data-field="card_check_time_fmt" data-align="">申请时间</th>
			            <th data-field="user_state" data-align="">用户状态</th>
			            <th data-field="action" data-align=""  data-formatter="actionFormatter" data-events="actionEvents">操作</th>
			        </tr>
			    </thead>
		</table>
	</div>
	
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<script src="page/assets/js/bootstrap.min.js"></script>
	<script src="page/assets/js/bootstrap-table.js"></script>
	<script src="page/assets/js/bootstrap-table-zh-CN.js"></script>
	<script type="text/javascript">
		$('#all').bootstrapTable({
		    url: 'card/getCheckCardList.action',
		});
		function actionFormatter(value, row, index) {
		return [
		        '<a class="yes" href="javascript:void(0)" title="通过">',
		        '<i class="glyphicon glyphicon-ok"></i>',
		        '</a>',
		        '<a class="no ml10" style="margin-left: 15px;" href="javascript:void(0)" title="不通过">',
		        '<i class="glyphicon glyphicon-remove"></i>',
		        '</a>',
		    ].join('');
		}
		window.actionEvents = {
		    'click .yes': function (e, value, row, index) {
		    	$.post("card/opencard.action",{user_id:row.user_id,card_id:row.card_id},function(result){
		    		alert(result.msg)
		    	});
		    },
		    'click .no': function (e, value, row, index) {
		    	alert(row.user_id)
		    },
		}
	</script>
</body>
</html>