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
<link rel="stylesheet" href="page/assets/css/cropper.css">
<link rel="stylesheet" href="page/assets/css/fakeloader.css">
<link href="http://cdn.bootcss.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
<style type="text/css">
#setlist .list-group-item{
	border:0;
	background-color: rgba(255,255,255,0.3);
	cursor:pointer;
}
#setlist .list-group-item:hover{
	border:0;
	background-color: rgba(255,255,255,0.9);
	cursor:pointer;
}
.bottom20{
	margin-bottom: 20px;
}
</style>

<title>修改头像</title>
</head>
<body style="background-image: url('page/assets/img/bg_grid.png');">
	<!-- 头部导航 -->
	<jsp:include page="../../../page/head_foot/mybank_head.jsp"></jsp:include>
	
	<div class="container top20">
		<div class="row">
			<div class="col-sm-3">
				<div id="setlist" class="list-group touming6">
				  <a href="myAccount/accountSet.action" class="list-group-item">
				  	<i class="icon-user" style="font-size: 20px;color: #3f316d"></i>&nbsp;&nbsp;基本信息
				  	<i class="icon-angle-right" style="font-size: 20px;color: #3f316d;float: right;"></i>
				  </a>
				  <a href="javascript:void(0)" class="list-group-item" style="background-color: #3f316d;border-color: #3f316d;color: white;">
				  	<i class="icon-github-alt" style="font-size: 19px;color: white;"></i>&nbsp;&nbsp;修改头像
				  	<i class="icon-angle-right" style="font-size: 20px;color: white;float: right;"></i>
				  </a>
				  <a href="myAccount/setPassword.action" class="list-group-item">
				  	<i class="icon-key" style="font-size: 19px;color: #3f316d;"></i>&nbsp;&nbsp;修改密码
				  	<i class="icon-angle-right" style="font-size: 20px;color: #3f316d;float: right;"></i>
				  </a>
				</div>
			</div>
			<div class="col-sm-9">
				<div class="col-sm-6">
				<form id="upimage" enctype="multipart/form-data">
				<div class="form-group">	
				  	<img id="headimageedit" src="page/assets/img/touxiang_zhushou.jpg">
			           <!-- Msg -->
  						<div id="imagemsg" class="alert alert-danger docs-alert" style="display: none;"><span class="warning message"></span></div>
  						<div align="center">
					        <!-- button group begin -->
					        <div class="btn-group" style="margin-top: 30px">
					          <label class="btn btn-primary btn-upload btncolor" for="inputImage" title="Upload image file">
					            <input class="sr-only" id="inputImage" name="FileContent" type="file" accept="image/*">
					            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="点击上传你的图片">
					              <span class="icon-picture"></span>
					            </span>
					          </label>
					          <button class="btn btn-primary btncolor" data-method="setDragMode" data-option="move" type="button" title="Move">
					            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;setDragMode&quot;, &quot;move&quot;)">
					              <span class="icon-move"></span>
					            </span>
					          </button>
					          <button class="btn btn-primary btncolor" data-method="setDragMode" data-option="crop" type="button" title="Crop">
					            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;setDragMode&quot;, &quot;crop&quot;)">
					            	<span class="icon-fullscreen"></span>
					            </span>
					          </button>
					          <button class="btn btn-primary btncolor" data-method="zoom" data-option="0.1" type="button" title="Zoom In">
					            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;zoom&quot;, 0.1)">
					              <span class="icon-zoom-in"></span>
					            </span>
					          </button>
					          <button class="btn btn-primary btncolor" data-method="zoom" data-option="-0.1" type="button" title="Zoom Out">
					            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;zoom&quot;, -0.1)">
					              <span class="icon-zoom-out"></span>
					            </span>
					          </button>
					          <button class="btn btn-primary btncolor" data-method="rotate" data-option="-45" type="button" title="Rotate Left">
					            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;rotate&quot;, -45)">
					              <span class="icon-reply"></span>
					            </span>
					          </button>
					          <button class="btn btn-primary btncolor" data-method="rotate" data-option="45" type="button" title="Rotate Right">
					            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;rotate&quot;, 45)">
					              <span class="icon-share-alt"></span>
					            </span>
					          </button>
					           <button class="btn btn-primary btncolor" data-method="reset" type="button" title="Reset">
					            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;reset&quot;)">
					              <span class="icon-refresh"></span>
					            </span>
					          </button>
					        </div>
						</div>
					</div>
					</form>
				</div>
				<div class="col-sm-6">
					<button id="saveimg" type="button" class="btn btncolor btn-primary btn-lg btn-block">保存</button>
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
	<script src="page/assets/js/cropper.js"></script>
	<script src="page/assets/js/cropper_custom.js"></script>
	<script src="page/assets/js/jquery.form.js"></script>
	<script src="page/assets/js/fakeloader.js"></script>
	<script type="text/javascript">
	$("#foot").removeClass("navbar-fixed-bottom");
		$("#saveimg").click(function(){
			$(".fakeloader").fakeLoader({
                spinner:"spinner2",
                show:true
            });
			var imageresult = $('#headimageedit').cropper("getCroppedCanvas");
			imageresult = imageresult.toDataURL();
			$.post("user/upLoadFace.action",{url:imageresult},function(json){
				$(".fakeloader").fakeLoader({
	                spinner:"spinner2",
	                show:false
	            });
				$("#msg").empty(); 
				$("#msg").append(json.msg)
               	$("#isSuc").modal(); 
			})
// 			$.getJSON("other/getImageSignature.action", { type: "upload", fileid: null }, function(json){
// 				var sign = json.sign,
// 			    url = 'http://web.image.myqcloud.com/photos/v2/10021396/sourceimg/0/?sign=' + encodeURIComponent(sign);
// 				$.ajax({
// 					   type: "POST",
// 					   url:url,
// 					   data: {"FileContent":imageresult},
// 					   contentType:"multipart/form-data",
// 					   success: function(msg){
// 					     alert(msg);
// 					   }
// 				});
// 				$.post(url,$("#upimage").serialize(),function(data){
// 					alert(data)
// 				})
				
// 				var options = { 
//                     type: 'post',
//                     url: url,
//                     dataType: 'json',
// 				    success:function(ret) { 
// 				    	alert(ret)
// 				    },
// 				    error:function (ret) {
// 				    	alert(ret.responseText);
// 				    }
// 				}; 
// 				// pass options to ajaxForm 
// 				$('#uploadForm').ajaxForm(options);
// 			});
			
		})
	</script>
</body>
</html>