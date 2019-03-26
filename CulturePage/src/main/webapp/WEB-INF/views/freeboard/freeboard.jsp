<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
<meta name="viewport" content="width=device-width">

<link href='http://fonts.googleapis.com/css?family=Paytone+One' rel='stylesheet' type='text/css'>

<link href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.css" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/webpage/stylefreeboard.css">

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<style type="text/css">
.table {border: 0;}
</style>

<script>
$(function(){

	$("#menubtn").click(function(){
		$("#menu").slideToggle();
	});

});
</script>

<script type="text/javascript">
	$(document).ready(function(){
		
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
	<li><a href="index.do">메인</a></li>
	<li><a href="showList.do">공연정보</a></li>
	<li><a href="freeboard.do">게시판</a></li>
	<li><a href="#">이벤트</a></li>
	</ul>
	</nav>
</div>
</div>

<div class="box3">
  <h2>자유 게시판</h2>
  <p>모두에게 열려 있는 공간입니다. 자신의 의견을 자유롭게 나누었으면 합니다</p>
  <p>제목을 클릭하면 자세한 내용을 확인하실 수 있습니다</p>
  <table class="table" border="0">
    <thead>
      <tr>
        <th>아이디</th>
        <th>제목</th>
        <th>게시일자</th>			      			    			      			    
      </tr>
    </thead>
    <tbody>
     <c:forEach var="contentDto" items="${list}">
      <tr class="cont" onclick="document.location.href='detailFreeboard.do?id=${contentDto.id}&title=${contentDto.title}'">

        <td>${contentDto.id}</td>
        <td>${contentDto.title}</td>
        <td><fmt:formatDate value="${contentDto.fdate}" pattern="yyyy.MM.dd"/>  </td>			        
      </tr>
     </c:forEach>    			      
    </tbody>
  </table>
  
  <ul class="btn-group pagination">
    <!--
        이전 버튼이 클릭가능한 조건이면, a태그를 이용해 이전 버튼이 뜨도록 하고, href로 링크를 걸되
        아까 만든 makeQuery 메서드를 이용해서 쿼리문자열을 만들어 줍니다.
        ?page=어쩌고&perPageNum=어쩌고 이 부분을 생성해서 넣게 되는데 단 이전 버튼을 클릭하면
        현재 페이지가 시작페이지의 - 1 이 되도록 되어야 함으로 그 부분만 신경써 주면 됩니다.
     -->
    <c:if test="${pageMaker.prev}">
        <li>
            <a href='<c:url value="/freeboard.do?page=${pageMaker.startPage-1 }"/>'><i class="fa fa-chevron-left"></i></a>
        </li>
         
    </c:if>
 
    <!--
        [1][2][3]....[10] 이 부분을 삽입하는 부분이다. jstl 이용해 for문을 돌면서 startPage ~ endPage까지
        표시해주되, a태그 눌렀을 때 이동하는 page 부분에 index 지정하는 부분을 유의깁게 보길 바란다.
     -->
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="index">
        <a href='<c:url value="/freeboard.do?page=${index}"/>'><i class="fa">${index}</i></a>
    </c:forEach>
 
    <c:if test="${pageMaker.next&&pageMaker.endPage>0}">       
        <li>
            <a href='<c:url value="/freeboard.do?page=${pageMaker.endPage+1 }"/>'><i class="fa fa-chevron-right"></i></a>
        </li>
    </c:if>  
</ul>

</div>
</div>

</body>
</html>
