<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="shortcut icon" type="image/x-icon" href="page/assets//img/tubiao.ico" /> 
<link href="page/assets/css/bootstrap.css" rel="stylesheet">
<title>找回密码</title>
<style type="text/css">
.btncolor{
	color:#fff;
	background-color: #3f316d;
}
</style>
</head>
<body style="background-image: url('page/assets/img/bg_grid.png');">
	<!-- 头部导航 -->
	<jsp:include page="../head_foot/head.jsp"></jsp:include>
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-4" style="margin-top: 20%;">
					<form id="findform" action="user/regfirst.action" method="post">
						<div class="form-group">
							<label for="user_name">找回的账号</label> 
							<input type="text" class="form-control" id="exampleInputName2"
								name = "user_name" placeholder="邮箱/身份证/手机">
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-sm-7">
									<label for="user_idcard">验证码</label>
									<input type="text" class="form-control" id="exampleInputName2"
										name = "user_idcard" placeholder="请输入您收到的验证码">
								</div>
								<div class="col-sm-5">
									<button id="send_email" style="margin-top: 26px;" type="button" class="btncolor btn btn-primary btn-sm btncolor">点击发送验证码</button>
								</div>
							</div>
						</div>
						<div class="form-group" style="margin-top: 25px;">
							<button type="reset" class="btn btn-block btncolor ">下一步</button>
						</div>
					</form>
				</div>
			</div>		
		</div>

	<div id="isSuc" class="modal fade bs-example-modal-sm" tabindex="-1"
		role="dialog" aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button id="isSucCloseBtn" type="button" class="close"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">提示</h4>
				</div>
				<div class="modal-body">
					<p id="msg"></p>
				</div>
			</div>
		</div>
	</div>
	
	<div id="isSuc" class="modal fade bs-example-modal-sm" tabindex="-1"
		role="dialog" aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button id="isSucCloseBtn" type="button" class="close"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">提示</h4>
				</div>
				<div class="modal-body">
					<p id="msg"></p>
				</div>
			</div>
		</div>
	</div>
	<script src="<%=basePath%>page/assets/js/jquery-1.8.1.min.js"></script>
	<!-- foot -->
	<jsp:include page="../head_foot/foot.jsp"></jsp:include>
	
	<script src="<%=basePath%>page/assets/js/bootstrap.min.js"></script>
	<script type="text/javascript">
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
	
	$(function(){
		$("#send_email").click(function(){
			$.post("user/sendMail_Reg_Again.action",function(result){
					$("#msg").empty()
					$("#msg").append(result.msg)
					$("#isSuc").modal()
			})
			$("#send_email").attr('disabled',true)
				var i = 30
			setInterval(function() {
				$("#send_email").text("等待下次发送("+i--+")")
				if(i<=0){
					$("#send_email").attr('disabled',false)
					$("#send_email").text("点击发送验证码")
					return;
				}
			}, 1000)
			
		})
	})
	</script>
</body>
</html>