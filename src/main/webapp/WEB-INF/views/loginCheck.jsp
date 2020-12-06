<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>loginCheck</title>
</head>
<body>
<%
    String id=(String)session.getAttribute("loginId");
    if (session.getAttribute("loginId") == null ) {
%>
    <script>alert("아이디나 비밀번호가 다릅니다.");
    location.href = "/login"
    </script>
<%

}else if (id.equals("admin_juston")){
%>

    <script>alert("안녕하세요 관리자님");
    location.href = "/adminMain"
    </script>
<%
}else{
%>
    <script>alert("로그인 되었습니다.");
    location.href = "/main"
    </script>
<%
    }
%>
</body>
</html>