<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원/관리자 로그인</title>
    <link rel="stylesheet" href="./css/login.css">
    <script src="./js/jquery-3.5.1.min.js"></script>
    <script src="./js/jq1.js"></script>
    <script src="./js/login.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <%@include file="user_header.jsp" %>
</head>
<body>
<!-- 로그인 -->
<script type="text/javascript" src="/shopimages/jojean/template/work/1147/header.1.js?t=202010161554"></script>
<div id="contentWrapper">
    <div id="contentWrap">
        <div id="content">
            <div id="loginWrap">

                <h2 class="tit-page">로그인</h2>

                <div class="page-body">
                    <div class="mlog-sign">
                        <div class="mlog">
                            <h3 class="log-tit">회원 로그인</h3>
                            <c:if test="${empty sessionScope.memUserid}">
                                <form action="/loginCheck" method="POST">
                                    <legend>member login</legend>
                                    <ul class="frm-list">
                                        <li><label>아이디</label><input type="text" id="id" name="id" maxlength="20"
                                                                     onblur="document.form1.passwd.focus();"
                                                                     class="MS_login_id txt-frm input-label"/></li>
                                        <li><label>비밀번호</label><input type="password" id="password" name="password"
                                                                      maxlength="20" onkeydown="CheckKey(event);"
                                                                      value="" class="MS_login_pw txt-frm input-label"/>
                                        </li>
                                    </ul>

                                    <input type="submit" class="CSSbuttonLog" value="로그인"></a>
                                </form>
                            </c:if>
                            <dl>
                                <dt><label>아직 회원이 아니신가요?</label></dt>
                                <dd><a href="/regist" class="CSSbuttonLogW">회원가입</a></dd>
                            </dl>
                        </div>
                        <div class="sign">
                            <img src="./images/login_benefit.jpg">
                        </div>
                    </div><!-- .mlog-sign -->
                </div><!-- .page-body -->
            </div><!-- #loginWrap -->
        </div><!-- #content -->
    </div><!-- #contentWrap -->
</div><!-- #contentWrapper-->
<!-- # 로그인 -->
<footer>
    <%@include file="user_footer.jsp" %>
</footer>
</body>
</html>