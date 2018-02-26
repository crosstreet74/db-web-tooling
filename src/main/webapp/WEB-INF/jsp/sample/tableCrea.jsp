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

	    var target = document.getElementById('buttonToAdd');
	    var str = '<select style="font-size:13pt">
			<option disabled="disabled" selected="selected">Data Type</option>
			<option value="1" style="font-size:12pt">INT</option>
			<option value="2" style="font-size:12pt">VARCHAR</option>
			<option value="3" style="font-size:12pt">TEXT</option>
			<option value="4" style="font-size:12pt">DATE</option>
			<option value="5" style="font-size:12pt">TIME</option>
		</select>';
	    var child = document.createElement('div');
	    child.innerHTML = str;
	    while(child.firstChild){
	    	target.appendChild(child.firstChild);
	    }
</script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
</head>

<body>
<form id="formData">
	<div>
		<label for="테이블 명">테이블 명 : </label>
		<input type="text" id="physical" placeholder=" Physical"/><br />
		<input type="text" id="logical" style="margin-left:85px" placeholder=" Logical"/>
	</div>
	<div id="divAdd">
		<br />
		<label for="데이터">데이터 명 : </label>
		<input type="text" id="data_name" value=""/>
		<select style="font-size:13pt">
			<option disabled="disabled" selected="selected">Data Type</option>
			<option value="1" style="font-size:12pt">INT</option>
			<option value="2" style="font-size:12pt">VARCHAR</option>
			<option value="3" style="font-size:12pt">TEXT</option>
			<option value="4" style="font-size:12pt">DATE</option>
			<option value="5" style="font-size:12pt">TIME</option>
		</select>
		<input type="button" value="추가" id="buttonToAdd" onclick="
			<br />
			<input type="text" id="data_name" value=""/>
				<select style="font-size:13pt">
					<option disabled="disabled" selected="selected">Data Type</option>
					<option value="1" style="font-size:12pt">INT</option>
					<option value="2" style="font-size:12pt">VARCHAR</option>
					<option value="3" style="font-size:12pt">TEXT</option>
					<option value="4" style="font-size:12pt">DATE</option>
					<option value="5" style="font-size:12pt">TIME</option>
				</select>" />
	</div>
	<div>
		<br />
		<button type="submit" style="margin-left:345px"> CREATE </button>
	</div>
</form>


<div style="padding-bottom: 20px;"></div>
<a  style="padding: 10px;" href="${pageContext.request.contextPath}/sample/openUserList.do">유저 관리로 이동</a>
<a  style="padding: 10px;" href="${pageContext.request.contextPath}/sample/openDBEdit.do">데이터베이스 관리로 이동</a>

</body>
</html>