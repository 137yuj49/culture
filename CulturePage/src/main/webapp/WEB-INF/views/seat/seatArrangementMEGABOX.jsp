<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta name="viewport" content="width=device-width">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

 	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
		var buttonValues = [];
        // html 이 다 로딩된 후 실행
        $(document).ready(function() {
 			restart();
		
 			$("button#chk").on("click", function(){ 
 				
 				$except = $(this);
 				var cnt = $("#person").val();

 				
 				if(buttonValues.indexOf($(this).val())!=-1){
 					$("button."+$(this).val()).prop("disabled", false); /////////
 					$("button#chk").css("background-color","");
 					for(i=0;i<buttonValues.length;i++){
 						$("button."+buttonValues[i]).css("background-color","yellow");
 					}					
 					var index = buttonValues.indexOf($(this).val());

 					buttonValues.splice(index,1);
 					$(this).css("background-color", "");
 					restart();
 				}else{
	 				$(this).css("background-color", "yellow");
	 				buttonValues.push($(this).val()); 														
 				}
	 				
	 			
	 			if(buttonValues.length==cnt){
 	
	 				$("button#chk").prop("disabled", true);
	 				$("button#chk").css("background-color", "gray");
	 				for(i=0;i<buttonValues.length;i++){
	 					$("button."+buttonValues[i]).prop("disabled", false);
	 					$("button."+buttonValues[i]).css("background-color","yellow");
	 				}
	 			}else{
	 				$("button#chk").prop("disabled", false);
	 			}
 			}); 		
 			                  
             
            // 셀렉트박스에서 다른 인원수를 선택하면 초기화 시킴
            $("#person").change(function(){
                $(":button").prop("disabled", false);
                $(":button").css("background-color","");
                buttonValues.splice(0,buttonValues.length);
            	restart();
            });                                  
        });
        
        function restart(){
	        var result1 = $("#movieplace_no", opener.document).attr("value");
	        var result2 = $("#moviedate", opener.document).attr("value");

	        
	        $.ajax({
	        	type : "POST",
	        	url : "selectCheckedSeatNo.do",
	        	dataType : "JSON",
	        	data : {"movieplace_no" : result1, "screeningplan_no" : result2},
	        	success : selectSeatNo2,
	        	error : function(request,status,error){alert('code: '+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
	        });       	
        }
        
        
        
        function selectSeatNo(data){
        	$.each(data, function(idx, val){
        		if(val!=""){
	        		$("input:checkbox[name='seat_no']").each(function(){
	        			if(this.value==val){
	        				$(this).prop("disabled",true);
	        			}
	        		});	        			        		       			
        		}
        	});
        }
        
        function selectSeatNo2(data){
        	$.each(data, function(idx, val){
        		if(val!=""){
	        		$("button#chk").each(function(){
	        			if(this.value==val){
	        				$(this).prop("disabled",true);
	        				$(this).css("background-color","gray");
	        			}
	        		});	        			        		       			
        		}
        	});
        }
        
        //////////////////////////////////////////////////////////////////////////////////////////
        function seatInfoPut() {
        	var checkboxValues = [];
        	$('input:checkbox[name="seat_no"]').each(function(){
        		if($(this).is(":checked")){     			
        			checkboxValues.push($(this).val());
        		}
        	});
        	       	
        	$(function(){
        		for(i=0;i<checkboxValues.length;i++){
        			$(opener.document).find("#test1").append("<li id='test' value='"+checkboxValues[i]+"'>"+checkboxValues[i]+" ("+window.opener.pri+"원) </li>");       			
        		}
        		self.close();
        	});   
        }
        
        ///////////////////////////////////////////////////////////////////////////////////////////
        function seatInfoPut1() {						
			$(function(){
				for(i=0;i<buttonValues.length;i++){
					$(opener.document).find("#test1").append("<li id='test' value='"+buttonValues[i]+"'>"+buttonValues[i]+" ("+window.opener.pri+"원) </li>");						
				}
				self.close();
			});
		}
    </script>
    
    <style type="text/css">
    	body{background-color: #2196F3}
    	
		.grid-container {
		  display: grid;
		  justify-content: center;
		  grid-template-columns: 30px 30px 30px 30px 30px 30px 30px 30px 30px 30px 30px; /*Make the grid smaller than the container*/
		  grid-gap: 10px;
		  background-color: #2196F3;
		  padding: 10px;
		}
		
		.grid-container > button {
		  background-color: rgba(255, 255, 255, 0.8);
		  text-align: center;
		  padding: 10px 0;
		  font-size: 30px;
		}
		
		.screen {width: 240px; height: 30px; background-color: #4dffff; margin-left: 400px; padding-left: 180px; color: white;}
    </style>
    
</head>
<body>
	<h3>MEGABOX 좌석 배치도</h3>
    <span>인원수 선택 : </span>
	<span id="movieplace"></span>
	<span id="screeningplan"></span>
    <form id="iform">
    <input type="hidden" name="movieplace_no" value="cgv">
    <select id="person">
        <option value="1">1명</option>
        <option value="2">2명</option>
        <option value="3">3명</option>
        <option value="4">4명</option>
        <option value="5">5명</option>
    </select>
 	
 	<div class="screen">screen</div>
 	
	<div class="grid-container">
	<div></div>
	<div> 1</div>
	<div> 2</div>
	<div> 3</div>
	<div> 4</div>
	<div> 5</div>
	<div> 6</div>
	<div> 7</div>
	<div> 8</div>
	<div> 9</div>
	<div> 10</div>
	
	
	<div>a</div>
	<button type="button" id="chk" class="a-1" name="seat_no" value="a-1"></button>
	<button type="button" id="chk" class="a-2" name="seat_no" value="a-2"></button>
	<button type="button" id="chk" class="a-3" name="seat_no" value="a-3"></button>
	<button type="button" id="chk" class="a-4" name="seat_no" value="a-4"></button>
	<button type="button" id="chk" class="a-5" name="seat_no" value="a-5"></button>
	<button type="button" id="chk" class="a-6" name="seat_no" value="a-6"></button>
	<button type="button" id="chk" class="a-7" name="seat_no" value="a-7"></button>
	<button type="button" id="chk" class="a-8" name="seat_no" value="a-8"></button>
	<button type="button" id="chk" class="a-9" name="seat_no" value="a-9"></button>
	<button type="button" id="chk" class="a-10" name="seat_no" value="a-10"></button>
	
	<div>b</div>
	<button type="button" id="chk" class="b-1" name="seat_no" value="b-1"></button>
	<button type="button" id="chk" class="b-2" name="seat_no" value="b-2"></button>
	<button type="button" id="chk" class="b-3" name="seat_no" value="b-3"></button>
	<button type="button" id="chk" class="b-4" name="seat_no" value="b-4"></button>
	<button type="button" id="chk" class="b-5" name="seat_no" value="b-5"></button>
	<button type="button" id="chk" class="b-6" name="seat_no" value="b-6"></button>
	<button type="button" id="chk" class="b-7" name="seat_no" value="b-7"></button>
	<button type="button" id="chk" class="b-8" name="seat_no" value="b-8"></button>
	<button type="button" id="chk" class="b-9" name="seat_no" value="b-9"></button>
	<button type="button" id="chk" class="b-10" name="seat_no" value="b-10"></button>
	
	<div>c</div>
	<button type="button" id="chk" class="c-1" name="seat_no" value="c-1"></button>
	<button type="button" id="chk" class="c-2" name="seat_no" value="c-2"></button>
	<button type="button" id="chk" class="c-3" name="seat_no" value="c-3"></button>
	<button type="button" id="chk" class="c-4" name="seat_no" value="c-4"></button>
	<button type="button" id="chk" class="c-5" name="seat_no" value="c-5"></button>
	<button type="button" id="chk" class="c-6" name="seat_no" value="c-6"></button>
	<button type="button" id="chk" class="c-7" name="seat_no" value="c-7"></button>
	<button type="button" id="chk" class="c-8" name="seat_no" value="c-8"></button>
	<button type="button" id="chk" class="c-9" name="seat_no" value="c-9"></button>
	<button type="button" id="chk" class="c-10" name="seat_no" value="c-10"></button>
	
	<div>d</div>
	<button type="button" id="chk" class="d-1" name="seat_no" value="d-1"></button>
	<button type="button" id="chk" class="d-2" name="seat_no" value="d-2"></button>
	<button type="button" id="chk" class="d-3" name="seat_no" value="d-3"></button>
	<button type="button" id="chk" class="d-4" name="seat_no" value="d-4"></button>
	<button type="button" id="chk" class="d-5" name="seat_no" value="d-5"></button>
	<button type="button" id="chk" class="d-6" name="seat_no" value="d-6"></button>
	<button type="button" id="chk" class="d-7" name="seat_no" value="d-7"></button>
	<button type="button" id="chk" class="d-8" name="seat_no" value="d-8"></button>
	<button type="button" id="chk" class="d-9" name="seat_no" value="d-9"></button>
	<button type="button" id="chk" class="d-10" name="seat_no" value="d-10"></button>
	
	<div>e</div>
	<button type="button" id="chk" class="e-1" name="seat_no" value="e-1"></button>
	<button type="button" id="chk" class="e-2" name="seat_no" value="e-2"></button>
	<button type="button" id="chk" class="e-3" name="seat_no" value="e-3"></button>
	<button type="button" id="chk" class="e-4" name="seat_no" value="e-4"></button>
	<button type="button" id="chk" class="e-5" name="seat_no" value="e-5"></button>
	<button type="button" id="chk" class="e-6" name="seat_no" value="e-6"></button>
	<button type="button" id="chk" class="e-7" name="seat_no" value="e-7"></button>
	<button type="button" id="chk" class="e-8" name="seat_no" value="e-8"></button>
	<button type="button" id="chk" class="e-9" name="seat_no" value="e-9"></button>
	<button type="button" id="chk" class="e-10" name="seat_no" value="e-10"></button>
	
	<div>f</div>
	<button type="button" id="chk" class="f-1" name="seat_no" value="f-1"></button>
	<button type="button" id="chk" class="f-2" name="seat_no" value="f-2"></button>
	<button type="button" id="chk" class="f-3" name="seat_no" value="f-3"></button>
	<button type="button" id="chk" class="f-4" name="seat_no" value="f-4"></button>
	<button type="button" id="chk" class="f-5" name="seat_no" value="f-5"></button>
	<button type="button" id="chk" class="f-6" name="seat_no" value="f-6"></button>
	<button type="button" id="chk" class="f-7" name="seat_no" value="f-7"></button>
	<button type="button" id="chk" class="f-8" name="seat_no" value="f-8"></button>
	<button type="button" id="chk" class="f-9" name="seat_no" value="f-9"></button>
	<button type="button" id="chk" class="f-10" name="seat_no" value="f-10"></button>
	
	<div>g</div>
	<button type="button" id="chk" class="g-1" name="seat_no" value="g-1"></button>
	<button type="button" id="chk" class="g-2" name="seat_no" value="g-2"></button>
	<button type="button" id="chk" class="g-3" name="seat_no" value="g-3"></button>
	<button type="button" id="chk" class="g-4" name="seat_no" value="g-4"></button>
	<button type="button" id="chk" class="g-5" name="seat_no" value="g-5"></button>
	<button type="button" id="chk" class="g-6" name="seat_no" value="g-6"></button>
	<button type="button" id="chk" class="g-7" name="seat_no" value="g-7"></button>
	<button type="button" id="chk" class="g-8" name="seat_no" value="g-8"></button>
	<button type="button" id="chk" class="g-9" name="seat_no" value="g-9"></button>
	<button type="button" id="chk" class="g-10" name="seat_no" value="g-10"></button>
	
	<div>h</div>
	<button type="button" id="chk" class="h-1" name="seat_no" value="h-1"></button>
	<button type="button" id="chk" class="h-2" name="seat_no" value="h-2"></button>
	<button type="button" id="chk" class="h-3" name="seat_no" value="h-3"></button>
	<button type="button" id="chk" class="h-4" name="seat_no" value="h-4"></button>
	<button type="button" id="chk" class="h-5" name="seat_no" value="h-5"></button>
	<button type="button" id="chk" class="h-6" name="seat_no" value="h-6"></button>
	<button type="button" id="chk" class="h-7" name="seat_no" value="h-7"></button>
	<button type="button" id="chk" class="h-8" name="seat_no" value="h-8"></button>
	<button type="button" id="chk" class="h-9" name="seat_no" value="h-9"></button>
	<button type="button" id="chk" class="h-10" name="seat_no" value="h-10"></button>
	  
	</div>
    
    <input type="button"  id="btncheckbox" value="좌석선택완료" onclick="seatInfoPut1()" />
    </form>
</body>
</html>


