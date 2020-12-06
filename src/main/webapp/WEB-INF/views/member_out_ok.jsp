<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>탈퇴신청 완료</title>
</head>
<body>
<input type="hidden" value="${result}" id="result">
<script>
    let result = document.getElementById("result").value;
    if (result == 0) {
        alert("비밀번호가 틀렸습니다.");
        location.href = "/login";
    } else {
        alert("탈퇴되었습니다.");
        location.href = "/main";
    }
</script>

</body>
</html>