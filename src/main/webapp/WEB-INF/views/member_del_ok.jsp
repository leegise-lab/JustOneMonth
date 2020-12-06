<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%--<c:forEach items="${list}" var="item" varStatus="status">--%>
<%--    <p style="border: 1px solid #f0ad4e;">${item}</p>--%>
<%--</c:forEach>--%>

<c:if test="${result eq 1}">
    <script>
        alert("선택하신 회원 정보가 삭제되었습니다.");
        location.href="admin_member";
    </script>
</c:if>
<c:if test="${result eq 0}">
    <script>
        alert("선택된 회원 정보가 없습니다.");
        history.back();
    </script>
</c:if>