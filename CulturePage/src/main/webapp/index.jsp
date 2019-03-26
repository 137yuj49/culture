<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CULTURE PAGE</title>

    <!-- Bootstrap core CSS-->
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin.css" rel="stylesheet">
    
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.css" rel="stylesheet">
    
    <link href="${pageContext.request.contextPath}/resources/css/webpage/main.css" rel="stylesheet" type="text/css">
    
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
    <jsp:include page="WEB-INF/views/commons/header.jsp" flush="true" />

    <div id="wrapper">
    
	  <!-- sidebar sider.jsp -->
      <jsp:include page="WEB-INF/views/commons/sider.jsp" flush="true" />

      <div id="content-wrapper">
        <div class="container-fluid">

          <!-- Breadcrumbs-->
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="#">CULTURE PAGE</a>
            </li>
            <li class="breadcrumb-item active">MAIN</li>
          </ol>

          <div class="box3">
			<div class="top">
			<img src="${pageContext.request.contextPath}/resources/mainImg/stagef.jpg" alt="" class="topimg">
			<p class="catch">CULTURE PAGE 를 통해<br>
			원하시는 공연 정보를 얻으실 수 있습니다</p>
			</div>
		  </div>

			<div class="box6">
			<div class="box6-1">
				<div class="summary">
				<a href="showList.do">
				<i class="fa fa-database"></i>
				<h1>공연 정보</h1>
				<p>추천 공연과 더불어<br>
				다양한 문화 공연을 보실 수 있으십니다</p>
				</a>
				</div>
			</div>
			
			<div class="box6-2">
				<div class="summary">
				<a href="freeboard.do">
				<i class="fa fa-bar-chart-o"></i>
				<h1>자유 게시판</h1>
				<p>여러분의 다양하고 <br>
				흥미로운 주제의 글을 기다립니다</p>
				</a>
				</div>
			</div>
			
			<div class="box6-3">
				<div class="summary">
				<a href="#">
				<i class="fa fa-envelope"></i>
				<h1>이벤트</h1>
				<p>공연에 대한 <br>
				다양한 이벤트가 준비되어 있습니다</p>
				</a>
				</div>
			</div>
			</div>
			
			<div class="box4">
			<div class="box4-1">
				<div class="news">
				<h1>공지사항</h1>
				<ul>
				<li><a href="#">
					<time datetime="2019-03-10">03/10</time>
					<div class="text">데이터센터 유지 보수를 수행합니다.</div>
				</a></li>
				<li><a href="#">
					<time datetime="2019-02-15">02/05</time>
					<div class="text">다양한 공연 이벤트</div>
				</a></li>
				<li><a href="#">
					<time datetime="2019-01-22">01/22</time>
					<div class="text">세미나/캠페인과 관련된 공지사항</div>
				</a></li>
				<li><a href="#">
					<time datetime="2019-01-07">01/07</time>
					<div class="text">친정엄마와 2박 3일 전국 공연</div>
				</a></li>
				</ul>
				</div>
			</div>
			<div class="box4-2">
				<div class="follow">
				
				<p class="follow-info">최신 정보를 여기서도 받아보세요!</p>
				
				<ul>
				<li><a href="https://twitter.com/intent/tweet?text=[글자]&amp;url=http%3A%2F%2Fexample.com&amp;via=[계정]" onclick="window.open(this.href, 'SNS', 'width=500, height=300, menubar=no, toolbar=no, scrollbars=yes'); return false;" class="follow-tw">
					<i class="fa fa-fw fa-twitter"></i>
					Twitter
				</a></li>
				<li><a href="http://www.facebook.com/share.php?u=http%3A%2F%2Fexample.com" onclick="window.open(this.href, 'SNS', 'width=500, height=500, menubar=no, toolbar=no, scrollbars=yes'); return false;" class="follow-fb">
					<i class="fa fa-fw fa-facebook"></i>
					Facebook
				</a></li>
				<li><a href="https://plus.google.com/share?url=http%3A%2F%2Fexample.com" onclick="window.open(this.href, 'SNS', 'width=500, height=500, menubar=no, toolbar=no, scrollbars=yes'); return false;" class="follow-gp">
					<i class="fa fa-fw fa-google-plus"></i>
					Google+
				</a></li>
				</ul>
				</div>
			</div>
			</div>

        

        </div>
        <!-- /.container-fluid -->

        <!-- Sticky Footer -->
        <jsp:include page="WEB-INF/views/commons/footer.jsp" flush="true" />

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
