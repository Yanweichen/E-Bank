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
	href="page/assets//img/tubiao.ico" />
<link rel="stylesheet" href="page/assets/css/fakeloader.css">
<link rel="stylesheet" href="page/assets/css/owl.carousel.css">
<link rel="stylesheet" href="page/assets/css/owl.theme.css">
<link rel="stylesheet" href="page/assets/css/jquery.mCustomScrollbar.min.css"/>
<link rel="stylesheet" href="page/assets/css/jquery.emoji.css"/>
<!-- <link href="//netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet"> -->
<title></title>
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
.btncolor {
	background-color: #3f316d;
	border-color: #3f316d;
	margin-right: 10px;
}
</style>
</head>
<body style="background-image: url('page/assets/img/bg_grid.png');">
	<!-- 头部导航  -->
	<jsp:include page="../head_foot/head.jsp"></jsp:include>
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
							<img  alt="" style="height: 20px;width: 20px" src="page/assets/img/circle-arrow-up.png">
							<a target='_blank' id="beforearticle"style='margin-left: 3px;' class="hand textbottom"></a>
						</div>
					</div>
					<div class="col-sm-4 col-sm-offset-4 overstep">
						<div class="overstep" >
							<img  alt="" style="height: 20px;width: 20px" src="page/assets/img/circle-arrow-down.png">
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
						<div class="col-sm-10" >
							<c:set value="${fn:split(article.index_label,',')}" var="labels" />
							<c:forEach var="lb" items="${labels}">
<!-- 								<div class="well well-sm hotdiv nosingline hand" style="margin-right: 5px"> -->
<%-- 								<a class="hota" href='page/article/articlelist.jsp?search="+${lb}+"'>${lb}</a></div> --%>
								<a href="page/article/articlelist.jsp?search=${lb}" 
								style="padding: 7px 14px 7px 14px;background-color:#f5f5f5;word-break: keep-all;border:1px solid #e3e3e3;
								white-space: nowrap;margin:0px 5px 5px 5px;display:inline-block;" class="hotdiv hota">${lb}</a>
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
					<div class="row top10 owl-carousel" id="aboutlist">
