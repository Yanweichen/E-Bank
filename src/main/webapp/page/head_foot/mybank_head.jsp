<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	// 获得项目完全路径（假设你的项目叫MyApp，那么获得到的地址就是 http://localhost:8080/MyApp/）:
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<canvas id="cas" style="position: absolute;z-index: -999"></canvas>
<script src="page/assets/js/pointbg.js"></script>
	<jsp:include page="head.jsp"></jsp:include>
	<hr width="100%" style="border:1px solid #3f315d;margin: 0;"/>
	<div style="background-color: #3f314d;height: 150px;position: relative;z-index: 2" >
		<ul class="headui">
			<li class="headui blackpurple">
				<h4 class="daohang"><a style="color: white;" href="myAccount/mybank.action">我的E-Bank</a></h4>
				<div class="subtext">
					<div class="list-group">
						<a class="list-group-item" style="color: white;"> 账户设置 </a>
						<a class="list-group-item" style="color: white;"> 我的账单 </a>
						<a class="list-group-item" style="color: white;"> 对账单 </a>
					</div>
				</div>
			</li>
			<li class="headui blackpurple">
				<h4 class="daohang">财富中心</h4>
				<div class="subtext">
					<div class="list-group">
						<a class="list-group-item" style="color: white;"> 账户设置 </a>
						<a class="list-group-item" style="color: white;"> 我的账单 </a>
						<a class="list-group-item" style="color: white;"> 对账单 </a>
					</div>
				</div>
			</li>
			<li class="headui blackpurple" id="userinfo">
				<img id="userface" class="img-circle hand" style="width: 100px;height: 100px;margin-top: 20px" src="${user.user_face}">
				<div class="subtext">
					<div class="row">
						<h5 class="colgb">阎伟晨</h5>
					</div>
					<div class="row">
						<h5 class="colgb">13279379235</h5>
					</div>
					<div class="row" style="margin: 10px 20px 0 20px;">
						<div class="col-sm-3"><a href="#" rel="relname"><img id="usercheck" src="page/assets/img/circle-profle.png" style="height: 20px;width: 20px;"></a></div>
						<div class="col-sm-3"><a href="#" rel="phone"><img src="page/assets/img/circle-smartphone.png" style="height: 20px;width: 20px;"></a></div>
						<div class="col-sm-3"><a href="#" rel="safe"><img src="page/assets/img/circle-security.png" style="height: 20px;width: 20px;"></a></div>
						<div class="col-sm-3"><a href="#" rel="setting"><img src="page/assets/img/circle-locked.png" style="height: 20px;width: 20px;"></a></div>
					</div>
					<div class="row" style="margin: 10px 20px 0 20px;">
						<div class="col-sm-6 bordera hand" onclick="window.location='myAccount/userCardList.action'">
							<h5 class="colgb">银行卡</h5>
							<h5 class="colgb">3</h5>
						</div>
						<div class="col-sm-6 borderb">
							<h5 class="colgb">银行卡</h5>
							<h5 class="colgb">3</h5>
						</div>
					</div>
					<div class="row" style="margin: 0px 20px 0 20px;">
						<div class="col-sm-6 borderc">
							<h5 class="colgb">银行卡</h5>
							<h5 class="colgb">3</h5>
						</div>
						<div class="col-sm-6">
							<h5 class="colgb">银行卡</h5>
							<h5 class="colgb">3</h5>
						</div>
					</div>
				</div>
			</li>
			<li class="headui blackpurple">
				<h4 class="daohang">生活服务</h4>
				<div class="subtext">
					<div class="list-group">
						<a class="list-group-item" style="color: white;"> 账户设置 </a>
						<a class="list-group-item" style="color: white;"> 我的账单 </a>
						<a class="list-group-item" style="color: white;"> 对账单 </a>
					</div>
				</div>
			</li>
			<li class="headui blackpurple">
				<h4 class="daohang">账户管理</h4>
				<div class="subtext" >
					<div class="list-group">
						<a href="myAccount/accountSet.action" class="list-group-item" style="color: white;"> 账户设置 </a>
						<a class="list-group-item" style="color: white;"> 我的账单 </a>
						<a class="list-group-item" style="color: white;"> 对账单 </a>
					</div>
				</div>
			</li>
		</ul>
	</div>
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<script src="page/assets/js/animated-menu.js"></script>
	<script src="page/assets/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript">
	$("#navhead").removeClass("navbar");//
     $(function(){
         $("[rel=relname]").popover({
             trigger:'manual',
             placement : 'right', //placement of the popover. also can use top, bottom, left or right
             title : '<h5 class="colgb" style="width:120px;">已经通过实名认证</h5>', //this is the top title bar of the popover. add some basic css
             html: 'true', //needed to show html of course
             content : '<h5 class="colgb" align="center">查看详情</h5>', //this is the content of the html box. add the image here or anything you want really.
             animation: false
         }).on("mouseenter", function () {
                     var _this = this;
                     $(this).popover("show");
                     $(this).siblings(".popover").on("mouseleave", function () {
                         $(_this).popover('hide');
                     });
                 }).on("mouseleave", function () {
                     var _this = this;
                     setTimeout(function () {
                         if (!$(".popover:hover").length) {
                             $(_this).popover("hide")
                         }
                     }, 100);
                 });
     });
     $(function(){
         $("[rel=phone]").popover({
             trigger:'manual',
             placement : 'top', //placement of the popover. also can use top, bottom, left or right
             title : '<h5 class="colgb" style="width:120px;">已经通过实名认证</h5>', //this is the top title bar of the popover. add some basic css
             html: 'true', //needed to show html of course
             content : '<h5 class="colgb" align="center">查看详情</h5>', //this is the content of the html box. add the image here or anything you want really.
             animation: false
         }).on("mouseenter", function () {
                     var _this = this;
                     $(this).popover("show");
                     $(this).siblings(".popover").on("mouseleave", function () {
                         $(_this).popover('hide');
                     });
                 }).on("mouseleave", function () {
                     var _this = this;
                     setTimeout(function () {
                         if (!$(".popover:hover").length) {
                             $(_this).popover("hide")
                         }
                     }, 100);
                 });
     });
     $(function(){
         $("[rel=safe]").popover({
             trigger:'manual',
             placement : 'top', //placement of the popover. also can use top, bottom, left or right
             title : '<h5 class="colgb" style="width:120px;">已经通过实名认证</h5>', //this is the top title bar of the popover. add some basic css
             html: 'true', //needed to show html of course
             content : '<h5 class="colgb" align="center">查看详情</h5>', //this is the content of the html box. add the image here or anything you want really.
             animation: false
         }).on("mouseenter", function () {
                     var _this = this;
                     $(this).popover("show");
                     $(this).siblings(".popover").on("mouseleave", function () {
                         $(_this).popover('hide');
                     });
                 }).on("mouseleave", function () {
                     var _this = this;
                     setTimeout(function () {
                         if (!$(".popover:hover").length) {
                             $(_this).popover("hide")
                         }
                     }, 100);
                 });
     });
     $(function(){
         $("[rel=setting]").popover({
             trigger:'manual',
             placement : 'left', //placement of the popover. also can use top, bottom, left or right
             title : '<h5 class="colgb" style="width:120px;">已经通过实名认证</h5>', //this is the top title bar of the popover. add some basic css
             html: 'true', //needed to show html of course
             content : '<h5 class="colgb" align="center">查看详情</h5>', //this is the content of the html box. add the image here or anything you want really.
             animation: false
         }).on("mouseenter", function () {
                     var _this = this;
                     $(this).popover("show");
                     $(this).siblings(".popover").on("mouseleave", function () {
                         $(_this).popover('hide');
                     });
                 }).on("mouseleave", function () {
                     var _this = this;
                     setTimeout(function () {
                         if (!$(".popover:hover").length) {
                             $(_this).popover("hide")
                         }
                     }, 100);
                 });
     });
     $("#userface").click(function(){
    	 window.location="myAccount/faceSet.action"
     })
	</script>