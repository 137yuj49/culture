<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">   
    <title>문화 페이지</title>    	
  </head>
  <body id="page-top"> 

    <!-- Sidebar -->
      <ul class="sidebar navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="index.jsp">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>CULTURE PAGE</span>
          </a>
        </li>
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>회원정보</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">            
            <h6 class="dropdown-header">회원 관리</h6>
           	<c:if test="${empty member}">
            <a class="dropdown-item" href="write.do">회원가입</a>          	
           	</c:if>
           	<c:if test="${!empty member}">
            <a class="dropdown-item" href="memberRemove.do">회원 탈퇴</a>              	
           	</c:if>                                              
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>예 매</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <h6 class="dropdown-header">예매 페이지</h6>
            <a class="dropdown-item" href="reservationPage.do">빠른예매</a>                       
            <div class="dropdown-divider"></div>
            <h6 class="dropdown-header">Other Pages:</h6>
            <a class="dropdown-item" href="writingContent.do">Writing</a>           	                                              
          </div>
        </li>
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>문화 공감</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <h6 class="dropdown-header">문화 내용</h6>
            <a class="dropdown-item" href="showList.do">공연 정보</a>     
            <div class="dropdown-divider"></div> 
            <h6 class="dropdown-header">Other Pages:</h6>
            <a class="dropdown-item" href="searchConcerthall.do">공연장 검색</a>                           
          </div>
        </li>
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>게시판</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <h6 class="dropdown-header">게시판 관련 페이지</h6>
            <a class="dropdown-item" href="freeboard.do">자유게시판</a>            
            <div class="dropdown-divider"></div>
            <h6 class="dropdown-header">Other Pages:</h6>
            <a class="dropdown-item" href="editor.do">Writing</a>        
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>이벤트</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <h6 class="dropdown-header">이벤트 관련 정보</h6>
            <a class="dropdown-item" href="paymentResultPage1.do">이벤트 정보</a>                
          </div>
        </li>
      </ul>     
  </body>
</html>
