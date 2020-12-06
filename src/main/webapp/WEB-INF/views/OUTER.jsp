<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <p>OUTER</p>
        </div>
        <ul id="Shortcuts">
            <li class="Shortcuts_btn " value="0">전체 보기</li>
            <li class="Shortcuts_btn " value="1">자켓</li>
            <li class="Shortcuts_btn " value="2">상의</li>
            <li class="Shortcuts_btn " value="3">코트</li>
            <li class="Shortcuts_btn " value="4">집업/점퍼</li>
            <li class="Shortcuts_btn " value="5">패딩</li>
        </ul>
        <div class="bestbox_top20">
            <c:forEach var="item" items="${list}"  end="${list.size()/4}">
                <div class="bestbox_line">
                    <% for (int i = 0; i <4;i++){%>
                    <c:forEach var="item" items="${list}" begin="<%=j%>" end="<%=j%>">
                        <div class="bestbox_list">
                            <a href="item?up_idx=${item.up_idx}"><img src="./images/in/${item.up_file1}" alt=""></a>
                            <ul class="explan">
                                <li><p class="tem_name">${item.up_name}</p></li>
                                <li><p class="tem_size">${item.up_size}</p></li>
                                <li><p class="tem_price">${item.up_price} 원 </p></li>
                            </ul>
                        </div>
                    </c:forEach>
                    <% j++; } %>
                    <div class="both"></div>
                </div>
            </c:forEach>
        </div>
        <div class="bestbox_top20 displaynone1">
            <%j=0;%>
            <c:forEach var="item1" items="${list1}"  end="${list1.size()/4}">
                <div class="bestbox_line">
                    <% for (int i = 0; i <4;i++){%>
                    <c:forEach var="item1" items="${list1}" begin="<%=j%>" end="<%=j%>">
                        <div class="bestbox_list">
                            <a href="item?up_idx=${item1.up_idx}"><img src="./images/in/${item.up_file1}" alt=""></a>
                            <ul class="explan">
                                <li><p class="tem_name">${item.up_name}</p></li>
                                <li><p class="tem_size">${item.up_size}</p></li>
                                <li><p class="tem_price">${item.up_price} 원 </p></li>
                            </ul>
                        </div>
                    </c:forEach>
                    <% j++; } %>
                    <div class="both"></div>
                </div>
            </c:forEach>
        </div>
        <%j=0;%>
        <div class="bestbox_top20 displaynone1">
            <c:forEach var="item" items="${list2}"  end="${list2.size()/4}">
                <div class="bestbox_line">
                    <% for (int i = 0; i <4;i++){%>
                    <c:forEach var="item" items="${list2}" begin="<%=j%>" end="<%=j%>">
                        <div class="bestbox_list">
                            <a href="item?up_idx=${item.up_idx}"><img src="./images/in/${item.up_file1}" alt=""></a>
                            <ul class="explan">
                                <li><p class="tem_name">${item.up_name}</p></li>
                                <li><p class="tem_size">${item.up_size}</p></li>
                                <li><p class="tem_price">${item.up_price} 원 </p></li>
                            </ul>
                        </div>
                    </c:forEach>
                    <% j++; }%>
                    <div class="both"></div>
                </div>
            </c:forEach>
        </div><%j=0;%>
        <div class="bestbox_top20 displaynone1">
            <c:forEach var="item" items="${list3}"  end="${list3.size()/4}">
                <div class="bestbox_line">
                    <% for (int i = 0; i <4;i++){%>
                    <c:forEach var="item" items="${list3}" begin="<%=j%>" end="<%=j%>">
                        <div class="bestbox_list">
                            <a href="item?up_idx=${item.up_idx}"><img src="./images/in/${item.up_file1}" alt=""></a>
                            <ul class="explan">
                                <li><p class="tem_name">${item.up_name}</p></li>
                                <li><p class="tem_size">${item.up_size}</p></li>
                                <li><p class="tem_price">${item.up_price} 원 </p></li>
                            </ul>
                        </div>
                    </c:forEach>
                    <% j++; } %>
                    <div class="both"></div>
                </div>
            </c:forEach>
        </div>
        <%j=0;%>
        <div class="bestbox_top20 displaynone1">
            <c:forEach var="item" items="${list4}"  end="${list4.size()/4}">
                <div class="bestbox_line">
                    <% for (int i = 0; i <4;i++){%>
                    <c:forEach var="item" items="${list4}" begin="<%=j%>" end="<%=j%>">
                        <div class="bestbox_list">
                            <a href="item?up_idx=${item.up_idx}"><img src="./images/in/${item.up_file1}" alt=""></a>
                            <ul class="explan">
                                <li><p class="tem_name">${item.up_name}</p></li>
                                <li><p class="tem_size">${item.up_size}</p></li>
                                <li><p class="tem_price">${item.up_price} 원 </p></li>
                            </ul>
                        </div>
                    </c:forEach>
                    <% j++; } %>
                    <div class="both"></div>
                </div>
            </c:forEach>
        </div>
        <%j=0;%>
        <div class="bestbox_top20 displaynone1">
            <c:forEach var="item" items="${list5}"  end="${list5.size()/4}">
                <div class="bestbox_line">
                    <% for (int i = 0; i <4;i++){%>
                    <c:forEach var="item" items="${list5}" begin="<%=j%>" end="<%=j%>">
                        <div class="bestbox_list">
                            <a href="item?up_idx=${item.up_idx}"><img src="./images/in/${item.up_file1}" alt=""></a>
                            <ul class="explan">
                                <li><p class="tem_name">${item.up_name}</p></li>
                                <li><p class="tem_size">${item.up_size}</p></li>
                                <li><p class="tem_price">${item.up_price} 원 </p></li>
                            </ul>
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
