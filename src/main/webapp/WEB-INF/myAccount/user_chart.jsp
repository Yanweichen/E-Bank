<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	// 获得项目完全路径（假设你的项目叫MyApp，那么获得到的地址就是 http://localhost:8080/MyApp/）:
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href=" <%=basePath%>">

<link href="page/assets/css/bootstrap.css" rel="stylesheet">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>饼图</title>
<style type="text/css">
.top {
	margin: 30px;
}

.tophight {
	height: 200px;
}

.height {
	margin: 30px;
	margin-left: 0px;
	margin-bottom: 20px;
}

.h_one {
	font-size: 30px;
}

.h_two {
	font-size: 20px;
}

.h_thr {
	font-size: 15px;
	margin: 20px;
	margin-top: 30px;
	margin-left: 0px;
}

.bottm_thr {
	color: #666;
	letter-spacing: 10px;
	margin-top: 80px;
	text-align: center;
	display: block;
}

@media ( max-width :1366px) {
	.bignum {
		font-size: 20px;
		margin-top: 70px;
		text-align: center;
	}
}

@media ( min-width :1366px) {
	.bignum {
		font-size: 50px;
		margin-top: 70px;
		text-align: center;
	}
}

.daihuankuan {
	letter-spacing: 5px;
}

.hello {
	float: left;
	height: 310px;
	width: 900px;
	margin-right: 30px;
}

.linechart {
	float: left;
	margin-left: 60px
}

.cen {
	margin: 30px;
	margin-top: 10px;
}

.notice {
	float: left;
	height: 330px;
	width: 1613px;
	margin: 30px;
	margin-top: 0px;
}


.piechart {
	float: right;
}