<%-- 						<div class='item' style='text-align: center;'><img class='img-rounded'  alt='' style='height: 100px;width: 100px' src='<%=basePath%>page/assets/img/chrome-big.png'><div class='overstep top5' ><img  alt='' style='height: 20px;width: 20px' src='<%=basePath%>page/assets/img/chrome-big.png'><a href='index/articledetail.action?id="+jo.index_id+"' target='_blank' id='afterarticle'style='margin-left: 3px;' class='hand textbottom'>asdasdasdasdasd</a></div></div> --%>
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
							<div id="fbtextarea" contenteditable="true" style="border-radius: 10px 10px 10px 10px;min-height: 100px;overflow:auto;" class="form-control" rows="3" placeholder="说点什么~"></div>
						</div>
						
					</div>
					<div class="row top10">
						<div class="col-sm-1">
							<img id="emoji_btn_1" src="page/assets/img/face.png" style="cursor: pointer;"></img>
						</div>
						<div class="col-sm-2 col-sm-offset-9" align="center">
							<button id="fbbtn" type="button" class="btn btn-block" style="color:white;background-color: #3f316d">发布</button>
						</div>
					</div>
				</div>
				<div class="top15">
						<ul class="sync-pagination pagination-sm" style="margin: 0px"></ul>
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
<!-- 							二级评论 -->
<!-- 								<div class="row well secondhflist"  style="margin-right:10px;padding:15px 0px 10px 15px;border-radius: 10px 10px 10px 10px;background-color:rgba(255,255,255,0.7);"> -->
<!-- 									<div class="secondhfdiv" style="margin-bottom: 10px"> -->
<!-- 										<div class="row" style="padding-left: 0px;padding-right: 0px;margin-bottom: 00px"> -->
<!-- 											<div class="col-sm-1"> -->
<!-- 												<img class="img-circle" src="page/assets/img/touxiang_zhushou.jpg" alt="..." style="height: 30px;width: 30px" > -->
<!-- 											</div> -->
<!-- 											<div class="col-sm-1" style="padding-right: 0px;padding-left: 10px" > -->
<!-- 												<h5 class="nosingline" style="color: #2A6496">yadaye</h5>&nbsp;回复说&nbsp;&nbsp;: -->
<!-- 											</div> -->
<!-- 											<div class="col-sm-10" style="padding-left: 0px;padding-right:30px"> -->
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
<!-- 							回复点赞 -->
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
				</div>
			<!--回复框 -->
			<div id="hfdiv" class="row top10" style="display: none;margin-left: 10px;margin-bottom: 10px;">
				<div class="col-sm-10" style="padding-left: 0px;padding-right: 0px">
					<div id="hfconent" contenteditable="true" style="border-radius: 10px 10px 10px 10px;min-height: 100px;overflow:auto;" class="form-control" rows="3" placeholder="说点什么~"></div>
					<img id="emoji_btn_2" src="page/assets/img/face.png" style="cursor: pointer;margin: 5px 0 0 5px;"></img>
				</div>
				<div class="col-sm-2">
					<button id="canclehf"  type="button" class="btn btn-sm" style="color:white;background-color: #3f316d;margin-top: 10px">取消</button>
					<button id="submithfbtn" type="button" class="btn btn-sm" style="color:white;background-color: #3f316d;margin-top: 10px">回复</button>
				</div>
			</div>
			<div class="top15">
						<ul class="sync-pagination pagination-sm" style="margin: 0px"></ul>
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
	
	
	<!-- 提示登陆框 -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">登陆</h4>
				</div>
				<form id="loginfrom" action="/user/login.action"
					method="post">
					<div class="modal-body">
						<div class="container">
							<div class="row">
								<div class="form-group">
									<label for="recipient-name" class="control-label">电话/身份证号/邮箱:</label>
									<div class="input-group col-sm-5">
										<input type="text" class="form-control" name="user_account">
									</div>
								</div>
								<div class="form-group">
									<label for="message-text" class="control-label">密码:</label>
									<div class="input-group col-sm-5">
										<input type="password" class="form-control"
											name="user_password">
									</div>
								</div>
								<div class="form-group">
									<label for="message-text" class="control-label">验证码:</label>
									<div class="row">
										<div class="col-sm-3">
											<input type="text" class="form-control" id="user_code"
												name="user_code" placeholder="验证码">
										</div>
										<div class="col-sm-3">
											<img src="Kaptcha.jpg" id="codeimg" alt="..."
												class="img-rounded" style="height: 33px; width: 130px;">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer" style="z-index: -1;text-align: center;">
						<div class="col-sm-6">
							<button type="button" class="btn btn-primary btncolor btn-block"
							onclick="window.location='page/regist/regist_1.jsp'">注册</button>
						</div>
						<div class="col-sm-6">
							<button type="submit" id="btn_login"
								class="btn btn-primary btncolor btn-block">登陆</button>
						</div>
					</div>
				</form>
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
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<!-- foot -->
	<jsp:include page="../head_foot/foot.jsp"></jsp:include>
	<script src="page/assets/js/bootstrap.min.js"></script>
	<script src="page/assets/js/bootstrap.min.js"></script>
	<script src="page/assets/js/Flow.js"></script>
	<script src="page/assets/js/bootstrapValidator.min.js"></script>
	<script src="page/assets/js/fakeloader.js"></script>
	<script src="page/assets/js/jquery.twbsPagination.js"></script>
	<script src="page/assets/js/owl.carousel.js"></script>
	<script src="page/assets/js/jquery.mousewheel-3.0.6.min.js"></script>
	<script src="page/assets/js/jquery.mCustomScrollbar.min.js"></script>
	<script src="page/assets/js/jquery.emoji.js"></script>
	<script type="text/javascript">
		 $("#emoji_btn_1").click(function () {
			  $("#fbtextarea").emoji({
			    	button:'#emoji_btn_1',
			        showTab: true,
			        animation: 'fade',
			        icons: [{
			            name: "贴吧表情",
			            path: "page/assets/img/tieba/",
			            maxNum: 50,
			            file: ".png",
			            placeholder: ":{alias}:",
			            alias: {
			                1: "hehe",
			                2: "haha",
			                3: "tushe",
			                4: "a",
			                5: "ku",
			                6: "lu",
			                7: "kaixin",
			                8: "han",
			                9: "lei",
			                10: "heixian",
			                11: "bishi",
			                12: "bugaoxing",
			                13: "zhenbang",
			                14: "qian",
			                15: "yiwen",
			                16: "yinxian",
			                17: "tu",
			                18: "yi",
			                19: "weiqu",
			                20: "huaxin",
			                21: "hu",
			                22: "xiaonian",
			                23: "neng",
			                24: "taikaixin",
			                25: "huaji",
			                26: "mianqiang",
			                27: "kuanghan",
			                28: "guai",
			                29: "shuijiao",
			                30: "jinku",
			                31: "shengqi",
			                32: "jinya",
			                33: "pen",
			                34: "aixin",
			                35: "xinsui",
			                36: "meigui",
			                37: "liwu",
			                38: "caihong",
			                39: "xxyl",
			                40: "taiyang",
			                41: "qianbi",
			                42: "dnegpao",
			                43: "chabei",
			                44: "dangao",
			                45: "yinyue",
			                46: "haha2",
			                47: "shenli",
			                48: "damuzhi",
			                49: "ruo",
			                50: "OK"
			            },
			            title: {
			                1: "呵呵",
			                2: "哈哈",
			                3: "吐舌",
			                4: "啊",
			                5: "酷",
			                6: "怒",
			                7: "开心",
			                8: "汗",
			                9: "泪",
			                10: "黑线",
			                11: "鄙视",
			                12: "不高兴",
			                13: "真棒",
			                14: "钱",
			                15: "疑问",
			                16: "阴脸",
			                17: "吐",
			                18: "咦",
			                19: "委屈",
			                20: "花心",
			                21: "呼~",
			                22: "笑脸",
			                23: "冷",
			                24: "太开心",
			                25: "滑稽",
			                26: "勉强",
			                27: "狂汗",
			                28: "乖",
			                29: "睡觉",
			                30: "惊哭",
			                31: "生气",
			                32: "惊讶",
			                33: "喷",
			                34: "爱心",
			                35: "心碎",
			                36: "玫瑰",
			                37: "礼物",
			                38: "彩虹",
			                39: "星星月亮",
			                40: "太阳",
			                41: "钱币",
			                42: "灯泡",
			                43: "茶杯",
			                44: "蛋糕",
			                45: "音乐",
			                46: "haha",
			                47: "胜利",
			                48: "大拇指",
			                49: "弱",
			                50: "OK"
			            }
			        },{
			            name: "QQ表情",
			            path: "page/assets/img/qq/",
			            maxNum: 91,
			            excludeNums: [41, 45, 54],
			            file: ".gif"
			        }]
			    });
		 });
		 $("#emoji_btn_2").click(function () {
			  $("#hfconent").emoji({
			    	button:'#emoji_btn_2',
			        showTab: true,
			        animation: 'fade',
			        icons: [{
			            name: "贴吧表情",
			            path: "page/assets/img/tieba/",
			            maxNum: 50,
			            file: ".png",
			            placeholder: ":{alias}:",
			            alias: {
			                1: "hehe",
			                2: "haha",
			                3: "tushe",
			                4: "a",
			                5: "ku",
			                6: "lu",
			                7: "kaixin",
			                8: "han",
			                9: "lei",
			                10: "heixian",
			                11: "bishi",
			                12: "bugaoxing",
			                13: "zhenbang",
			                14: "qian",
			                15: "yiwen",
			                16: "yinxian",
			                17: "tu",
			                18: "yi",
			                19: "weiqu",
			                20: "huaxin",
			                21: "hu",
			                22: "xiaonian",
			                23: "neng",
			                24: "taikaixin",
			                25: "huaji",
			                26: "mianqiang",
			                27: "kuanghan",
			                28: "guai",
			                29: "shuijiao",
			                30: "jinku",
			                31: "shengqi",
			                32: "jinya",
			                33: "pen",
			                34: "aixin",
			                35: "xinsui",
			                36: "meigui",
			                37: "liwu",
			                38: "caihong",
			                39: "xxyl",
			                40: "taiyang",
			                41: "qianbi",
			                42: "dnegpao",
			                43: "chabei",
			                44: "dangao",
			                45: "yinyue",
			                46: "haha2",
			                47: "shenli",
			                48: "damuzhi",
			                49: "ruo",
			                50: "OK"
			            },
			            title: {
			                1: "呵呵",
			                2: "哈哈",
			                3: "吐舌",
			                4: "啊",
			                5: "酷",
			                6: "怒",
			                7: "开心",
			                8: "汗",
			                9: "泪",
			                10: "黑线",
			                11: "鄙视",
			                12: "不高兴",
			                13: "真棒",
			                14: "钱",
			                15: "疑问",
			                16: "阴脸",
			                17: "吐",
			                18: "咦",
			                19: "委屈",
			                20: "花心",
			                21: "呼~",
			                22: "笑脸",
			                23: "冷",
			                24: "太开心",
			                25: "滑稽",
			                26: "勉强",
			                27: "狂汗",
			                28: "乖",
			                29: "睡觉",
			                30: "惊哭",
			                31: "生气",
			                32: "惊讶",
			                33: "喷",
			                34: "爱心",
			                35: "心碎",
			                36: "玫瑰",
			                37: "礼物",
			                38: "彩虹",
			                39: "星星月亮",
			                40: "太阳",
			                41: "钱币",
			                42: "灯泡",
			                43: "茶杯",
			                44: "蛋糕",
			                45: "音乐",
			                46: "haha",
			                47: "胜利",
			                48: "大拇指",
			                49: "弱",
			                50: "OK"
			            }
			        },{
			            name: "QQ表情",
			            path: "page/assets/img/qq/",
			            maxNum: 91,
			            excludeNums: [41, 45, 54],
			            file: ".gif"
			        }]
			    });
		 });
		var articletitle = "${article.index_title}";		
		document.title = articletitle;
		var articleid = ${article.index_id};
		var articlelabel = "${article.index_label}";
		var userid = "${user.user_id}";
		var username = "${user.user_name}";
		var userface = "${user.user_face}";
		//刷新验证码
		$("#codeimg").click( function () {
			$(this).attr("src","<%=basePath%>Kaptcha.jpg?r=" + new Date());
			;
		});
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
			//替换为可滚动的
