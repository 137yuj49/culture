<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>

<meta name="viewport" content="width=device-width">

<style type="text/css">	
			
	ul {list-style: none;
		padding-left: 0px}
	
</style>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- boot pay 연동 관련  -->
<script src="https://cdn.bootpay.co.kr/js/bootpay-2.1.1.min.js" type="application/javascript"></script>

<link href="${pageContext.request.contextPath}/resources/css/webpage/detailReservation.css" rel="stylesheet" type="text/css">

<!-- font 관련 link -->
<link href='http://fonts.googleapis.com/css?family=Paytone+One' rel='stylesheet' type='text/css'>

<!-- button 관련  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script type="text/javascript">	
	var pri = null;
	
	$(document).ready(function(){
		$(".box6-3").hide();
		
		$("#movieplace1").on("click","li",function(){
			
			$("li#mp").css("color","");
			$("li#movieplace_no").remove();
			$("li#movlist").remove();
			$("li#movie_no").remove();
			$("li#movdate").remove();
			$("li#moviedate").remove();
			$("li#test").remove();
			$("li#lastPrice").remove();
			
			$(this).css("color","orange");

			var num = $(this).attr("value");
			var num1 = $(this).text();
			$.ajax({
				method : "POST",
				url : "selectAllMovieAbout.do",
				dataType : "JSON",
				data : {movieplace_no : num},
				error : function(){alert('error');},
				success : result,
				complete : function(){$('#myReservation').append("<li id='movieplace_no' value='"+num+"'>"+num1 + "</li>");}
			});			
		});
	});

	var priceValues = [];
	function result(data){
			$.each(data, function(idx,val){
				$('#movieList1').append("<li id='movlist' value='" +val.movie_no +"'>" +val.movie_title +"</li>");
				priceValues.push(val.price);
			});
			
	}
	//////////////////////////////////////////////////////////////////////////////////////////////////////////
	$(document).ready(function(){
		$("#movieList1").on("click","li",function(){
			
			$("li#movlist").css("color", "");
			$("li#movie_no").remove();
			$("li#movdate").remove();
			$("li#moviedate").remove();
			$("li#test").remove();
			$("li#lastPrice").remove();
			
			$(this).css("color","orange");
			
			var index =  $(this).index();
			//$('#price').append(priceValues[index]);	
			pri = priceValues[index];
			
			var movien = $(this).attr("value");
			var moviename = $(this).text();
			var moviep = $("#movieplace_no").attr("value");
			
			$.ajax({
				method : "POST",
				url : "getScreeningPlan.do",
				dataType : "JSON",
				data : {movie_no : movien, movieplace_no : moviep},
				error : function(){alert('error');},
				success : plan,
				complete : function(){$('#myReservation').append("<li id='movie_no' value='"+movien+"'>"+moviename+"</li>");}
			});			
		});
	});
	
	
	function plan(data){			
		$.each(data, function(idx,val){
			$('#movieDate1').append("<li id='movdate' value='" + val.screeningplan_no +"'>" +val.screeningdate+" > "+val.screeningtime +"</li>");
		});							
	}
	//////////////////////////////////////////////////////////////////////////////////////////////////////////
	$(document).ready(function(){
		$("#movieDate1").on("click","li",function(){
			$("li#movdate").css("color", "");
			$("li#moviedate").remove();
			$("li#test").remove();
			$("li#lastPrice").remove();
			
			$(this).css("color","orange");
			
			var movied = $(this).attr("value");
			var moviet = $(this).text();
			
			$.ajax({	
				complete : function(){$('#myReservation').append("<li id='moviedate' value='"+movied+"'>"+moviet+"</li>");}
			});
			
			var openWin;
			
			if($("#movieplace_no").attr("value")==="mp001"){
				openWin = window.open("seatArrangementCGV.do", "좌석 배치도", "width=1200,height=800");
			}else if($("#movieplace_no").attr("value")==="mp002"){
				window.open("seatArrangementMEGABOX.do", "좌석 배치도", "width=1200,height=800");
			}
		});
	});
		
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 예매 신청
	var checkboxValues = [];
	
	function reservationInfoInsert() {		
		
		var movieplace = $('#movieplace_no').attr("value");
		var movie = $("#movie_no").text();
		var movie_no = $("#movie_no").attr("value");
		var moviedate = $("#moviedate").text();
		var screeningplan_no = $("#moviedate").attr("value");
		var memberId = $("#memberId").attr("value");
		
		$("#test1 li").each(function(){			
			checkboxValues.push($(this).attr("value"));			
		});
		

		
		$("#price").append("<li id='lastPrice'>"+ checkboxValues.length*parseInt(pri)+"원" +"</li>");
		
		$(".box6-3").show();
		
		var allData = {"movieplace_no" : movieplace, "movie" : movie, "movie_no":movie_no,"moviedate" : moviedate , 
				"checkboxValues" : checkboxValues, "screeningplan_no" : screeningplan_no, "id" : memberId};
			
		$.ajax({
			type : "GET", 
			url : "reservationInfoInsert.do",
			dataType : "JSON",
			data : allData,
			error : function(request,status,error){alert('code: '+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);},
			success : payment,
			complete : function(){}
		});
		
	}
	
	function payment(data) {
		
		var movieplace = $('#movieplace_no').attr("value");
		var movie = $("#movie_no").text();
		var memberId = $("#memberId").text();
		
		var result = checkboxValues.length * parseInt(pri);				
		
		$(function(){
			$("#payment").html("<button type='button' id='pay' class='btn btn-primary btn-block'>결제 하기</button>");
			$("#reservation").hide();
		});
		
		$(document).on("click","#pay",function(){
			//실제 복사하여 사용시에는 모든 주석을 지운 후 사용하세요
			BootPay.request({
				price: result, //실제 결제되는 가격
				application_id: "5c7bd368396fa6147950b7f4",
				name: movie, //결제창에서 보여질 이름
				pg: 'inicis',
				method: 'bank', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
				show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
				items: [
					{
						item_name: '나는 아이템', //상품명
						qty: 1, //수량
						unique: '123', //해당 상품을 구분짓는 primary key
						price: 1000, //상품 단가
						cat1: 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
						cat2: '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
						cat3: '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
					}
				],
				user_info: {
					username: memberId,
					email: 'yuj-love@hanmail.net',
					addr: '사용자 주소',
					phone: '010-1234-4567'
				},
				order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
				params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
				account_expire_at: '2018-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
				extra: {
				    start_at: '2018-10-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
					end_at: '2021-10-10', // 정기결제 만료일 -  기간 없음 - 무제한
			        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
			        quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
				}
			}).error(function (data) {
				//결제 진행시 에러가 발생하면 수행됩니다.
				alert("에러가 발생했습니다");
				console.log(data);
			}).cancel(function (data) {
				alert("결제가 취소되었습니다.");
				//결제가 취소되면 수행됩니다.
				console.log(data);
			}).ready(function (data) {
				// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
				console.log(data);
			}).confirm(function (data) {							
				this.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
			
			}).close(function (data) {
			    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
			    console.log(data);
			}).done(function (data) {
				//결제가 정상적으로 완료되면 수행됩니다
				//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
				console.log(data);
				alert("결제가 정상 처리 되었습니다.");
				
				var memID = $("#memberId").attr("value");
				var mov_no = $("#movie_no").attr("value");
				var movplace_no = $("#movieplace_no").attr("value");
				var scplan_no = $("#moviedate").attr("value");
				
				location.href="paymentResultPage.do?id="+memID+"&movie_no="+mov_no+"&movieplace_no="+movplace_no+"&screeningplan_no="+scplan_no+"&price="+pri;
				
			});
		});
	}

