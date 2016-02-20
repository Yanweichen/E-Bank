<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="foot" class="container top20">
	<div class="row">
		<div class="col-sm-6 col-sm-offset-3">
			<p align="center">
				<a id="E-Bank" href="page/index.jsp" target="_blank">E-Bank</a> | <a href="#" target="_blank">Bank
					Online</a> | Complaint Guidelines | 审核时间[2015]-070
			</p>
			<p align="center">Copyright &copy; 2015 - e-bank.All Rights
				Reserved.
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Yanweichen| 版权所有</p>
		</div>
	</div>
</div>

<script type="text/javascript">
//判断页面是否出现滚动条
if (!(document.documentElement.clientHeight < document.documentElement.offsetHeight-4)) {
	$("#foot").addClass("navbar-fixed-bottom");
}
</script>
	<!-- 如果登陆 -->
	<c:if test="${!empty user}">
	<script src="page/assets/js/velocity.min.js"></script>
	<script src="page/assets/js/velocity.ui.min.js"></script>
		<script type="text/javascript">
		var msgIn,msgOut;
		$(function() {
			msgIn = [ {
				elements : $("#headmsgbox"),
				properties : 'transition.bounceRightIn',
				options : {
					delay : 10
				}
			}, ];
			msgOut = [ {
				elements : $("#headmsgbox"),
				properties : 'transition.bounceUpOut',
				options : {
					delay : 10
				}
			}];
		})
		
		//判断是否隐藏个人信息入口
			$("#logintitle").css({
				"display" : "inline-block"
			})
			//隐藏msgbox
			function closebox(){
				$.Velocity.RunSequence(msgOut);
			}
			//循环查看消息
			function showMsg(){
				$.getJSON("msg/getNewMsg.action",function(json){
					if (json.ishaveNew) {
						$("#newmsg").fadeIn()
						$.Velocity.RunSequence(msgIn);
						$("#headmsg").empty();
						$("#headmsg").append(json.msg.msgTitle);
						setTimeout(closebox,10000);
					}
				})
			}
// 			setInterval(showMsg, 15000);
			$(window).scroll(function(event){
				var winPos = $(window).scrollTop();
				$("#headmsgbox").css("top",winPos+40);
		    });
		</script>
	</c:if>