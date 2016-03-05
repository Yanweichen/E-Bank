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
<link rel="stylesheet" href="page/assets/css/bootstrapValidator.min.css"/>
<link rel="stylesheet" href="page/assets/css/bootstrap-switch.css"/>
<link rel="stylesheet" href="page/assets/css/fakeloader.css">
<link href="http://cdn.bootcss.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
<title>转入/转出</title>
</head>
<body style="background-image: url('page/assets/img/bg_grid.png');">
	<!-- 头部导航 -->
	<jsp:include page="../../../page/head_foot/mybank_head.jsp"></jsp:include>
	<div class="container top20">
		<div class="row">
			<div class="col-sm-3">
				<div id="setlist" class="list-group touming6">
				  <a id="noviewa" href="myAccount/trade.action?toBorC=tob" class="list-group-item">
				  	<i class="icon-share-alt noviewi"></i>&nbsp;&nbsp;转账
				  	<i class="icon-angle-right noviewi" style="float: right;"></i>
				  </a>
				  <a id="outin" href="myAccount/outin.action" class="list-group-item">
				  	<i class="icon-exchange isviewi" ></i>&nbsp;&nbsp;转入/转出
				  	<i class="icon-angle-right isviewi" style="float: right;"></i>
				  </a>
				  <a id="isviewa" href="myAccount/userCardList.action" class="list-group-item">
				  	<i class="icon-credit-card isviewi" ></i>&nbsp;&nbsp;我的银行卡
				  	<i class="icon-angle-right isviewi" style="float: right;"></i>
				  </a>
				</div>
			</div>
			<div class="col-sm-9">
			<div class="panel panel-default touming6">
			  <div class="panel-body">
				  <!-- Nav tabs -->
				  <ul id="tradetab" class="nav nav-tabs" role="tablist">
				    <li role="presentation" class="active">
				    	<a href="#in" aria-controls="ebao" style="width: 200px;" role="tab" data-toggle="tab">转入</a>
				    </li>
				    <li role="presentation">
				    	<a href="#out" aria-controls="bankcard" style="width: 200px;" role="tab" data-toggle="tab">转出</a>
				    </li>
				  </ul>
				  <!-- Tab panes -->
				  <div class="tab-content tbcstyle" >
				    <div role="tabpanel" class="tab-pane active" id="in">
				    	<div class="row">
				    		<div class="col-sm-6">
				    			<form id="inoutfrom">
									<div class="form-group">
									    <label class="gray6" id="inoroutlabel">转入到</label>
									    <div >
										    <input name="ebaooryuebao" type="checkbox" checked />
									    </div>
									</div>
									 <div class="form-group" >
									    <label class="gray6">金额来源</label>
									    <div id="selectcorm" style="display: none;">
										    <input name="cardormoney" type="checkbox" checked />
									    </div>
									      <div id="selectcorb">
										    <input name="cardorblance" type="checkbox" checked />
									    </div>
									</div>
									 <div class="form-group" id="userbankcardlistdiv" style="display: none;">
									    <label class="gray6">请选择银行卡</label>
										    <select id="inselect"   class="form-control usercardlist">
											</select>
											<label class="gray6 top5">此卡余额:&nbsp;&nbsp;<span style="color: #3f316d" id="cardblance" ></span> </label>
									</div>
									<div class="form-group">
									    <label class="gray6">金额</label>
									     <input type="text" class="form-control" id="trademoney" name="trademoney" placeholder="0">
									</div>
									<div class="form-group">
									    <label class="gray6">备注</label>
									    <input type="text" class="form-control" id="tradeinfo" name="tradeinfo" placeholder="备注~">
									</div>
									<div class="form-group" style="margin-top: 40px;">
									<button id="subbtn" type="button" class="btn btn-primary btn-lg btn-block btncolor">转入</button>
									</div>
								</form>
				    		</div>
				    	</div>
				    </div>
				    <div role="tabpanel" class="tab-pane" id="out">
				   	   <div class="row">
				    	<div class="col-sm-6">
				    	 	<div class="form-group" >
							    <label class="gray6">请选择银行卡</label>
								    <select id="outselect"   class="form-control usercardlist">
									</select>
								<label class="gray6 top5">此卡余额:&nbsp;&nbsp;<span style="color: #3f316d" id="outcardblance" ></span> </label>
							</div>
				    		<div class="form-group">
							    <label class="gray6" id="inoroutlabel">金额来源</label>
							    <div >
								    <input name="outborc" type="checkbox" checked />
							    </div>
							</div>
							<div class="form-group">
							    <label class="gray6">金额</label>
							    <input type="text" class="form-control" id="outtrademoney" name="outtrademoney" placeholder="0">
							</div>
							<div class="form-group">
							    <label class="gray6">备注</label>
							    <input type="text" class="form-control" id="outtradeinfo" name="outtradeinfo" placeholder="备注~">
							</div>
							<div class="form-group" style="margin-top: 40px;">
								<button id="subbtnout" type="button" class="btn btn-primary btn-lg btn-block btncolor">转入</button>
							</div>
				    	</div>
				    	</div>
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
	<div class="fakeloader"></div>
	<!-- foot -->
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<jsp:include page="../../../page/head_foot/foot.jsp"></jsp:include>
	<script src="page/assets/js/jquery.easing.1.3.js"></script>
	<script src="page/assets/js/bootstrap.min.js"></script>
	<script src="page/assets/js/bootstrapValidator.min.js"></script> 
	<script src="page/assets/js/bootstrap-switch.min.js"></script> 
	<script src="page/assets/js/fakeloader.js"></script>
	<script type="text/javascript">
	var toOorI = "<% out.print(request.getParameter("toOorI")==null?"":request.getParameter("toOorI")); %>";
	if (toOorI=="toO") {//根据URL切换TAB
		$('#tradetab a:last').tab('show') 
	} 
	$("#outin").attr("style","background-color: #3f316d;border-color: #3f316d;color: white;");
	$("[name='ebaooryuebao']").bootstrapSwitch('handleWidth',100);
	$("[name='ebaooryuebao']").bootstrapSwitch('onColor',"default");
	$("[name='ebaooryuebao']").bootstrapSwitch('offColor',"default");
	$("[name='ebaooryuebao']").bootstrapSwitch('onText',"E宝");
	$("[name='ebaooryuebao']").bootstrapSwitch('offText',"余额宝");
	$('input[name="ebaooryuebao"]').on('switchChange.bootstrapSwitch', function(event, state) {
		if (!state) {
			$("#selectcorm").fadeIn();//银行卡或者余额
			$("#selectcorb").css("display","none");
		}else{
			$("#selectcorb").fadeIn();//银行卡或者余额宝
			$("#selectcorm").css("display","none");
		}
	});
	$("[name='cardormoney']").bootstrapSwitch('handleWidth',75);
	$("[name='cardormoney']").bootstrapSwitch('onColor',"default");
	$("[name='cardormoney']").bootstrapSwitch('offColor',"default");
	$("[name='cardormoney']").bootstrapSwitch('onText',"E宝");
	$("[name='cardormoney']").bootstrapSwitch('offText',"银行卡");
	$('input[name="cardormoney"]').on('switchChange.bootstrapSwitch', function(event, state) {
		if (!state) {
			$("#userbankcardlistdiv").fadeIn();
		}else{
			$("#userbankcardlistdiv").fadeOut();
		}
	});
	$("[name='cardorblance']").bootstrapSwitch('handleWidth',100);
	$("[name='cardorblance']").bootstrapSwitch('onColor',"default");
	$("[name='cardorblance']").bootstrapSwitch('offColor',"default");
	$("[name='cardorblance']").bootstrapSwitch('onText',"余额宝");
	$("[name='cardorblance']").bootstrapSwitch('offText',"银行卡");
	$('input[name="cardorblance"]').on('switchChange.bootstrapSwitch', function(event, state) {
		if (!state) {
			$("#userbankcardlistdiv").fadeIn();
		}else{
			$("#userbankcardlistdiv").fadeOut();
		}
	});
	$("[name='outborc']").bootstrapSwitch('handleWidth',100);
	$("[name='outborc']").bootstrapSwitch('onColor',"default");
	$("[name='outborc']").bootstrapSwitch('offColor',"default");
	$("[name='outborc']").bootstrapSwitch('onText',"余额宝");
	$("[name='outborc']").bootstrapSwitch('offText',"E宝");
	
	//获得卡列表
	$.post("card/userCardListJSON.action",function(result){
        if (result.error==200) {
        	$.each(result.msg,function(i,card){
        		if (i=0) {
	            	$(".usercardlist").append("<option selected='selected' value="+card.user_card_balance+">"+card.user_card_num+"</option>");
				}
	            $(".usercardlist").append("<option value="+card.user_card_balance+">"+card.user_card_num+"</option>");
        	})
        }else{
        	$(".usercardlist").append("<option>"+result.msg+"</option>");
        }
  	})
  	$("#subbtn").click(function(){
  		$(".fakeloader").fakeLoader({
            spinner:"spinner2",
            show:true
        });
  		var cardnum = $("#inselect option:selected").text();
  		var trademoney = $("#trademoney").val()
  		var tradeinfo = $("#tradeinfo").val()
  		var ebaooryuebao = $("[name='ebaooryuebao']").bootstrapSwitch('state');
  		var corborm;
  		if (ebaooryuebao) {
			corborm = $("[name='cardorblance']").bootstrapSwitch('state');
		} else {
  			corborm = $("[name='cardormoney']").bootstrapSwitch('state');
		}
  		$.post("trade/tradeIn.action",{ebaooryuebao:ebaooryuebao,corborm:corborm,cardnum:cardnum,trademoney:trademoney,tradeinfo:tradeinfo},function(result){
  			$(".fakeloader").fakeLoader({
                spinner:"spinner2",
                show:false
            });
  			result = JSON.parse(result)
			if (result.error==200) {
				 $("#msg").empty(); 
				 $("#msg").append(result.msg)
               	 $("#isSuc").modal(); 
			}else{
				 $("#msg").empty(); 
				 $("#msg").append(result.msg)
               	 $("#isSuc").modal(); 
			}
  	  	})
  	})
  	$("#subbtnout").click(function(){
  		$(".fakeloader").fakeLoader({
            spinner:"spinner2",
            show:true
        });
  		var cardnum = $("#outselect option:selected").text();
  		var outtrademoney = $("#outtrademoney").val()
  		var outtradeinfo = $("#outtradeinfo").val()
  		var ebaooryuebao = $("[name='outborc']").bootstrapSwitch('state');
  		$.post("trade/tradeOut.action",{ebaooryuebao:ebaooryuebao,cardnum:cardnum,outtrademoney:outtrademoney,outtradeinfo:outtradeinfo},function(result){
  			$(".fakeloader").fakeLoader({
                spinner:"spinner2",
                show:false
            });
  			result = JSON.parse(result)
			if (result.error==200) {
				 $("#msg").empty(); 
				 $("#msg").append(result.msg)
               	 $("#isSuc").modal(); 
			}else{
				 $("#msg").empty(); 
				 $("#msg").append(result.msg)
               	 $("#isSuc").modal(); 
			}
  	  	})
  	})
  	//in
   	$("#inselect").change(function(){
   		var bla = $("#inselect option:selected").val();
   		$("#cardblance").empty();
   		$("#cardblance").append(bla);
   	})
   	//out
   	$("#outselect").change(function(){
   		var bla = $("#outselect option:selected").val();
   		$("#outcardblance").empty();
   		$("#outcardblance").append(bla);
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