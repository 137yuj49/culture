<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>예매 페이지</title>

<script>
$(function(){

	$("#menubtn").click(function(){
		$("#menu").slideToggle();
	});

});
</script>

<!-- boot pay 연동 관련  -->
<script src="https://cdn.bootpay.co.kr/js/bootpay-2.1.1.min.js" type="application/javascript"></script>

<script type="text/javascript">
	$(document).ready(function(){

		alert(memberId);
		alert(screeningplan_no);
		
		$.ajax({
			type : "POST",
			url : "selectTicketInfo.do",
			dataType : "JSON",
			data : {"id" : memberId, "screeningplan_no" : screeningplan_no},
			error : function(request,status,error){alert('code: '+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);},
			success : tickeInfo
		});
	});
	
	function tickeInfo(data) {
		$.each(data, function(idx, val){
			$("ticketList").append("<td>"+val.movie_title+"</td>"+"\n"+
								   "<td>"+val.movieplace_name+"</td>"+"\n"+
								   "<td>"+val.seat_no+"</td>"+"\n"+
								   "<td>"+val.price+"</td>");
		});
	}
</script>

</head>
<body class="contents">

<div class="boxA">
<div class="boxA-inner">
<div class="box1">
	<div class="site">
	<h1><a href="#"><img src="${pageContext.request.contextPath}/resources/sumnail/logo-large.png" alt="TimeSwitch" width="250" height="33"></a></h1>
	</div>
</div>

<div class="box2">

	<button type="button" id="menubtn">
	<i class="fa fa-bars"></i><span>MENU</span>
	</button>

	<nav class="menu" id="menu">
	<ul>
	<li><a href="#">메인</a></li>
	<li><a href="#">연혁</a></li>
	<li><a href="#">사업 소개</a></li>
	<li><a href="#">채용 정보</a></li>
	<li><a href="#">문의</a></li>
	</ul>
	</nav>
</div>
</div>
</div>

<div class="box7">
<div class="box7-1">
	<article class="story">
		<div class="bread">
		<ol>
		<li><a href="#">메인</a></li>
		<li><a href="#">사업 소개</a></li>
		</ol>
		</div>
	
	
		<h1>데이터 분석/해석</h1>
		
		<img src="${pageContext.request.contextPath}/resources/sumnail/header-data.jpg" alt="" class="story-img">
	
		<p class="lead">축적된 데이터를 활용하려면 어떻게 분석/해석할지가 중요합니다. TimeSwitch에서는 표준적인 분석 방법과 활용 목적에 따른 해석을 제공합니다.</p>
	
		<h2><i class="fa fa-check-square-o"></i>평균값 확인</h2>
	
		<p>기본적인 평균입니다. 대상 데이터들의 대표적인 수치를 확인할 수 있습니다. 다만 평균만으로는 데이터 쏠림 등의 문제를 확인할 수 없습니다.</p>
	
	
		<h2><i class="fa fa-check-square-o"></i>분산 확인</h2>
	
		<p>분산 확인
		   통계적인 방법을 사용해서 축적된 데이터의 분산을 확인합니다. 분산을 사용하면 평균값으로는 보이지 않는 문제와 특징을 찾아낼 수 있습니다.</p>
				
	
	</article>
</div>
<div class="box7-2">
	<aside class="sidemenu">
		<h1><i class="fa fa-caret-square-o-down"></i>사업소개</h1>
		<ul>
		<li><a href="#">데이터 축적</a></li>
		<li><a href="#">데이터 분석/해석</a></li>
		<li><a href="#">데이터 시각화</a></li>
		<li><a href="#">애플리케이션 활용</a></li>
		<li><a href="#">24시간 지원</a></li>
		<li><a href="#">실적 소개</a></li>
		</ul>
	</aside>
</div>
	
</div>

<form action="">
<div class="box6">
<table width="100%" cellspacing="0">
	<thead>
	<tr>
	<th>예매자</th>
	<th>공연상영넘버</th>
	<th>공연제목</th>
	<th>공연장소</th>
	<th>티켓자리</th>
	<th>결제금액</th>
	</tr>
	</thead>
	<tbody>	
	<tr id="ticketList">
	<td id="memId">${member.id}</td>
	<td id="screeningplan_no">${screeningplan_no}</td>
	
	</tr>
	</tbody>
</table>
</div>
<input type="button" id="payment" value="결제하기" onclick="payment()" />
</form>

<div class="box5">
<div class="box5-inner">
	<div class="copyright">
	<p>Copyright &copy; TimeSwitch</p>
	</div>
</div>
</div>

</body>
</html>
