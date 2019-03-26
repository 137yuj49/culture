<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>

<meta name="viewport" content="width=device-width">

<link href='http://fonts.googleapis.com/css?family=Paytone+One' rel='stylesheet' type='text/css'>
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/webpage/style.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- button 관련  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		var movie_title = $("#movie_title").text();
		
		$.ajax({
			type : "POST",
			url : "selectTheMovie.do",
			data : {"movie_title" : movie_title},
			error : function(request,status,error){alert('code: '+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);},
			success : selectTheMovie
		});
		
	});
	
	var movie_no;
	function selectTheMovie(data) {		
		
		movie_no = data.movie_no;
		
		$("#content").html(data.movie_content);
		$("#moviestar").html(data.moviestar);

	}

	function reservationPage() {
		var movie_title = $("#movie_title").text();
		var movNum = movie_no;
		
		window.location.href="detailReservating.do?movie_title="+movie_title+"&movie_no="+movNum;
	}
</script>

<style type="text/css">
#reservation {margin-top: 230px}
</style>
</head>
<body>
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
	<div class="box3">
		<article class="story">
		
		<div class="story-cat">
		<ul>
		<li><a href="#">공연</a></li>
		<li><a href="#">뮤지컬</a></li>
		</ul>
		</div>
		
		<h1 id="movie_title"><c:out value="${param.movie_name}"></c:out></h1>
		
		<div class="story-info">
		<time datetime="2014-08-10">
		<i class="fa fa-clock-o"></i> 2019년 03월 05일
		</time>
		</div>
			
		<p><img src="${pageContext.request.contextPath}/resources/sumnailImage/jikillandhide3.jpg" alt=""></p>		
		
		<p>지금 이 순간, 배우들의 완벽한 연기와 어우러지는 주옥같은 넘버.</p>
		<p id="content"></p>
		<p id="moviestar"></p> 
		
		<h2>REVIEW</h2>
		
		<p>지킬의 고요함과 하이드의 폭풍 같은 야성적인 연기 - 중앙일보 -</p>
		<p>온몸의 에너지를 쏟아 붓는 열창으로 가슴 뻥 뚫리는 폭발적인 무대 - 동아일보 -</p>
		<p>선과 악이 공존하는 이중적인 그리고 섬세한 연기의 매력 - 국민일보 -</p>
		
		<h2>SYNOPSIS</h2>	
				
		<p>1885년 런던, 헬리 '지킬'은 유능한 의사이자 과학자이며, 사랑하는 엠마와의 결혼을 앞두고 있다. 부족한 것 없어 보이는 그에게 단 
		하나의 걱정은 정신질환을 앓고 있는 아버지. 지킬은 자신의 아버지를 비롯해 정신질환으로 고통받는 환자들을 위해 사람의 정신에서
		선과 악을 분리할 수 있는 치료제 연구를 시작한다.</p>
		<P>사람을 대상으로 하는 임상 실험 단계에 이르렀지만 이사회의 반대로 실험은 무산되고 지킬의 친구이자 변호사인 어터슨은 낙담에 
		빠진 그를 위로하며 웨스트엔드의 한 클럽으로 이끈다. 술에 취한 사람들 사이에서 학대받는 루시를 발견한 지킬, 친구가 필요하면 
		찾아오라며 자신의 명함을 건넨다. 루시는 지금까지 자신이 만나 온 사람들과 달리 자신을 인간적으로 대해준 지킬에게 호감을 느낀다.</P>	
		<p>클럽에서 돌아온 지킬은 이 연구가 자기 자신만이 해결할 수 있는 과제임을 깨닫고 스스로가 실험 대상이 되기로 결정한다.
		그의 바람대로 선과 악을 분리시키는데 성공하지만 시간이 지날수록 악으로 가득 찬 제2의 인물 에드워드'하이드'가 지킬을 장악하며
		통제 불가능한 수준에 이른다.</p>
		<P>실험이 진행될수록 지킬은 엠마와 점점 더 멀어지고, 그러던 어느 날 상처받은 루시가 그를 찾아온다.
		그녀를 상처 입게 만든 사람이 하이드란 것을 알게 된 지킬은 불안에 휩싸인다. 한편, 하이드는 지킬의 실험을 반대했던 이사회 임원들을
		한 명씩 살해하기 시작하고, 위험을 감지한 지킬은 다시금 치료제 주입을 통해 하이드를 잠재우는데 성공하지만 예상치 못한 순간 다시금
		하이드가 등장하게 되는데...</P>
		
		<div class="share">
		<ul>
		<li><a href="https://twitter.com/intent/tweet?text=[글자]&amp;url=http%3A%2F%2Fexample.com&amp;via=[계정]" onclick="window.open(this.href, 'SNS', 'width=500, height=300, menubar=no, toolbar=no, scrollbars=yes'); return false;" class="share-tw">
			<i class="fa fa-twitter"></i>
			<span>Twitter</span>로 공유
		</a></li>
		<li><a href="http://www.facebook.com/share.php?u=http%3A%2F%2Fexample.com" onclick="window.open(this.href, 'SNS', 'width=500, height=500, menubar=no, toolbar=no, scrollbars=yes'); return false;" class="share-fb">
			<i class="fa fa-facebook"></i>
			<span>Facebook</span>으로 공유
		</a></li>
		<li><a href="https://plus.google.com/share?url=http%3A%2F%2Fexample.com" onclick="window.open(this.href, 'SNS', 'width=500, height=500, menubar=no, toolbar=no, scrollbars=yes'); return false;" class="share-gp">
			<i class="fa fa-google-plus"></i>
			<span>Google+</span>로 공유
		</a></li>
		</ul>
		</div>		
		</article>
		
		<aside class="relation">
		<h1>관련 기사</h1>
		<ul>
		<li><a href="http://www.newdaily.co.kr/site/data/html/2018/08/21/2018082100003.html">
			<img src="${pageContext.request.contextPath}/resources/sumnailImage/jikill4-150x150.jpg" alt="">
			<div class="text">
			'지킬 앤 하이드' 100% 설렘되길
			</div>
		</a></li>
		<li><a href="http://www.zenithnews.com/news/articleView.html?idxno=118807">
			<img src="${pageContext.request.contextPath}/resources/sumnailImage/jikill6-150x150.jpg" alt="">
			<div class="text">
			지킬앤하이드 레전드의 귀환
			</div>
		</a></li>
		<li><a href="http://news.hankyung.com/article/201811051309k">
			<img src="${pageContext.request.contextPath}/resources/sumnailImage/kukminilbo-150x150.jpg" alt="">
			<div class="text">
			실전 같은 연습 현장 공개
			</div>
		</a></li>
		<li><a href="http://news.chosun.com/site/data/html_dir/2018/09/20/2018092001206.html">
			<img src="${pageContext.request.contextPath}/resources/sumnailImage/jikill8-150x150.jpg" alt="">
			<div class="text">
			조승우 첫 공연 때 기립박수, 배우 인생에 처음
			</div>
		</a></li>
		</ul>
		</aside>
	</div>
	<div class="box4">
		<div class="box4-1">
			<aside class="sidemenu">
			<h1>특집 기사</h1>
			<ul>
			<li><a href="https://www.mcst.go.kr/kor/s_culture/culture/cultureView.jsp?pSeq=18827&pRo=-1">
				<i class="fa fa-caret-right"></i>
				친정 엄마와 2박 3일 전국 공연
			</a></li>
			<li><a href="http://tenasia.hankyung.com/archives/1669336">
				<i class="fa fa-caret-right"></i>
				뮤지컬 영웅 연습 현장 공개
			</a></li>
			<li><a href="http://www.khan.co.kr/allthatart/art_view.html?art_id=201903041320001">
				<i class="fa fa-caret-right"></i>
				뮤지컬 '엑스칼리버' 캐스팅 공개
			</a></li>
			<li><a href="http://www.hani.co.kr/arti/culture/culture_general/850957.html">
				<i class="fa fa-caret-right"></i>
				뮤지컬 '시카고' 보다가 콜록콜록 왜?
			</a></li>
			</ul>
			</aside>
			
			<aside class="recommend">
			<h1>추천 기사</h1>
			<ul>
			<li><a href="http://www.upinews.kr/news/newsview.php?ncode=1065606836780319">
				<img src="${pageContext.request.contextPath}/resources/sumnailImage/jikill5-400x200.jpg" alt="">
				<div class="text">
				'지킬앤하이드' 2분만에 매진
				</div>
			</a></li>
			<li><a href="http://www.newspim.com/news/view/20181218000275">
				<img src="${pageContext.request.contextPath}/resources/sumnailImage/jikill9-400x200.jpg" alt="">
				<div class="text">
				"역시 조승우" 매 순간이 명장면
				</div>
			</a></li>
			</ul>
			</aside>
		</div>					
		<div class="box4-2">
			<aside class="popular">
			<h1>인기 공연</h1>
			<ul>
			<li><a href="#">
				<img src="${pageContext.request.contextPath}/resources/sumnailImage/mother2-3-60x60.jpg" alt="">
				<div class="text">
				친정 엄마와 2박 3일
				<span>연극</span>
				</div>
			</a></li>
			<li><a href="#">
				<img src="${pageContext.request.contextPath}/resources/sumnailImage/theLionKing-60x60.png" alt="">
				<div class="text">
				The Lion King
				<span>뮤지컬</span>
				</div>
			</a></li>
			<li><a href="#">
				<img src="${pageContext.request.contextPath}/resources/sumnailImage/youngung-60x60.png" alt="">
				<div class="text">
				뮤지컬 영웅
				<span>뮤지컬</span>
				</div>
			</a></li>
			<li><a href="#">
				<img src="${pageContext.request.contextPath}/resources/sumnailImage/leesunjae-60x60.jpg" alt="">
				<div class="text">
				앙리할아버지와 나
				<span>연극</span>
				</div>
			</a></li>
			<li><a href="#">
				<img src="${pageContext.request.contextPath}/resources/sumnailImage/kukhanjob-60x60.jpg" alt="">
				<div class="text">
				극한 직업
				<span>영화</span>
				</div>
			</a></li>
			<li><a href="#">
				<img src="${pageContext.request.contextPath}/resources/sumnailImage/witness-60x60.jpg" alt="">
				<div class="text">
				증인
				<span>영화</span>
				</div>
			</a></li>
			</ul>
			</aside>
		</div>
		<div class="box4-3">
		<button type="button" id="reservation" class="btn btn-primary btn-block" onclick="reservationPage()" >공연 예매</button>
		</div>
	</div>
	</div>
	
	<div class="box5">
	<div class="box5-inner">
		<div class="copyright">
		<p>Copyright &copy; Culture Page</p>
		</div>
	</div>
	</div>
	
</body>
</html>

