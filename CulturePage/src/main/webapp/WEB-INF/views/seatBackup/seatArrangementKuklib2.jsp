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
        // html 이 다 로딩된 후 실행
        $(document).ready(function() {
 			restart();
            // 체크박스들이 변경됬을때
            $(":checkbox").change(function() {
            	
                var cnt = $("#person").val();
                 
                // 셀렉트박스의 값과 체크박스중 체크된 갯수가 같을때, 다른 체크박스들을 disable 처리
                if( cnt==$(":checkbox:checked").length ) {
                    $(":checkbox:not(:checked)").attr("disabled", "disabled");
                }
                // 체크된 갯수가 다르면 활성화 시킴
                else {
                    $(":checkbox").removeAttr("disabled");
                	restart();
                }
            });
             
            // 셀렉트박스에서 다른 인원수를 선택하면 초기화 시킴
            $("#person").change(function(){
                $(":checkbox").removeAttr("disabled");
                $("input:checkbox[name='seat_no']").prop("checked",false);              
            	restart();
            });                                  
        });
        
        function restart(){
	        var result1 = $("#movieplace_no", opener.document).attr("value");
	        //$("#movieplace").append(result1);
	        var result2 = $("#moviedate", opener.document).attr("value");
	        //$("#movieplace").append(result2);
	        
	        
	        $.ajax({
	        	type : "POST",
	        	url : "selectCheckedSeatNo.do",
	        	dataType : "JSON",
	        	data : {"movieplace_no" : result1, "screeningplan_no" : result2},
	        	success : selectSeatNo,
	        	error : function(request,status,error){alert('code: '+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
	        });       	
        }
        
        
        
        function selectSeatNo(data){
        	$.each(data, function(idx, val){
        		alert(val);
        		if(val!=""){
	        		$("input:checkbox[name='seat_no']").each(function(){
	        			if(this.value==val){
	        				$(this).prop("disabled",true);
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
        			alert($(this).val());      			
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
    </script>
    
</head>
<body>
	<h3>국 립 극 장 좌석 배치도</h3>
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
 
    <table id="seat" border="0">
        <tr>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="a-1"/>a-1</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="a-2"/>a-2</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="a-3"/>a-3</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="a-4"/>a-4</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="a-5"/>a-5</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="a-6"/>a-6</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="a-7"/>a-7</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="a-8"/>a-8</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="a-9"/>a-9</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="a-10"/>a-10</label></td>
        </tr>
        <tr>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="b-1"/>b-1</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="b-2"/>b-2</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="b-3"/>b-3</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="b-4"/>b-4</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="b-5"/>b-5</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="b-6"/>b-6</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="b-7"/>b-7</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="b-8"/>b-8</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="b-9"/>b-9</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="b-10"/>b-10</label></td>
        </tr>
        <tr>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="c-1"/>c-1</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="c-2"/>c-2</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="c-3"/>c-3</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="c-4"/>c-4</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="c-5"/>c-5</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="c-6"/>c-6</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="c-7"/>c-7</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="c-8"/>c-8</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="c-9"/>c-9</label></td>
            <td><label><input type="checkbox" id="chk" name="seat_no" value="c-10"/>c-10</label></td>
        </tr>
    </table>
    <input type="button"  id="btncheckbox" value="좌석선택완료" onclick="seatInfoPut()" />
    </form>
</body>
</html>


