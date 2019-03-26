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

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin.css" rel="stylesheet">
	
	<script type="text/javascript" src="./resources/js/register/InputJS.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> <!-- alert window -->
	
  </head>

  <body class="bg-dark">

    <div class="container">
      <div class="card card-register mx-auto mt-5">
        <div class="card-header">공연 정보 입력</div>
        <div class="card-body">
          <form name="iform" action="showInsert.do" method="post" enctype="multipart/form-data">
             <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="show_id" name="show_id" class="form-control" placeholder="show_id" required="required">
                <label for="show_id">공연 아이디</label>
              </div>
            </div>
             <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="show_name" name="show_name" class="form-control" placeholder="show_name" required="required">
                <label for="show_name">공연 이름</label>
              </div>
            </div>           
            <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="show_fee" name="show_fee" class="form-control" placeholder="show_fee" required="required">
                <label for="show_fee">공연 가격</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="show_mdate" name="show_mdate" class="form-control" placeholder="show_mdate" required="required">
                <label for="show_mdate">공연 날짜</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="show_genre" name="show_genre" class="form-control" placeholder="show_genre" required="required">
                <label for="show_genre">공연 장르</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="show_phone" name="show_phone" class="form-control" placeholder="show_phone" required="required">
                <label for="show_phone">공연 문의 전화</label>
              </div>
            </div>          
            <div class="form-group">
              <div class="form-label-group">
                <input type="file" id="upload_f" name="upload_f" class="form-control" placeholder="File" required="required">
                <label for="upload_f">공연 관련 사진</label>
              </div>
            </div>
             <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="concerthall_id" name="concerthall_id" class="form-control" placeholder="concerthall_id" required="required">
                <label for="concerthall_id">공연장 아이디</label>
              </div>
            </div>         
            <button type="submit" class="btn btn-primary btn-block" value="Register">공연정보등록</button>
          </form>
          <div class="text-center">
            <a class="d-block small mt-3" href="preLogin.do">Login Page</a>
            <a class="d-block small" href="forgot-password.do">Forgot Password?</a>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  </body>

</html>