</script>
</head>
<body>
	<div class="box1">
	<div class="site">
	<h1><a href="index.do">Culture Page</a></h1>
	</div>
	</div>
	<div class="box2">
	<nav class="menu">
	<ul>
	<li><a href="index.do">메인</a></li>
	<li><a href="showList.do">공연정보</a></li>
	<li><a href="freeboard.do">게시판</a></li>
	<li><a href="#">이벤트</a></li>
	</ul>
	</nav>
	</div>
	
	<div class="boxA-1">
	<div class="box3">
	<h3>공연장소</h3>
	<ul id="movieplace1">
	<li id="mp" value="mp001">CGV</li>
	<li id="mp" value="mp002">MEGABOX</li>
	<li id="mp" value="mp003">국립극장</li>
	<li id="mp" value="mp004">안양예술회관</li>
	</ul>
	</div>
	
	<div class="box4">
	<h3>공연작품</h3>		
	<ul id="movieList1">	
	</ul>
	</div>
				
	<div class="box5">
	<h3>공연날짜</h3>
	<ul id="movieDate1">
	</ul>
	</div>	
	

	<div class="box6-1">
	<h3>예매신청정보</h3>
	<span id="memberId" value="${member.id}">${member.id}</span>
	<ul id="myReservation">		
	</ul>		
	</div>
	<div class="box6-2">
	<h3>좌석</h3>
	<ul id="test1">
	</ul>
	</div>
	<div class="box6-3">
	<h3>결제금액</h3>
	<ul id="price"></ul>	
	</div>	
		
	<div class="box7">
	<button type="button" id="reservation" class="btn btn-primary btn-block" onclick="reservationInfoInsert()" >예매 신청</button>
	<span id="payment"></span>
	</div>
	</div>
	
</body>
</html>

