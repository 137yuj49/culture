<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>예매 페이지</title>


<meta name="viewport" content="width=device-width">


<link href='http://fonts.googleapis.com/css?family=Paytone+One' rel='stylesheet' type='text/css'>

<link href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.css" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/webpage/stylelist.css">

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- button 관련  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
$(function(){

	$("#menubtn").click(function(){
		$("#menu").slideToggle();
	});

});
</script>

<style type="text/css">
#writer {margin-top: 10px; margin-bottom: 10px}
#writefrm {margin-top: 10px; padding-top: 10px}
</style>
</head>
<body class="contents">

<div class="boxA">
<div class="boxA-inner">
<div class="box1">
	<div class="site">
	<h1><a href="index.do">Culture Page</a></h1>
	</div>
</div>

<div class="box2">

	<nav class="menu" id="menu">
	<ul>
	<li><a href="#">메인</a></li>
	<li><a href="#">공연 정보</a></li>
	<li><a href="#">게시판</a></li>
	<li><a href="#">이벤트</a></li>
	</ul>
	</nav>
</div>
</div>

<div class="hello-text">
<form action="home" name="writefrm" id="writefrm">
	작성자 <input type="text" id="writer" placeholder="writer">
	<textarea name="ir1" id="ir1" class="form-control" rows="10" cols="100"></textarea>
	<input type="button" id="writebtn" class='btn btn-primary' name="writebtn" value="저장">
</form>
</div>

</div>

</body>
<script type="text/javascript">
var oEditors = [];

var sLang = "ko_KR";	// 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR

// 추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "${pageContext.request.contextPath}/smarteditor/SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
		//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		fOnBeforeUnload : function(){
			//alert("완료!");
		},
		I18N_LOCALE : sLang
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});
</script>
<script type="text/javascript">
window.onload = function(){
	//버튼을 누를 때 실행
	var btn = document.getElementById("writebtn"); //저장버튼을 누르면 submitContents 함수 실행
	btn.onclick = function(){
		submitContents(btn);
	}
}

// 저장 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
function submitContents(elClickedObj) {
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
	
	try {
		// 해당 오브젝트가 위치한 form이 submit됨
		// submitContents 함수는 파라미터 elClickedObj가 포함되어 있는 form태그를 submit 시킴 submit될때 textarea의 값을 같이 가져감
		elClickedObj.form.submit();
	} catch(e) {}
}
</script>
</html>
