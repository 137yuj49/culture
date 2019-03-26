<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>회원 탈퇴 완료 페이지</title>
    
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    
	<!-- button 관련  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	function moveMain() {
			location.href="index.do";
		}
    </script>
    <style type="text/css">
    	#moveMain {width: 300px}
    </style>
  </head>
  <body>
  <div class="success" align="center">
    <h1>회원 탈퇴 </h1>
    <p>회원 탈퇴가 완료 되었습니다. 그동안 이용해 주셔서 감사합니다.</p>
    <button type="button" id="moveMain" class="btn btn-primary btn-block" onclick="moveMain()">메인으로 이동</button>
  </div>  
  </body>
</html>