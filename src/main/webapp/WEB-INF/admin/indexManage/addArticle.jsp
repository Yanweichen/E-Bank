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
<!-- <link href="page/assets/css/bootstrap-combined.min.css" rel="stylesheet"> -->
<link rel="stylesheet" href="page/assets/css/bootstrap.css">
<link rel="stylesheet" href="page/assets/css/bootstrap-table.css">
<link rel="stylesheet" href="page/assets/css/bootstrap-wysiwyg.css">
<link rel="stylesheet" href="page/assets/css/tokenfield-typeahead.css">
<link rel="stylesheet" href="page/assets/css/bootstrap-tokenfield.css">
<link rel="stylesheet" href="page/assets/css/cropper.css">
<link rel="stylesheet" href="page/assets/css/fakeloader.css">
<!-- 编辑框需要的图表来源  必须是3.0.2版本 -->
<link href="http://cdn.bootcss.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
<style type="text/css">
.docs-preview {
  margin-right: -15px;
  margin-bottom: 10px;
}
.img-preview {
  float: left;
  margin-right: 10px;
  margin-bottom: 10px;
}
.preview-lg {
  width: 263px;
  height: 148px;
}

.preview-md {
  width: 139px;
  height: 78px;
}

.preview-sm {
  width: 69px;
  height: 39px;
}

.preview-xs {
  width: 35px;
  height: 20px;
  margin-right: 0;
}
</style>
<title>添加文章</title>
</head>
<body style="background-image: url('page/assets/img/bg_grid.png');">
<div class="row" style="padding: 20px">
	<div class="col-sm-6">
		<div class="row">
		  <div class="col-sm-12">
		      <!-- 来源 -->
	    <div class="form-group">
		   <!-- Split button -->
			<div class="btn-group">
			  <button  id="frombtn" type="button" class="btn btn-default">原创</button>
			  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    <span class="caret"></span>
			    <span class="sr-only">Toggle Dropdown</span>
			  </button>
			  <ul class="dropdown-menu">
			    <li id="fromself"><a href="javascript:void(0)">原创</a></li>
			    <li id="fromother"><a href="javascript:void(0)">来自其他网站</a></li>
			  </ul>
			</div>
	    </div>
	    <!-- 显示或隐藏 -->
	    <div id = "fromdiv" style="display: none;">
		    <div class="form-group">
			   <div class="input-group">
			      <div class="input-group-btn">
			      	<button type="button" class="btn btn-default" 
		                     tabindex="-1">来源
		            </button>
			      </div><!-- /btn-group -->
			        <input type="text" class="form-control" id="index_from" />
			    </div><!-- /input-group -->
		    </div>
		    <div class="form-group">
			   <div class="input-group">
			      <div class="input-group-btn">
			      	<button type="button" class="btn btn-default" 
		                     tabindex="-1">链接
		            </button>
			      </div><!-- /btn-group -->
			        <input type="text" class="form-control" id="index_href" />
			    </div><!-- /input-group -->
		    </div>
	    </div>
	    
	     <!-- 来源 END-->
		  <!-- 标题-->
		  <div class="form-group">
		    <div class="input-group">
		      <div class="input-group-btn">
		      	<button type="button" class="btn btn-default" 
	                     tabindex="-1">标题
	            </button>
		        <button id="selectType" type="button" class="btn btn-default dropdown-toggle" 
		        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">活动&nbsp;&nbsp;<span class="caret"></span></button>
		        <ul class="dropdown-menu">
		          <li id="activity"><a href="javascript:void(0)">活动</a></li>
		          <li id="notice"><a href="javascript:void(0)">公告</a></li>
		        </ul>
		      </div><!-- /btn-group -->
		      <input id="title" type="text" class="form-control">
		   </div><!-- /input-group -->
		 </div><!-- /form-group -->
	    <!-- 标签 -->
	    <div class="form-group">
		   <div class="input-group">
		      <div class="input-group-btn">
		      	<button type="button" class="btn btn-default" 
	                     tabindex="-1">标签
	            </button>
		      </div><!-- /btn-group -->
		        <input type="text" class="form-control" id="label" value="关键词1,关键词2,关键词3" />
		    </div><!-- /input-group -->
	    </div>
		</div><!-- /.col-lg-6 -->
	  </div>
	  <div class="form-group">
			<button id="headimage" type="button" class="btn btn-primary btn-lg btn-block">请选择预览图片</button>
	  </div>
	  <div class="form-group">	
	  		<img id="selectedimg" class="img-rounded">
	  </div>
	<!-- 富文本编辑器 -->
	<div class="row">
		<div class="col-sm-12" >
			<div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
	      <div class="btn-group">
	        <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="icon-font"></i><b class="caret"></b></a>
	          <ul class="dropdown-menu">
	          </ul>
	        </div>
	      <div class="btn-group">
	        <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="icon-text-height"></i>&nbsp;<b class="caret"></b></a>
	          <ul class="dropdown-menu">
	          <li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
	          <li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
	          <li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
	          </ul>
	      </div>
	      <div class="btn-group">
	        <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="icon-bold"></i></a>
	        <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a>
	        <a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="icon-strikethrough"></i></a>
	        <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="icon-underline"></i></a>
	      </div>
	      <div class="btn-group">
	        <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="icon-list-ul"></i></a>
	        <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="icon-list-ol"></i></a>
	        <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="icon-indent-left"></i></a>
	        <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="icon-indent-right"></i></a>
	      </div>
	      <div class="btn-group">
	        <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>
	        <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a>
	        <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a>
	        <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>
	      </div>
	      <div class="btn-group">
			  <a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="icon-link"></i></a>
			    <div class="dropdown-menu input-append">
				    <input class="span2" placeholder="URL" type="text" data-edit="createLink"/>
				    <button class="btn" type="button">Add</button>
	        </div>
	        <a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="icon-cut"></i></a>
	      </div>
	      
	      <div class="btn-group">
	        <a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="icon-picture"></i></a>
	        <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
	      </div>
	      <div class="btn-group">
	        <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="icon-undo"></i></a>
	        <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
	      </div>
	      <input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="">
	    </div>
		    <div id="editor">
		    	<!-- 编辑区域 -->
		    </div>
		</div>
	</div>
		<div class="row" style="margin-top: 20px">
			<div class="col-sm-6" >
				<button id="submit" type="button" class="btn btn-default btn-lg btn-block">提交</button>
			</div>
			<div class="col-sm-6">
				<button id="previewbtn" type="button" class="btn btn-default btn-lg btn-block">预览</button>
			</div>
		</div>
	</div>
	<div class="col-sm-6">
		<div id="preview" class="well well-lg" style="height: 800px"></div>
	</div>
