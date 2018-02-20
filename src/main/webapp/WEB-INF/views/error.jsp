<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta http-equiv="content-language" content="ko">
<title>ERROR</title>
</head>
<body>
<table style="width:100%; height:100%;border-collapse:collapse;">
  <tr>
    <td width="100%" height="100%" align="center" valign="middle" style="padding-top:150px;"><table style="border-collapse:collapse;">
      <tr>
        <td>
        	<span style="font-family:Tahoma; font-weight:bold; color:#000000; line-height:150%; width:440px; height:70px;">오류발생 알림화면(허용되지 않는 요청을 하셨습니다)</span>
        	<%
        	if(exception != null) {
        		out.println(exception.getMessage());
        	}
        	%>
        </td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>