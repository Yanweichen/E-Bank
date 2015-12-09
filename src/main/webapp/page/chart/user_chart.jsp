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
<link href="../assets/css/dpl-min.css" rel="stylesheet">
<link href="../assets/css/bui-min.css" rel="stylesheet">
<meta charset="utf-8">
<title>饼图</title>
<style type="text/css">
#Container{
    width:1800px;
    margin:0 auto;/*设置整个容器在浏览器中水平居中*/
}
 .top{
 	overflow : auto;
 	margin: 30px
 }
 .hello{
 	float: left;
 	height: 363px;
 	width: 500px;
 	margin-right: 30px;
 }
 .linechart{
 	float :left;
 	margin-left: 60px
 }
 .cen{
 	float: left;
 	margin: 30px;
 	margin-top:10px;
 }
</style>
</head>
<body>
	<!-- JS import start -->
	<!-- 通用JS -->
	<script src="../assets/js/jquery-1.8.1.min.js"></script>
	<script src="../assets/js/bui-min.js"></script>
	<!-- 图表所需JS -->
	<script src="../assets/js/acharts.js"></script>
	<!-- JS import end -->
	<div id="Container">
	<div class="top">
		<div class="hello">
			<div class="panel">
				<div class="panel-header">
					<h3>欢迎登陆</h3>
				</div>
				<div class="panel-body">
					<div class="hello"></div>
				</div>
			</div>
		</div>
		<div class="linechart">
			<div class="panel">
				<div class="panel-header">
					<h3>周内收支</h3>
				</div>
				<div class="panel-body">
					<div id="line"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="cen">
		<div class="panel">
			<div class="panel-header">
				<h3>资金占比</h3>
			</div>
			<div class="panel-body">
				<div id="pie"></div>
			</div>
		</div>
	</div>


</div>
		<script type="text/javascript">
			//饼图
			var piechart = new AChart({
				id : 'pie',
				theme : AChart.Theme.SmoothBase,
				width : 500,
				height : 400,
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
					data : [ [ '收入', 55.0 ], [ '支出', 36.8 ], {
						name : '理财',
						y : 12.8,
						sliced : true,
						selected : true
					}, [ '转账', 8.5 ], [ '缴费', 6.2 ], [ '贷款', 0.7 ] ]
				} ]
			});
			piechart.render();
			//折线图
			var multiple = 350;
			var linechart = new AChart({
				theme : AChart.Theme.SmoothBase,
				id : 'line',
				width : 1.9*multiple,
				height : 1*multiple,
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
					data : [ 1000, 1500, 1800, 2000, 9000, 6000, 3000 ]
				}, {
					name : '收入',
					data : [ 6000, 2000, 1600, 5000, 3000, 1000, 800 ]
				} ]
			});

			linechart.render();
		</script>
		<!-- script end -->
</body>
</html>