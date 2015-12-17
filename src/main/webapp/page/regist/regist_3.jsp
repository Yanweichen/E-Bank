<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>注册</title>
<style type="text/css">
.btncolor{
	color:#CCC;
	background-color: #3f316d;
}	
</style>
</head>
<body style="background-image: url('page/assets/img/bg_grid.png');">
	<!-- 头部导航 -->
	<jsp:include page="../head_foot/head.html"></jsp:include>
	<div class="container">
		<ol class="breadcrumb">
			<li class="active">填写信息</li>
			<li class="active">完善信息</li>
			<li style="color: #3f316d">确认信息</li>
		</ol>	
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<div class="panel panel-danger">
					<div class="panel-heading">
   						 警告！信息一经确认部分信息不可修改！
  					</div>
  					<div class="panel-body">
  					<div class="form-group has-error">
  						<label for="user_name">注册姓名</label>
						<input class="form-control" type="text" placeholder="<c:if test="${!empty reguser}">${reguser.user_name}</c:if>" readonly>
					</div>
					<div class="form-group has-error">
  						<label for="user_name">开户城市</label>
						<input class="form-control" type="text" placeholder="<c:if test="${!empty reguser}">${reguser.user_city}</c:if>" readonly>
					</div>
					<div class="form-group has-success">
  						<label for="user_name">预留信息</label>
						<input class="form-control" type="text" placeholder="<c:if test="${!empty reguser}">${reguser.user_obligate_info}</c:if>" readonly>
					</div>
					<div class="form-group has-error">
  						<label for="user_name">身份证号码</label>
						<input class="form-control" type="text" placeholder="<c:if test="${!empty reguser}">${reguser.user_idcard}</c:if>" readonly>
					</div>
					<div class="form-group has-success">
  						<label for="user_name">预留电话</label>
						<input class="form-control" type="text" placeholder="<c:if test="${!empty reguser}">${reguser.user_phone}</c:if>" readonly>
					</div>
					<div class="form-group has-success">
  						<label for="user_name">预留信箱</label>
						<input class="form-control" type="text" placeholder="<c:if test="${!empty reguser}">${reguser.user_email}</c:if>" readonly>
					</div>
  					</div>
  					<div class="form-group" align="center">
  						<div class="row">
							<div class="col-sm-2 col-sm-offset-3">
								<button id="confirm" type="button" class="btn btn-default btncolor">确认</button>
							</div>
							<div class="col-sm-2 col-sm-offset-2">
								<button id="cancel" type="button" class="btn btn-default btncolor">取消</button>
							</div>
						</div>
					</div>
				</div>
				
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
	<!-- foot -->
	<jsp:include page="../head_foot/foot.html"></jsp:include>
	<script src="<%=basePath%>page/assets/js/jquery-1.8.1.min.js"></script>
	<script src="<%=basePath%>page/assets/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		//确认
		$("#confirm").click(function(){
			$.getJSON("user/adduser.action", function(json){
				if(json.error == 200){
					location.href = "page/regist/regist_success.jsp";
				}else{
					$("#msg").append("注册失败！请检查您的网络！")
		             $("#isSuc").modal().on('hidden.bs.modal',function(){
						location.href = "page/regist/regist_1.jsp";
		            });
				}
	 		});
		})
		//取消
		$("#cancel").click(function(){
			 $("#msg").append("取消成功！请重新注册")
             $("#isSuc").modal().on('hidden.bs.modal',function(){
				location.href = "page/regist/regist_1.jsp";
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