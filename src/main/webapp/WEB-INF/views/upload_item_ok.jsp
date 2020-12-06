
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");
%>

    <meta charset="UTF-8">
    <title>상품 등록</title>

<c:if test="${result eq 1}">
<script>
    alert('등록이 완료되었습니다.');
    location.href='adminUpload';

</script>
</c:if>

<c:if test="${result eq 0}">
<script>
    alert('등록 실패했습니다.');
    history.back();
</script>
</c:if>

