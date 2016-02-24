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
<title>转账</title>
<style type="text/css">
.zuijinlistbg{
	border-radius: 10px 10px 10px 10px;
	padding: 8px;
	background-color: rgba(244,244,244,0.6);
}
</style>
</head>
<body style="background-image: url('page/assets/img/bg_grid.png');">
	<!-- 头部导航 -->
	<jsp:include page="../../../page/head_foot/mybank_head.jsp"></jsp:include>
	<div class="container top20">
		<div class="row">
			<div class="col-sm-3">
				<div id="setlist" class="list-group touming6">
				  <a id="noviewa" href="myAccount/trade.action?toBorC=tob" class="list-group-item">
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
			<div class="panel panel-default touming6">
			  <div class="panel-body">
				  <!-- Nav tabs -->
				  <ul id="tradetab" class="nav nav-tabs" role="tablist">
				    <li role="presentation" class="active">
				    	<a href="#ebao" aria-controls="ebao" style="width: 200px;" role="tab" data-toggle="tab">转账到E宝</a>
				    </li>
				    <li role="presentation">
				    	<a href="#bankcard" aria-controls="bankcard" style="width: 200px;" role="tab" data-toggle="tab">转账到银行卡</a>
				    </li>
				  </ul>
				  <!-- Tab panes -->
				  <div class="tab-content tbcstyle" >
				    <div role="tabpanel" class="tab-pane active" id="ebao">
				    	<div class="row">
				    		<div class="col-sm-6">
				    			<form id="tradetoefrom">
					    			<div class="form-group">
									    <label class="gray6">收款人</label>
									    <input type="text" class="form-control" id="touser" name="touser" placeholder="手机/邮箱">
									    <label class="gray6 top5" id="tousernamediv" style="display: none">收款人姓名:&nbsp;&nbsp;<span style="color: #3f316d" id="tousernamespan" ></span> </label>
									</div>
									 <div class="form-group">
									    <label class="gray6">使用E宝转账</label>
									    <div >
										    <input name="isuserebao" type="checkbox" checked />
									    </div>
									</div>
									 <div class="form-group" id="userbankcardlistdiv" style="display: none;">
									    <label class="gray6">请选择转账银行卡</label>
										    <select id="ebaoselect"   class="form-control usercardlist">
											</select>
											<label class="gray6 top5"  >此卡余额:&nbsp;&nbsp;<span style="color: #3f316d" id="cardblance" ></span> </label>
									</div>
									<div class="form-group">
									    <label class="gray6">转账金额</label>
									     <input type="text" class="form-control" id="trademoney" name="trademoney" placeholder="0">
									</div>
									<div class="form-group">
									    <label class="gray6">备注</label>
									    <input type="text" class="form-control" id="tradeinfo" name="tradeinfo" placeholder="想说的话~">
									</div>
									<div class="form-group" style="margin-top: 40px;">
									<button type="submit" class="btn btn-primary btn-lg btn-block btncolor">转账</button>
									</div>
								</form>
				    		</div>
				    		<div class="col-sm-4 col-sm-offset-1" id="aboutuserlist">
				    		<h5 style="color: #999;margin-left: 10px;">最近有过来往的朋友..</h5>
				    		<div class="row">
				    			<div class="col-sm-6" id="aboutuserleftlist">
