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
	color:#CCC;
	background-color: #3f316d;
}	
</style>
<script>  
</script>
</head>
<body onbeforeunload="checkLeave()" onunload="checkLeave()" style="background-image: url('page/assets/img/bg_grid.png');">
	<!-- 头部导航 -->
	<jsp:include page="../head_foot/head.html"></jsp:include>
	
	<div class="container">
		<ol class="breadcrumb">
			<li class="active">填写信息</li>
			<li style="color: #3f316d">完善信息</li>
			<li class="active">确认信息</li>
		</ol>		
		<div class="row">
			<div class="col-sm-4 col-sm-offset-4">
				<form id="regform" action="user/regsecond.action" method="post">
					<div class="form-group">
					<p></p>
					<div class="row">
						<div class="col-sm-4" >
							<label for="user_name" style="margin-top: 5px">开户地区</label> 
						</div>
						<div  class="col-sm-4">
							<select id="province" class="form-control">
							</select>
						</div>
						<div class="col-sm-4">
							<select id = "city" name="user_city" class="form-control">
							</select>
						</div>
					</div>
					</div>
					<div class="form-group">
						<label for="exampleInputName2">预留信息</label> 
						<input type="text" class="form-control" id="user_obligate_info"
							name = "user_obligate_info" placeholder="此信息会在您登陆时提示">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">登陆密码</label>
    					<input type="password" class="form-control" id="user_pass" 
    						name = "user_pass" placeholder="请输入登陆密码">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">重复登陆密码</label>
    					<input type="password" class="form-control" id="user_pass_again" 
    						name = "user_pass_again" placeholder="请重复输入登陆密码">
					</div>
					<div class="form-group">
						<label for="exampleInputName2">电子邮箱</label> 
						<input type="text" class="form-control" id="user_obligate_info"
							name = "user_email" placeholder="找回密码时使用">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">验证码</label>
						<div class="row">
							<div class="col-sm-6">
								<input type="text" class="form-control" id="user_code"
									name = "user_code" placeholder="验证码">
							</div>
							<div class="col-sm-6">
								<img src="Kaptcha.jpg" id="codeimg" alt="..." class="img-rounded" style="height: 30px;width: 130px;">
							</div>
						</div>
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


	<div id="isSuc" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
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
	<div id="isColse" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
						<h4 class="modal-title">提示</h4>
				</div>
				<div class="modal-body">
						<p id = "msg"></p>
				</div>
				 <div class="modal-footer">
		      	 <input type="hidden" id="url"/>
		      	 <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		      	 <a  onclick="urlSubmit()" class="btn btn-success" data-dismiss="modal">确定</a>
		      </div>
			</div>
		</div>
	</div>
	
	
		<!-- 信息删除确认 -->
		<div class="modal fade bs-example-modal-sm" id="delcfmModel">
		  <div class="modal-dialog">
		    <div class="modal-content message_align">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
		        <h4 class="modal-title">提示信息</h4>
		      </div>
		      <div class="modal-body">
		        <p>您确认要退出吗？您的信息将会丢失</p>
		      </div>
		      <div class="modal-footer">
		      	 <input type="hidden" id="url"/>
		      	 <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		      	 <a  onclick="urlSubmit()" class="btn btn-success" data-dismiss="modal">确定</a>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->

	
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<!-- foot -->
	<jsp:include page="../head_foot/foot.html"></jsp:include>
	<script src="page/assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="page/assets/js/bootstrapValidator.min.js"></script> 
	<script type="text/javascript" src="page/assets/js/jquery.validate-1.13.1.js"></script>
	<script type="text/javascript" src="page/assets/js/additional-methods.js"></script>
	<script src="page/assets/js/password.js"></script>
	<script type="text/javascript">
	//刷新验证码
	$("#codeimg").click( function () {
		$(this).attr("src","Kaptcha.jpg?r="+new Date());; 
	});
	//启用密码可视
        $('#user_pass').password().on('show.bs.password')
        $('#user_pass_again').password().on('show.bs.password')
	//二级联动
	//获取省
	 $.getJSON("user/getProvince.action", function(json){
		 	$.each(json, function(index,item){ 
	 	 	 	$("#province").append("<option value='"+item.code+"'>"+item.name+"</option>");
    		});  
		});
	//首次加载
	 $.getJSON("user/getCity.action",{"code":"01"}, function(json){
		 		$("#city").empty(); 
		 	$.each(json, function(index,item){
	 	 	 	$("#city").append("<option value='"+item.name+"'>"+item.name+"</option>");
 		});  
	 });
	//获取市
	 $("#province").change(function(){ 
		 var pselect = $(this); 
		 var code = pselect.attr("value");		 
		 $.getJSON("user/getCity.action",{"code":code}, function(json){
			 		$("#city").empty(); 
			 	$.each(json, function(index,item){
		 	 	 	$("#city").append("<option value='"+item.name+"'>"+item.name+"</option>");
	    		});  
		 });
	 });
	$(document).ready(function() {
	    $('#regform').bootstrapValidator({
	        message: 'This value is not valid',
	        submitButtons: 'button[type="submit"]',
	        feedbackIcons: {
	           
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	        	user_obligate_info: {
	                validators: {
	                    notEmpty: {
	                        message: '预留信息不能为空'
	                    },
	                }
	            },
	            user_pass: {
	            	trigger:"blur",
	                validators: {
	                    notEmpty: {
	                        message: '密码不能为空'
	                    },
	                    identical: {
	                        field: 'user_pass_again',
	                        message: '请输入确认密码'
	                    },
	                }
	            },
	            user_pass_again: {
	            	trigger:"blur",
	                validators: {
	                    notEmpty: {
	                        message: '请确认密码'
	                    },
	                    identical: {
	                        field: 'user_pass',
	                        message: '两次密码不一致'
	                    },
	                }
	            },
	            user_email:{
	            	validators: {
	                    notEmpty: {
	                        message: '请输入邮箱'
	                    },
	                    regexp: {
	                        regexp: /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/,
	                        message: '非法的邮箱地址'
	                    }
	                }
	            },
	            user_code:{
	            	trigger:"blur",
	            	validators: {
	            		notEmpty: {
	                      message: '请输入验证码'
	               		 },
	            	remote: {
                        url: 'user/verifyCode.action',
                        type: "post",
                        async: false,
                        data:
                        {
                        	user_code: function(validator)
                            {
                                return $('#regform :input[name="user_code"]').val();

                            }
                        },
                    },
                  }
	           }
	        }
	    }).on('success.form.bv', function(e) {
            // Prevent form submission
            e.preventDefault();

            // Get the form instance
            var $form = $(e.target);

            // Get the BootstrapValidator instance
            var bv = $form.data('bootstrapValidator');

            // Use Ajax to submit form data
            $.post($form.attr('action'), $form.serialize(), function(result) {
				if (result.error==200) {
					//跳转到确认信息界面
					location.href = "user/regthird.action";
				}else {
					$("#msg").empty(); 
	                $("#msg").append(result.msg)
	                $("#isSuc").modal(); 
				}
					
            }, 'json');
        });
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