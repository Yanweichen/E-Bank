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
<link rel="stylesheet" href="page/assets/css/bootstrapValidator.min.css"/>
<link href="http://cdn.bootcss.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
<style type="text/css">
</style>
<title>我的消息</title>
</head>
<body style="background-image: url('page/assets/img/bg_grid.png');">
	<!-- 头部导航 -->
	<jsp:include page="../../../page/head_foot/mybank_head.jsp"></jsp:include>
	
	<div class="container top20">
		<div class="row">
			<div class="col-sm-3">
				<div id="setlist" class="list-group touming6">
				  <a id="noviewa" href="msg/msgBox.action?state=noview&limit=5&offset=0" class="list-group-item">
				  	<i class="icon-envelope-alt noviewi"></i>&nbsp;&nbsp;未读消息
				  	<i class="icon-angle-right noviewi" style="float: right;"></i>
				  </a>
				  <a id="isviewa" href="msg/msgBox.action?state=isview&limit=5&offset=0" class="list-group-item">
				  	<i class="icon-envelope isviewi" ></i>&nbsp;&nbsp;已读消息
				  	<i class="icon-angle-right isviewi" style="float: right;"></i>
				  </a>
				   <a id="alla" href="msg/msgBox.action?limit=5&offset=0" class="list-group-item">
				  	<i class="icon-folder-close alli"></i>&nbsp;&nbsp;全部消息
				  	<i class="icon-angle-right alli" style="float: right;"></i>
				  </a>
				</div>
			</div>
			<div class="col-sm-9">
				<div class="panel panel-default touming6">
					<div class="panel-heading">
				  		<button id="selectallbtn" type="button" class="btn btn-default btncolor" style="margin-right: 10px;margin-left: 10px;">全选</button>
				  		<button id="deletebtn" type="button" class="btn btn-default btncolor">删除</button>
				  	</div>
				  <div class="panel-body">
				  <c:forEach var="msg" items="${msglist}">
					  	<div class="panel panel-default touming6">
					  		<div class="panel-body">
					  			<h5 class="hand <c:if test="${msg.msgState}">titleisview</c:if>
					  			 <c:if test="${!msg.msgState}">titlenoview</c:if>" style="float: left;margin-right: 20px;">
					  			<input type="checkbox" name="ckbox" class="ckbox" value="${msg.msgId}">&nbsp;&nbsp;
					  			<i class="icon-envelope" style="font-size: 19px;color: #3f316d"></i>&nbsp;&nbsp;
					  			<span id="${msg.msgId}" class="msg">${msg.msgTitle}<span style="display: none;">${msg.msgContent}</span></span></h5>
					  			<h5 class="hand" style="color: #999999;float: right;" >${msg.msgTime_fmt}</h5>
					  		</div>
					  	</div>
				  	</c:forEach>
				  </div>
				  <div class="panel-footer">
			 		<div class="top15" align="right">
						<ul class="sync-pagination pagination-sm" style="margin: 0px"></ul>
					</div>
				  </div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="msgbox" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel" id="msgboxtitle">消息</h4>
	      </div>
	      <div class="modal-body">
	      	<blockquote>
			  <p id="msgcontent"></p>
			  <footer>此消息来自于<cite title="Source Title">系统管理员</cite></footer>
			</blockquote>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default btncolor" data-dismiss="modal">取消</button>
	        <button type="button" id="isview" class="btn btn-primary btncolor">我知道了</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- foot -->
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<jsp:include page="../../../page/head_foot/foot.jsp"></jsp:include>
	<script src="page/assets/js/jquery.easing.1.3.js"></script>
	<script src="page/assets/js/bootstrap.min.js"></script>
	<script src="page/assets/js/jquery.twbsPagination.js"></script>
	<script type="text/javascript" src="page/assets/js/bootstrapValidator.min.js"></script> 
	<script type="text/javascript">
	var state = "<% out.print(request.getParameter("state")==null?"":request.getParameter("state")); %>";
	var offset = "<% out.print(request.getParameter("offset")==null?"":request.getParameter("offset")); %>";
	function init(){
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
		init()
		$.getJSON("msg/getTotalByState.action",{"state":state},function(json){
			 $('.sync-pagination').twbsPagination({
			        totalPages: Math.ceil(json.msg/5),
			        initiateStartPageClick :false,//初始化不点击
			        startPage:offset/5+1,
			        visiblePages: 7,
			        first:"首页",
			        prev:"前一页",
			 		next:"后一页",
			 		last:"尾页",
			        onPageClick: function (event, page) {
			        	var url = window.location.href;
			        	var offset=(page-1)*5
			        	var pageurl = url.substr(0,url.lastIndexOf("=")+1)+offset; 
			        	window.location= pageurl;
			        }
			  });
		});
	});
	var msgid;
	$(".msg").live('click',function() {
		var content = $(this).find('span').html()
		msgid = $(this).attr("id");
		$("#msgcontent").empty();
		$("#msgcontent").append(content);
		$('#msgbox').modal('show');
	})
	$("#isview").click(function(){
		$.post("msg/alertmsgstate.action",{id:msgid},function(result){
			if (result.error==200) {
				$('#msgbox').modal('hide');
			} else {
				alert("请检查您的网络");
			}
		})
	})
	//全选
	var flag = true;
	$('#selectallbtn').click(function(){
		if (flag) {
			$(".ckbox").attr("checked",true);
			$('#selectallbtn').text("取消")
			flag = false;
		} else {
			$(".ckbox").attr("checked",false);
			$('#selectallbtn').text("全选")
			flag = true;
		}
	})
	$('#deletebtn').click(function(){
		var ids=new Array()
		var j = 0;
  		$('input:checkbox[name=ckbox][checked]').each(function(){
  		     ids[j] = $(this).val();
             j++;
        });
  		$.post("msg/deleteMoreMsg.action",{ids:ids},function(result){
  			if (result.error==200) {
	  			window.location.reload() 
			}else{
				alert("删除失败")
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