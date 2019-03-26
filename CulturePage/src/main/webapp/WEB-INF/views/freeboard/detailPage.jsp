<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시판 상세 페이지</title>


<meta name="viewport" content="width=device-width">

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<link href='http://fonts.googleapis.com/css?family=Paytone+One' rel='stylesheet' type='text/css'>

<link href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.css" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/webpage/stylefreeboard.css">

<script type="text/javascript">
$(document).ready(function(){
	
	writerValues.splice(0,writerValues.length);
	rcommentValues.splice(0,rcommentValues.length);
	selectReply();
	
	var result = $("#detailContent").text();
	var fdat = null;
	var detailTitle = null;
	$("button#button1").on("click",function(){
		$('#detailContent').html("<textarea id='area' rows='10' cols='103' name='contents'>"+result+"</textarea>");
		$("#buttonSpan").append("<button id='button1-1' class='btn btn-primary btn-block'>수정완료</button>");
		$("#button1").hide();
	});
	
	$(document).on("click", "#button1-1",function(){
		var updateContent = $("textarea[name='contents']").val();
		detailTitle = $("#detailTitle").text();
		$.ajax({
			type : "GET",
			url : "updateContent.do",
			data : {"id" : $("#detailId").text(), "content" : updateContent, "title" : detailTitle},
			error : function(request,status,error){alert('code: '+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);},
			complete : function(){
				$("#updateContent").removeAttr("text");
				$("#detailContent").html(updateContent);
				$("#button1-1").remove();
				$("#button1").show();
			}
		});
	});
	
	$("button#button2").on("click",function(){
		var id1 = $("#detailId").text();
		var title1 = $("#detailTitle").text();
		
		$.ajax({
			type : "GET",
			url : "deleteContent.do",
			data : {"id" : id1, "title" : title1},
			//error : function(request,status,error){alert('code: '+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);},			
			complete : function(){location.href="freeboard.do";}
		});
	});
	
	
	$("#replyInsert").on("click",function(){
		$("span#wr").remove();
		$("span#rc").remove();
		$("p#wr").remove();
		$("p#rc").remove();
		$("button#replyUpdate").remove();
		$("button#replyDelete").remove();
		$("hr#replyHr").remove();
		
		var rwriter = $("#writer").val();
		var rconmment = $("#rcomment").val();
		var rid = $("#detailId").text();
		var rtitle = $("#detailTitle").text();
		alert(rwriter);
		alert(rconmment);
		alert(rid);
		alert(rtitle);
		
		$.ajax({
			type : "GET",
			url : "replyInsert.do",
			data : {"writer" : rwriter, "rcomment" : rconmment, "id" : rid, "title" : rtitle},
			success : function(data){	
				writerValues.splice(0,writerValues.length);
				rcommentValues.splice(0,rcommentValues.length);
				selectReply();				
			},
			error : function(request,status,error){alert('code: '+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
		});
	});
	
	
	// 댓글 삭제
	var writer = null;
	var rcomment = null;
	$(document).on("click","#replyDelete",function(){
		var rid = $("#detailId").text();
		
		var idx = $(this).index();
		alert("idx : " + idx);
		var index = idx / 6 ;
		alert("index : " + index);
		
		writer = writerValues[parseInt(index)];
		rcomment = rcommentValues[parseInt(index)];
		
		alert(rid);
		
		for(var i=0;i<writerValues.length;i++){
			alert(writerValues[i]);
			alert(rcommentValues[i]);			
		}
		
		$.ajax({
			type : "GET",
			url : "replyDelete.do",
			data : {"id" : rid, "writer" : writer, "rcomment" : rcomment},
			error : function(request,status,error){alert('code: '+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);},
			success : function(data){
				
				reset();
				
				writerValues.splice(0,writerValues.length);
				rcommentValues.splice(0,rcommentValues.length);					
								
				selectReply();
			}
		});
	});
	
	var result = null;
	// 댓글 수정
	$(document).on("click","#replyUpdate",function(){
		var idx = $(this).index();
		alert("idx : " + idx);
		var index = idx / 6 ;
		alert("index : " + index);
		result = parseInt(index);
		alert("parseInt(index) : " + result);
		
		
		
		writer = writerValues[parseInt(index)];
		rcomment = rcommentValues[parseInt(index)];

		alert("writer : " + writer);
		alert("rcomment : " + rcomment);
		for(var i=0;i<writerValues.length;i++){
			alert(writerValues[i]);
			alert(rcommentValues[i]);
		}
		
		var spanValue = $('span#rc').eq(result).attr("value");
		alert("spanValue : " + spanValue);
		
		$('button#replyDelete').eq(result).remove();
		$('button#replyUpdate').eq(result).remove();
		$('span#rc').eq(result).html("<input id='beforeRep' class='form-control' value='"+rcomment+"'></input>");
		$('span#rc').eq(result).append("<button id='updateRep' class='btn btn-primary'>수정완료</button>")
	});
	
	$(document).on("click","#updateRep",function(){
		var rid = $("#detailId").text();
		var beforeRepl = $("#beforeRep").val();
		alert("beforeRepl : " + beforeRepl);
		alert("update writer : " + writer);
		alert("update id : " + rid);
		
		$.ajax({
			type : "GET",
			url : "replyUpdate.do",
			data : {"rcomment" : beforeRepl, "writer" : writer, "id" : rid},
			error : function(request,status,error){alert('code: '+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);},
			success : function(data){
				$("#beforeRep").remove();
				$("#updateRep").remove();
				
				reset();
				
				writerValues.splice(0,writerValues.length);
				rcommentValues.splice(0,rcommentValues.length);					
								
				selectReply();
			}
		});
	});
});

var writerValues = [];
var rcommentValues = [];
function selectReply(){
	var rrid = $("#detailId").text();
	var rrtitle = $("#detailTitle").text();
	
	$.ajax({
		type : "GET",
		url : "selectReply.do",
		data : {"id" : rrid, "title" : rrtitle},
		error : function(request,status,error){alert('code: '+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);},
		success : function(data){			
			$.each(data, function(idx,val){
				$("#replyPlace").append("<span id='wr'>"+val.writer+"</span><p id='wr'>");
				$("#replyPlace").append("<span id='rc' value='"+val.rcomment+"'>"+val.rcomment+"</span>"
						+"<button id='replyUpdate' class='btn btn-primary'>수정</button>"
						+"<button id='replyDelete' class='btn btn-primary'>삭제</button>"
						+"<hr id='replyHr'>");
				writerValues.push(val.writer);
				rcommentValues.push(val.rcomment);
			});
			$("#writer").val('');
			$("#rcomment").val('');
		}
	});
}

function reset() {
	$("span#wr").remove();
	$("span#rc").remove();
	$("p#wr").remove();
	$("p#rc").remove();
	$("button#replyUpdate").remove();
	$("button#replyDelete").remove();
	$("hr#replyHr").remove();
}

</script>

<script>
$(function(){

	$("#menubtn").click(function(){
		$("#menu").slideToggle();
	});

});
</script>


<!-- button 관련  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style type="text/css">
#replyUpdate {float: right}
#replyDelete {float: right}
#repl {padding-top: 20px}
#updateRep {float: right}

</style>

</head>
<body class="contents">

<div class="boxA">
<div class="boxA-inner">
<div class="box1">
	<div class="site">
	<h1><a href="#">Culture Page</a></h1>
	</div>
</div>

<div class="box2">

	<nav class="menu" id="menu">
	<ul>
	<li><a href="index.do">메인</a></li>
	<li><a href="showList.do">공연정보</a></li>
	<li><a href="freeboard.do">게시판</a></li>
	<li><a href="#">이벤트</a></li>
	</ul>
	</nav>
</div>
</div>

<div class="box3">
<div class="container">
      <div class="row">
        <!-- Post Content Column -->
        <div class="col-lg-8">
          <!-- Title -->
          <h1 class="mt-4">작성한 글</h1>
          <!-- Author -->
          <p class="lead">
            작성자
            <a id="detailId" href="#">${detailFreeboard.id}</a>
          </p>
          <div id="detailTitle"><h2>${detailFreeboard.title}</h2></div>
          <hr>
          <!-- Date/Time -->
          <div id="fdat"><fmt:formatDate value="${detailFreeboard.fdate}" pattern="yyyy.MM.dd" /></div>
          <hr>	  
          <!-- Preview Image -->
          <div>
          <img class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/sumnail/flower-60x60.jpg" alt="" >
		  </div>
          <hr>
		  <div id="detailContent">${detailFreeboard.content}</div>
          
          
          <hr>
          <span id="buttonSpan"></span>
          <c:if test="${member.id == detailFreeboard.id}">
		  <button type="button" id="button1" class="btn btn-primary btn-block" >포스팅수정</button>
		  <button type="button" id="button2" class="btn btn-primary btn-block" >포스팅삭제</button>
		  </c:if>
          <!-- Comments Form -->
          <div class="card my-4">
          	<h4 id="repl">댓글</h4><hr>
            <div id="replyPlace"></div>
            <h5 class="card-header">댓글을 남겨 주세요.</h5>
            <div class="card-body">
              <form action="replyInsert.do">
              	<div class="form-group">
                  <input type="text" id="writer" name="writer" class="form-control" placeholder="writer" required="required">
                </div>             
                <div class="form-group">
                  <textarea class="form-control" id="rcomment" name="rcomment" placeholder="content" rows="3"></textarea>
                </div>
              	<input type="hidden" id="id" name="id" value="${detailFreeboard.id}">
              	<input type="hidden" id="title" name="title" value="${detailFreeboard.title}">
              	<input type="hidden" id="date" name="date" value="${detailFreeboard.fdate}">
                <button type="button" id="replyInsert" class="btn btn-primary">Submit</button>
              </form>
            </div>
          </div>
          <!-- Single Comment -->                
        </div>              
        </div>
      </div>
</div>
</div>

</body>
</html>
