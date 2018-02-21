<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>User List</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body>
<h2>유저 정보</h2>
<table style="border:1px solid #ccc">
    <colgroup>
        <col width="10%"/>
        <col width="10%"/>
        <col width="10%"/>
        <col width="10%"/>
        <col width="10%"/>
        <col width="10%"/>
        <col width="10%"/>
        <col width="10%"/>
        <col width="10%"/>
        <col width="15%"/>
    </colgroup>
    <thead>
        <tr>
            <th scope="col">일련번호</th>
            <th scope="col">아이디</th>
            <th scope="col">비밀번호</th>
            <th scope="col">이름</th>
            <th scope="col">팀</th>
            <th scope="col">메일</th>
            <th scope="col">전화번호</th>
            <th scope="col">휴대전화번호</th>
            <th scope="col">승인일자</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${fn:length(list) > 0}">
                <c:forEach items="${list }" var="row">
                    <tr align="center">
                        <td>${row.EMP_UID }</td>
                        <td>${row.EMP_ID }</td>
                        <td>${row.EMP_PW }</td>
                        <td>${row.EMP_NAME }</td>
                        <td>${row.EMP_TEAM }</td>
                        <td>${row.EMP_MAIL }</td>
                        <td>${row.EMP_PHONE }</td>
                        <td>${row.EMP_CELLPHONE }</td>
                        <td>${row.EMP_REG_DTM }</td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="9">조회된 결과가 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
    </tbody>
</table><br/>
<a  style="padding: 10px;" href="${pageContext.request.contextPath}/sample/openDBEdit.do">데이터베이스 리스트로 이동</a>
<a  style="padding: 10px;" href="${pageContext.request.contextPath}/sample/openTableCrea.do">테이블 생성으로 이동</a>
</body>
</html>