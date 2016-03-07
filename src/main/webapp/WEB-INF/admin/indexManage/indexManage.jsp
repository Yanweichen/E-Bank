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
<link rel="stylesheet" href="page/assets/css/bootstrap.css">
<link rel="stylesheet" href="page/assets/css/bootstrap-table.css">
<link href="page/assets/css/bootstrap-datepicker3.css" rel="stylesheet">
<style type="text/css">
.ml10 {
    margin-left: 10px;
}
.hand{
cursor:pointer
}
</style>
<title>首页管理</title>
</head>
<body>
	<div id="toolbar">
	<h4 >首页文章</h4>
       <ul class="nav nav-pills">
 		 <li id="viewall" role="presentation" class="active hand"><a style="padding:0px 20px 0px 20px">全部</a></li>
  		 <li id="viewactivity" class="hand" role="presentation" ><a  style="padding: 0px 20px 0px 20px">活动</a></li>
  		 <li id="viewnotice" class="hand" role="presentation" ><a  style="padding: 0px 20px 0px 20px">公告</a></li>
  		 <li role="presentation" >
			<div class="input-daterange input-group" id="viewdate" style="margin-left: 10px">
				<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
				<input id="viewstarttime" type="text" class="input-sm form-control" name="start" onfocus="this.blur()" /> 
				<span class="input-group-addon">至</span> 
				<input id="viewendtime" type="text" class="input-sm form-control" name="end" onfocus="this.blur()" />
				<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
			</div>
		 </li>
	   </ul>
	</div>
	<div class="row" style="padding: 40px">
		<div class="row">
			<div class="col-sm-12">
				<table id="isputaway" data-toggle="table" data-width="50px" data-pagination="true" 
				   data-side-pagination="server"
			       data-show-refresh="true"
			       data-show-toggle="true"
			       data-show-columns="true"
			       data-detail-view="true"
			       data-search="true"
			       data-detail-formatter="detailFormatter"
			       data-toolbar="#toolbar">
				    <thead>
				        <tr>
				            <th data-field="index_id" data-align="center" data-sortable="true">ID</th>
				            <th data-field="index_type" data-align="right">类型</th>
				            <th data-width="40%" data-field="index_title" data-align="center">标题</th>
				            <th data-field="index_uptime_format" data-align="" data-sortable="true">上传时间</th>
				            <th data-field="upfrom" data-align="">上传者</th>
				            <th data-field="action" data-align="" data-formatter="actionFormatter" data-events="actionEvents">操作</th>
				        </tr>
				    </thead>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
			<div id="toolbarAll">
			<h4 >所有文章</h4>
		       <ul class="nav nav-pills">
		 		  <li id="allall" role="presentation" class="active hand"><a style="padding:0px 20px 0px 20px">全部</a></li>
  		 		  <li id="allactivity" class="hand" role="presentation" ><a  style="padding: 0px 20px 0px 20px">活动</a></li>
  				  <li id="allnotice" class="hand" role="presentation" ><a  style="padding: 0px 20px 0px 20px">公告</a></li>
		  		 <li role="presentation" >
					<div class="input-daterange input-group" id="alldate" style="margin-left: 10px;">
						<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
						<input id="allstarttime" type="text" class="input-sm form-control" name="start" onfocus="this.blur()" /> 
						<span class="input-group-addon">至</span> 
						<input id="allendtime" type="text" class="input-sm form-control" name="end" onfocus="this.blur()" />
						<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
					</div>
				 </li>
			   </ul>
		    </div>
				<table id="all" data-toggle="table" 
				   data-width="50px" 
				   data-pagination="true" 
				   data-side-pagination="server"
			       data-show-refresh="true"
			       data-page-list="[5, 10, 20, 50, 100, 200]"
			       data-show-toggle="true"
			       data-show-columns="true"
			       data-detail-view="true"
			       data-search="true"
			       data-detail-formatter="detailFormatter"
			       data-toolbar="#toolbarAll">
				    <thead>
				        <tr>
				            <th data-field="index_id" data-align="center" data-sortable="true">ID</th>
				            <th data-field="index_type" data-align="right">类型</th>
				            <th data-width="40%" data-field="index_title" data-align="center">标题</th>
				            <th data-field="index_uptime_format" data-align="" data-sortable="true">上传时间</th>
				            <th data-field="upfrom" data-align="">上传者</th>
				            <th data-field="action" data-align="" data-formatter="actionFormatterAll" data-events="actionEventsAll">操作</th>
				        </tr>
				    </thead>
				</table>
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
<script src="page/assets/js/jquery-1.8.1.min.js"></script>
<script src="page/assets/js/bootstrap.min.js"></script>
<script src="page/assets/js/bootstrap-table.js"></script>
<script src="page/assets/js/bootstrap-table-zh-CN.js"></script>
<script src="page/assets/js/bootstrap-datepicker.js"></script>
<script src="page/assets/js/bootstrap-datepicker.zh-CN.min.js" charset="UTF-8"></script>
<script type="text/javascript">
	function showMsg(msg) {
		$("#msg").empty(); 
        $("#msg").append(msg)
		$("#isSuc").modal(); 
	}
	function queryParams(type,stime,etime,pid,tb){
		return {
			    search:type,
				limit:10,
				offset:0,
				startTime:stime,
				endTime:etime,
				timefmt:"yyyy-MM-dd HH:mm:ss",
				index_pid:pid,
				isView:tb
		}
	}
	$("#viewall").click(function(){
		$("#viewall").addClass("active")
		$("#viewactivity").removeClass("active");
		$("#viewnotice").removeClass("active");
		$('#isputaway').bootstrapTable('refresh');
	})
	$("#viewactivity").click(function(){
		$("#viewactivity").addClass("active")
		$("#viewall").removeClass("active");
		$("#viewnotice").removeClass("active");
		$.getJSON("index/Allnotice.action", queryParams(null,null,null,2,null,"view"), function(json){
			$('#isputaway').bootstrapTable('load', json);
		});
	})
	$("#viewnotice").click(function(){
		$("#viewnotice").addClass("active")
		$("#viewall").removeClass("active");
		$("#viewactivity").removeClass("active");
		$.getJSON("index/Allnotice.action", queryParams(null,null,null,1,null,"view"), function(json){
			$('#isputaway').bootstrapTable('load', json);
		});
	})
	
	$("#allall").click(function(){
		$("#allall").addClass("active")
		$("#allactivity").removeClass("active");
		$("#allnotice").removeClass("active");
		$('#all').bootstrapTable('refresh');
	})
	$("#allactivity").click(function(){
		$("#allactivity").addClass("active")
		$("#allall").removeClass("active");
		$("#allnotice").removeClass("active");
		$.getJSON("index/Allnotice.action", queryParams(null,null,null,2,false), function(json){
			$('#all').bootstrapTable('load', json);
		});
	})
	$("#allnotice").click(function(){
		$("#allnotice").addClass("active")
		$("#allall").removeClass("active");
		$("#allactivity").removeClass("active");
		$.getJSON("index/Allnotice.action", queryParams(null,null,null,1,false), function(json){
			$('#all').bootstrapTable('load', json);
		});
	})
	//日期选择
	$('#viewdate').datepicker({
	    format: 'yyyy-mm-dd',
	    language: "zh-CN",
	    autoclose:true,
	    todayBtn:true,
	    keyboardNavigation:true,
	    todayHighlight:true,
	}).on('changeDate', function(ev){
		//ev.date.valueOf()
		$.getJSON("index/Allnotice.action", queryParams("TIME",$("#viewstarttime").val(),$("#viewendtime").val(),-1,"view"), function(json){
			$('#isputaway').bootstrapTable('load', json);
		});
	});
	$('#alldate').datepicker({
	    format: 'yyyy-mm-dd',
	    language: "zh-CN",
	    autoclose:true,
	    todayBtn:true,
	    keyboardNavigation:true,
	    todayHighlight:true,
	}).on('changeDate', function(ev){
		$.getJSON("index/Allnotice.action", queryParams("TIME",$("#allstarttime").val(),$("#allendtime").val(),-1,false), function(json){
			$('#all').bootstrapTable('load', json);
		});
	});
	
	//初始化表格
	$.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['zh-CN']);
	$('#isputaway').bootstrapTable({
	    url: "index/Allnotice.action?isView=view",
	}).on('load-success.bs.table', function (e, name, args) {
    })
	$('#all').bootstrapTable({
	    url: 'index/Allnotice.action',
	});

	function actionFormatter(value, row, index) {
		var state = parseInt(row.index_state);
		switch (state) {
		case 0:
			return [
			        '<a class="upordown" href="javascript:void(0)" title="置顶">',
			        '<i class="glyphicon glyphicon-arrow-down"></i>',
			        '</a>',
			        '<a class="important ml10" href="javascript:void(0)" title="标记为重要">',
			        '<i class="glyphicon glyphicon-star-empty"></i>',
			        '</a>',
			        '<a class="remove ml10" href="javascript:void(0)" title="删除">',
			        '<i class="glyphicon glyphicon-remove"></i>',
			        '</a>'
			    ].join('');
			break;
		case 1:
			return [
			        '<a class="upordown" href="javascript:void(0)" title="置顶">',
			        '<i class="glyphicon glyphicon-arrow-down"></i>',
			        '</a>',
			        '<a class="important ml10" href="javascript:void(0)" title="标记为重要">',
			        '<i class="glyphicon glyphicon-star"></i>',
			        '</a>',
			        '<a class="remove ml10" href="javascript:void(0)" title="删除">',
			        '<i class="glyphicon glyphicon-remove"></i>',
			        '</a>'
			    ].join('');
			break;
		case 10:
			return [
			        '<a class="upordown" href="javascript:void(0)" title="置顶">',
			        '<i class="glyphicon glyphicon-arrow-up"></i>',
			        '</a>',
			        '<a class="important ml10" href="javascript:void(0)" title="标记为重要">',
			        '<i class="glyphicon glyphicon-star-empty"></i>',
			        '</a>',
			        '<a class="remove ml10" href="javascript:void(0)" title="删除">',
			        '<i class="glyphicon glyphicon-remove"></i>',
			        '</a>'
			    ].join('');
			break;
		case 11:
			return [
			        '<a class="upordown" href="javascript:void(0)" title="置顶">',
			        '<i class="glyphicon glyphicon-arrow-up"></i>',
			        '</a>',
			        '<a class="important ml10" href="javascript:void(0)" title="标记为重要">',
			        '<i class="glyphicon glyphicon-star"></i>',
			        '</a>',
			        '<a class="remove ml10" href="javascript:void(0)" title="删除">',
			        '<i class="glyphicon glyphicon-remove"></i>',
			        '</a>'
			    ].join('');
			break;
		default:
			break;
		}
	}
	
	window.actionEvents = {
	    'click .upordown': function (e, value, row, index) {
	    	var state = parseInt(row.index_state);//获取当前状态
	    	var elementstate = e.target.className;
	    	if (elementstate=="glyphicon glyphicon-arrow-down") {//置顶
	    		var updatestate;
	    		var type;
	    		if (row.index_type=="公告") {
					type=1;
				} else {
					type=2;
				}
	    		switch (state) {
				case 0:
					updatestate="10"
					break;
				case 1:
					updatestate="11"
					break;
				case 10:
					updatestate="10"
					break;
				case 11:
					updatestate="11"
					break;
				default:
					break;
				}
	    		$.post("index/getTopByState.action",{type:type,fmt:"MM/dd"},function(result){
	    			if (result.error!=200) {
	    				$.post("index/updateNoticeState.action",{"row":JSON.stringify(row),state:updatestate},function(result){
			    			if (result.error==200) {
					    		e.target.setAttribute("class", "glyphicon glyphicon-arrow-up");
					    		row.index_state = updatestate;
			    				$('#isputaway').bootstrapTable('updateRow', {index: index, row: row});
							} else {
								showMsg("置顶失败")
							}
			    		})
					}else{
						if (type==1) {
							showMsg("公告已经有置顶项了哦~")
						} else {
							showMsg("活动已经有置顶项了哦~")
						}
					}
	    		})
			} else {//取消置顶
				var updatestate;
	    		switch (state) {
				case 0:
					updatestate="00"
					break;
				case 1:
					updatestate="01"
					break;
				case 10:
					updatestate="00"
					break;
				case 11:
					updatestate="01"
					break;
				default:
					break;
				}
	    		$.post("index/updateNoticeState.action",{"row":JSON.stringify(row),state:updatestate},function(result){
	    			if (result.error==200) {
	    				e.target.setAttribute("class", "glyphicon glyphicon-arrow-down");
	    				row.index_state = updatestate;
	    				$('#isputaway').bootstrapTable('updateRow', {index: index, row: row});
					} else {
						showMsg("取消置顶失败")
					}
	    		})
			}
	    },
	    'click .important': function (e, value, row, index) {
	    	var state = parseInt(row.index_state);//获取当前状态
	    	var elementstate = e.target.className;
	    	if (elementstate=="glyphicon glyphicon-star-empty") {//重要
	    		var updatestate;
	    		switch (state) {
				case 0:
					updatestate="01"
					break;
				case 1:
					updatestate="11"
					break;
				case 10:
					updatestate="11"
					break;
				case 11:
					updatestate="11"
					break;
				default:
					break;
				}
	    		$.post("index/updateNoticeState.action",{"row":JSON.stringify(row),state:updatestate},function(result){
	    			if (result.error==200) {
	    				e.target.setAttribute("class", "glyphicon glyphicon-star");
	    				row.index_state = updatestate;
	    				$('#isputaway').bootstrapTable('updateRow', {index: index, row: row});
					} else {
						showMsg("取消置顶失败")
					}
	    		})
			} else {//取消重要
				var updatestate;
	    		switch (state) {
				case 0:
					updatestate="00"
					break;
				case 1:
					updatestate="00"
					break;
				case 10:
					updatestate="10"
					break;
				case 11:
					updatestate="10"
					break;
				default:
					break;
				}
	    		$.post("index/updateNoticeState.action",{"row":JSON.stringify(row),state:updatestate},function(result){
	    			if (result.error==200) {
	    				e.target.setAttribute("class", "glyphicon glyphicon-star-empty");
	    				row.index_state = updatestate;
	    				$('#isputaway').bootstrapTable('updateRow', {index: index, row: row});
					} else {
						showMsg("取消失败")
					}
	    		})
				
			}
	    },
	    'click .remove': function (e, value, row, index) {
	    	//删除
	    	$.post("index/removeById.action",{"id":row.index_id,type:1},function(result){
    			if (result.error==200) {
    				$('#isputaway').bootstrapTable('remove', {field: 'index_id', values: [row.index_id]});
				} else {
					showMsg("删除失败")
				}
    		})
	    }
	};
	
	
	function actionFormatterAll(value, row, index) {
		return [
		        '<a class="addview" href="javascript:void(0)" title="添加到首页">',
		        '<i class="glyphicon glyphicon-plus"></i>',
		        '</a>',
		        '<a class="remove ml10" href="javascript:void(0)" title="删除">',
		        '<i class="glyphicon glyphicon-remove"></i>',
		        '</a>',
		        '<a class="edit ml10" href="javascript:void(0)" title="编辑文章">',
		        '<i class="glyphicon glyphicon-edit"></i>',
		        '</a>'
		    ].join('');
	}
	window.actionEventsAll = {
	    'click .addview': function (e, value, row, index) {
	    	$.post("index/add2View.action",{"id":row.index_id},function(result){
    			if (result.error==200) {
    				$('#isputaway').bootstrapTable('refresh');
				} else {
					showMsg("已经添加过了哦~")
				}
    		})
	    },
	    'click .remove': function (e, value, row, index) {
	    	//删除
	    	$.post("index/removeById.action",{"id":row.index_id,type:0},function(result){
    			if (result.error==200) {
    		            $('#all').bootstrapTable('remove', {
    		                field: 'index_id',
    		                values: [row.index_id]
    		            });
				} else {
					showMsg("删除失败")
				}
    		})
	    },
		'click .edit': function (e, value, row, index) {
	    	//编辑文章
			if(top.topManager){
					top.topManager.openPage({
					    id : 'UpdateArticle',
					    href : 'admin/UpdateArticle.action?id='+row.index_id,
					    title : '编辑文章'
				  });
			}
	    }
	}
	function detailFormatter(index, row) {
//         var html = [];
//         $.each(row, function (key, value) {
//             html.push('<p><b>' + key + ':</b> ' + value + '</p>');
//         });
//         return html.join('');
		 return [
		         '<h3>'+row.index_title+'</h3>',
		         '<div>'+row.index_content+'</div>',
		         ].join('')
    }
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