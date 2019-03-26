<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    

    <title>회원 가입</title>

    <!-- Bootstrap core CSS-->
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin.css" rel="stylesheet">
	

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> <!-- alert window -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">	
		var idFlag = false;
		var pwdFlag = false;
		var emailFlag = false;
		var nameFlag = false;
	
		
		function idCheck() {
			var ID = $("#id").val();
			$.ajax({
				type : "POST",
				url : "idCheck.do",
				data : "JSON",
				data : {"id" : ID},
				error : function(request,status,error){alert('code: '+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);},
				success : checkId
			});
		}
		
		function checkId(data) {			
			if(data =="1"){
				$("#idCheckResult").html("중복된 아이디입니다.");
				$("#id").val("");
			}else if(data=="0"){
				$("#idCheckResult").html("사용 가능한 아이디입니다.");
				idFlag = true;
			}
			
		}
		
		function resetId() {
			$("#idCheckResult").html("");
		}
		/////////////////////////////////////////////////////////////////////////////////////
		function emailCheck() {
			var email = $("#email").val();
			var objRegex = new RegExp( /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
			
			if(!objRegex.test(email)){
				$("#emailCheck").html("올바른 메일 주소가 아닙니다");
				$("#email").val("");
				return false;
			}else if(objRegex.test(email)){
				$("#emailCheck").html("올바른 메일 주소입니다.");
				emailFlag = true;
				return true;
			}
		}
		
		function emailReset() {
			$("#emailCheck").html("");
		}
		///////////////////////////////////////////////////////////////////////////////////
		function pwdCheck() {
			var pwd = $("#pwd").val();
			var againPwd = $("#confirmPassword").val();
			
			if(pwd == againPwd){
				$("#pwdCheck").html("비밀번호가 일치합니다.");
				pwdFlag = true;
			}else if(pwd != againPwd){
				$("#pwdCheck").html("비밀번호가 틀립니다.");
				$("#confirmPassword").val("");
			}
		}
		////////////////////////////////////////////////////////////////////////////////////
		function nameCheck() {
			var name = $("name").val();
			if(name != ""){
				nameFlag = true;
			}
		}
		////////////////////////////////////////////////////////////////////////////////////
		function check() {
			if(idFlag != true || pwdFlag != true || emailFlag != true || nameFlag != true){
				$("#allCheck").html("적지 않은 내용이 있으시거나 바르게 입력바랍니다.");
				return false;
			}else{
				return true;
			}
		}
	</script>
	<style type="text/css">
	#idCheckResult {margin-bottom: 15px; color: #4dd2ff}
	#pwdCheck {margin-bottom: 15px; color: #4dd2ff}
	#emailCheck {margin-bottom: 15px; color: #4dd2ff}
	</style>
  </head>

  <body class="bg-dark">

    <div class="container">
      <div class="card card-register mx-auto mt-5">
        <div class="card-header">회원 등록</div>
        <div class="card-body">
          <form name="iform" action="memberJoin.do" method="post" enctype="multipart/form-data" onsubmit="return check()">
            <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="id" name="id" class="form-control" placeholder="id" required="required" onfocus="resetId()" />
                <label id="labId" for="id">아이디</label>             
              </div>
            </div>
            <div id="idCheckResult"></div>
            <div class="form-group">
              <div class="form-label-group">
              	<a class="btn btn-primary btn-block" href="javascript: void(0);" onclick="idCheck()">아이디 중복체크</a>                           
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="pwd" name="pwd" class="form-control" placeholder="pwd" required="required">
                <label for="pwd">패스워드</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="confirmPassword" required="required" onchange="pwdCheck()" />
                <label for="confirmPassword">패스워드확인</label>
              </div>
            </div> 
            <div id="pwdCheck"></div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="email" name="email" class="form-control" placeholder="email" required="required" onchange="emailCheck()" onfocus="emailReset()" />
                <label for="email">이메일</label>
              </div>
            </div>
            <div id="emailCheck"></div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="name" name="name" class="form-control" placeholder="name" required="required" onchange="nameCheck()" />
                <label for="name">이름</label>
              </div>
            </div>                                               
            <button type="submit" class="btn btn-primary btn-block" value="Register">회원등록</button>
          </form>
          <div id="allCheck"></div>
          <div class="text-center">
            <a class="d-block small mt-3" href="preLogin.do">로그인</a>
            <a class="d-block small" href="forgot-password.do">비밀번호를 잊으셨나요?</a>
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

