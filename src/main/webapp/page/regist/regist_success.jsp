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
<link rel="shortcut icon" type="image/x-icon" href="page/assets//img/tubiao.ico" /> 
<link href="page/assets/css/bootstrap.css" rel="stylesheet">
<title>注册成功</title>
<style type="text/css">
.btncolor{
	color:#fff;
	background-color: #3f316d;
}
</style>
</head>
<body style="background-image: url('page/assets/img/bg_grid.png');">
	<!-- 头部导航 -->
	<jsp:include page="../head_foot/head.html"></jsp:include>
		<div class="container">
			<div class="row">
				<div class="col-sm-2 col-sm-offset-2">
				<img src="page/assets/img/reg_success.jpg" style="margin-top: 50px" class="img-circle img-responsive touxiang" alt="...">
				</div>
				<div class="col-sm-8">
					<div class="form-group">
						<h1>注册成功！</h1>
					</div>
					<div class="form-group">
						<h4>恭喜您注册成功！激活邮件已经发送到您刚才填写的邮箱！</h4>
					</div>
					<div class="form-group">
						<h5>如果您没有收到邮件,请点击</h5>
					</div>
					<div class="form-group">
						<button id="send_email" type="button" class="btn btn-primary btn-sm btncolor">重新发送邮件</button>
					</div>
					<div class="form-group">
						<h3>您现在可以</h3>
					</div>
					<div class="form-group">
						<a href="page/index.jsp">回到首页</a>
					</div>
					<div class="form-group">
						<a href="page/bus_index.jsp">立即登陆到我的银行</a>
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
	<!-- foot -->
	<jsp:include page="../head_foot/foot.html"></jsp:include>
	
	<script src="<%=basePath%>page/assets/js/jquery-1.8.1.min.js"></script>
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
					$("#send_email").text("重新发送邮件")
					return;
				}
			}, 1000)
			
		})
	})
	
	</script>
</body>
</html>