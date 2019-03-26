<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시판 상세 페이지</title>


<meta name="viewport" content="width=device-width">

<link href='http://fonts.googleapis.com/css?family=Paytone+One' rel='stylesheet' type='text/css'>

<link href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.css" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/webpage/stylefreeboard.css">

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script>
$(function(){

	$("#menubtn").click(function(){
		$("#menu").slideToggle();
	});

});
</script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#")
	});
</script>

<!-- button 관련  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

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
<div class="container">
      <div class="row">
        <!-- Post Content Column -->
        <div class="col-lg-8">
          <!-- Title -->
          <h1 class="mt-4">작성한 글</h1>
          <!-- Author -->
          <p class="lead">
            작성자
            <a href="#">${detailFreeboard.id}</a>
          </p>
          <hr>
          <!-- Date/Time -->
          <p>작성일자 <fmt:formatDate value="${detailFreeboard.fdate}" pattern="yyyy.MM.dd" /></p>
          <hr>	  
          <!-- Preview Image -->
          <div>
          <img class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/sumnail/flower-60x60.jpg" alt="" >
		  </div>
          <hr>
		  <div id="detailContent">${detailFreeboard.content}</div>
          
          
          <hr>
		  <input type="submit" class="btn btn-primary btn-block" value="EDIT CONTENT" onclick="location.href='contentPreEdit.do?id=${ldetailFreeboardist.id}&content=${detailFreeboard.content}'">
		  <input type="submit" class="btn btn-primary btn-block" value="DELETE CONTENT" onclick="location.href='contentDelete.do?id=${detailFreeboard.id}&content=${detailFreeboard.content}'">
          <!-- Comments Form -->
          <div class="card my-4">
            <h5 class="card-header">Leave a Comment:</h5>
            <div class="card-body">
              <form action="replyInsert.do">
              	<div class="form-group">
                  <input type="text" id="br_writer" name="br_writer" class="form-control" placeholder="writer" required="required">
                </div>             
                <div class="form-group">
                  <textarea class="form-control" id="br_content" name="br_content" placeholder="content" rows="3"></textarea>
                </div>
              	<input type="hidden" id="br_sabun" name="br_sabun" value="${detailFreeboard.id}">
              	<input type="hidden" id="bc_title" name="bc_title" value="${detailFreeboard.title}">
                <button type="submit" id="btn btn-primary" class="btn btn-primary">Submit</button>
              </form>
            </div>
          </div>
          <!-- Single Comment -->                
        </div>              
        </div>
      </div>
</div>
</div>

</body>
</html>
