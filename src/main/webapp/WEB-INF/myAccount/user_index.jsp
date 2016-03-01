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
<link href="page/assets/css/animated-menu.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon"
	href="page/assets//img/tubiao.ico" />
<link href="http://cdn.bootcss.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="page/assets/css/bootstrap-table.css">
<link rel="stylesheet" href="page/assets/css/mybankbase.css">
<style type="text/css">
#transaction td{
	border-top: 0;
	border-left: 0;
	border-right: 0;
	border-bottom: 1px solid #cccccc;
}
</style>
<title>我的E-Bank</title>
</head>
<body style="background-image: url('page/assets/img/bg_grid.png');">
	<jsp:include page="../../page/head_foot/mybank_head.jsp"></jsp:include>
	<div class="container" >
		<div class="row top20" >
			<div class="col-sm-6 " >
				<div class="panel panel-default" style="border-radius: 10px 10px 10px 10px;background-color:rgba(255,255,255,0.6);">
					<div class="panel-body">
						<div class="row" >
							<div class="col-sm-4" >
								<h4>财富看板</h4>
							</div>
							<div class="col-sm-5 col-sm-offset-3">
								<h5 style="float: left;margin-left: 80px;color: #999999">单位:元<a href="#"  style="margin-left: 10px;">财富总览</a></h5>
							</div>
						</div>
						<hr width="100%" style="border-top:1px solid #cccccc;margin: 0px;"/>
						<div class="row">
							<div class="col-sm-4 top20" style="text-align: center;">
								<h5 class="top20">E宝</h5>
								<h3 class="top20">${user.user_account_money}</h3>
								<button type="button" onclick="javascript:window.location='myAccount/outin.action'"  class="btn btn-primary btncolor top10">&nbsp;&nbsp;&nbsp;&nbsp;充值&nbsp;&nbsp;&nbsp;&nbsp;</button>
								<h5 class="top10"><a href="myAccount/outin.action?toOorI=toO">提现</a></h5>
							</div>
							<div class="col-sm-4 top20" style="text-align: center;">
								<h5 class="top20">余额宝</h5>
								<h3 class="top20">${user.user_account_balance}</h3>
								<button type="button" onclick="javascript:window.location='myAccount/outin.action'" class="btn btn-primary btncolor top10">&nbsp;&nbsp;&nbsp;&nbsp;转入&nbsp;&nbsp;&nbsp;&nbsp;</button>
								<h5 class="top10"><a href="myAccount/outin.action?toOorI=toO">提现</a></h5>
							</div>
							<div class="col-sm-4 top20" style="text-align: center;">
								<h5 class="top20">昨日收益</h5>
								<h3 class="top20">+1.84</h3>
								<button type="button" onclick="javascript:window.location='myAccount/outin.action'"  class="btn btn-primary btncolor top10">&nbsp;&nbsp;&nbsp;&nbsp;提升&nbsp;&nbsp;&nbsp;&nbsp;</button>
								<h5 class="top10">详情</h5>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="panel panel-default" style="border-radius: 10px 10px 10px 10px;background-color:rgba(255,255,255,0.6);">
					 <div class="panel-body">
						<div class="row" >
							<div class="col-sm-4" >
								<h4 >生活服务</h4>
							</div>
							<div class="col-sm-5 col-sm-offset-3">
								<h5 style="float: left;margin-left: 80px;">管理&nbsp;&nbsp;&nbsp;|&nbsp;<a href="#"  style="margin-left: 5px;">我的服务</a></h5>
							</div>
						</div>
						<hr width="100%" style="border-top:1px solid #cccccc;margin: 0px;"/>
						<div class="row">
							<div class="col-sm-3 top10" style="text-align: center;">
								<a href="myAccount/trade.action?toBorC=tob" target="_blank"><i class="icon-github-alt" style="color: #3f316d;font-size: 50px;"></i></a> 
								<h5>转账到E宝</h5>
								<i class="icon-mobile-phone" style="color: #3f316d;font-size: 50px;"></i> 
								<h5>手机缴费充值</h5>
							</div>
							<div class="col-sm-3 top10" style="text-align: center;">
								<a href="myAccount/trade.action?toBorC=toc" target="_blank"><i class="icon-money" style="color: #3f316d;font-size: 50px;"></i></a> 
								<h5>转账到银行卡</h5>	
								<i class="icon-heart" style="color: #3f316d;font-size: 50px;"></i> 
								<h5>爱心捐赠</h5>
							</div>
							<div class="col-sm-3 top10" style="text-align: center;">
								<a href="myAccount/userCardList.action" target="_blank"><i class="icon-list-alt" style="color: #3f316d;font-size: 50px;"></i></a>
								<h5>我的银行卡</h5>
								<i class="icon-desktop" style="color: #3f316d;font-size: 50px;"></i> 
								<h5>有线电视缴费</h5>
							</div>
							<div class="col-sm-3 top10" style="text-align: center;">
								<a href="myAccount/viewCard.action" target="_blank"><i class="icon-credit-card" style="color: #3f316d;font-size: 50px;"></i></a>
								<h5>办理银行卡</h5>
								<i class="icon-tint" style="color: #3f316d;font-size: 50px;"></i> 
								<h5>水电煤缴费</h5>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 账单 -->
		<div class="row">
			<div class="col-sm-12">
				<div id="toolbar">
					<h4 style="display: inline;">我的账单&nbsp;&nbsp;&nbsp;&nbsp;</h4><a href="myAccount/alltradeinfo.action" class="hand">全部账单</a>
				</div>
				<table id="transaction"
				   style="border-bottom: 1px solid #c3c9cc;border-top: 1px solid #c3c9cc;"
				   data-toggle="table" 
				   data-width="50px" 
				   data-side-pagination="server"
				   data-show-header="false"
				   data-toolbar="#toolbar"
				   data-sort-order="desc"
			       data-show-refresh="true">
				    <thead>
				        <tr>
				            <th data-field="tradeTypeImage" data-align="center" data-sortable="true">交易类型图片</th>
				            <th data-field="tradeType" data-align="right">交易类型</th>
				            <th data-field="tradeInfo" data-align="center">交易详情</th>
				            <th data-field="tradeTimefmt" data-align="" data-sortable="true">时间</th>
				            <th data-field="tradeOhterName" data-align="">对方姓名</th>
				            <th data-field="tradeIncomeMoneystr" data-align="">收入</th>
				            <th data-field="tradeExpendMoneystr" data-align="">支出</th>
				            <th data-field="tradeUserCard" data-align="">本方使用的卡片</th>
				            <th data-field="tradeOtherCard" data-align="">对方使用的卡片</th>
<!-- 				            <th data-field="action" data-align="" data-formatter="actionFormatter" data-events="actionEvents">操作</th> -->
				        </tr>
				    </thead>
				</table>			
			</div>
		</div>
	</div>
	<!-- foot -->
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<script src="page/assets/js/jquery.easing.1.3.js"></script>
	<jsp:include page="../../page/head_foot/foot.jsp"></jsp:include>
	<script src="page/assets/js/bootstrap.min.js"></script>
	<script src="page/assets/js/bootstrap-table.js"></script>
	<script src="page/assets/js/bootstrap-table-zh-CN.js"></script>
	<script type="text/javascript">
		$("#foot").removeClass("navbar-fixed-bottom");
	    $('#transaction').bootstrapTable({
	 	    url: "trade/gettradelist.action?limit=10&offset=0",
	 	})
	 	function actionFormatter(value, row, index) {
	    	 return [
				        '<a class="remove ml10" href="javascript:void(0)" title="删除">',
				        '<i class="glyphicon glyphicon-remove"></i>',
				        '</a>'
				    ].join('');
		}
	</script>
</body>
</html>