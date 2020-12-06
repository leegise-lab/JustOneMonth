<%--

작업할 페이지에 <%@ include file="admin_head.jsp" %> 적어주면 파일 적용됨.
헤드파일을 적용할 페이지에서는 charset=utf-8 입력할때 UTF 대문자로 통일시켜줘야 함
사이드바 크기가 210px이기 때문에 margin-left: 210px 최상위 태그에 적용시켜줘야함

--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>저스트원 관리자</title>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="./css/admin_head.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<header class="top-bar">
    <a class="mobile-nav" href="adminMain">
        <i class="pe-7s-menu"></i>

    <div class="main-logo"><img src="./images/adminimg.png"> JustoneMonth</div></a>
    <ul class="profile">
        <li>
            <a class="dropdown-toggle" data-toggle="dropdown" href="./main" class="profile__user">
                <figure class="pull-left rounded-image profile__img">
                    <img class="media-object" src="./images/adminuser.png" alt="user">
                </figure>
                <span class="profile__name">
                    Admin
                        <i class="pe-7s-angle-down"></i>
                    </span>
            </a>
        </li>
        <li>
            <a href="logOut">
                <i class="pe-7f-logout">Log Out</i>
            </a>
        </li>
        <li>
            <a href="#">
                <img src="./images/settings.png" />
            </a>
        </li>
    </ul>
</header>
<div class="wrapper">

    <aside class="sidebar">
        <ul class="main-nav">
            <li class="main-nav--active">
                <a class="main-nav__link" href="adminUpload">
                        <span class="main-nav__icon">
                            <i class="icon pe-7s-home"><img src="./images/arrow.png" /></i>
                        </span>
                    <span class="activename">상품등록</span>
                </a>
            </li>
            <li>
                <a class="main-nav__link" href="admin_product">
                        <span class="main-nav__icon">
                            <i class="icon pe-7s-edit"><img src="./images/arrow.png" /></i>
                        </span>
                    <span class="activename">상품리스트</span>
                </a>
            </li>
            <li class="main-nav--collapsible">
                <a class="main-nav__link" href="orderDeliveryLookup">
                        <span class="main-nav__icon">
                            <i class="icon pe-7s-photo-gallery"><img src="./images/arrow.png" /></i>
                        </span>
                    <span class="activename">결제리스트</span>
                </a>
            </li>
            <li>
                <a class="main-nav__link" href="admin_member">
                        <span class="main-nav__icon">
                            <i class="icon pe-7s-crop"><img src="./images/arrow.png" /></i>
                        </span>
                    <span class="activename">회원리스트</span>
                </a>
            </li>
        </ul>
    </aside>
    <!-- /main-nav -->
    <section class="content">
        <header class="main-header clearfix">
            <div class="main-header__date">
                <h4>Today <a class="font_small" id="current_time" style="font-size: 13px">(현재 시각)</a>
                    <script>
        let time_txt = document.getElementById('current_time');
        let today = new Date();
        time_txt.textContent = "( " + today.toLocaleString() + " )";
    </script> <img class="pe-7s-angle-down-circle"><img src="./images/arrowdown.png" />
                </h4></div>
        </header>
    </section>
    <!-- /content -->
</div>
<!-- /wrapper -->
</body>
</html>