.panleinline {
	display: inline-block;
}
.yuanjiao {
	border-radius: 15px;
}
.yuanjiaoup{
	border-radius: 15px 15px 0px 0px;
}
.yuanjiaodown{
	border-radius: 0px 15px 15px 15px;
}
.wordspace2{
	letter-spacing: 2px;
}
.wordspace3{
	letter-spacing: 3px;
}
.wordspace4{
	letter-spacing: 4px;
}
</style>
</head>
<body style="background-image: url('page/assets/img/bg_grid.png');">
	<!-- JS import start -->
	<!-- 通用JS -->
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<script src="page/assets/js/bui-min.js"></script>
	<!-- 图表所需JS -->
	<script src="page/assets/js/acharts.js"></script>
	<!-- bootstrap -->
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<script src="page/assets/js/bootstrap.min.js"></script>
	<!-- JS import end -->
	
	<div class="top">
		<div class="row">
			<div class="col-sm-6">
				<div class="well tophight yuanjiaodown">
					<h2 class="wordspace4">你好:</h2>
					<h4 class="wordspace2">Root,欢迎登陆！您是本行XXX级用户</h4>
					<p >今天是2015年12月10日,星期四</p>
					<p >上次登录时间2015年12月10日19:19:44,今日是第X次登陆</p>
					<a href="index/notice.action?num=3">测试</a>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="panel panel-info tophight yuanjiao">
					<div class="panel-heading yuanjiaoup">
						<h4 class="text-center wordspace3">余额</h4>
					</div>
					<div class="panel-body">
						<h1 class="text-center">45500</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="panel panel-success tophight yuanjiao">
					<div class="panel-heading yuanjiaoup">
						<h4 class="text-center wordspace3">利率</h4>
					</div>
					<div class="panel-body">
						<h1 class="text-center">4.5%</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="panel panel-warning tophight yuanjiao">
					<div class="panel-heading yuanjiaoup">
						<h4 class="text-center wordspace3">待还款</h4>
					</div>
					<div class="panel-body">
						<h1 class="text-center">0</h1>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="cen">
		<div class="row">
			<div class="col-sm-8">
				<div class="panel panel-primary yuanjiao">
					<div class="panel-heading yuanjiaoup">周内收支</div>
					<div class="panel-body">
						<div id="line" style="margin:0px; margin-top: 20px" align="center"></div>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="panel panel-primary yuanjiao">
					<div class="panel-heading yuanjiaoup">资金占比</div>
					<div class="panel-body" style="padding-top: 35px">
						<div id="pie" align="center"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
			
		var screenwidth = window.screen.height;
		var piew,pieh,linw,linh;
		if (screenwidth > 768) {
			piew = 550;
			pieh = 400;
			linw = 1050;
			linh = 400;
		}else{
			piew = 320;
			pieh = 300;
			linw = 650;
			linh = 300;
		}
		$.post("trade/getTypeWeight.action",function(json){
			
		
			//饼图
			var piechart = new AChart({
				id : 'pie',
				theme : AChart.Theme.SmoothBase,
				width : piew,
				height : pieh,
				title : {
					text:'本周资金占比',
					stroke : '#999',
				},
				plotCfg : {
					margin : [ 50, 50, 80 ]
				//画板的边距
				},
				legend : null,//不显示图例
				seriesOptions : { //设置多个序列共同的属性
					pieCfg : {
						allowPointSelect : true,
						labels : {
							distance : 30,//文本距离圆的距离
							label : {
							//文本信息可以在此配置
							},
							renderer : function(value, item) { //格式化文本
								return value + ' '
										+ (item.point.percent * 100).toFixed(2)
										+ '%';
							},
						}
					}
				},
				tooltip : {
					pointRenderer : function(point) {
						return (point.percent * 100).toFixed(2) + '%';
					}
				},
				series : [ {
					type : 'pie',
					name : '资金分布',
					legendType : 'circle', //显示在legend上的图形
					legend : {
						position : 'bottom',
						checkable : false,//是否可以勾选
						back : null, //背景清空
						spacingX : 15, //增加x方向间距
						spacingY : 25, //增加Y方向间距
						itemCfg : { //子项的配置信息
							label : {
								fill : '#999',//字体颜色
								'text-anchor' : 'start',
								cursor : 'pointer'
							}
						}
					},
					events : {
						itemclick : function(ev) {
							var point = ev.point
							//item = ev.item, //点击的项
							console.log(point); //执行一系列操作
						},
						//选中事件
						itemselected : function(ev) {
							console.log(ev.point.xValue + ' selected');
						},
						//取消选中
						itemunselected : function(ev) {
							console.log(ev.point.xValue + ' unselected');
						}
					},
// 					data : [ [ '收入', 55.0 ], [ '支出', 36.8 ], {
//						name : '理财',
//						y : 12.8,
//						sliced : true,
//						selected : true
//					}, [ '转账', 8.5 ], [ '缴费', 6.2 ], [ '贷款', 0.7 ] ]
					data :json
				} ]
			});
			piechart.render();
		})
			//折线图
			var linechart = new AChart({
				theme : AChart.Theme.SmoothBase,
				id : 'line',
				width : linw,
				height : linh,
				title : {
					text : '本周收入支出',
					stroke : '#999',
				},
				subTitle : {
					text : '数据来自xxx'
				},
				plotCfg : {
					margin : [ 50, 50, 80 ]
				//画板的边距
				},

				xAxis : {
					categories : [ '周一', '周二', '周三', '周四', '周五', '周六', '周日' ]
				},
				seriesOptions : { //设置多个序列共同的属性
					lineCfg : { //不同类型的图对应不同的共用属性，lineCfg,areaCfg,columnCfg等，type + Cfg 标示
						labels : { //标示显示文本
							label : { //文本样式
								y : -20,
								x : 15,
								font : '10px/2',
							},
							//渲染文本
							renderer : function(value, item) { //通过item修改属性
								if (value > 5000) {
									item.fill = '#FF9D40';
									item['font-weight'] = 'bold';
									item['font-size'] = 16;
								}
								return value;
							}
						}
					}
				},
				tooltip : {
					valueSuffix : '￥',
					shared : true, //是否多个数据序列共同显示信息
					crosshairs : true, //是否出现基准线
				},
				series : [ {
					name : '支出',
					data : [ 1000, 1500, 800, 2000, 9000, 6000, 3000 ]
				}, {
					name : '收入',
					data : [ 6000, 2000, 2600, 5000, 3000, 1000, 800 ]
				} ]
			});

			linechart.render();
		</script>
		<!-- script end -->
</body>
</html>