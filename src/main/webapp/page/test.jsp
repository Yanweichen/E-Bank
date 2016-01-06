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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="page/assets/css/bootstrap.min1.css" rel="stylesheet">
<link href="page/assets/css/fakeloader.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<div class="fakeLoader"></div>
<script src="<%=basePath%>page/assets/js/jquery.min.js"></script>
<script src="<%=basePath%>page/assets/js/fakeloader.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $(".fakeloader").fakeLoader({
        timeToHide:1200,
        bgColor:"#e74c3c",
        spinner:"spinner2"
    });
});

</script>
</body>
</html>