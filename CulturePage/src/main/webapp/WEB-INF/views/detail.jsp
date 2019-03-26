<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Blog Post - Start Bootstrap Template</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/resources/detail/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/detail/css/blog-post.css" rel="stylesheet">
    
	
  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#">DETAIL PAGE</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="index.jsp">HOME
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="list.do">MEMBER LIST</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="postingBoard.do">CONTENT LIST</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">PREPARE</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <!-- Post Content Column -->
        <div class="col-lg-8">

          <!-- Title -->
          <h1 class="mt-4">작성한 글</h1>

          <!-- Author -->
          <p class="lead">
            by
            <a href="#">${contentDetail.bc_sabun}</a>
          </p>

          <hr>

          <!-- Date/Time -->
          <p>Posted on ${contentDetail.bc_cdate}</p>

          <hr>
		  
          <!-- Preview Image -->
          <div style="width: 200px; height: 200px; overflow: hidden;">
          <img class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/upload/${bbsDetail.b_file1}" style="max-width: 200px; height: auto;" alt="" >
		  </div>
          <hr>

          ${contentDetail.bc_content}
          
          <hr>
		  <input type="submit" class="btn btn-primary btn-block" value="EDIT CONTENT" onclick="location.href='contentPreEdit.do?idx=${contentDetail.bc_sabun}&content=${contentDetail.bc_content}'">
		  <input type="submit" class="btn btn-primary btn-block" value="DELETE CONTENT" onclick="location.href='contentDelete.do?idx=${contentDetail.bc_sabun}&content=${contentDetail.bc_content}'">
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
              	<input type="hidden" id="br_sabun" name="br_sabun" value="${contentDetail.bc_sabun}">
              	<input type="hidden" id="bc_title" name="bc_title" value="${contentDetail.bc_title}">
                <button type="submit" id="btn btn-primary" class="btn btn-primary">Submit</button>
              </form>
            </div>
          </div>

          <!-- Single Comment -->
          <div class="media mb-4">
            
            
            <table style="width: 700;" border="0">
	            <c:forEach var="list" items="${replyDetail}">
	            	<tr>
	            		<td><img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt=""></td>
	            		<td>${list.br_writer}</td>
	            		<td>${list.br_content}</td>
	            		<td><input type="button" value="edit" onclick="location.href='replyPreEdit.do?br_writer=${list.br_writer}&br_sabun=${list.br_sabun}&br_title=${contentDetail.bc_title}'"></td>
	            		<td><input type="button" value="delete" onclick="location.href='replyDelete.do?br_writer=${list.br_writer}&br_sabun=${list.br_sabun}&br_title=${contentDetail.bc_title}'"></td>
	            	</tr>
	            </c:forEach>
            </table>
          </div>       
        </div>
               
        </div>

      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-white">
      <div class="container">
        <p class="m-0 text-center text-dark">Copyright &copy; Your Website 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/detail/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/detail/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>


