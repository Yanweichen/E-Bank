<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	// 获得项目完全路径（假设你的项目叫MyApp，那么获得到的地址就是 http://localhost:8080/MyApp/）:
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href=" <%=basePath%>">
<button id="start">start</button>
<link rel="stylesheet" href="page/assets/css/amaran.min.css">
<link rel="stylesheet" href="page/assets/css/animate.min.css">
<script src="page/assets/js/jquery-1.8.1.min.js"></script>
<script src="page/assets/js/jquery.amaran.js"></script>
<script type="text/javascript">
	$('#start').on('click',function(){
		$.amaran({
		    content:{
		        title:'My first funcy example!',
		        message:'1.4 GB',
		        info:'my_birthday.mp4',
		        icon:'fa fa-download'
		    },
		    theme:'awesome ok'
		});
	});
</script>
