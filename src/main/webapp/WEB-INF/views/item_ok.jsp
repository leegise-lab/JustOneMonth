<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean class="com.justonemonth.model.ProductDTO" id="product"/>
<jsp:useBean class="com.justonemonth.model.ProductDAO" id="dao"/>
<jsp:setProperty property="*" name="product"/>
<%@ include file="./userCheck.jsp"%>
<c:choose>
    <c:when test="${result>0}">

    </c:when>
    <c:when test="${result==-1}">
        <script>
            let pageMove = confirm("이미 장바구니에 담겨 있는 상품입니다. 장바구니로 이동하시겠습니까?");
            if(pageMove){
                location.href='./cart';
            }else{
                history.back();
            }
        </script>
    </c:when>
    <c:otherwise>

    </c:otherwise>
</c:choose>
<%
    request.setCharacterEncoding("UTF-8");
%>
<script>
    alert('<%=product.getProductName()%> 상품이 장바구니에 추가 되었습니다.');
    let pageMove = confirm("장바구니로 이동하시겠습니까?")
    if(pageMove){
        location.href='./cart';
    }else{
        history.back();
    }
</script>