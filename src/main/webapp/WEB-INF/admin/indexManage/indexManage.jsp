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
<style type="text/css">
.ml10 {
    margin-left: 10px;
}
</style>
<title>首页管理</title>
</head>
<body>
	<div class="row" style="padding: 40px">
		<div class="row">
			<div class="col-sm-12">
				<table id="isputaway" data-toggle="table" data-width="50px" data-pagination="true" 
				   data-side-pagination="server"
			       data-show-refresh="true"
			       data-show-toggle="true"
			       data-show-columns="true"
			       data-detail-view="true"
			       data-detail-formatter="detailFormatter">
				    <thead>
				        <tr>
				        	<th class="detail"><div class="fht-cell"></div></th>
				            <th data-field="index_id" data-align="center">ID</th>
				            <th data-field="index_type" data-align="right">类型</th>
				            <th data-field="index_title" data-align="center">标题</th>
				            <th data-field="index_uptime_format" data-align="">上传时间</th>
				            <th data-field="upfrom" data-align="">上传者</th>
				            <th data-field="action" data-align="" data-formatter="actionFormatter" data-events="actionEvents">操作</th>
				        </tr>
				    </thead>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<table id="all" data-toggle="table" 
				   data-width="50px" 
				   data-pagination="true" 
				   data-side-pagination="server"
			       data-show-refresh="true"
			       data-page-list="[5, 10, 20, 50, 100, 200]"
			       data-show-toggle="true"
			       data-show-columns="true">
				    <thead>
				        <tr>
				            <th data-field="index_id" data-align="center" data-sortable="true">ID</th>
				            <th data-field="index_type" data-align="right">类型</th>
				            <th data-field="index_title" data-align="center">标题</th>
				            <th data-field="index_content" data-align="">内容</th>
				            <th data-field="index_uptime_format" data-align="" data-sortable="true">上传时间</th>
				            <th data-field="upfrom" data-align="">上传者</th>
				            <th data-field="action" data-align="" data-formatter="actionFormatterAll" data-events="actionEventsAll">操作</th>
				        </tr>
				    </thead>
				</table>
			</div>
		</div>
	</div>
	
<script src="page/assets/js/jquery-1.8.1.min.js"></script>
<script src="page/assets/js/bootstrap.min.js"></script>
<script src="page/assets/js/bootstrap-table.js"></script>
<script src="page/assets/js/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript">
	function queryParams() {
	    return {
	        type: 0,
	        sort: 'index_id',
	        order: 'desc',
	        offset: 100,
	        limit: 1
	    };
	}
	$.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['zh-CN']);
	$('#isputaway').bootstrapTable({
	    url: 'index/indexnotice.action',
	   queryParams: "type=0"
	});
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
	    		$.post("index/getCountByState.action",{state:1},function(result){
	    			if (result.count==0) {
	    				$.post("index/updateNoticeState.action",{"row":JSON.stringify(row),state:updatestate},function(result){
			    			if (result.error==200) {
					    		e.target.setAttribute("class", "glyphicon glyphicon-arrow-up");
							} else {
								alert("置顶失败")
							}
			    		})
					}else{
						alert("已经有置顶项了哦~")
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
					} else {
						alert("取消置顶失败")
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
					updatestate="01"
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
					} else {
						alert("取消置顶失败")
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
					} else {
						alert("取消失败")
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
					alert("删除失败")
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
		        '</a>'
		    ].join('');
	}
	window.actionEventsAll = {
	    'click .addview': function (e, value, row, index) {
	    	$.post("index/add2View.action",{"row":JSON.stringify(row)},function(result){
    			if (result.error==200) {
    				$('#isputaway').bootstrapTable('refresh');
				} else {
					alert("添加失败")
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
					alert("删除失败")
				}
    		})
	    }
	}
	function detailFormatter(index, row) {
        var html = [];
        $.each(row, function (key, value) {
            html.push('<p><b>' + key + ':</b> ' + value + '</p>');
        });
        return html.join('');
    }
</script>
</body>
</html>