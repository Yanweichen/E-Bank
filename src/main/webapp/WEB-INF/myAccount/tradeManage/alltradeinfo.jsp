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
<link rel="shortcut icon" type="image/x-icon"
	href="page/assets//img/tubiao.ico" />
<link href="page/assets/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="page/assets/css/mybankbase.css">
<link href="page/assets/css/animated-menu.css" rel="stylesheet">
<link rel="stylesheet" href="page/assets/css/bootstrap-table.css">
<link href="http://cdn.bootcss.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
<link href="page/assets/css/bootstrap-datepicker3.css" rel="stylesheet">
<title>全部账单</title>
<style type="text/css">
#transaction td{
	border-top: 0;
	border-left: 0;
	border-right: 0;
	border-bottom: 1px solid #cccccc;
}
</style>
</head>
<body style="background-image: url('page/assets/img/bg_grid.png');">
	<!-- 头部导航 -->
	<jsp:include page="../../../page/head_foot/mybank_head.jsp"></jsp:include>
	<div class="container top20">
		<div class="row">
			<div class="col-sm-12" >
				<div class="panel panel-default touming6">
				  <div class="panel-heading"><h4 style="display: inline;">全部账单&nbsp;&nbsp;&nbsp;&nbsp;</h4></div>
				  <div class="panel-body">
				  	<div id="toolbar" >
						<div class="input-daterange input-group" id="alldate">
							<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
							<input id="allstarttime" type="text" class="input-sm form-control" name="start" onfocus="this.blur()" /> 
							<span class="input-group-addon">至</span> 
							<input id="allendtime" type="text" class="input-sm form-control" name="end" onfocus="this.blur()" />
							<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
						</div>
					</div>
					<table id="transaction" class="touming6"
					   data-toggle="table" 
					   data-width="50px" 
					   data-side-pagination="server"
					   data-toolbar="#toolbar"
					   data-sort-order="desc"
					   data-pagination="true" 
					   data-page-list="[5, 10, 20, 50, 100, 200]"
					   data-search="true"
				       data-show-refresh="true">
					    <thead>
					        <tr>
					            <th data-field="tradeTypeImage" data-align="center" ></th>
					            <th data-field="tradeNumber" data-align="center">单号</th>
					            <th data-field="tradeType" data-align="center">类型</th>
					            <th data-field="tradeInfo" data-align="center">详情</th>
					            <th data-field="tradeTimefmt" data-align="center" data-sortable="true">时间</th>
					            <th data-field="tradeOhterName" data-align="">对方姓名</th>
					            <th data-field="tradeIncomeMoneystr" data-align="">收入</th>
					            <th data-field="tradeExpendMoneystr" data-align="">支出</th>
					            <th data-field="tradeUserCard" data-align="center">我的卡号</th>
					            <th data-field="tradeOtherCard" data-align="center">对方卡号</th>
<!-- 					            <th data-field="action" data-align="" data-formatter="actionFormatter" data-events="actionEvents">操作</th> -->
					        </tr>
					    </thead>
					</table>			
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
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
						<h4 class="modal-title">提示</h4>
				</div>
				<div class="modal-body">
						<p id="msg"></p>
				</div>
			</div>
		</div>
	</div>
	<!-- foot -->
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<jsp:include page="../../../page/head_foot/foot.jsp"></jsp:include>
	<script src="page/assets/js/jquery.easing.1.3.js"></script>
	<script src="page/assets/js/bootstrap.min.js"></script>
	<script src="page/assets/js/bootstrap-table.js"></script>
	<script src="page/assets/js/bootstrap-table-zh-CN.js"></script>
	<script src="page/assets/js/bootstrap-datepicker.js"></script>
	<script src="page/assets/js/bootstrap-datepicker.zh-CN.min.js" charset="UTF-8"></script>
	<script type="text/javascript">
		$("#foot").removeClass("navbar-fixed-bottom");
	 	$('#transaction').bootstrapTable({
	 	    url: "trade/gettradelist.action",
	 	})
	 	
	 	function actionFormatter(value, row, index) {
	    	 return [
				        '<a class="remove ml10" href="javascript:void(0)" title="删除">',
				        '<i class="glyphicon glyphicon-remove"></i>',
				        '</a>'
				    ].join('');
		}
	 	function showMsg(msg) {
			$("#msg").empty(); 
	        $("#msg").append(msg)
			$("#isSuc").modal(); 
		}
	 	
	 	$('#alldate').datepicker({
	    format: 'yyyy-mm-dd',
	    language: "zh-CN",
	    autoclose:true,
	    todayBtn:true,
	    keyboardNavigation:true,
	    todayHighlight:true,
		}).on('changeDate', function(ev){
			$.getJSON("trade/gettradelist.action?limit=10&offset=0",{starttime:$("#allstarttime").val(),endtime:$("#allendtime").val()}, function(json){
				if (json.rows.length==0) {
					showMsg("该日期区间无数据");
				} else {
					$('#transaction').bootstrapTable('load', json);
				}
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