</div><!-- /.row -->
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
		
		<div id="inputimage" class="modal fade">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">上传预览图</h4>
		      </div>
		      <div class="modal-body">
		      <div align="center">
		      	<img id="headimageedit" src="page/assets/img/touxiang_zhushou.jpg">
			           <!-- Msg -->
  						<div id="imagemsg" class="alert alert-danger docs-alert" style="display: none;"><span class="warning message"></span></div>
					        <!-- button group begin -->
					        <div class="btn-group" style="margin-top: 30px">
					          <label class="btn btn-primary btn-upload" for="inputImage" title="Upload image file">
					            <input class="sr-only" id="inputImage" name="file" type="file" accept="image/*">
					            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="Import image with Blob URLs">
					              <span class="icon-picture"></span>
					            </span>
					          </label>
					          <button class="btn btn-primary" data-method="setDragMode" data-option="move" type="button" title="Move">
					            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;setDragMode&quot;, &quot;move&quot;)">
					              <span class="icon-move"></span>
					            </span>
					          </button>
					          <button class="btn btn-primary" data-method="setDragMode" data-option="crop" type="button" title="Crop">
					            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;setDragMode&quot;, &quot;crop&quot;)">
					            	<span class="icon-fullscreen"></span>
					            </span>
					          </button>
					          <button class="btn btn-primary" data-method="zoom" data-option="0.1" type="button" title="Zoom In">
					            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;zoom&quot;, 0.1)">
					              <span class="icon-zoom-in"></span>
					            </span>
					          </button>
					          <button class="btn btn-primary" data-method="zoom" data-option="-0.1" type="button" title="Zoom Out">
					            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;zoom&quot;, -0.1)">
					              <span class="icon-zoom-out"></span>
					            </span>
					          </button>
					          <button class="btn btn-primary" data-method="rotate" data-option="-45" type="button" title="Rotate Left">
					            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;rotate&quot;, -45)">
					              <span class="icon-reply"></span>
					            </span>
					          </button>
					          <button class="btn btn-primary" data-method="rotate" data-option="45" type="button" title="Rotate Right">
					            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;rotate&quot;, 45)">
					              <span class="icon-share-alt"></span>
					            </span>
					          </button>
					           <button class="btn btn-primary" data-method="reset" type="button" title="Reset">
					            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;reset&quot;)">
					              <span class="icon-refresh"></span>
					            </span>
					          </button>
							</div>
							<!-- button group end -->
		      
		      </div>
		       		
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		        <button id="imagefinshbtn" type="button" class="btn btn-primary">完成</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		<div class="fakeloader"></div>
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<script src="page/assets/js/bootstrap.min.js"></script>
	<script src="page/assets/js/bootstrap-wysiwyg.js"></script>
	<script src="page/assets/js/jquery.hotkeys.js"></script>
	<script src="page/assets/js/bootstrap-tokenfield.js"></script>
	<script src="page/assets/js/typeahead.bundle.js"></script>
	<script src="page/assets/js/cropper.js"></script>
	<script src="page/assets/js/cropper_custom.js"></script>
	<script src="page/assets/js/fakeloader.js"></script>
	<script type="text/javascript">
	function initToolbarBootstrapBindings() {
	    var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier', 
	          'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
	          'Times New Roman', 'Verdana'],
	          fontTarget = $('[title=Font]').siblings('.dropdown-menu');
	    $.each(fonts, function (idx, fontName) {
	        fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
	    });
	    $('a[title]').tooltip({container:'body'});
	  	$('.dropdown-menu input').click(function() {return false;})
			    .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
	      .keydown('esc', function () {this.value='';$(this).change();});
	
	    $('[data-role=magic-overlay]').each(function () { 
	      var overlay = $(this), target = $(overlay.data('target')); 
	      overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
	    });
	    if ("onwebkitspeechchange"  in document.createElement("input")) {
	      var editorOffset = $('#editor').offset();
	      $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
	    } else {
	      $('#voiceBtn').hide();
	    }
		};
	function showErrorAlert (reason, detail) {
		var msg='';
		if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
		else {
			console.log("error uploading file", reason, detail);
		}
		$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
		 '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
	};
  	initToolbarBootstrapBindings(); 
	$('#editor').wysiwyg({ fileUploadError: showErrorAlert} );
	var type = 2;//类型
	$("#activity").click(function () {
		type=2;
		$("#selectType").empty();
		$("#selectType").append("活动&nbsp;&nbsp;<span class='caret'></span>");
	});
	$("#notice").click(function () {
		type=1;
		$("#selectType").empty();
		$("#selectType").append("公告&nbsp;&nbsp;<span class='caret'></span>");
	});
	function from(){
		return {
			index_type : type,
			index_title : $("#title").val(),
			index_content : $("#editor").html(),
			index_label : $("#label").val(),
			index_from : $("#index_from").val(),
			index_href : $("#index_href").val(),
			index_preview_image_url:imageresult
		}
	}
	$("#submit").click(function () {
		$(".fakeloader").fakeLoader({
	            spinner:"spinner2",
	            show:true
	        });
		$.post("index/addnotice.action",from(),function(result){
			$(".fakeloader").fakeLoader({
		            spinner:"spinner2",
		            show:false
		        });
			if (result.error==200) {
				showMsg(result.msg);
			}else{
				showMsg(result.msg);
			}
		})
	});
	$("#previewbtn").click(function () {
		$("#preview").empty();
		$("#preview").html($("#editor").html());
	});
	var imageresult;
	$("#imagefinshbtn").click(function () {
		imageresult = $('#headimageedit').cropper("getCroppedCanvas"); 
		$("#selectedimg").html(imageresult);
		$("#selectedimg > canvas").addClass("img-rounded");
		$("#selectedimg > canvas").css({
			"max-width":'100px',
			"max-height":'100px'
		})
		imageresult = imageresult.toDataURL(); 
		$("#inputimage").modal('hide')
		$("#headimage").removeClass("btn-default");
		$("#headimage").addClass("btn-success");
		$("#headimage").text("添加预览图成功")
	});
	function showMsg(msg) {
		$("#msg").empty(); 
        $("#msg").append(msg)
		$("#isSuc").modal(); 
	}
	$(document).ready(function(){
		$.getJSON("index/getAllLabel.action", function(json){
			var engine = new Bloodhound({
				  local: json,
				  datumTokenizer: function(d) {
				    return Bloodhound.tokenizers.whitespace(d.value);
				  },
				  queryTokenizer: Bloodhound.tokenizers.whitespace
				});

				engine.initialize();
				$('#label').tokenfield({
					  typeahead: [null, { source: engine.ttAdapter() }],
					  beautify:false
				});
		});
		
	})
	
	$("#headimage").click(function() {
		$("#inputimage").modal(); 
	})	
	$("#fromself").click(function() {
		$("#frombtn").empty();
		$("#frombtn").append("原创");
		$("#fromdiv").fadeOut("slow");
		
	})
	$("#fromother").click(function() {
		$("#frombtn").empty();
		$("#frombtn").append("来自其他网站");
		$("#fromdiv").fadeIn("slow");
	})
</script>
</body>
</html>