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
<link rel="stylesheet" href="page/assets/css/bootstrapValidator.min.css"/>
<title>注册</title>
<style type="text/css">
label{
	letter-spacing: 3px;
}
.btncolor{
	color:white;
	background-color: #3f316d;
}	
</style>
</head>
<body style="background-image: url('page/assets/img/bg_grid.png');">
	<!-- 头部导航 -->
	<jsp:include page="../head_foot/head.html"></jsp:include>
	
	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-sm-offset-4">
				<form id="regform">
					<div class="form-group">
						<label for="user_name">姓名</label> 
						<input type="text" class="form-control" id="exampleInputName2"
							name = "user_name" placeholder="请输入本人姓名">
					</div>
					<div class="form-group">
						<label for="exampleInputName2">证件类型</label> 
						<select class="form-control">
							<option>身份证</option>
						</select>
					</div>
					<div class="form-group">
						<label for="user_idcard">证件号码</label> 
						<input type="text" class="form-control" id="exampleInputName2"
							name = "user_idcard" placeholder="请输入证件号码">
					</div>
					<div class="form-group">
						<label for="exampleInputName2">手机号码</label> 
							<input type="text" class="form-control" id="exampleInputName2"
							name = "user_phone" placeholder="请输入手机号码">
					</div>
					<div class="form-group" align="center">
						<div class="row">
							<div class="col-sm-3"></div>
							<div class="col-sm-2">
								<button type="submit" class="btn btn-default btncolor">下一步</button>
							</div>
							<div class="col-sm-1"></div>
							<div class="col-sm-1">
								<button type="reset" class="btn btn-default btncolor">重置</button>
							</div>
							<div class="col-sm-5"></div>
						</div>
					</div>
				</form>
			</div>		
		</div>
	</div>
	
	<!-- foot -->
	<jsp:include page="../head_foot/foot.html"></jsp:include>
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<script src="page/assets/js/bootstrap.min.js"></script>
	<!-- <script type="text/javascript" src="page/assets/js/bootstrapValidator.min.js"></script> -->
	<script type="text/javascript" src="page/assets/js/jquery.validate-1.13.1.js"></script>
	<script type="text/javascript" src="page/assets/js/additional-methods.js"></script>
	<script type="text/javascript">
	$.validator.setDefaults({
        debug: true
    });

    validator = $("#regform").validate({
        rules: {
            user_name: {
                required: true,
                postcode : "中国"
            },
            user_idcard: {
                required: true,
                minlength: 2,
                maxlength: 16
            },
            "confirm-password": {
                equalTo: "#password"
            }
        },
        messages: {
        	user_name: {
                required: "必须填写用户名",
                minlength: "用户名最小为2位",
                maxlength: "用户名最大为10位",
                rangelength: "用户名应该在2-10位",
                remote: "用户名不存在"
            },
            user_idcard: {
                required: "必须填写密码",
                minlength: "密码最小为2位",
                maxlength: "密码最大为16位"
            },
            "confirm-password": {
                equalTo: "两次输入的密码不一致"
            }
        },
        submitHandler: function (form) {
            console.log($(form).serialize());
        }
    });

    $.validator.addMethod("postcode", function(value, element, params){
        var postcode = /^[0-9]{6}$/;
        return this.optional(element) || (postcode.test(value));
    }, $.validator.format("请填写正确的{0}邮编！"));

    $("#check").click(function () {
        alert($("#demoForm").valid() ? "填写正确！" : "填写错误！");
    });
	</script>
</body>
</html>