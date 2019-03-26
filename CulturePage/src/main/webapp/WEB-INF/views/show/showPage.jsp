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
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

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
            <li class="breadcrumb-item active">메인 페이지</li>
          </ol>

          <!-- DataTables Example -->
          <div class="card mb-3">
            <div class="card-header">
              <i class="fas fa-table"></i>
              Data Table Example</div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>번호</th>
                      <th>공연아이디</th>
                      <th>공연이름</th>
                      <th>공연료</th>
                      <th>전화번호</th>
                      <th>공연날짜</th>
                      <th>공연장르</th>
                      <th>전화번호</th>
                      <th>사진</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>번호</th>
                      <th>공연아이디</th>
                      <th>공연이름</th>
                      <th>공연료</th>
                      <th>전화번호</th>
                      <th>공연날짜</th>
                      <th>공연장르</th>
                      <th>공연장 정보</th>
                      <th>사진</th>
                    </tr>
                  </tfoot>
                  <tbody>
                   <c:forEach var="dto" items="${list}">                  
                    <tr>
                      <td>${dto.show_no}</td>
                      <td>${dto.show_id}</td>
                      <td>${dto.show_name}</td>
                      <td>${dto.show_fee}</td>
                      <td>${dto.show_phone}</td>
                      <td>${dto.show_mdate}</td>
                      <td>${dto.show_genre}</td>
                      <td>${dto.concerthall_id}</td>
                      <td>
                      <img alt="" src="${pageContext.request.contextPath}/resources/upload/${dto.show_picture}" style="width: 30px; height: 30px;"> 
                      </td>
                    </tr>
                   </c:forEach> 
                  </tbody>
                </table>
              </div>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>
		  <!-- 내가 하고자 하는 것 -->
		  
          
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
