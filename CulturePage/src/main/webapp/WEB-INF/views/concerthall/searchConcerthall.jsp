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

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eaf01106b768e2ee868e3fb22b2f2fcb"></script>

<script type="text/javascript">
$(document).ready(function(){
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new daum.maps.LatLng(37.552828, 126.999556), //지도의 중심좌표.37.552828, 126.999556
	level: 3 //지도의 레벨(확대, 축소 정도)
};

var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴	
});
</script>

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
	<h1><a href="#">Culture Page</a></h1>
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

<div class="box3">
<div id="map" style="width:500px;height:400px;"></div>

</div>
</div>

</body>
</html>
