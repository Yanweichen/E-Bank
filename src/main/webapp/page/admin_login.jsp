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
<title>e-bank后台登陆</title>
<link rel="shortcut icon" type="image/x-icon"
	href="page/assets//img/tubiao.ico" />
<link href="page/assets/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="page/assets/css/fakeloader.css">
<style>
.ios7_b {
				filter: blur(5px) contrast(0.4) brightness(1.4);
				transition: all 0.5s ease-in-out;
			}
.appleinputup{
	border-radius: 15px 15px 0 0;
	height: 50px;
	border-bottom:1px;
}
.appleinputdown{
	border-radius: 0 0 15px 15px;
	height: 50px;
}
.loginbtn{
	margin-top: 20px;
	background-color: #3f316d;
	border: 0px;
	color: white;
}
</style>
</head>
<body style="background-color: #17181C">
	<canvas id="cas" class="ios7_b"
		style="position: absolute; z-index: -1; height: 100%; width: 100%;"></canvas>
	<script src="page/assets/js/pointbg.js"></script>
	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-sm-offset-4">
				<form id="adminloginfrom" style="margin-top: 100%">
					<input type="email" class="form-control appleinputup" id="adminname" name="adminname"
							placeholder="请输入管理员账户">
					<input type="password" class="form-control appleinputdown" id="adminpass" name="adminpass"
						placeholder="请输入管理员密码">
					<button id ="loginbtn" type="button" class="btn btn-default btn-lg btn-block loginbtn">Login</button>
				</form>
			</div>
		</div>
	</div>
	<div id="isSuc" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button id="isSucCloseBtn" type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
						<h4 class="modal-title">提示</h4>
				</div>
				<div class="modal-body">
					<p id = "msg"></p>
				</div>
			</div>
		</div>
	</div>
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<script src="page/assets/js/bootstrap.min.js"></script>
	<script src="page/assets/js/fakeloader.js"></script>
	<script type="text/javascript">
		$("#loginbtn").click(function () {
			$.post("admin/login.action", $("#adminloginfrom").serialize(),function(result){
				if (result.error==200) {
					//跳转
				}else{
					$("#msg").empty(); 
					$("#msg").append(result.msg);
					$("#isSuc").modal(); 
				}
			});
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