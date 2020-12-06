<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<c:if test="${result eq 1}">
    <script>
        alert("선택하신 상품 정보가 삭제되었습니다.");
        location.href="admin_product";
    </script>
</c:if>
<c:if test="${result eq 0}">
    <script>
        alert("선택된 상품 정보가 없습니다.");
        history.back();
    </script>
</c:if>