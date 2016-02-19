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
		
			$("#logintitle").css({
				"display" : "inline-block"
			})
			function closebox(){
				$.Velocity.RunSequence(msgOut);
			}
			var id;
			function showMsg(){
				$.getJSON("msg/getNewMsg.action",function(json){
					if (json.ishaveNew) {
						$.Velocity.RunSequence(msgIn);
						$("#headmsg").empty();
						$("#headmsg").append(json.msg.msgTitle);
						setTimeout(closebox,10000);
					}
				})
// 				$().toastmessage('showMailToast', '哈哈哈哈哈');
			}
			setInterval(showMsg, 15000);
		</script>
	</c:if>