// 			$.getJSON("index/aboutnotice.action", queryParams(articlelabel,4,null,null), function(json){
// 				if (json.rows.length==0) {
// 					$("#aboutlist").append("<div class='col-sm-12'><div align='center'><h4 style='color: #444444'>暂时没有相关文章哦~</h4></div></div>");
// 				}
// 				$.each(json.rows,function(i,jo){
// 					var src;
// 					if (jo.index_state=="01"||jo.index_state=="11") {
// 						src = 'indexhoticon.png';
// 					} else {
// 						src = 'indexnomalicon.png';
// 					}
// 					if (jo.index_id!=articleid) {
// 						$("#aboutlist").append("<div class='item' style='text-align: center;'><img class='img-rounded'  alt='' style='height: 100px;width: 100px' src='"+jo.index_preview_image_url+"'><div class='overstep top5' ><img  alt='' style='height: 20px;width: 20px' src='page/assets/img/"+src+"'><a href='index/articledetail.action?id="+jo.index_id+"' target='_blank' id='afterarticle'style='margin-left: 3px;' class='hand textbottom'>"+jo.index_title+"</a></div></div>");
// 					}
// 				});
// 			});
			$.getJSON("index/getHotLabel.action", {num:15}, function(json){
				$.each(json,function(i,jo){
					$("#hotlabels").append("<a href='page/article/articlelist.jsp?search="+jo.value+"' style='padding: 5px 10px 5px 10px;background-color:rgba(255,255,255,0.5);word-break: keep-all;white-space: nowrap;margin:5px;display:inline-block;' class='hotdiv hota'>"+jo.value+"</a>");
				});
			});
			$('#loginfrom').bootstrapValidator({
				message : 'This value is not valid',
				submitButtons : 'button[type="submit"]',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					user_account : {
						validators : {
							notEmpty : {
								message : '用户名不能为空'
							},
						}
					},
					user_password : {
						validators : {
							notEmpty : {
								message : '密码不能为空'
							},
						}
					},
					user_code : {
						threshold : 5,
						validators : {
							notEmpty : {
								message : '验证码不能为空'
							},
							remote : {
								url : 'user/verifyCode.action',
									type : "post",
									async : true,
									data : {
										user_account : function(
												validator) {
											return $(
													'#loginfrom :input[name="user_code"]')
													.val();
										},
									},
								},
							}
						},
		
					}
				}).on(
				'success.form.bv',
				function(e) {
					// Prevent form submission
					e.preventDefault();
		
					// Get the form instance
					var $form = $(e.target);
		
					// Get the BootstrapValidator instance
					var bv = $form
							.data('bootstrapValidator');
					$(".fakeloader").fakeLoader({
		                spinner:"spinner2",
		                show:true
		            });
					// Use Ajax to submit form data
					$.post($form.attr('action'),$form.serialize(),
									function(result) {
										$(".fakeloader").fakeLoader({
							                spinner:"spinner2",
							                show:false
							            });
										if (result.error == 203) {
											alert(result.msg)
										} else {
											$('#loginModal').modal('hide');
											window.location.reload();
										}
									}, 'json');});
			$.getJSON("comment/getCount.action", queryCommentParmer(null,null,null),function(json){
				$('.sync-pagination').twbsPagination({
			        totalPages: Math.ceil(json.total/10),
			        visiblePages: 7,
			        first:"首页",
			        prev:"前一页",
			 		next:"后一页",
			 		last:"尾页",
			        onPageClick: function (event, page) {
			        	refreshFirstComment(null,page,10);
			        }
			  });
			})
			//相关文章横向滚动
			$('.owl-carousel').owlCarousel({
			    margin:10,
			    loop:true,
			    autoWidth:true,
			    items:4,
			    jsonPath : 'index/aboutnotice.action?search='+articlelabel+'&limit=30&offset=0&sort=&order=',
			    jsonSuccess : customDataSuccess,
			})
			//横向滚动请求回调
			function customDataSuccess(json){
			    var content = "";
			    if (json.rows.length==0) {
					$("#aboutlist").append("<div class='col-sm-12'><div align='center'><h4 style='color: #444444'>暂时没有相关文章哦~</h4></div></div>");
				}
				$.each(json.rows,function(i,jo){
					var src;
					if (jo.index_state=="01"||jo.index_state=="11") {
						src = 'indexhoticon.png';
					} else {
						src = 'indexnomalicon.png';
					}
					if (jo.index_id!=articleid) {
						content+="<div class='item' style='text-align: center;'><img class='img-rounded'  alt='' style='height: 100px;width: 100px' src='"+jo.index_preview_image_url+"'><div class='overstep top5' ><img  alt='' style='height: 20px;width: 20px' src='page/assets/img/"+src+"'><a href='index/articledetail.action?id="+jo.index_id+"' target='_blank' id='afterarticle'style='margin-left: 3px;' class='hand textbottom'>"+jo.index_title+"</a></div></div>";
					}
				});
			    $("#aboutlist").html(content);
			}
		})
		
		//点击恢复显示回复框     
				$(".hfbtn").live('click',function() {
//		 			$("#hfdiv").css({ "top": $(this).offset().top - 30, "display": "block" });
// 					alert($("#hfdiv").css("display"))
					if ($("#hfdiv").css("display")!="inline") {
						$("#hfconent").html("")
						$("#hfdiv").fadeIn()
						$(this).parent().parent().parent().append($("#hfdiv"))
					}
// 						$(this).parent().parent().parent().append("<div id='hfdiv' class='row top10' style='margin-left: 10px;margin-bottom: 10px;'><div class='col-sm-10' style='padding-left: 0px;padding-right: 0px'><textarea id='hfconent' style='border-radius: 10px 10px 10px 10px;' class='form-control' rows='3' placeholder='说点什么~'></textarea></div><div class='col-sm-2'><button id='canclehf' type='button' class='btn btn-sm' style='color:white;background-color: #3f316d;margin-top: 10px'>取消</button><button id='submithfbtn' type='button' class='btn btn-sm' style='color:white;background-color: #3f316d;margin-top: 10px'>回复</button></div></div>");
				})
