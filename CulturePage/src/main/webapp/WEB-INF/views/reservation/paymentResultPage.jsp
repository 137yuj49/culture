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

<!-- button 관련  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script>

$(function(){

	$("#menubtn").click(function(){
		$("#menu").slideToggle();
	});

});

function moveMain() {
	location.href="index.do";
}
</script>

<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 970px;
  margin-bottom: 30px;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

th, td {
  padding: 15px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}

h3 {margin-top: 70px}
</style>

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
	<li><a href="index.do">메인</a></li>
	<li><a href="showList.do">공연정보</a></li>
	<li><a href="freeboard.do">게시판</a></li>
	<li><a href="#">이벤트</a></li>
	</ul>
	</nav>
</div>
</div>

<h3>결제 정보</h3>
<div class="box3">
<table border="1">
	<thead>
	<tr>
	<th>아이디</th>
	<th>티켓번호</th>
	<th>공연제목</th>
	<th>공연날짜</th>
	<th>공연시간</th>
	<th>결제금액</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="paymentResult" items="${list}">
	<tr>
	<td>${paymentResult.id}</td>
	<td>${paymentResult.ticket_no}</td>
	<td>${paymentResult.movie_title}</td>
	<td>${paymentResult.screeningdate}</td>
	<td>${paymentResult.screeningtime}</td>
	<td>${price}</td>
	</tr>
	</c:forEach>
	</tbody>
</table>
<button type="button" id="moveMain" class="btn btn-primary btn-block" onclick="moveMain()">메인으로 이동</button>
</div>
</div>

</body>
</html>
