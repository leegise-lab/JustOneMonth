<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="./userCheck.jsp"%>
<%@include file="user_header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1 게시판 공지 보기</title>
    <link rel="stylesheet" href="./css/board1v1.css">
    <script src="./js/jquery-3.5.1.min.js"></script>
    <script src="./js/jq1.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">

</head>
<body>
<div id="contentWrapper">
    <div id="contentWrap">
        <div id="notice_content">
            <div id="board1v1">
                <h2 class="title-page">1:1 문의</h2>
                <div class="page-body">
                    <fieldset>
                        <legend>상담 내역 폼</legend>
                        <div class="table-d2-view">
                            <table summary="제목">
                                <caption>공지사항</caption>
                                <colgroup>
                                    <col width="150"/>
                                    <col width="*"/>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row">
                                        <div class="tb-center">제목</div>
                                    </th>
                                    <td>
                                        <div class="tb-left tb-bold"><br/>${title}</div><br/>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        <div class="tb-center">내용</div>
                                    </th>
                                    <td>
                                        <div class="tb-left tb-cont">${contents}</div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="btn-foot"><a href="/list"><span class="CSSbuttonB">목록보기</span></a>
                        </div>
                    </fieldset>
                </div><!-- .page-body -->
            </div><!-- #board1v1 -->
        </div><!-- #content -->
    </div><!-- #contentWrap -->
</div><!-- #contentWrapper-->
<footer>
    <%@include file="user_footer.jsp" %>
</footer>
</body>
</html>