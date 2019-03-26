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

    <title>SB Admin - Login</title>

    <!-- Bootstrap core CSS-->
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin.css" rel="stylesheet">

  </head>

  <body class="bg-dark">

    <div class="container">
      <div class="card card-login mx-auto mt-5">
        <div class="card-header">REPLY EDIT</div>
        <div class="card-body">
          <form action="replyEdit.do">
            <div class="form-group">
              <div class="form-label-group">
              	<input type="hidden" id="br_sabun" name="br_sabun" value="${replyEdit.br_sabun}">
              	<input type="hidden" id="br_title" name="br_title" value="${replyEdit.br_title}">
                <input type="text" id="br_writer" name="br_writer" value="${replyEdit.br_writer}" class="form-control" required="required" autofocus="autofocus" readonly="readonly">
                <label for="id">WRITER</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="br_content" name="br_content" value="${replyEdit.br_content}" class="form-control" required="required">
                <label for="pwd">CONTENT</label>
              </div>
            </div>           
            <button type="submit" class="btn btn-primary btn-block" value="Login">수 정</button>
          </form>        
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

