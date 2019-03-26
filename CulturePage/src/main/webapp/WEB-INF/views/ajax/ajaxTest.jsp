
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

  <head>
	<title>ajax test</title>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		function getMessage(){
			$.ajax({
				method : "POST",
				url : "ajaxtest.do",
				dataType : "JSON",
				data : null,
				error : function(){alert('error');},
				success : result
			})
		}
		
		function result(data){
			alert(data.result);
			alert(data.item);
		}
	</script>
  </head>

  <body> 
	<input type="button" value="getMessage" onclick="javascript:getMessage()" /> 
	<span id="ajax"></span> 
  </body>

</html>