// 				//取消回复
				$("#canclehf").live('click',function() {
					$("#hfdiv").fadeOut()
				})
				$("#submithfbtn").live('click',function() {
					var conent = $("#hfconent").html();
					if (typeof($(this).parent().parent().parent().attr("id")) != "undefined") {//回复一级评论
						var commentuserid = $(this).parent().parent().parent().find(".row > .col-sm-2 > h5").attr("id")
						var colsm10 = $(this).parent().parent().parent()//放置id的元素
						var pid = colsm10.attr("id")
						$.post("comment/addcomment.action",commitParmer("&nbsp;回复说&nbsp;&nbsp;:"+$("#hfconent").html(),userid,pid),function(result){
							if (result.error==200) {
								colsm10.find(".secondhflist").fadeIn();
								colsm10.find(".secondhflist").append("<div class='secondhfdiv' style='margin-bottom: 10px'><div class='row' style='padding-left: 0px;padding-right: 0px;margin-bottom: 00px'><div class='col-sm-1'><img class='img-circle' src='"+userface+"' alt='...' style='height: 30px;width: 30px' ></div><div class='col-sm-2' style='padding-right: 0px;padding-left: 10px' ><h5 class='nosingline' style='color: #2A6496'>"+username+"</h5></div><div class='col-sm-9' style='padding-left: 0px;padding-right:30px'><p style='color: #444444'>&nbsp;回复说&nbsp;&nbsp;:"+conent+"</p></div></div><div class='row'><div class='col-sm-5 col-sm-offset-7' style='padding-left: 0px'><h5 class='nosingline' style='color: #666666'>"+formatDate(new Date())+"</h5><button type='button' class='btn btn-sm hfbtn' style='color:white;background-color: #3f316d;margin-left:8px;'>回复</button></div></div></div>");
								$.post("comment/sendNotice.action",{"content":username+" 对你说:"+conent,user_id:commentuserid})//发送通知
							}else{
								if (result.indexOf("<script")==-1?false:true) {
									$('#loginModal').modal('show')
								} else {
									result = JSON.parse(result)
									$("#msg").empty(); 
									 $("#msg").append(result.msg)
					               	 $("#isSuc").modal(); 
								}
							}
						})
					} else {//回复二级评论
						var commentuserid = $(this).parent().parent().parent().find(".col-sm-2 > h5").attr("id")
						var colsm10 = $(this).parent().parent().parent().parent().parent();//放置id的元素
						var pid = colsm10.attr("id")
						var secondlist = $(this).parent().parent().parent();
						var hfname = secondlist.find(".col-sm-2 > h5").text()	;
						$.post("comment/addcomment.action",commitParmer("&nbsp;回复<a>"+hfname+"</a>说&nbsp;&nbsp;:"+$("#hfconent").html(),userid,pid),function(result){
							if (result.error==200) {
								secondlist.append("<div class='secondhfdiv' style='margin-bottom: 10px'><div class='row' style='padding-left: 0px;padding-right: 0px;margin-bottom: 00px'><div class='col-sm-1'><img class='img-circle' src='"+userface+"' alt='...' style='height: 30px;width: 30px' ></div><div class='col-sm-2' style='padding-right: 0px;padding-left: 10px' ><h5 class='nosingline' style='color: #2A6496'>"+username+"</h5></div><div class='col-sm-9' style='padding-left: 0px;padding-right:30px'><p style='color: #444444'>&nbsp;回复<a>"+hfname+"</a>说&nbsp;&nbsp;:"+conent+"</p></div></div><div class='row'><div class='col-sm-5 col-sm-offset-7' style='padding-left: 0px'><h5 class='nosingline' style='color: #666666'>"+formatDate(new Date())+"</h5><button type='button' class='btn btn-sm hfbtn' style='color:white;background-color: #3f316d;margin-left:8px;'>回复</button></div></div></div>");
								$.post("comment/sendNotice.action",{"content":username+" 对你说:"+conent,user_id:commentuserid})//发送通知
							}else{
								if (result.indexOf("<script")==-1?false:true) {
									$('#loginModal').modal('show')
								} else {
									result = JSON.parse(result)
								     $("#msg").empty(); 
									 $("#msg").append(result.msg)
					               	 $("#isSuc").modal(); 
								}
							}
						})
					}
					$("#hfdiv").css("display","none");
				})
				
		function queryCommentParmer(pid,page,limit){
			return {
				entry_id:articleid,
				pid:pid,
				offset:(page-1)*10,
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
		//日期转换
		function   formatDate(now)   {   
	         var   year=now.getUTCFullYear();   
	         var   month=now.getUTCMonth()+1;   
	         var   date=now.getUTCDate();   
	         var   hour=now.getHours();   
	         var   minute=now.getMinutes();   
	         var   second=now.getUTCSeconds();
	         if (minute/10<1) {
	        	 minute = "0"+minute;
			 }
	         if (date/10<1) {
	        	 date = "0"+date;
			 }
	         return   year+"年"+month+"月"+date+"日  "+hour+":"+minute;   
		}   
		function refreshFirstComment(pid,offset,limit){
			$.getJSON("comment/getcomment.action",queryCommentParmer(pid,offset,limit),function(json){
				$("#first_comment_list").empty();
				
				$.each(json.rows,function(i,jo){
					var secondlist = "";
					$.each(jo.secondCommentList,function(i,sjo){
						secondlist +="<div class='secondhfdiv' style='margin-bottom: 10px'><div class='row' style='padding-left: 0px;padding-right: 0px;margin-bottom: 00px'><div class='col-sm-1'><img class='img-circle' src='"+sjo.user_face+"' alt='...' style='height: 30px;width: 30px' ></div><div class='col-sm-2' style='padding-right: 0px;padding-left: 10px' ><h5 class='nosingline' id='"+sjo.comment_user_id+"' style='color: #2A6496'>"+sjo.user_name+"</h5></div><div class='col-sm-9' style='padding-left: 0px;padding-right:30px'><p style='color: #444444'>"+sjo.comment_content+"</p></div></div><div class='row'><div class='col-sm-5 col-sm-offset-7' style='padding-left: 0px'><h5 class='nosingline' style='color: #666666'>"+formatDate(new Date(sjo.comment_time))+"</h5><button type='button' class='btn btn-sm hfbtn' style='color:white;background-color: #3f316d;margin-left:8px;'>回复</button></div></div></div>";
					})
					
					if (secondlist!="") {
						secondlist = "<div class='row well secondhflist'  style='margin-right:10px;padding:15px 0px 10px 15px;border-radius: 10px 10px 10px 10px;background-color:rgba(255,255,255,0.7);'>"+secondlist+"</div>";
					}else{
						secondlist = "<div class='row well secondhflist'  style='margin-right:10px;padding:15px 0px 10px 15px;border-radius: 10px 10px 10px 10px;background-color:rgba(255,255,255,0.7);display:none;'></div>";
					}
						
					$("#first_comment_list").append(
							"<div class='well col-sm-12' style='padding:15px 0px 10px 15px;border-radius: 10px 10px 10px 10px;background-color:rgba(255,255,255,0.6);'>"+
									"<div class='col-sm-2' style='padding: 20px 0px 0px 0px;text-align: center;'>"+
										"<img class='img-circle' src='"+jo.user_face+"' alt='...' style='height: 80px;width: 80px' >"+
										"<h5 style='margin-top: 15px; color: #666666'>"+(i+1)+"楼</h5>"+
									"</div>"+
									"<div class='col-sm-10' id="+jo.comment_id+">"+
										"<div class='row'>"+
											"<div class='col-sm-2' style='padding-left: 0px'>"+
												"<h5 style='color: #2A6496' id='"+jo.comment_user_id+"'>"+jo.user_name+"</h5>"+
											"</div>"+
											"<div class='col-sm-4 col-sm-offset-6'>"+
												"<h5 style='color: #666666;'>"+formatDate(new Date(jo.comment_time))+"</h5>"+
											"</div>"+
										"</div>"+
										"<div class='row top10'>"+
											"<p style='color: #444444;padding-right: 15px;min-height:50px;'>"+jo.comment_content+"</p>"+
										"</div>"+secondlist+
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
			var content = $("#fbtextarea").html();
			var d = new Date(); 
			$.post("comment/addcomment.action",commitParmer(content,userid,null),function(result){
				if (result.error==200) {
// 					refreshFirstComment(null,1,10);
					window.location.reload()
				}else{
					if (result.indexOf("<script")==-1?false:true) {
						$('#loginModal').modal('show')
					} else {
						result = JSON.parse(result);
						if (result.error==203) {
							 $("#msg").empty(); 
							 $("#msg").append(result.msg)
			               	 $("#isSuc").modal(); 
							 return;
						}
						alert("回复失败")
					}
				}
			})
		});
	</script>
</body>
</html>