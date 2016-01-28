<%@page import="com.bank.model.index.IndexModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	href="<%=basePath%>page/assets//img/tubiao.ico" />
<title>注册</title>
<style type="text/css">
.top20{
	margin-top: 20px
}
.top10{
	margin-top: 10px
}
.top5{
	margin-top: 5px
}
.touming{
	background-color:rgba(0,0,0,0.1);
	border: 0;
}
.nosingline{
	display: inline;
}
.wenzizhidi{
	position:absolute;
	margin:5px 0px 5px 5px
}
.titlewenzizhidi{
	position:absolute;
	margin:3px 0px 5px 5px
}
.updownwenzizhidi{
	position:absolute;
	margin:5px 0px 5px 5px
}
a{
	cursor:pointer;
	text-decoration: none;
}
a:hover {text-decoration: none;}		/* 鼠标移动到链接上 */
.overstep{
	text-overflow:ellipsis; 
	white-space:nowrap;
	overflow:hidden;
}
a.hota:link {color: #3f316d;text-decoration: none;}		/* 未访问的链接 */
a.hota:visited {color: #3f316d;text-decoration: none;}	/* 已访问的链接 */
a.hota:hover {color: #4C9ED9;text-decoration: none;}		/* 鼠标移动到链接上 */
a.hota:active {color: #3f316d;text-decoration: none;}    /* 选定的链接 */
.textbottom{
	vertical-align:bottom;
}
.timestyle{
	color: #666666;
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
</style>
</head>
<body style="background-image: url('page/assets/img/bg_grid.png');">
	<!-- 头部导航  -->
	<jsp:include page="../head_foot/head.html"></jsp:include>
	<div class="container">
		<div class="row" >
		<!-- 左侧部分 -->
			<div class="col-sm-7">
				<div id="title" align="center"><h2>${article.index_title}</h2></div>
				<div class="row top20">
					<div class="col-sm-3 col-sm-offset-1" style="color: #777777">
					<img  alt='' style='height: 20px;width: 20px;' src='page/assets/img/circle-calendar.png'>
					<h5 class="nosingline titlewenzizhidi" style="text-align:center;">${article.index_uptime_format}</h5></div>
					<div class="col-sm-3" style="color: #777777">
					<img  alt='' style='height: 20px;width: 20px;' src='page/assets/img/circle_global.png'>
					来源：
						<c:choose>
						   <c:when test="${!empty article.index_from}">  
								<a href="${article.index_href}">${article.index_from}</a>
						   </c:when>
						   <c:otherwise> 
								<a href="javascript:void(0)">本站原创</a>
						   </c:otherwise>
						</c:choose>
					</div>
					<div class="col-sm-4" style="color: #777777">
					<img  alt='' style='height: 20px;width: 20px;' src='page/assets/img/circle_profle.png'>
					发布者:${article.upfrom}</div>
				</div>
				<div class="well row top20" style="background-color: white;border-radius: 10px 10px 10px 10px;">
					<p style="color: #444444;">
					${article.index_content}
					</p>
				</div>
				<div class="row top20">
					<div class="col-sm-4 overstep" style="padding-left: 0px">
						<div class="overstep" >
							<img  alt="" style="height: 20px;width: 20px" src="<%=basePath%>page/assets/img/circle-arrow-up.png">
							<a target='_blank' id="beforearticle"style='margin-left: 3px;' class="hand textbottom"></a>
						</div>
					</div>
					<div class="col-sm-4 col-sm-offset-4 overstep">
						<div class="overstep" >
							<img  alt="" style="height: 20px;width: 20px" src="<%=basePath%>page/assets/img/circle-arrow-down.png">
							<a target='_blank' id="afterarticle"style='margin-left: 3px;' class="hand textbottom"></a>
						</div>
					</div>
				</div>
				<div class="row top20">
					<div class="row">
						<div class="col-sm-2" style="padding-left: 5px;">
							<img  alt='' style='height: 30px;width: 30px;' src='page/assets/img/circle-shop.png'>
							<h4 class="nosingline wenzizhidi" style="color: #666666">本文标签</h4>
						</div>
						<div class="col-sm-7" style="margin-top: 5px">
							<c:set value="${fn:split(article.index_label,',')}" var="labels" />
							<c:forEach var="lb" items="${labels}">
								<div class="well well-sm hotdiv nosingline hand" style="margin-right: 5px">
								<a class="hota" href='page/article/articlelist.jsp?search="+${lb}+"'>${lb}</a></div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- 相关文章 -->
				<div class="row top20">
					<div class="row">
						<div class="col-sm-5" style="padding-left: 5px">
							<img  alt='' style='height: 30px;width: 30px;' src='page/assets/img/circle-document.png'>
							<h4 class="nosingline wenzizhidi" style="color: #666666">相关文章</h4>
						</div>
					</div>
					<div class="row top10" id="aboutlist">
<!-- 								<div class="col-sm-3" style="text-align: center;"> -->
<%-- 									<img class="img-rounded"  alt="" style="height: 100px;width: 100px" src="<%=basePath%>page/assets/img/indexnomalicon.png"> --%>
<!-- 									<div class="overstep top5" > -->
<%-- 										<img  alt="" style="height: 20px;width: 20px" src="<%=basePath%>page/assets/img/indexnomalicon.png"> --%>
<!-- 										<a target='_blank' id="afterarticle"style='margin-left: 3px;' class="hand textbottom"> -->
<!-- 											Example page header Subtext for header -->
<!-- 										</a> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 						<div id="imageFlow"> -->
<!-- 							<div class="bank" > -->
<!-- 								<a rel='page/assets/img/circle-shop.png' href='#'> -->
<!-- 									<ul> -->
<!-- 										<li class="ProTi" >3000光学无线鼠标</li> -->
<!-- 									</ul>   -->
<!-- 								</a> -->
<!-- 							</div> -->
<!-- 							<div class="scrollbar"> -->
<!-- 								<img class="arrow-left" src="page/assets/img/btn_Pro_show_left.png" alt="" /> -->
<!-- 								<img class="arrow-right" src="page/assets/img/btn_Pro_show_right.png" alt="" /> -->
<!-- 							</div> -->
							
<!-- 						</div>  -->

					</div>
				</div>
				<!-- 发表评论 -->
				<div class="row top20">
					<div class="row">
						<div class="col-sm-5" style="padding-left: 5px">
							<img  alt='' style='height: 30px;width: 30px;' src='page/assets/img/circle-chat.png'>
							<h4 class="nosingline wenzizhidi" style="color: #666666">说点什么吧！</h4>
						</div>
					</div>
					<div class="row top10" >
						<div class="col-sm-12" style="padding-left: 5px;">
							<textarea id="fbtextarea" style="border-radius: 10px 10px 10px 10px;" class="form-control" rows="3" placeholder="说点什么~"></textarea>
						</div>
						
					</div>
					<div class="row top10">
						<div class="col-sm-2 col-sm-offset-10" align="center">
							<button id="fbbtn" type="button" class="btn btn-block" style="color:white;background-color: #3f316d">发布</button>
						</div>
					</div>
				</div>
				<!-- 评论部分 -->
				<div id="first_comment_list" class="row top10">
		
<!-- 					<div class="well col-sm-12" style="padding:15px 0px 10px 15px;border-radius: 10px 10px 10px 10px;background-color:rgba(255,255,255,0.6);"> -->
<!-- 						<div class="col-sm-2" style="padding: 20px 0px 0px 0px;text-align: center;"> -->
<!-- 							<img class="img-circle" src="page/assets/img/touxiang_zhushou.jpg" alt="..." style="height: 80px;width: 80px" > -->
<!-- 							<h5 style="margin-top: 15px; color: #666666">1楼</h5> -->
<!-- 						</div> -->
<!-- 						<div class="col-sm-10"> -->
<!-- 							<div class="row"> -->
<!-- 								<div class="col-sm-2" style="padding-left: 0px"> -->
<!-- 									<h5 style="color: #2A6496">yanweichen</h5> -->
<!-- 								</div> -->
<!-- 								<div class="col-sm-4 col-sm-offset-6"> -->
<!-- 									<h5 style="color: #666666;">2016年1月21日 14:25</h5> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="row top10"> -->
<!-- 								<p style="color: #444444;padding-right: 15px;"> -->
<!-- 								从天到地，从地到天，万事万物多么神奇！多么神奇，啦啦啦啦啦！ -->
<!-- 								从天到地，从地到天，万事万物多么神奇！多么神奇，啦啦啦啦啦！ -->
<!-- 								从天到地，从地到天，万事万物多么神奇！多么神奇，啦啦啦啦啦！ -->
<!-- 								从天到地，从地到天，万事万物多么神奇！多么神奇，啦啦啦啦啦！ -->
<!-- 								</p> -->
<!-- 							</div> -->
<!-- 								二级评论 -->
<!-- 								<div class="row well secondhflist"  style="margin-right:10px;padding:15px 0px 10px 15px;border-radius: 10px 10px 10px 10px;background-color:rgba(255,255,255,0.7);"> -->
<!-- 									<div class="secondhfdiv" style="margin-bottom: 10px"> -->
<!-- 										<div class="row" style="padding-left: 0px;padding-right: 0px;margin-bottom: 00px"> -->
<!-- 											<div class="col-sm-1"> -->
<!-- 												<img class="img-circle" src="page/assets/img/touxiang_zhushou.jpg" alt="..." style="height: 30px;width: 30px" > -->
<!-- 											</div> -->
<!-- 											<div class="col-sm-3" style="padding-right: 0px;padding-left: 10px" > -->
<!-- 												<h5 class="nosingline" style="color: #2A6496">yadaye</h5>&nbsp;回复说&nbsp;&nbsp;: -->
<!-- 											</div> -->
<!-- 											<div class="col-sm-8" style="padding-left: 0px;padding-right:30px"> -->
<!-- 											<p style="color: #444444">呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵</p></div> -->
<!-- 										</div> -->
<!-- 										<div class="row"> -->
<!-- 											<div class="col-sm-5 col-sm-offset-7" style="padding-left: 0px"> -->
<!-- 												<h5 class="nosingline" style="color: #666666">2016年1月27日 14:17</h5> -->
<!-- 												<button type="button" class="btn btn-sm hfbtn" style="color:white;background-color: #3f316d;margin-left: 5px">回复</button> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
									
<!-- 								</div> -->
<!-- 								回复点赞 -->
<!-- 							<div class="row"> -->
<!-- 								<div class="col-sm-2 col-sm-offset-8" style="padding-right: 0px;padding-left: 0px"> -->
<!-- 									<button type="button" class="btn btn-sm hfbtn" style="color:white;background-color: #3f316d">我也说一句</button> -->
<!-- 								</div> -->
<!-- 								<div class="col-sm-2"> -->
<!-- 									<div align="left" style="margin-top: 5px"> -->
<!-- 										<img class="img-circle" src="page/assets/img/hand_thumbsup.png" alt="..." style="height: 20px;width: 20px" > -->
<!-- 										<strong style="color: #5CACEE">(32)</strong> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<!-- 回复框 -->
<!-- 					<div id="hfdiv" class="row top10" style="display: none;margin-left: 10px;margin-bottom: 10px;"> -->
<!-- 						<div class="col-sm-10" style="padding-left: 0px;padding-right: 0px"> -->
<!-- 							<textarea id="hfconent" style="border-radius: 10px 10px 10px 10px;" class="form-control" rows="3" placeholder="说点什么~"></textarea> -->
<!-- 						</div> -->
<!-- 						<div class="col-sm-2"> -->
<!-- 							<button id="canclehf" type="button" class="btn btn-sm" style="color:white;background-color: #3f316d;margin-top: 10px">取消</button> -->
<!-- 							<button id="submithfbtn" type="button" class="btn btn-sm" style="color:white;background-color: #3f316d;margin-top: 10px">回复</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
				</div>
			</div>
			<!-- 右侧部分 -->
			<div class="col-sm-4 col-sm-offset-1">
				<div class="list-group">
					<a href="#" class="list-group-item touming active"style="background-color: #3f316d">
						<h4 class="list-group-item-heading" style="margin-top: 5px" >热门文章</h4>
					</a>
					<div id="hotlist" class='list-group-item ' style="background-color:rgba(0,0,0,0.1);">
<!-- 						<div class="row hotdiv top10"> -->
<!-- 							<div class='col-sm-10 overstep' style="z-index: 10"> -->
<!-- 								<img alt='' style='height: 25px; width: 25px' src='page/assets/img/indexnomalicon.png'> -->
<!-- 							    <a target='_blank' href='index/articledetail.action?id="+jo.index_id+' style='margin-left: 3px;font-size: 18px' class='hota hand textbottom'> -->
<!-- 									热门文章热门文章热门文章热门文章热热门文章热门文章热门文章热门文章热热门文章热门文章热门文章热门文章热热门文章热门文章热门文章热门文章热 -->
<!-- 							    </a> -->
<!-- 							</div> -->
<!-- 							<div class='col-sm-1 timestyle' style="padding-left: 0px;z-index: 9"><span class="badge">1877</span></div> -->
<!-- 						</div> -->
					</div>
				</div>
				
				<div id="hotlabelpanel" class="panel panel-default"  style="background-color:rgba(0,0,0,0.1);">
				  <div class="panel-heading" style="background-color: #3f316d;color: white">
				  	<h4>热门标签</h4>
				  </div>
				  <div id="hotlabels" class="panel-body" style="line-height:25px">
				  </div>
			   </div>
			</div>
		</div>
	</div>
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<!-- foot -->
	<jsp:include page="../head_foot/foot.html"></jsp:include>
	<script src="page/assets/js/bootstrap.min.js"></script>
	<script src="page/assets/js/bootstrap.min.js"></script>
	<script src="page/assets/js/Flow.js"></script>
	
	<script type="text/javascript">
		var articletitle = "${article.index_title}";		
		document.title = articletitle;
		var articleid = ${article.index_id};
		var articlelabel = "${article.index_label}";
		var userid = "${user.user_id}";
		var username = "${user.user_name}";
		function queryParams(search,limit,sort,order){
			return {
					search:search,
					limit:limit,
					offset:0,
					sort:sort,
					order:order,
			}
		}
		$(document).ready(function(){
			$.getJSON("index/getArticleByBorA.action", { id: articleid,ba:"before" }, function(json){
				var isNull = typeof(json.index_title) == "undefined";
				$("#beforearticle").empty();
				$("#beforearticle").append(isNull?"没有上一篇了哦~":json.index_title);
				if (isNull) {
					return;
				}
				$("#beforearticle").attr("href","index/articledetail.action?id="+(json.index_id));
			});
			$.getJSON("index/getArticleByBorA.action", { id: articleid,ba:"after" }, function(json){
				var isNull = typeof(json.index_title) == "undefined";
				$("#afterarticle").empty();
				$("#afterarticle").append(isNull?"没有下一篇了哦~":json.index_title);
				if (isNull) {
					return;
				}
				$("#afterarticle").attr("href","index/articledetail.action?id="+(json.index_id));
			});
			$.getJSON("index/Allnotice.action", queryParams(null,10,"index_hitsnum",null), function(json){
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
			$.getJSON("index/aboutnotice.action", queryParams(articlelabel,4,null,null), function(json){
				if (json.rows.length==0) {
					$("#aboutlist").append("<div class='col-sm-12'><div align='center'><h4 style='color: #444444'>暂时没有相关文章哦~</h4></div></div>");
				}
				$.each(json.rows,function(i,jo){
// 					var src;
					if (jo.index_state=="01"||jo.index_state=="11") {
						src = 'indexhoticon.png';
					} else {
						src = 'indexnomalicon.png';
					}
// 					if (i<3 && jo.index_id!=articleid) {
// 						$("#aboutlistleft").append("<div class='overstep top5' ><img  alt='' style='height: 20px;width: 20px' src='page/assets/img/"+src+"'><a target='_blank' href='index/articledetail.action?id="+jo.index_id+"' id='afterarticle'style='margin-left: 3px;' class='hand textbottom'>"+jo.index_title+"</a> </div>");
// 					}else if(jo.index_id!=articleid){
// 						$("#aboutlistright").append("<div class='overstep top5' ><img  alt='' style='height: 20px;width: 20px' src='page/assets/img/"+src+"'><a target='_blank' href='index/articledetail.action?id="+jo.index_id+"' id='afterarticle'style='margin-left: 3px;' class='hand textbottom'>"+jo.index_title+"</a> </div>");
// 					}
					if (jo.index_id!=articleid) {
						$("#aboutlist").append("<div class='col-sm-3' style='text-align: center;'><img class='img-rounded'  alt='' style='height: 100px;width: 100px' src='"+jo.index_preview_image_url+"'><div class='overstep top5' ><img  alt='' style='height: 20px;width: 20px' src='page/assets/img/"+src+"'><a href='index/articledetail.action?id="+jo.index_id+"' target='_blank' id='afterarticle'style='margin-left: 3px;' class='hand textbottom'>"+jo.index_title+"</a></div></div>");
					}

// 					$("#aboutlist").append("<a rel='page/assets/img/circle-shop.png' href='index/articledetail.action?id="+jo.index_id+"'><ul><li class='ProTi' >"+jo.index_title+"</li></ul> </a>");
// 					/* ==== create imageFlow ==== */
// 					imf.create("imageFlow", 1, 0.4, 0);
				});
			});
			$.getJSON("index/getHotLabel.action", {num:15}, function(json){
				$.each(json,function(i,jo){
					$("#hotlabels").append("<a href='page/article/articlelist.jsp?search="+jo.value+"' style='padding: 5px 10px 5px 10px;background-color:rgba(255,255,255,0.5);word-break: keep-all;white-space: nowrap;margin:5px;display:inline-block;' class='hotdiv hota'>"+jo.value+"</a>");
				});
			});
			refreshFirstComment(null,0,10);
		})
		
		//点击恢复显示回复框      不知道为毛？？？莫名其妙就实现了效果？？？？？
				$(".hfbtn").on('click',function() {
//		 			$("#hfdiv").css({ "top": $(this).offset().top - 30, "display": "block" });
// 					alert($("#hfdiv").css("display"))
// 					if ($("#hfdiv").css("display")!="inline") {
// 						$("#hfconent").val("")
// 						$("#hfdiv").fadeIn()
// 					}
						$(this).parent().parent().parent().append("<div id='hfdiv' class='row top10' style='margin-left: 10px;margin-bottom: 10px;'><div class='col-sm-10' style='padding-left: 0px;padding-right: 0px'><textarea id='hfconent' style='border-radius: 10px 10px 10px 10px;' class='form-control' rows='3' placeholder='说点什么~'></textarea></div><div class='col-sm-2'><button id='canclehf' type='button' class='btn btn-sm' style='color:white;background-color: #3f316d;margin-top: 10px'>取消</button><button id='submithfbtn' type='button' class='btn btn-sm' style='color:white;background-color: #3f316d;margin-top: 10px'>回复</button></div></div>");
				})
// 				//取消回复
				$("#canclehf").live('click',function() {
					$("#hfdiv").fadeOut()
				})
				$("#submithfbtn").live('click',function() {
					var conent = $("#hfconent").val();
					if ($(this).parent().parent().parent().find(".secondhflist").length==0) {//回复二级评论
						$(this).parent().parent().parent().append("<div class='secondhfdiv' style='margin-bottom: 10px'><div class='row' style='padding-left: 0px;padding-right: 0px;margin-bottom: 00px'><div class='col-sm-1'><img class='img-circle' src='page/assets/img/touxiang_zhushou.jpg' alt='...' style='height: 30px;width: 30px' ></div><div class='col-sm-3' style='padding-right: 0px;padding-left: 10px' ><h5 class='nosingline' style='color: #2A6496'>yadaye</h5>&nbsp;回复说&nbsp;&nbsp;:</div><div class='col-sm-8' style='padding-left: 0px;padding-right:30px'><p style='color: #444444'>"+conent+"</p></div></div><div class='row'><div class='col-sm-5 col-sm-offset-7' style='padding-left: 0px'><h5 class='nosingline' style='color: #666666'>2016年1月27日 14:17</h5><button type='button' class='btn btn-sm hfbtn' style='color:white;background-color: #3f316d;margin-left:8px;'>回复</button></div></div></div>");
					} else {//回复一级评论
						$(this).parent().parent().parent().find(".secondhflist").fadeIn();
						$(this).parent().parent().parent().find(".secondhflist").append("<div class='secondhfdiv' style='margin-bottom: 10px'><div class='row' style='padding-left: 0px;padding-right: 0px;margin-bottom: 00px'><div class='col-sm-1'><img class='img-circle' src='page/assets/img/touxiang_zhushou.jpg' alt='...' style='height: 30px;width: 30px' ></div><div class='col-sm-3' style='padding-right: 0px;padding-left: 10px' ><h5 class='nosingline' style='color: #2A6496'>yadaye</h5>&nbsp;回复说&nbsp;&nbsp;:</div><div class='col-sm-8' style='padding-left: 0px;padding-right:30px'><p style='color: #444444'>"+conent+"</p></div></div><div class='row'><div class='col-sm-5 col-sm-offset-7' style='padding-left: 0px'><h5 class='nosingline' style='color: #666666'>2016年1月27日 14:17</h5><button type='button' class='btn btn-sm hfbtn' style='color:white;background-color: #3f316d;margin-left:8px;'>回复</button></div></div></div>");
					}
					$("#hfdiv").css("display","none");
				})
				
		function queryParmer(pid,offset,limit){
			return {
				entry_id:articleid,
				pid:pid,
				offset:offset,
				limit:limit,
			}
		}
		function commitParmer(content,uid,pid){
			return {
				comment_content:content,
				comment_user_id:uid,
				comment_parent_id:pid,
				comment_entry_id:articleid,
			}
		}
		function refreshFirstComment(pid,offset,limit){
			$.getJSON("comment/getcomment.action",queryParmer(pid,offset,limit),function(json){
				$("#first_comment_list").empty();
				$.each(json.rows,function(i,jo){
					$("#first_comment_list").prepend(
							"<div class='well col-sm-12' style='padding:15px 0px 10px 15px;border-radius: 10px 10px 10px 10px;background-color:rgba(255,255,255,0.6);'>"+
									"<div class='col-sm-2' style='padding: 20px 0px 0px 0px;text-align: center;'>"+
										"<img class='img-circle' src='page/assets/img/touxiang_zhushou.jpg' alt='...' style='height: 80px;width: 80px' >"+
										"<h5 style='margin-top: 15px; color: #666666'>"+(i+1)+"楼</h5>"+
									"</div>"+
									"<div class='col-sm-10'>"+
										"<div class='row'>"+
											"<div class='col-sm-2' style='padding-left: 0px'>"+
												"<h5 style='color: #2A6496'>"+jo.user_name+"</h5>"+
											"</div>"+
											"<div class='col-sm-4 col-sm-offset-6'>"+
												"<h5 style='color: #666666;'>"+jo.comment_time_fmt+"</h5>"+
											"</div>"+
										"</div>"+
										"<div class='row top10'>"+
											"<p style='color: #444444;padding-right: 15px;min-height:50px;'>"+jo.comment_content+"</p>"+
										"</div>"+
											"<!-- 二级评论 -->"+
											"<div class='row well secondhflist'  style='margin-right:10px;padding:15px 0px 10px 15px;border-radius: 10px 10px 10px 10px;background-color:rgba(255,255,255,0.7);display:none;'>"+
											"</div>"+
											"<!-- 回复点赞 -->"+
										"<div class='row'>"+
											"<div class='col-sm-2 col-sm-offset-8' style='padding-right: 0px;padding-left: 0px'>"+
												"<button type='button' class='btn btn-sm hfbtn' style='color:white;background-color: #3f316d'>我也说一句</button>"+
											"</div>"+
											"<div class='col-sm-2'>"+
												"<div align='left' style='margin-top: 5px'>"+
													"<img class='img-circle' src='page/assets/img/hand_thumbsup.png' alt='...' style='height: 20px;width: 20px' >"+
													"<strong style='color: #5CACEE'>(0)</strong>"+
												"</div>"+
											"</div>"+
										"</div>"+
									"</div>"+
								"</div>")		
				});
			})
		}
		
		
		$("#fbbtn").click(function() {
			var content = $("#fbtextarea").val();
			var d = new Date(); 
			$.post("comment/addcomment.action",commitParmer(content,userid,null),function(result){
				if (result.error==200) {
					refreshFirstComment(null,0,30);
// 					$("#first_comment_list").prepend(
// 						"<div class='well col-sm-12' style='padding:15px 0px 10px 15px;border-radius: 10px 10px 10px 10px;background-color:rgba(255,255,255,0.6);'>"+
// 								"<div class='col-sm-2' style='padding: 20px 0px 0px 0px;text-align: center;'>"+
// 									"<img class='img-circle' src='page/assets/img/touxiang_zhushou.jpg' alt='...' style='height: 80px;width: 80px' >"+
// 									"<h5 style='margin-top: 15px; color: #666666'>1楼</h5>"+
// 								"</div>"+
// 								"<div class='col-sm-10'>"+
// 									"<div class='row'>"+
// 										"<div class='col-sm-2' style='padding-left: 0px'>"+
// 											"<h5 style='color: #2A6496'>"+username+"</h5>"+
// 										"</div>"+
// 										"<div class='col-sm-4 col-sm-offset-6'>"+
// 											"<h5 style='color: #666666;'>"+d.getFullYear()+"年"+(d.getMonth()+1)+"月"+d.getDate()+"日 "+d.getHours()+":"+d.getMinutes()+"</h5>"+
// 										"</div>"+
// 									"</div>"+
// 									"<div class='row top10'>"+
// 										"<p style='color: #444444;padding-right: 15px;min-height:50px;'>"+content
// 										+"</p>"+
// 									"</div>"+
// 										"<!-- 二级评论 -->"+
// 										"<div class='row well secondhflist'  style='margin-right:10px;padding:15px 0px 10px 15px;border-radius: 10px 10px 10px 10px;background-color:rgba(255,255,255,0.7);display:none;'>"+
// 										"</div>"+
// 										"<!-- 回复点赞 -->"+
// 									"<div class='row'>"+
// 										"<div class='col-sm-2 col-sm-offset-8' style='padding-right: 0px;padding-left: 0px'>"+
// 											"<button type='button' class='btn btn-sm hfbtn' style='color:white;background-color: #3f316d'>我也说一句</button>"+
// 										"</div>"+
// 										"<div class='col-sm-2'>"+
// 											"<div align='left' style='margin-top: 5px'>"+
// 												"<img class='img-circle' src='page/assets/img/hand_thumbsup.png' alt='...' style='height: 20px;width: 20px' >"+
// 												"<strong style='color: #5CACEE'>(0)</strong>"+
// 											"</div>"+
// 										"</div>"+
// 									"</div>"+
// 								"</div>"+
// 							"</div>")		
						}else{
							alert("回复失败！");
						}
				})
		});
	</script>
</body>
</html>