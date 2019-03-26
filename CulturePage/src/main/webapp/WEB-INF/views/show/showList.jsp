<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공연 정보</title>
<meta name="viewport" content="width=device-width">

<link href='http://fonts.googleapis.com/css?family=Paytone+One' rel='stylesheet' type='text/css'>

<link href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.css" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/webpage/stylelist.css">

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
	function detailPage() {		
		var movie_name = $("#title").text();		
		window.location.href="detailPage.do?movie_name="+movie_name;		
	}
</script>
</head>
<body class="top">


<div class="box1">
	<div class="site">
	<h1><a href="#">Culture Page</a></h1>
	</div>
</div>

<div class="box2">
<div class="box2-inner">
	<nav class="menu">
	<ul>
	<li><a href="index.do">메인</a></li>
	<li><a href="showList.do">공연정보</a></li>
	<li><a href="freeboard.do">게시판</a></li>
	<li><a href="#">이벤트</a></li>
	</ul>
	</nav>
</div>
</div>


<div class="boxA">
	<article class="summary pickup">
	<a href="#" onclick="detailPage()">
		<div class="badge">
		<i class="fa fa-thumbs-o-up"></i>추천 공연
		</div>
	
		<img src="${pageContext.request.contextPath}/resources/sumnailImage/jikillandhide2.jpg" alt="">
		<h1 id="title">지킬 앤 하이드</h1>
		<p>지금 이 순간, 배우들의 완벽한 연기와 어우러지는 주옥같은 넘버</p>
		<p>다시 시작되는 신화, 대한민국 독보적인 NO.1 뮤지컬</p>
		<p>전율의 무대를 선사할 가장 완벽한 라인업!, 조승우, 홍광호, 박은태, 민우혁, 아이비</p>
		<p class="more">계속 읽기<i class="fa fa-chevron-right"></i></p>
	</a>
	</article>

<div class="boxA-1">
	<article class="summary">
	<a href="#">
		<img src="${pageContext.request.contextPath}/resources/sumnailImage/greece2.jpg" alt="">
		<h1>그리스</h1>
		<p>대한민국 뮤지컬 16년 신화, 뉴트로 감성으로 재탄생</p>
		<p>9인조 라이브 밴드와 함께 신나는 ROCK-ROLL!, 생동감 넘치는 라이브!!!</p>
		<p class="more">계속 읽기<i class="fa fa-chevron-right"></i></p>
	</a>
	</article>

	<article class="summary">
	<a href="#">
		<img src="${pageContext.request.contextPath}/resources/sumnailImage/kukhanjob3.jpg" alt="">
		<h1>극한직업</h1>
		<p>지금까지 이런 수사는 없었다!</p>
		<p>국제 범죄조직의 마약 밀반입 수사위해 잠복 근무하는 마약반의 활약!</p>
		<p class="more">계속 읽기<i class="fa fa-chevron-right"></i></p>
	</a>
	</article>

	<article class="summary">
	<a href="#">
		<img src="${pageContext.request.contextPath}/resources/sumnailImage/youngung1.png" alt="">
		<h1>영웅</h1>
		<p>2019년, 대한민국이 기다려온 영웅이 온다!</p>
		<p>매 시즌 전 국민의 사랑을 받아온 뮤지컬 영웅</p>
		<p class="more">계속 읽기<i class="fa fa-chevron-right"></i></p>
	</a>
	</article>

	<article class="summary">
	<a href="#">
		<img src="${pageContext.request.contextPath}/resources/sumnailImage/theLionKing1.png" alt="">
		<h1>THE LION KING</h1>
		<p>20개국, 100개 이상의 도시에서 공연되며 9천 5백만 명 이상 관람!</p>
		<p>토니 어워즈 6개 부문을 비롯해 메이저 시상식 70개 이상의 상 석권</p>
		<p class="more">계속 읽기<i class="fa fa-chevron-right"></i></p>
	</a>
	</article>
</div>

	<div class="pagenation">
	<ul>
	<li><a href="#" class="active">1</a></li>
	<li><a href="#">2</a></li>
	<li><a href="#">3</a></li>
	<li><a href="#">4</a></li>
	<li><a href="#">5</a></li>
	</ul>
	</div>
	
</div>


<div class="box5">
<div class="box5-inner">
	<div class="copyright">
	<p>Copyright &copy; TimeSwitch</p>
	</div>
</div>
</div>


</body>
</html>


