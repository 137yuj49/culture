<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">   
    <title>문화 페이지</title>
    
    <style type="text/css">
    	/* 사이트 이름 */
		.site h1 a {color: #83a4a8;
		   			text-decoration: none}
		   
		.site h1 {margin: 0;
		 		font-size: 30px;
		 		font-family: 'Paytone One', sans-serif;
		 		font-weight: normal}
		 		
		.box1 {padding-top: 8px;
	  			padding-bottom: 8px}
	  			
	  	.nav-item dropdown no-arrow {float: right}
    </style> 	
  </head>

  <body id="page-top">
  	
    <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
      <a class="navbar-brand mr-1" href="index.jsp">CULTURE PAGE</a>
      <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
      </button>     

      <!-- Navbar -->
      <ul class="navbar-nav ml-auto ml-md-0">       
        <li class="nav-item dropdown no-arrow">
          <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-user-circle fa-fw"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">         	
	      <c:if test="${empty member}">
	       <a class="dropdown-item" href="prelogin.do">로그인</a>	          
	      </c:if>
	      <c:if test="${! empty member}">
	       <a class="dropdown-item" href="logout.do" data-toggle="modal" data-target="#logoutModal">로그아웃</a>	            	        
	      </c:if>     	          	         
          </div>
        </li>
      </ul>
	  <span><font color="white"></font></span>
    </nav>
  </body>
</html>
