<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>공지사항</title>
<script type="text/javascript">
	function setCookie( name, value, expiredays ) { 
		var todayDate = new Date();
		todayDate.setDate( todayDate.getDate() + expiredays ); 
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
	} 
	
	function closeWin() {	 
		if ( document.cnjform.notice.checked ) {// 폼네임 cnjform 은 동일해야 합니다.
			setCookie("CookieName", "no", 1); // 부모창에서 지정한 쿠키네임과 일치 해야 합니다.
		} 
		top.close();
	}
</script>
</head>
<body>
	
	<table border="1" cellspacing="0" width="276" bordercolor="#FCB0D8" bordercolordark="white" bordercolorlight="#66CCFF">
	<tr>
	<td width="270" height="25" bgcolor="#FFE6F2">
	<p align="center"><span style="font-size:9pt;"><img src="1202.gif" align="absmiddle" width="30" height="17" border="0"> 
	<font color="red"><b> 공지사항 </b></font><img src="1202.gif" align="absmiddle" width="30" height="17" border="0"></span></p>
	</td>
	</tr>
	<tr>
	<td width="270" height="259">
	<p align="center"><span style="font-size:9pt;">이벤트를 엽니다 
	<br>많은 분들의 성원에 감사하는 마음으로
	<br>선물을 드리고자 합니다
	<br>자세한 일정은 2019.02.20 에
	<br>공고할 예정입니다</span></p>
	</td>
	</tr> <tr>
	<td width="270" height="9" bgcolor="#99CCFF">
	<form name="cnjform"> 
	<p align="center"><span style="font-size:9pt;"><input type="checkbox" name="notice" onclick="closeWin()"> 오늘 하룻동안 페이지를 열지 않습니다.</span> 
	</form>
	</td>
	</tr>
	</table>
</body>
</html>