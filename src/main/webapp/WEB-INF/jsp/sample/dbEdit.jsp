<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Get DB Table</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-calendar/master/dist/ax5calendar.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-picker/master/dist/ax5picker.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-select/master/dist/ax5select.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-grid/master/dist/ax5grid.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5core/master/dist/ax5core.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-calendar/master/dist/ax5calendar.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-picker/master/dist/ax5picker.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-formatter/master/dist/ax5formatter.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-select/master/dist/ax5select.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5core/master/dist/ax5core.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-grid/master/dist/ax5grid.min.js"></script>

<script type="text/javascript">
$(document).ready(function () {
	var API_SERVER = "http://api-demo.ax5.io";
	var firstGrid = new ax5.ui.grid();

    firstGrid.setConfig({
    	target: $('[data-ax5grid="first-grid"]'),
            
        showLineNumber: true,
        showRowSelector: true,
        multipleSelect: true,
        lineNumberColumnWidth: 40,
        rowSelectorColumnWidth: 27,
        sortable: true,
         
        columns: [
            {key: "uid", label: "아이디", align: "center"},
       		{key: "pw", label: "비밀번호", align: "center"},
            {key: "name", label: "이름", align: "center"},
            {key: "team", label: "팀", align: "center"},
            {key: "mail", label: "이메일", align: "center"},
            {key: "tel", label: "전화번호", align: "center"},
            {key: "phone", label: "휴대전화번호", align: "center"},
            {key: "date", label: "승인일자", align: "center"}
        ]
    });
    
    /* 테스트용 데이터 생성 */



    /* 버튼 이벤트 핸들러 */
    $('[data-grid-control]').click(function () {
        switch (this.getAttribute("data-grid-control")) {
            case "row-add":
            	firstGrid.addRow($.extend({}, firstGrid.list[Math.floor(Math.random() * firstGrid.list.length)], {__index: undefined}));
                //firstGrid.addRow($.extend({}, firstGrid.list[Math.floor(Math.random() * firstGrid.list.length)], true), 1);
                break;
            case "row-remove":
                firstGrid.removeRow(1);
                break;
            case "row-update":
                var updateIndex = Math.floor(Math.random() * firstGrid.list.length);
                firstGrid.updateRow($.extend({}, firstGrid.list[updateIndex], {name: "방성호", uid: "shbang", pw: "1111"}), updateIndex);
                break;
            case "column-add":
                firstGrid.addColumn({key: "b", label: "추가된 열"}, "last");
                break;
            case "column-remove":
                firstGrid.removeColumn();
                break;
            case "column-update":
                firstGrid.updateColumn({key: "b", label: "업데이트"}, 0);
                break;
        }
    });
});
function getTable(){
	 	var sendData =  JSON.stringify({selTB:$("#tbSelect").find(":selected").val()});
	 	alert(sendData + typeof(sendData));
	 	$.ajax({
	 		type: "POST",
	 		url : "<c:url value='/getTable.do' />",
	 		data: sendData,
	 		dataType: "json",
			contentType:"application/json;charset=UTF-8",
	 		async: true,
	 		success : function(data, status, xhr) {
	 			alert("success! " + data);
 			},
 			error: function(jqXHR, textStatus, errorThrown) {
 				alert(jqXHR.responseText);
	 		}
	 	});
	 }
</script>
</head>

<body>
<div style="margin-bottom:10px;">
	<label for="tbSelect"><strong>TABLE 리스트 : </strong></label>
	<select id='tbSelect' name="tbSelect">
		<c:choose>
		    <c:when test="${fn:length(list) > 0}">
		        <c:forEach items="${list }" var="row">
		        	<option value=${row.TABLE_NAME }>${row.TABLE_NAME }</option>
		        </c:forEach>
		    </c:when>
		    <c:otherwise>
		        <tr>
		        	<option value='notable'>no table</option>
		        </tr>
		    </c:otherwise>
		</c:choose>
	</select>
	<input type="submit" value="불러오기" onclick="getTable();">
</div>
<div data-ax5grid="first-grid" data-ax5grid-config="{}" style="width:100%; height:316px;"></div><br/>
<a  style="padding: 10px;" href="${pageContext.request.contextPath}/sample/openUserList.do">유저 관리로 이동</a>
<a  style="padding: 10px;" href="${pageContext.request.contextPath}/sample/openTableCrea.do">테이블 생성으로 이동</a>
</body>
</html>