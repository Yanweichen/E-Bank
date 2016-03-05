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
<link rel="shortcut icon" type="image/x-icon"
	href="page/assets//img/tubiao.ico" />
<link href="page/assets/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="page/assets/css/mybankbase.css">
<link href="page/assets/css/animated-menu.css" rel="stylesheet">
<link href="http://cdn.bootcss.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
<title>财富总览</title>
</head>
<body style="background-image: url('page/assets/img/bg_grid.png');">
	<!-- 头部导航 -->
	<jsp:include page="../../../page/head_foot/mybank_head.jsp"></jsp:include>
	<div class="container top20">
		<div class="panel panel-default touming6">
		<div class="panel-heading"><h4 style="margin-left: 20px;color: #3f316d;">财富总览</h4></div>
		  <div class="panel-body">
		    <div class="col-sm-4">
				<div id="container" style=""></div>
			</div>
			<div class="col-sm-8" style="padding-top: 50px;">
				<div class="row" style="margin-bottom: 30px;">
					<div class="col-sm-6" style="text-align: center;">
						<h3 id="alloutmoney" style="color: #3f316d"></h3>
					</div>
					<div class="col-sm-6" style="text-align: center;">
						<h3 id="allinmoney" style="color: #3f316d"></h3>
					</div>
				</div>
				<div class="progress">
				  <div id="inprogress" class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="background-color: #F62366;min-width: 6em;">
				  </div>
				</div>
				<div class="progress">
				  <div id="outprogress" class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="background-color: #9DFF02;min-width: 6em;">
				  </div>
				</div>
				<div class="progress" >
				  <div id="payprogress" class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="background-color: #0CCDD6;min-width: 6em;">
				  </div>
				</div>
			</div>
		  </div>
		</div>
			
	</div>
	<!-- foot -->
	<jsp:include page="../../../page/head_foot/foot.jsp"></jsp:include>
	<script src="page/assets/js/jquery-1.8.1.min.js"></script>
	<script src="page/assets/js/jquery.easing.1.3.js"></script>
	<script src="page/assets/js/bootstrap.min.js"></script>
	<script src="page/assets/js/highcharts.js"></script>
	<script src="page/assets/js/highcharts-more.js"></script>
	<script src="page/assets/js/solid-gauge.js"></script>
	<script type="text/javascript">
		$.post("trade/getTypeWeight.action",function(json){
		$(function () {

	    // Uncomment to style it like Apple Watch
	    if (!Highcharts.theme) {
	        Highcharts.setOptions({
	            chart: {
	                backgroundColor: 'transparent'
	            },
	            colors: ['#F62366', '#9DFF02', '#0CCDD6'],
	            title: {
	                style: {
	                    color: '#3f316d'
	                }
	            },
	            tooltip: {
	                style: {
	                    color: '#3f316d'
	                }
	            }
	        });
	    }
	
	    Highcharts.chart('container', {
	
	        chart: {
	            type: 'solidgauge',
	            marginTop: 30
	        },
	
	        title: {
	            text: '资金比',
	            style: {
	                fontSize: '24px'
	            },
	            maigin:0,
	        },
	
	        tooltip: {
	            borderWidth: 0,
	            backgroundColor: 'none',
	            shadow: false,
	            style: {
	                fontSize: '16px'
	            },
	            pointFormat: '{series.name}<br><span style="font-size:2em; color: {point.color}; font-weight: bold">{point.y}%</span>',
	            positioner: function (labelWidth, labelHeight) {
	                return {
	                    x: 170 - labelWidth / 2,
	                    y: 170
	                };
	            }
	        },
	
	        pane: {
	            startAngle: 0,
	            endAngle: 360,
	            background: [{ // Track for Move
	                outerRadius: '112%',
	                innerRadius: '88%',
	                backgroundColor: Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0.3).get(),
	                borderWidth: 0
	            }, { // Track for Exercise
	                outerRadius: '87%',
	                innerRadius: '63%',
	                backgroundColor: Highcharts.Color(Highcharts.getOptions().colors[1]).setOpacity(0.3).get(),
	                borderWidth: 0
	            }, { // Track for Stand
	                outerRadius: '62%',
	                innerRadius: '38%',
	                backgroundColor: Highcharts.Color(Highcharts.getOptions().colors[2]).setOpacity(0.3).get(),
	                borderWidth: 0
	            }]
	        },
	
	        yAxis: {
	            min: 0,
	            max: 100,
	            lineWidth: 0,
	            tickPositions: []
	        },
	
	        plotOptions: {
	            solidgauge: {
	                borderWidth: '34px',
	                dataLabels: {
	                    enabled: false
	                },
	                linecap: 'round',
	                stickyTracking: false
	            }
	        },
	
	        series: [{
	            name: json.tradeinfo[0].typename,
	            borderColor: Highcharts.getOptions().colors[0],
	            data: [{
	                color: Highcharts.getOptions().colors[0],
	                radius: '100%',
	                innerRadius: '100%',
	                y: json.tradeinfo[0].percent
	            }]
	        }, {
	            name: json.tradeinfo[1].typename,
	            borderColor: Highcharts.getOptions().colors[1],
	            data: [{
	                color: Highcharts.getOptions().colors[1],
	                radius: '75%',
	                innerRadius: '75%',
	                y: json.tradeinfo[1].percent
	            }]
	        }, {
	            name: json.tradeinfo[2].typename,
	            borderColor: Highcharts.getOptions().colors[2],
	            data: [{
	                color: Highcharts.getOptions().colors[2],
	                radius: '50%',
	                innerRadius: '50%',
	                y: json.tradeinfo[2].percent
	            }]
	        }]
	    },
	
	    /**
	     * In the chart load callback, add icons on top of the circular shapes
	     */
	    function callback() {
	
	        // Move icon
	        this.renderer.path(['M', -8, 0, 'L', 8, 0, 'M', 0, -8, 'L', 8, 0, 0, 8])
	            .attr({
	                'stroke': '#303030',
	                'stroke-linecap': 'round',
	                'stroke-linejoin': 'round',
	                'stroke-width': 2,
	                'zIndex': 10
	            })
	            .translate(160, 40)
	            .add(this.series[2].group);
	
	        // Exercise icon
	        this.renderer.path(['M', -8, 0, 'L', 8, 0, 'M', 0, -8, 'L', 8, 0, 0, 8, 'M', 8, -8, 'L', 16, 0, 8, 8])
	            .attr({
	                'stroke': '#303030',
	                'stroke-linecap': 'round',
	                'stroke-linejoin': 'round',
	                'stroke-width': 2,
	                'zIndex': 10
	            })
	            .translate(160, 75)
	            .add(this.series[2].group);
	
	        // Stand icon
	        this.renderer.path(['M', 0, 8, 'L', 0, -8, 'M', -8, 0, 'L', 0, -8, 8, 0])
	            .attr({
	                'stroke': '#303030',
	                'stroke-linecap': 'round',
	                'stroke-linejoin': 'round',
	                'stroke-width': 2,
	                'zIndex': 10
	            })
	            .translate(160, 110)
	            .add(this.series[2].group);
	    });
	});
		//设置总收支
		$("#allinmoney").html("总收入 : <span style='color: #9DFF02'>"+json.outin.allin+"</span>");
		$("#alloutmoney").html("总支出 : <span style='color: #0CCDD6'>"+json.outin.allout+"</span>");
		//设置进度条	
		$("#inprogress").css("width",json.tradeinfo[0].percent+"%");
		$("#inprogress").text(json.tradeinfo[0].typename+":"+json.tradeinfo[0].money);
		$("#outprogress").css("width",json.tradeinfo[1].percent+"%");
		$("#outprogress").text(json.tradeinfo[1].typename+":"+json.tradeinfo[1].money);
		$("#payprogress").css("width",json.tradeinfo[2].percent+"%");
		$("#payprogress").text(json.tradeinfo[2].typename+":"+json.tradeinfo[2].money);
		
	});//post end
	</script>
</body>
</html>