<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Create DB Table</title>
<h2>DB 테이블 생성</h2>


<link rel="stylesheet" href="C:\Users\sga\Downloads\eGovFrameDev-3.5.0-32bit\workspace\db-web-tooling\src\main\webapp\WEB-INF\css\nice-select.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="C:\Users\sga\Downloads\eGovFrameDev-3.5.0-32bit\workspace\db-web-tooling\src\main\webapp\WEB-INF\js\jquery.js"></script>
<script src="C:\Users\sga\Downloads\eGovFrameDev-3.5.0-32bit\workspace\db-web-tooling\src\main\webapp\WEB-INF\js\jquery.nice-select.js"></script>

<script type="text/javascript">	
	var oTbl;
	
	//Row 추가
	function insRow() {
		  oTbl = document.getElementById("addTable");
		  var oRow = oTbl.insertRow();
		  oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; 
		  
		  //삽입될 Form Tag
		  var oCell = oRow.insertCell();
		  var frmTag = "<input type=text name=addText style='margin-left:84px'> ";
		  frmTag = frmTag + "<select style='font-size:13pt'><option disabled='disabled' selected='selected'>Data Type</option><option value='1' style='font-size:12pt'>INT</option><option value='2' style='font-size:12pt'>VARCHAR</option><option value='3' style='font-size:12pt'>TEXT</option><option value='4' style='font-size:12pt'>DATE</option><option value='5' style='font-size:12pt'>TIME</option></select>";
		  frmTag = frmTag + "<input type=button value='X' style='margin-left:13px' onClick='removeRow()' style='cursor:hand'>";
		  oCell.innerHTML = frmTag;
	}
	
	//Row 삭제
	function removeRow() {
		oTbl.deleteRow(oTbl.clickedRowIndex);
	}
	
	function frmCheck()
	{
	  var frm = document.form;
	  
	  for( var i = 0; i <= frm.elements.length - 1; i++ ){
	     if( frm.elements[i].name == "addText" )
	     {
	         if( !frm.elements[i].value ){
	             alert("텍스트박스에 값을 입력하세요!");
	                 frm.elements[i].focus();
		 return;
	          }
	      }
	   }
	 }
</script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
</head>

<body>
<form name="form" method="post" id="formData" action="createdTable.jsp">
<table>
	<tr>
		<td>
			<label for="테이블 명">테이블 명 : </label>
			<input type="text" id="physical" name="phyTab" placeholder=" Physical"/>
			<br />
			<input type="text" id="logical" name="logTab" style="margin-left:85px" placeholder=" Logical"/>
		</td>
	</tr>
	<tr>
		<td>
			<table id="addTable">
				<tr>
					<td>
						<br />
						<label for="데이터">데이터 명 : </label>
						<input type="text" name="dataName" value="" />
						<select name="dataType" style="font-size:13pt">
							<option disabled="disabled" selected="selected">Data Type</option>
							<option value="1" style="font-size:12pt">INT</option>
							<option value="2" style="font-size:12pt">VARCHAR</option>
							<option value="3" style="font-size:12pt">TEXT</option>
							<option value="4" style="font-size:12pt">DATE</option>
							<option value="5" style="font-size:12pt">TIME</option>
						</select>
						<input name="addButton" type="button" style="cursor:hand" onClick="insRow()" value="추가">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table>
	<tr>
		<td>
			<br />
			<input type="button" name="button" value=" CREATE " style="margin-left:370px" onClick="frmCheck();">
		</td>
	</tr>
</table>
</form>


<div style="padding-bottom: 20px;"></div>
<a  style="padding: 10px;" href="${pageContext.request.contextPath}/sample/openUserList.do">유저 관리로 이동</a>
<a  style="padding: 10px;" href="${pageContext.request.contextPath}/sample/openDBEdit.do">데이터베이스 관리로 이동</a>

</body>
</html>