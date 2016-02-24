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

<link href="http://cdn.bootcss.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
<title>我的银行卡</title>
</head>
<body style="background-image: url('page/assets/img/bg_grid.png');">
	<!-- 头部导航 -->
	<jsp:include page="../../../page/head_foot/mybank_head.jsp"></jsp:include>
	<div class="container top20">
		<div class="row">
		<div class="col-sm-3">
				<div id="setlist" class="list-group touming6">
				  <a id="noviewa" href="myAccount/trade.action" class="list-group-item">
				  	<i class="icon-envelope-alt noviewi"></i>&nbsp;&nbsp;转账
				  	<i class="icon-angle-right noviewi" style="float: right;"></i>
				  </a>
				  <a id="outin" href="myAccount/outin.action" class="list-group-item">
				  	<i class="icon-envelope isviewi" ></i>&nbsp;&nbsp;转入/转出
				  	<i class="icon-angle-right isviewi" style="float: right;"></i>
				  </a>
				  <a id="isviewa" href="myAccount/userCardList.action" class="list-group-item">
				  	<i class="icon-envelope isviewi" ></i>&nbsp;&nbsp;我的银行卡
				  	<i class="icon-angle-right isviewi" style="float: right;"></i>
				  </a>
				</div>
		</div>
		<div class="col-sm-9">
				<div class="panel panel-default touming6 yuanjiao15" >
			  <div class="panel-heading yuanjiao15" ><h4 style="color: #3f314d;"><i class="icon-credit-card"></i>&nbsp;&nbsp;我的银行卡</h4></div>
			  <div class="panel-body">
			  <c:forEach var="card" items="${usercardlist}">
				    <div class="col-sm-6">
				    	<div class="panel panel-default touming6" >
				    		<div class="panel-heading" style="background-color: #3f315d;color: white;">${card.card_name}</div>
				  			<div class="panel-body" style="height: 150px;">
				  			<div align="center">
				  				<img class="img-thumbnail" src="${card.card_face}" style="position:absolute;">
				  			</div>
				  				<h4 class="overstep" style="width: 150px;" onmouseover="$(this).removeClass('overstep')" onmouseout="$(this).addClass('overstep')">${card.user_name}</h4>
				  				<h5 class="overstep" style="width: 170px;" onmouseover="$(this).removeClass('overstep')" onmouseout="$(this).addClass('overstep')">${card.user_card_num}</h5>
				  				<button type="button" class="btn btn-primary btn-xs btncolor" data-container="body" data-toggle="popover" data-placement="top" data-content="${card.user_card_balance}">
								  点我查看余额
								</button>
				  				<c:choose>
				  					<c:when test="${card.user_card_state==1}">
				  						<h5 style="color: #32CD32;font-weight: bold;"><i class="icon-ok-sign"></i>&nbsp;正常</h5> 
				  					</c:when>
				  					<c:when test="${card.user_card_state==3}">
				  						<h5 style="color: #00BFFF;font-weight: bold;"><i class="icon-remove-circle"></i>&nbsp;冻结</h5> 
				  					</c:when>
				  					<c:when test="${card.user_card_state==4}">
				  						<h5 style="color: #FF4500;font-weight: bold;"><i class="icon-minus-sign"></i>&nbsp;挂失</h5> 
				  					</c:when>
				  					<c:when test="${card.user_card_state==5}">
				  						<h5 style="color: #999999;font-weight: bold;"><i class="icon-spinner icon-spin"></i>&nbsp;审核中</h5> 
				  					</c:when>
				  						<c:when test="${card.user_card_state==6}">
				  						<h5 style="color: red;font-weight: bold;"><i class="icon-info-sign"></i>&nbsp;审核未通过</h5> 
				  					</c:when>
				  				</c:choose>
				  			</div>
				  		</div>
				    </div>
			    </c:forEach>
			  </div>
			</div>
		</div>
		</div>
	</div>
	<!-- foot -->
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<jsp:include page="../../../page/head_foot/foot.jsp"></jsp:include>
	<script src="page/assets/js/jquery.easing.1.3.js"></script>
	<script src="page/assets/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function () {
		  $('[data-toggle="popover"]').popover()
		})
		function init(state){
		switch (state) {
		case "isview":
			$("#isviewa").attr("style","background-color: #3f316d;border-color: #3f316d;color: white;");
			$("#isviewi").addClass("iconactive")
			$("#noviewi").addClass("iconnoactive")
			$("#alli").addClass("iconnoactive")
			break;
		case "noview":
			$("#noviewa").attr("style","background-color: #3f316d;border-color: #3f316d;color: white;");
			$("#isviewi").addClass("iconnoactive")
			$("#noviewi").addClass("iconactive")
			$("#alli").addClass("iconnoactive")
			break;
		}
	}
	$(document).ready(function() {
		init("isview")
	})
	</script>
</body>
</html>