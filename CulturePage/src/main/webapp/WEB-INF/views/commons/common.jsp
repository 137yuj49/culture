<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>예매 페이지</title>


<meta name="viewport" content="width=device-width">

<link href='http://fonts.googleapis.com/css?family=Paytone+One' rel='stylesheet' type='text/css'>

<link href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.css" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/webpage/stylelist.css">

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script>
$(function(){

	$("#menubtn").click(function(){
		$("#menu").slideToggle();
	});

});
</script>

</head>
<body class="contents">

<div class="boxA">
<div class="boxA-inner">
<div class="box1">
	<div class="site">
	<h1><a href="index.do">Culture Page</a></h1>
	</div>
</div>

<div class="box2">

	<nav class="menu" id="menu">
	<ul>
	<li><a href="#">메인</a></li>
	<li><a href="#">공연 정보</a></li>
	<li><a href="#">게시판</a></li>
	<li><a href="#">이벤트</a></li>
	</ul>
	</nav>
</div>
</div>
</div>

</body>
</html>
