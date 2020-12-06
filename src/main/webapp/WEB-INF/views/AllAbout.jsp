<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    int j =0;

    request.setCharacterEncoding("UTF-8");

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/cf.css">
    <link rel="stylesheet" href="./css/main_1.css">
    <link rel="stylesheet" href="./css/style_1.css">
    <link rel="stylesheet" href="./css/footer.css">
    <link rel="stylesheet" href="./css/best.css">
    <script src="./jq/jquery-3.5.1.min.js"></script>
    <script src="./jq/bestjq.js"></script>
    <script src="./jq/jq1.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <%@include file="./user_header.jsp" %>


</head>
<body>
    <main>
        <div id="top_menu">
        <p>All About</p>
        </div>
        <div class="bestbox_top20">
            <c:forEach var="item" items="${list}"  end="${list.size()/4}">
                <div class="bestbox_line">
                    <% for (int i = 0; i <4;i++){%>
                    <c:forEach var="item" items="${list}" begin="<%=j%>" end="<%=j%>">
                        <div class="bestbox_list">
                            <a href="item?up_idx=${item.up_idx}"><img src="./images/in/${item.up_file1}" alt="">
                            <ul class="explan">
                                <li><p class="tem_name">${item.up_name}</p></li>
                                <li><p class="tem_size">${item.up_size}</p></li>
                                <li><p class="tem_price"><fmt:formatNumber value="${item.up_price}" pattern="#,###" />원 </p></li>
                            </ul></a>
                        </div>
                    </c:forEach>
                    <% j++; } %>
                    <div class="both"></div>
                </div>
            </c:forEach>

        </div>
    </main>
    <footer>
        <%@include file="./user_footer.jsp" %>
    </footer>
</body>
</html>
