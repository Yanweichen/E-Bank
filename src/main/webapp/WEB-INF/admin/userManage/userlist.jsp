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
<title>用户列表</title>
<style type="text/css">
.userface{
	height: 50px;
	width: 50px;
}
.cardface{
	height: 50px;
	width: 100px;
}
.top20{
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="container top20">
		<div class="row">
			<div id="Onlintoolbar"><h4 class="top20">在线用户列表</h4></div>
			<table id="online" data-toggle="table"
					   data-width="50px" 
					   data-pagination="true" 
					   data-side-pagination="server"
				       data-show-refresh="true"
				       data-page-list="[5, 10, 20, 50, 100, 200]"
				       data-show-toggle="true"
				       data-show-columns="true"
				       data-toolbar="#Onlintoolbar"
				       >
				    <thead>
				        <tr>
				            <th data-field="user_id" data-visible="false" data-align="center" ></th>
				            <th data-field="user_face" data-align="center" >头像</th>
				            <th data-field="user_name" data-align="center">用户姓名</th>
				            <th data-field="user_city" data-align="center">开户城市</th>
				            <th data-field="user_idcard" data-align="center" >身份证号</th>
				            <th data-field="user_regist_time_fmt" data-align="center">注册时间</th>
				            <th data-field="user_state" data-align="center">用户状态</th>
				            <th data-field="action" data-align="center"  data-formatter="actionFormatter" data-events="actionEvents">操作</th>
				        </tr>
				    </thead>
			</table>
		</div>
		<div class="row top20">
			<div id="Alltoolbar"><h4 class="top20">所有用户列表</h4></div>
			<table id="all" data-toggle="table"
					   data-width="50px" 
					   data-pagination="true" 
					   data-side-pagination="server"
				       data-show-refresh="true"
				       data-page-list="[5, 10, 20, 50, 100, 200]"
				       data-show-toggle="true"
				       data-show-columns="true"
				       data-toolbar="#Alltoolbar"
				       data-search="true"
				       >
				    <thead>
				        <tr>
				            <th data-field="user_id" data-visible="false" data-align="center" ></th>
				            <th data-field="user_face" data-align="center" >头像</th>
				            <th data-field="user_name" data-align="center">用户姓名</th>
				            <th data-field="user_city" data-align="center">开户城市</th>
				            <th data-field="user_idcard" data-align="center" >身份证号</th>
				            <th data-field="user_regist_time_fmt" data-align="center" data-sortable="true">注册时间</th>
				            <th data-field="user_state" data-align="center">用户状态</th>
				            <th data-field="action" data-align="center"  data-formatter="AllactionFormatter" data-events="AllactionEvents">操作</th>
				        </tr>
				    </thead>
			</table>
		</div>
	</div>
	
	<div class="modal fade" id="msgbox" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel" id="msgboxtitle">消息</h4>
	      </div>
	      <div class="modal-body">
			  <div class="form-group">
			    <label>消息标题</label>
			    <input type="text" id="msgtitle" name="title" class="form-control" placeholder="消息标题">
			  </div>
			  <div class="form-group">
			    <label>消息内容</label>
			    <textarea class="form-control" id="msgcontent" name="content" rows="5" placeholder="消息内容"></textarea>
			  </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default btncolor" data-dismiss="modal">取消</button>
	        <button type="button" id="sendMsg" class="btn btn-primary btncolor">发送</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<script src="page/assets/js/bootstrap.min.js"></script>
	<script src="page/assets/js/bootstrap-table.js"></script>
	<script src="page/assets/js/bootstrap-table-zh-CN.js"></script>
	<script type="text/javascript">
		$('#online').bootstrapTable({
		    url: 'user/getOnLineUser.action',
		});
		$('#all').bootstrapTable({
		    url: 'user/getALLUser.action',
		});
		var roww;
		function actionFormatter(value, row, index) {
		return [
		        '<a class="ban ml10" href="javascript:void(0)" title="禁封">',
		        '<i class="glyphicon glyphicon-remove-sign" style="color:red;margin-left: 15px;"></i>',
		        '</a>',
		        '<a class="noban ml10" href="javascript:void(0)" title="解封">',
		        '<i class="glyphicon glyphicon-ok-sign" style="color:green;margin-left: 15px;"></i>',
		        '</a>',
		        '<a class="send ml10" style="margin-left: 15px;" href="javascript:void(0)" title="发送信息">',
		        '<i class="glyphicon glyphicon-envelope"></i>',
		        '</a>',
		    ].join('');
		}
		window.actionEvents = {
				'click .ban': function (e, value, row, index) {
					$.post("user/modifyUserState.action",{idcard:row.user_idcard,state:2},function(result){
			    		if (result) {
			    			$('#online').bootstrapTable("refresh");
						}else{
				    		alert("操作失败")
						}
			    	});
			    },
			    'click .noban': function (e, value, row, index) {
			    	$.post("user/modifyUserState.action",{idcard:row.user_idcard,state:1},function(result){
			    		if (result) {
			    			$('#online').bootstrapTable("refresh");
						}else{
				    		alert("操作失败")
						}
			    	});
			    },
			    'click .send': function (e, value, row, index) {
			    	$('#msgbox').modal('show');
			    	roww = row;
			    },
		}
		function AllactionFormatter(value, row, index) {
			return [
			        '<a class="ban ml10" href="javascript:void(0)" title="禁封">',
			        '<i class="glyphicon glyphicon-remove-sign" style="color:red;margin-left: 15px;"></i>',
			        '</a>',
			        '<a class="noban ml10" href="javascript:void(0)" title="解封">',
			        '<i class="glyphicon glyphicon-ok-sign" style="color:green;margin-left: 15px;"></i>',
			        '</a>',
			        '<a class="send ml10" style="margin-left: 15px;" href="javascript:void(0)" title="发送信息">',
			        '<i class="glyphicon glyphicon-envelope"></i>',
			        '</a>',
			    ].join('');
			}
			
		window.AllactionEvents = {
		    'click .ban': function (e, value, row, index) {
		    	$.post("user/modifyUserState.action",{idcard:row.user_idcard,state:2},function(result){
		    		if (result) {
		    			$('#all').bootstrapTable("refresh");
					}else{
			    		alert("操作失败")
					}
		    	});
		    },
		    'click .noban': function (e, value, row, index) {
		    	$.post("user/modifyUserState.action",{idcard:row.user_idcard,state:1},function(result){
		    		if (result) {
		    			$('#all').bootstrapTable("refresh");
					}else{
			    		alert("操作失败")
					}
		    	});
		    },
		    'click .send': function (e, value, row, index) {
		    	$('#msgbox').modal('show');
		    	roww = row;
		    },
		}
		
		
		$("#sendMsg").click(function(){
			var title = $("#msgtitle").val()
			var content = $("#msgcontent").val()
			$.post("msg/sendMsg.action",{msgUserId:roww.user_id,msgTitle:title,msgContent:content,msgType:3},function(result){
				if (result.error==200) {
					$('#msgbox').modal('hide');
				}else{
					alert(result.msg);
				}
			})
		})
		//模态框居中
		function centerModals() {
			$('.modal').each(
					function(i) {
						var $clone = $(this).clone().css('display', 'block')
								.appendTo('body');
						var top = Math.round(($clone.height() - $clone.find(
								'.modal-content').height()) / 3);
						top = top > 0 ? top : 0;
						$clone.remove();
						$(this).find('.modal-content').css("margin-top", top);
					});
		}
		$('.modal').on('show.bs.modal', centerModals);
		$(window).on('resize', centerModals);
	</script>
</body>
</html>