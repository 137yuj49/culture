<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>문화 페이지</title>
    
    <!-- Bootstrap core CSS-->
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" >

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin.css" rel="stylesheet">
        
    
    <!-- video -->
	<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet" />
	<script src="http://vjs.zencdn.net/c/video.js"></script>
	<script type="text/javascript">		 
		function getCookie(name) { 
			var Found = false ;
			var start, end ;
			var i = 0 ;
		
			while(i <= document.cookie.length) { 
				start = i ;
				end = start + name.length ;
			
				if(document.cookie.substring(start, end) == name) { 
						Found = true ;
						break ;
				} 
				i++ ;
			} 
	
			if(Found == true) { 
				start = end + 1 ;;
				end = document.cookie.indexOf(";", start) ;
				if(end < start) 
					end = document.cookie.length ; 
				return document.cookie.substring(start, end) ;
			} 
			return "" ;
		} 
	
		function openPopup() { 
			var noticeCookie=getCookie("CookieName"); // 쿠키네임 지정
			if (noticeCookie != "no") 
			window.open('popup.jsp','pop','width=300,height=397,top=50,left=150');  
		} 
		openPopup(); // 자동으로 팝업 띄우기 

	</script>

	
  </head>

  <body id="page-top"> 

    <!-- nav header.jsp -->
    <jsp:include page="../commons/header.jsp" flush="true" />

    <div id="wrapper">

      <!-- Sidebar -->
      <jsp:include page="../commons/sider.jsp" flush="true" />
      

      <div id="content-wrapper">

        <div class="container-fluid">

          <!-- Breadcrumbs-->
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="#">문화 페이지</a>
            </li>
            <li class="breadcrumb-item active">공연 페이지</li>
          </ol>
          
          <!-- 내가 하고자 하는 것 carousel-->
          <div class="card mb-3">
          	<div class="card-header">
          		<i class="fas fa-table"></i>
          	    오늘의 공연</div>
          	<div class="card-body">
          	 <div class="table-responsive">          	  
			  <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
				  <div class="carousel-inner" align="center" style="background-color: #0080ff; width: 50%;">
				  	
				    <div class="carousel-item active">
				      <img class="d-block w-40" src="${pageContext.request.contextPath}/resources/carouselImages/100yeardreamsesang.PNG" alt="첫번째 슬라이드" style="height: 400px;">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-40" src="${pageContext.request.contextPath}/resources/carouselImages/2wolinmunyesul.PNG" alt="두번째 슬라이드" style="height: 400px;">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-40" src="${pageContext.request.contextPath}/resources/carouselImages/brocoli.PNG" alt="세번째 슬라이드" style="height: 400px;">
				    </div>
				  </div>
				  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="false"></span>
				    <span class="sr-only">이전</span>
				  </a>
				  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next" >
				    <span class="carousel-control-next-icon" aria-hidden="false" style="position: relative; right: 800px;"></span>
				    <span class="sr-only">다음</span>
				  </a>
			  </div>	
          	 </div>
          	 <div class="table-responsive">          	  
			 	<table>
			 		<c:forEach var="list" items="${todayShowList}">
			 			<tr>
			 				<td>${list.show_id}</td>
			 				<td>${list.show_name}</td>
			 				<td>${list.show_fee}</td>
			 				<td>${list.show_mdate}</td>
			 				<td>${list.show_genre}</td>
			 				<td>${list.show_phone}</td>
			 				<td>${list.show_picture}</td>
			 			</tr>
			 		</c:forEach>
			 	</table>
          	 </div>
          	</div>
          </div>
          
          <!-- DataTables Example -->
          <div class="card mb-3">
            <div class="card-header">
              <i class="fas fa-table"></i>
              영상 페이지 </div>
            <div class="card-body">
              <div class="table-responsive">
                <video poster="http://placehold.it/640x360" width="640" height="360" controls="controls" autoplay="autoplay" loop="loop" muted="muted">
    				<source src="./resources/video/christmas.mp4" type="video/mp4" />  		
				</video>
              </div>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div> <!-- ajax로 구현시킬 것 -->
          </div>

        </div>
        <!-- /.container-fluid -->

        <!-- Sticky Footer -->
        <jsp:include page="../commons/footer.jsp" flush="true" />

      </div>
      <!-- /.content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">로그 아웃 하시겠습니까?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Logout 버튼을 누르시면 로그 아웃 되십니다.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="logout.do">Logout</a>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin.min.js"></script>

    <!-- Demo scripts for this page-->
    <script src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>
            

  </body>

</html>
