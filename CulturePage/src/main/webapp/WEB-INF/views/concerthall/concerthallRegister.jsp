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
        <div class="card-header">Register an Account</div>
        <div class="card-body">
          <form name="iform" action="insert.do" method="post" enctype="multipart/form-data">
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="text" id="b_sabun" name="b_sabun" class="form-control" placeholder="Sabun" required="required" autofocus="autofocus">
                    <label for="b_sabun">Sabun</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="text" id="b_name" name="b_name" class="form-control" placeholder="Name" required="required">
                    <label for="b_name">Name</label>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
              	<a class="btn btn-primary btn-block" href="javascript: void(0);" onclick="DaumPostcode()">Search Address</a>                           
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="code" name="code" class="form-control" placeholder="code" required="required">
                <label for="code">Code</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="b_juso1" name="b_juso1" class="form-control" placeholder="Address1" required="required">
                <label for="b_juso1">Address1</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="b_juso2" name="b_juso2" class="form-control" placeholder="Address2" required="required">
                <label for="b_juso2">Address2</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="b_phone" name="b_phone" class="form-control" placeholder="Phone number" required="required">
                <label for="b_phone">Phone number</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="b_email" name="b_email" class="form-control" placeholder="Email address" required="required">
                <label for="b_email">Email address</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="file" id="upload_f" name="upload_f" class="form-control" placeholder="File" required="required">
                <label for="upload_f">File</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="password" id="inputPassword" name="b_pwd" class="form-control" placeholder="Password" required="required">
                    <label for="inputPassword">Password</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="Confirm password" required="required">
                    <label for="confirmPassword">Confirm password</label>
                  </div>
                </div>
              </div>
            </div>
            <button type="submit" class="btn btn-primary btn-block" value="Register">Register</button>
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

