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
<link rel="shortcut icon" type="image/x-icon"
	href="page/assets//img/tubiao.ico" />
<link rel="stylesheet" href="page/assets/css/fakeloader.css">
<style type="text/css">
.top20{
	margin-top: 20px
}
.top15{
	margin-top: 15px
}
.top10{
	margin-top: 10px
}
.top5{
	margin-top: 5px
}
.overstep{
	text-overflow:ellipsis; 
	white-space:nowrap;
	overflow:hidden;
}
.hand{
	cursor:pointer
}
div.hotdiv:hover{
	background-color:rgba(255,255,255,0.5);
	overflow: visible;
}
.hotdiv{
	border-radius: 10px 10px 10px 10px;
}
.nosingline{
	display: inline;
}
.textbottom{
	vertical-align:bottom;
}
.wenzizhidi{
	position:absolute;
	margin:5px 0px 5px 5px
}
.moretextoverstep{
	height:60px;
 	overflow : hidden;
  	text-overflow: ellipsis;
 	display: -webkit-box;
  	-webkit-line-clamp: 3;
  	-webkit-box-orient: vertical;
}
a.hota:link {color: #3f316d;text-decoration: none;}		/* 未访问的链接 */
a.hota:visited {color: #3f316d;text-decoration: none;}	/* 已访问的链接 */
a.hota:hover {color: #4C9ED9;text-decoration: none;}		/* 鼠标移动到链接上 */
a.hota:active {color: #3f316d;text-decoration: none;}    /* 选定的链接 */
</style>
<title></title>
</head>
<body style="background-image: url('page/assets/img/bg_grid.png');">
	<!-- 头部导航 -->
	<jsp:include page="../head_foot/head.html"></jsp:include>
	
	<div class="container">
		<div class="row">
			<!-- 左侧 -->
			<div class="col-sm-7">
				<!-- 主体列表 -->
				<div class="panel panel-default" style="border-radius: 10px 10px 10px 10px;;background-color: rgba(255,255,255,0.5);padding: 10px">
				<div class="panel-heading">
					<div id="nowlabel" class="top5" style="display: none;"> 
							<img  alt='' style='height: 30px;width: 30px;' src='page/assets/img/circle-shop.png'>
							<h4 class="nosingline wenzizhidi " style="color: #666666">当前标签</h4>
		  					<div class="well well-sm nosingline hotdiv hand top5" style="margin-left: 90px;position: relative;"><% out.print(request.getParameter("search")); %></div>
		  			</div>
					<div class="top15">
						<ul class="sync-pagination pagination-sm" style="margin: 0px"></ul>
					</div>
					<div id="topdiv" style="display: none;">
				  	
				  	</div>
				</div>
				  <div class="panel-body" id="list">
				  <!-- item -->
<!-- 				  	<div class="row hotdiv top10" style="background-color: rgba(255,255,255,0.8);padding: 15px"> -->
<!-- 				  		<div class="col-sm-2 top20" style="padding-left: 0px"> -->
<!-- 				  		图片 -->
<!-- 				  			<img  alt="" class="img-rounded" style="height: 100px;width: 100px" src="page/assets/img/touxiang_zhushou.jpg"> -->
<!-- 				  		</div> -->
<!-- 				  		<div class="col-sm-10"> -->
<!-- 				  			<div class="row" > -->
<!-- 				  				<div class="col-sm-1" > -->
<!-- 				  					<img  alt="" class="img-rounded" style="height: 20px;width: 20px;margin-top:10px;" src="page/assets/img/touxiang_zhushou.jpg"> -->
<!-- 				  				</div> -->
<!-- 				  				<div class="col-sm-10" style="padding-left: 0px"> -->
<!-- 				  				<h4 class="overstep"><a class="hand hota">啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</a></h4></div> -->
<!-- 				  				<div class="col-sm-1" style="padding-left: 0px;padding-top: 10px;color: #444">11/22</div> -->
<!-- 				  			</div> -->
<!-- 				  			<div class="row top5"> -->
<!-- 				  				<div class="col-sm-12"> -->
<!-- 				  				<p style="color: #888;" class="moretextoverstep">啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊 -->
<!-- 				  				啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊 -->
<!-- 				  				啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊 -->
<!-- 				  				啊啊啊啊啊啊啊啊啊啊啊啊 -->
<!-- 				  				啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊 -->
<!-- 				  				啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p></div> -->
<!-- 				  			</div> -->
<!-- 				  			<div class="row top5"> -->
<!-- 				  				<div class="col-sm-2" > -->
<!-- 									<img  alt='' style='height: 20px;width: 20px;' src='page/assets/img/circle-shop.png'> -->
<!-- 									<h5 class="nosingline wenzizhidi " style="color: #666666">标签</h5> -->
<!-- 								</div> -->
<!-- 				  				<div class="col-sm-10" style="padding-left: 0px"> -->
<!-- 				  					<div class="well well-sm hotdiv nosingline hand top5" style="margin-right: 5px">Win10</div> -->
<!-- 				  					<div class="well well-sm hotdiv nosingline hand top5" style="margin-right: 5px">Win10</div> -->
<!-- 				  				</div> -->
<!-- 				  			</div> -->
<!-- 				  		</div> -->
<!-- 				  	</div> -->
				  </div>
				  <div class="panel-footer">
			 		<div class="top15">
						<ul class="sync-pagination pagination-sm" style="margin: 0px"></ul>
					</div>
				  </div>
				</div>
			</div>
			<!-- 右侧 -->
			<div class="col-sm-4 col-sm-offset-1">
				<div class="list-group" >
						<a href="#" class="list-group-item touming active"style="background-color: #3f316d">
							<h4 class="list-group-item-heading" style="margin-top: 5px" >热门文章</h4>
						</a>
						<div id="hotlist" class='list-group-item ' style="background-color:rgba(0,0,0,0.1);">
						</div>
				</div>
				<div id="hotlabelpanel" class="panel panel-default"  style="background-color:rgba(0,0,0,0.1);">
				  <div class="panel-heading" style="background-color: #3f316d;color: white">
				  	<h4>热门标签</h4>
				  </div>
				  <div id="hotlabels" class="panel-body" style="line-height: 50px">
				  </div>
			   </div>
			</div>
			
		</div>
	</div>
	<div class="fakeloader"></div>
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<script src="page/assets/js/bootstrap.min.js"></script>
	<script src="page/assets/js/jquery.twbsPagination.js"></script>
	<script src="page/assets/js/fakeloader.js"></script>
	<!-- foot -->
	<jsp:include page="../head_foot/foot.html"></jsp:include>
	<script type="text/javascript">
	function queryParams(type,page,pid,sort,order){
		return {
			    search:type,
				limit:10,
				offset:(page-1)*10,
				timefmt:"MM/dd",
				index_pid:pid,
				sort:sort,
				order:order,
		}
	}
	function delHtmlTag(str){
		return str.replace(/<[^>]+>/g,"");//去掉所有的html标记
	}
	var first = true;
	function init(page,url){
		$(".fakeloader").fakeLoader({
            spinner:"spinner2",
            show:true
        });
		$.ajaxSettings.async = false;//为了获取总条数修改为同步
		$.getJSON(url, queryParams("<% out.print(request.getParameter("search")); %>",page,<% out.print(request.getParameter("pid")==null?-1:request.getParameter("pid")); %>,null,null),function(json){
			var after =	"</div></div></div></div>";
			if (first && json.top!=null) {
				var top = json.top;
				first = false;
				$("#topdiv").css("display","inline");
				var content = delHtmlTag(top.index_content);
				var begin =	"<div class='row hotdiv top10' style='background-color: rgba(255,255,255,0.8);padding: 15px'><div class='col-sm-2 top20' style='padding-left: 0px'><img  alt='' class='img-rounded' style='height: 100px;width: 100px' src='page/assets/img/touxiang_zhushou.jpg'></div><div class='col-sm-10'><div class='row' ><div class='col-sm-1' ><img  alt='' class='img-rounded' style='height: 20px;width: 20px;margin-top:10px;' src='page/assets/img/indextopicon.png'></div><div class='col-sm-10' style='padding-left: 0px'><h4 class='overstep'><a target='_blank' class='hand hota' href='index/articledetail.action?id="+top.index_id+"' style='color: #B22222;'>"+top.index_title+"</a></h4></div><div class='col-sm-1' style='padding-left: 0px;padding-top: 10px;color: #444'>"+top.index_uptime_format+"</div></div><div class='row top5'><div class='col-sm-12'><p style='color: #888;' class='moretextoverstep'>"+content+"</p></div></div><div class='row top5'><div class='col-sm-2' ><img  alt='' style='height: 20px;width: 20px;' src='page/assets/img/circle-shop.png'><h5 class='nosingline wenzizhidi ' style='color: #666666'>标签</h5></div><div class='col-sm-10' style='padding-left: 0px'>";
			  	var labels = "";
			  	if(top.index_label!=null){
	  				$.each(top.index_label.split(","),function(i,label){
						labels+="<div class='well well-sm hotdiv nosingline hand top5' style='margin-right: 5px'><a class='hota' href='page/article/articlelist.jsp?search="+label+"'>"+label+"</a></div>";
	  				})
			  	}
  				$("#topdiv").append(begin+labels+after);
			}
			$("#list").empty();
			$.each(json.rows,function(i,jo){
				var src;
				if (jo.index_state=="01"||jo.index_state=="11") {
					src = 'indexhoticon.png';
				} else {
					src = 'indexnomalicon.png';
				}
				var content = delHtmlTag(jo.index_content);
				var begin =	"<div class='row hotdiv top10' style='background-color: rgba(255,255,255,0.8);padding: 15px'><div class='col-sm-2 top20' style='padding-left: 0px'><img  alt='' class='img-rounded' style='height: 100px;width: 100px' src='page/assets/img/touxiang_zhushou.jpg'></div><div class='col-sm-10'><div class='row' ><div class='col-sm-1' ><img  alt='' class='img-rounded' style='height: 20px;width: 20px;margin-top:10px;' src='page/assets/img/"+src+"'></div><div class='col-sm-10' style='padding-left: 0px'><h4 class='overstep'><a target='_blank' class='hand hota' href='index/articledetail.action?id="+jo.index_id+"'>"+jo.index_title+"</a></h4></div><div class='col-sm-1' style='padding-left: 0px;padding-top: 10px;color: #444'>"+jo.index_uptime_format+"</div></div><div class='row top5'><div class='col-sm-12'><p style='color: #888;' class='moretextoverstep'>"+content+"</p></div></div><div class='row top5'><div class='col-sm-2' ><img  alt='' style='height: 20px;width: 20px;' src='page/assets/img/circle-shop.png'><h5 class='nosingline wenzizhidi ' style='color: #666666'>标签</h5></div><div class='col-sm-10' style='padding-left: 0px'>";
			  	var labels="";
			  	if(jo.index_label!=null){
	  				$.each(jo.index_label.split(","),function(i,label){
						labels+="<div class='well well-sm hotdiv nosingline hand top5' style='margin-right: 5px'><a class='hota' href='page/article/articlelist.jsp?search="+label+"'>"+label+"</a></div>";
	  				})
			  	}
  				$("#list").append(begin+labels+after);
  				$(".fakeloader").fakeLoader({
  		            spinner:"spinner2",
  		            show:false
  		        });
			});
		});
	}
	
	$(document).ready(function(){
		document.title = "${type}";
		var url = "index/Allnotice.action";
		if (eval("<% out.print(request.getParameter("search")!=null?true:false); %>")) {
			$("#nowlabel").css("display","inline-block");
			url = "index/aboutnotice.action";
		}
		$.getJSON(url, queryParams("<% out.print(request.getParameter("search")); %>",1,<% out.print(request.getParameter("pid")); %>,null,null),function(json){
			console.log(json.total)
			 $('.sync-pagination').twbsPagination({
			        totalPages: Math.ceil(json.total/10),
			        visiblePages: 7,
			        first:"首页",
			        prev:"前一页",
			 		next:"后一页",
			 		last:"尾页",
			        onPageClick: function (event, page) {
			        	init(page,url);
			        }
			  });
		});
		$.getJSON("index/Allnotice.action",queryParams(null,1,-1,"index_hitsnum",null), function(json){
			$.each(json.rows,function(i,jo){
				var src;
				if (jo.index_state=="01"||jo.index_state=="11") {
					src = 'indexhoticon.png';
				} else {
					src = 'indexnomalicon.png';
				}
				$("#hotlist").append("<div class='row hotdiv top10'><div class='col-sm-10 overstep' style='z-index: 10'><img alt='' style='height: 25px; width: 25px' src='page/assets/img/"+src+"'><a target='_blank' href='index/articledetail.action?id="+jo.index_id+"' style='margin-left: 5px;font-size: 18px' class='hota hand textbottom'>"+jo.index_title+"</a> </div> <div class='col-sm-1 timestyle' style='padding-left: 0px;z-index: 9'><span class='badge'>"+jo.index_hitsnum+"</span></div></div>");
			});
		});
		$.getJSON("index/getHotLabel.action", {num:15}, function(json){
			$.each(json,function(i,jo){
				$("#hotlabels").append("<a href='page/article/articlelist.jsp?search="+jo.value+"' style='padding: 10px;background-color:rgba(255,255,255,0.5);margin-right: 5px;' class='hotdiv hota'>"+jo.value+"</a>");
			});
		});
	})
	if (!(document.documentElement.clientHeight < document.documentElement.offsetHeight-4)) {
		$("#foot").removeClass("navbar-fixed-bottom");
	}
	</script>
</body>
</html>