<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>userList</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-kernel/master/dist/ax5ui.all.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-kernel/master/dist/ax5ui.all.min.js"></script>
<script type="text/javascript">
//<![CDATA
var firstGrid = null;

$(function () {
    /* 그리드 객체 생성 */
    firstGrid = new ax5.ui.grid();

    /* 그리드 설정 지정 */
    firstGrid.setConfig({
        target: $('[data-ax5grid="first-grid"]'),

        showLineNumber: false,
        showRowSelector: true,
        multipleSelect: false,
        lineNumberColumnWidth: 40,
        rowSelectorColumnWidth: 27,

        columns: [
            {key: "date", label: "날짜", align: "center", editor: {type: "date"}},
            {key: "type", label: "구분", align: "center", 
             editor: {
                type: "select", config: {
                    columnKeys: {
                        optionValue: "CD", optionText: "NM"
                    },
                    options: [
                        {CD: "O", NM: "O: 주유"},
                        {CD: "R", NM: "R: 정비"}
                    ]
                },
                disabled: function () {
                    return this.item.complete == "true";
                }
             }
            },
            {key: "amount", label: "<strong>주유량</strong>", align: "center", editor: {type: "number"}},
            {key: "mileage", label: "주행거리(km)", align: "center", editor: {type:"number"}},
            {key: "price", label: "금액(원)", formatter: "money", align: "center", editor: {type:"money"}},
            {key: "repair", label: "정비내역", align: "center", editor:{type: "text"}},
            {key: "complete", label: "완료", align: "center", editor:{type: "checkbox"}},
            {key: "note", label: "비고", align: "center", editor:{type: "textarea"}}
        ],
        page: {
            navigationItemCount: 9,
            height: 30,
            display: true,
            firstIcon: '|<',
            prevIcon: '<',
            nextIcon: '>',
            lastIcon: '>|',
            onChange: function () {
                search(this.page.selectPage);
            }
        },
    });
});
function getTable(){
	var sendData =$("#tbSelect").find(":selected").val();
	$.ajax({
		type: "POST",
		url : "<c:url value='/getTable.do' />",
		data: sendData,
		dataType: "json",
		contentType:"application/json;charset=UTF-8",
		async: true,
		success : function(data, status, xhr) {
			console.log(data);
		},
		error: function(jqXHR, textStatus, errorThrown) {
			alert(jqXHR.responseText);
		}
	});
}
//]]>
</script>
</head>

<body>
<div style="margin-bottom:10px;">
	<form id="formSelectTB" style="display:inline;">
		<label for="tbSelect">TABLE 리스트 : </label>
		<select id='tbSelect' name="tbSelect">
			<c:choose>
			    <c:when test="${fn:length(list) > 0}">
			        <c:forEach items="${list }" var="row">
			        	<option value=${row.TABLE_NAME }>${row.TABLE_NAME }</option>
			        </c:forEach>
			    </c:when>
			    <c:otherwise>
		        	<option value='notable'>no table</option>
			    </c:otherwise>
			</c:choose>
		</select>
	</form>
	<input type="submit" value="불러오기" onclick="getTable();">
</div>
<div data-ax5grid="first-grid" data-ax5grid-config="{}" style="width:100%; height:316px;"></div><br/>
<a  href="${pageContext.request.contextPath}/sample/openUserList.do">유저 관리로 이동</a>
<a  href="${pageContext.request.contextPath}/sample/openTableCrea.do">테이블 생성으로 이동</a>
</body>
</html>