<!-- 				    				<div class="zuijinlistbg top10"> -->
<!-- 				    				<div class="row"> -->
<!-- 				    					<div class="col-sm-4"> -->
<!-- 				    					<img alt="" class="img-circle" style="width: 40;height: 40px;" src="http://sourceimg-10021396.image.m -->
<!-- 										yqcloud.com/f86c151d-7a1e-4ba1-885f-e487ce6c6d8a"> -->
<!-- 				    					</div> -->
<!-- 				    					<div class="col-sm-8" style="padding-right: 4px"> -->
<!-- 				    						<div class="overstep top10" style="color: #999;margin-left: 5px;">A同学A同学A同学A同学A同学A同学A同学</div> -->
<!-- 				    					</div> -->
<!-- 				    				</div> -->
<!-- 				    				</div> -->
				    			</div>
				    			<div class="col-sm-6" id="aboutuserrightlist">
				    			</div>
				    		</div>
				    		</div>
				    	</div>
				    	
				    </div>
				    <div role="tabpanel" class="tab-pane" id="bankcard">
				    <form id="tradetocfrom">
				    	<div class="form-group">
						    <label class="gray6">转账卡号</label>
						    <input type="text" class="form-control" id="tocardnum" name="tocardnum" placeholder="银行卡号">
						    <label class="gray6 top5" id="tocardnumnamediv" style="display: none">收款人姓名:&nbsp;&nbsp;<span style="color: #3f316d" id="tocardnumnamespan" ></span> </label>
						</div>
						 <div class="form-group">
						    <label class="gray6">使用E宝转账</label>
						    <div >
							    <input name="nouserebao" type="checkbox" checked />
						    </div>
						</div>
						 <div class="form-group" id="carduserbankcardlistdiv" style="display: none;">
						    <label class="gray6">请选择转账银行卡</label>
							    <select id="cardselect"  class="form-control usercardlist">
								</select>
								<label class="gray6 top5" >此卡余额:&nbsp;&nbsp;<span style="color: #3f316d" id="noebaocardblance" ></span> </label>
							</div>
						<div class="form-group">
						    <label class="gray6">转账金额</label>
						     <input type="text" class="form-control" id="cardtrademoney" name="cardtrademoney" placeholder="0">
						</div>
						<div class="form-group">
						    <label class="gray6">备注</label>
						    <input type="text" class="form-control" id="cardtradeinfo" name="cardtradeinfo" placeholder="想说的话~">
						</div>
						<div class="form-group" style="margin-top: 40px;">
						<button type="submit" class="btn btn-primary btn-lg btn-block btncolor">转账</button>
						</div>
					</form>
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
	<img src="" class="tradetypeimage img-circle">
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
	var toBorC = "<% out.print(request.getParameter("toBorC")==null?"":request.getParameter("toBorC")); %>";
	if (toBorC=="toc") {//根据URL切换TAB
		$('#tradetab a:last').tab('show') 
	} 
	var usermoney = "${user.user_account_money}";
	$("[name='isuserebao']").bootstrapSwitch('handleWidth',50);
	$("[name='isuserebao']").bootstrapSwitch('onColor',"default");
	$("[name='isuserebao']").bootstrapSwitch('offColor',"primary");
	$('input[name="isuserebao"]').on('switchChange.bootstrapSwitch', function(event, state) {
		if (!state) {
			$("#userbankcardlistdiv").fadeIn();
		}else{
			$("#userbankcardlistdiv").fadeOut();
		}
	});
	$("[name='nouserebao']").bootstrapSwitch('handleWidth',50);
	$("[name='nouserebao']").bootstrapSwitch('onColor',"default");
	$("[name='nouserebao']").bootstrapSwitch('offColor',"primary");
	$('input[name="nouserebao"]').on('switchChange.bootstrapSwitch', function(event, state) {
		if (!state) {
			$("#carduserbankcardlistdiv").fadeIn();
		}else{
			$("#carduserbankcardlistdiv").fadeOut();
		}
	});
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
		default:
			$("#alla").attr("style","background-color: #3f316d;border-color: #3f316d;color: white;");
			$("#isviewi").addClass("iconnoactive")
			$("#noviewi").addClass("iconnoactive")
			$("#alli").addClass("iconactive")
			break;
		}
	}
	$(document).ready(function() {
		init("noview")
		 $('#tradetoefrom').bootstrapValidator({
		        message: 'This value is not valid',
		        submitButtons: 'button[type="submit"]',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		            touser: {
		            	trigger:"blur",
		                validators: {
		                    notEmpty: {
		                        message: '此项不能为空'
		                    },
		                    remote: {
	                            url: 'user/getusername.action',
	                            type: "post",
	                            async: true,
	                            data:
	                            {
	                            	account: function(validator)
	                                {
	                                    return $('#tradetoefrom :input[name="touser"]').val();
	                                },
	                            },
	                        },
		                }
		            },
		            trademoney: {
		                validators: {
		                    notEmpty: {
		                        message: '此项不能为空'
		                    },
		                }
		            },

		        }
		    }).on('success.form.bv', function(e) {
	            // Prevent form submission
	            e.preventDefault();
	            console.log('走E宝转账')
	            // Get the form instance
	            var $form = $(e.target);

	            // Get the BootstrapValidator instance
	            var bv = $form.data('bootstrapValidator');
	            var isuserEbao = $("[name='isuserebao']").bootstrapSwitch("state");
	            $(".fakeloader").fakeLoader({
	                spinner:"spinner2",
	                show:true
	            });
				if (isuserEbao) {
					$.post("trade/tradeBlancetoBlance.action", $form.serialize(), function(result) {
						$(".fakeloader").fakeLoader({
			                spinner:"spinner2",
			                show:false
			            });
						if (result.error==200) {
							 $("#msg").empty(); 
							 $("#msg").append(result.msg)
			               	 $("#isSuc").modal(); 
						}else{
							 $("#msg").empty(); 
							 $("#msg").append(result.msg)
			               	 $("#isSuc").modal(); 
						}
							
		            });
				} else {
					$.post("trade/tradeByCardtoBlance.action", {touser:$("#touser").val(),cardnum:$("#usercardlist option:selected").text(),trademoney:$("#trademoney").val(),tradeinfo:$("#tradeinfo").val(),}, function(result) {
						$(".fakeloader").fakeLoader({
			                spinner:"spinner2",
			                show:false
			            });
						if (result.error==200) {
							 $("#msg").empty(); 
							 $("#msg").append(result.msg)
			               	 $("#isSuc").modal(); 
						}else{
							 $("#msg").empty(); 
							 $("#msg").append(result.msg)
			               	 $("#isSuc").modal(); 
						}
							
		            });
				}
	        });
		//转账到银行卡表单验证
		 $('#tradetocfrom').bootstrapValidator({
		        message: 'This value is not valid',
		        submitButtons: 'button[type="submit"]',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		        	tocardnum: {
		            	trigger:"blur",
		                validators: {
		                    notEmpty: {
		                        message: '此项不能为空'
		                    },
		                    remote: {
	                            url: 'card/ishavecard.action',
	                            type: "post",
	                            async: true,
	                            data:
	                            {
	                            	cardnum: function(validator)
	                                {
	                                    return $('#tradetocfrom :input[name="tocardnum"]').val();
	                                }
	                            },
	                        },
		                }
		            },
		            cardtrademoney: {
		                validators: {
		                    notEmpty: {
		                        message: '此项不能为空'
		                    },
		                }
		            },

		        }
		    }).on('success.form.bv', function(e) {
	            // Prevent form submission
	            e.preventDefault();
				console.log('走银行卡转账')
	            // Get the form instance
	            var $form = $(e.target);

	            // Get the BootstrapValidator instance
	            var bv = $form.data('bootstrapValidator');
	            var isuserEbao = $("[name='nouserebao']").bootstrapSwitch("state");
	            $(".fakeloader").fakeLoader({
	                spinner:"spinner2",
	                show:true
	            });
				if (isuserEbao) {
					$.post("trade/tradeByBlancetoCard.action", $form.serialize(), function(result) {
						$(".fakeloader").fakeLoader({
			                spinner:"spinner2",
			                show:false
			            });
						if (result.error==200) {
							 $("#msg").empty(); 
							 $("#msg").append(result.msg)
			               	 $("#isSuc").modal(); 
						}else{
							 $("#msg").empty(); 
							 $("#msg").append(result.msg)
			               	 $("#isSuc").modal(); 
						}
							
		            });
				} else {
					$.post("trade/tradeByCardtoCard.action", {tocardnum:$("#tocardnum").val(),usercardnum:$("#cardselect option:selected").text(),cardtrademoney:$("#cardtrademoney").val(),cardtradeinfo:$("#cardtradeinfo").val(),}, function(result) {
						$(".fakeloader").fakeLoader({
			                spinner:"spinner2",
			                show:false
			            });
						if (result.error==200) {
							 $("#msg").empty(); 
							 $("#msg").append(result.msg)
			               	 $("#isSuc").modal(); 
						}else{
							 $("#msg").empty(); 
							 $("#msg").append(result.msg)
			               	 $("#isSuc").modal(); 
						}
							
		            });
				}
	        });
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
          	//获得相关用户列表
          	$.post("trade/getRecentlyTradeUser.action",function(result){
	             if (result.error==200) {
	            	 $.each(result.msg,function(i,user){
	            		 var cl = 'top20'
	            		 if (i==1) {
							cl='top40'
						 }
	            		 if (i==4) {
							cl='top10'
						 }
	            		 if (i%2==0) {
							$("#aboutuserleftlist").append('<div class="zuijinlistbg '+cl+'">'+
				    				'<div class="row">'+
			    					'<div class="col-sm-4">'+
			    					'<img alt="" class="img-circle" style="width: 40;height: 40px;" src='+user.user_face+'>'+
			    					'</div>'+
			    					'<div class="col-sm-8" style="padding-right: 5px">'+
			    						'<div class="overstep top10" style="color: #999;margin-left: 5px;">'+user.user_name+'</div>'+
			    					'</div>'+
			    				'</div>'+
			    				'</div>')
						} else {
							$("#aboutuserrightlist").append('<div class="zuijinlistbg '+cl+'">'+
				    				'<div class="row">'+
			    					'<div class="col-sm-4">'+
			    					'<img alt="" class="img-circle" style="width: 40;height: 40px;" src='+user.user_face+'>'+
			    					'</div>'+
			    					'<div class="col-sm-8" style="padding-right: 5px">'+
			    						'<div class="overstep top10" style="color: #999;margin-left: 5px;">'+user.user_name+'</div>'+
			    					'</div>'+
			    				'</div>'+
			    				'</div>')
						}
		             })
			     }else{
			    	 $("#aboutuserlist").css("display","none");
			     } 
      		})
      		//E宝转账银行卡选择事件
          	$("#ebaoselect").change(function(){
          		var bla = $("#ebaoselect option:selected").val();
          		$("#cardblance").empty();
          		$("#cardblance").append(bla);
          	})
          	//银行卡转账银行卡选择时间
          	$("#cardselect").change(function(){
          		var bla = $("#cardselect option:selected").val();
          		console.log(bla)
          		$("#noebaocardblance").empty();
          		$("#noebaocardblance").append(bla);
          	})
		});
	//根据账号查名字
	$("#touser").blur(function(){
		$.post("user/getusername.action",{account:$('#tradetoefrom :input[name="touser"]').val()},function(result){
             if (result.valid) {
            	 $("#tousernamediv").fadeIn();
            	 $("#tousernamespan").empty();
            	 $("#tousernamespan").append(result.message);
		     }else{
		    	 $("#tousernamediv").fadeOut();
		     } 
      })
	})
	//根据卡号查名字
	$("#tocardnum").blur(function(){
		$.post("card/ishavecard.action",{cardnum:$('#tradetocfrom :input[name="tocardnum"]').val()},function(result){
             if (result.valid) {
            	 $("#tocardnumnamediv").fadeIn();
            	 $("#tocardnumnamespan").empty();
            	 $("#tocardnumnamespan").append(result.message);
		     }else{
		    	 $("#tocardnumnamediv").fadeOut();
		     } 
      })
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