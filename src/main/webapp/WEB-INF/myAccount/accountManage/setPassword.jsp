<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="shortcut icon" type="image/x-icon"
	href="page/assets//img/tubiao.ico" />
<link href="page/assets/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="page/assets/css/mybankbase.css">
<link href="page/assets/css/animated-menu.css" rel="stylesheet">
<link rel="stylesheet" href="page/assets/css/cropper.css">
<link rel="stylesheet" href="page/assets/css/fakeloader.css">
<link href="http://cdn.bootcss.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
<style type="text/css">
#setlist .list-group-item{
	border:0;
	background-color: rgba(255,255,255,0.3);
	cursor:pointer;
}
#setlist .list-group-item:hover{
	border:0;
	background-color: rgba(255,255,255,0.9);
	cursor:pointer;
}
.bottom20{
	margin-bottom: 20px;
}
</style>

<title>修改密码</title>
</head>
<body style="background-image: url('page/assets/img/bg_grid.png');">
	<!-- 头部导航 -->
	<jsp:include page="../../../page/head_foot/mybank_head.jsp"></jsp:include>
	
	<div class="container top20">
		<div class="row">
			<div class="col-sm-3">
				<div id="setlist" class="list-group touming6">
				  <a href="myAccount/accountSet.action" class="list-group-item">
				  	<i class="icon-user" style="font-size: 20px;color: #3f316d"></i>&nbsp;&nbsp;基本信息
				  	<i class="icon-angle-right" style="font-size: 20px;color: #3f316d;float: right;"></i>
				  </a>
				  <a href="myAccount/faceSet.action" class="list-group-item" >
				  	<i class="icon-github-alt" style="font-size: 19px;color: #3f316d;"></i>&nbsp;&nbsp;修改头像
				  	<i class="icon-angle-right" style="font-size: 20px;color: #3f316d;float: right;"></i>
				  </a>
				   <a href="javascript:void(0)" class="list-group-item" style="background-color: #3f316d;border-color: #3f316d;color: white;">
				  	<i class="icon-key" style="font-size: 19px;color: white;"></i>&nbsp;&nbsp;修改密码
				  	<i class="icon-angle-right" style="font-size: 20px;color: white;float: right;"></i>
				  </a>
				</div>
			</div>
			<div class="col-sm-9">
				<div class="panel panel-default touming6">
				  <div class="panel-body">
				  <div class="col-sm-6 col-sm-offset-3">
				  	<form id="setpasform" action="user/setPass.action" method="post">
						<div class="form-group">
							<label for="user_name">请输入新的密码</label> 
							<input type="text" class="form-control" id="pass"
								name = "pass" placeholder="新的密码">
						</div>
						<div class="form-group">
							<label for="user_idcard">请重复输入新的密码</label>
							<input type="text" class="form-control" id="againpass"
								name = "againpass" placeholder="重复密码">
						</div>
						<div class="form-group" style="margin-top: 25px;">
							<button type="submit" class="btn btn-block btncolor ">修改</button>
						</div>
					</form>
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
	<div class="fakeloader"></div>
	<!-- foot -->	
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<jsp:include page="../../../page/head_foot/foot.jsp"></jsp:include>
	<script src="page/assets/js/jquery.easing.1.3.js"></script>
	<script src="page/assets/js/bootstrap.min.js"></script>
	<script src="page/assets/js/cropper.js"></script>
	<script src="page/assets/js/cropper_custom.js"></script>
	<script src="page/assets/js/jquery.form.js"></script>
	<script src="page/assets/js/fakeloader.js"></script>
	<script type="text/javascript" src="page/assets/js/bootstrapValidator.min.js"></script> 
	<script type="text/javascript">
	$(document).ready(function() {
		 $('#setpasform').bootstrapValidator({
		        message: 'This value is not valid',
		        submitButtons: 'button[type="submit"]',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		        	pass: {
		            	trigger:"blur",
		                validators: {
		                    notEmpty: {
		                        message: '密码不能为空'
		                    },
		                    identical: {
		                        field: 'againpass',
		                        message: '两次密码不一致'
		                    },
		                }
		            },
		            againpass: {
		            	trigger:"blur",
		                validators: {
		                    notEmpty: {
		                        message: '请输入确认密码'
		                    },
		                    identical: {
		                        field: 'pass',
		                        message: '两次密码不一致'
		                    },
		                }
		            },

		        }
		    }).on('success.form.bv', function(e) {
	            // Prevent form submission
	            e.preventDefault();
	            // Get the form instance
	            var $form = $(e.target);

	            // Get the BootstrapValidator instance
	            $.post($form.attr('action'),{pass:$("#pass").val()},function(result){
	            	 $("#msg").empty(); 
					 $("#msg").append(result.msg)
		             $("#isSuc").modal().on('hidden.bs.modal',function(){
						location.href = "page/index.jsp";
		            });
	            })
	        })
	     });
	
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