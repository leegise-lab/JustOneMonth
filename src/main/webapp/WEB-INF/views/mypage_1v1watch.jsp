<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="user_header.jsp" %>
<%@ include file="./userCheck.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1 게시글 보기</title>
    <link rel="stylesheet" href="./css/board1v1.css">
    <script src="./js/jquery-3.5.1.min.js"></script>
    <script src="./js/jq1.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">

</head>
<body>
<div id="contentWrapper">
    <div id="contentWrap">
        <div id="watch_content">
            <div id="board1v1">
                <h2 class="title-page">1:1 문의</h2>
                <div class="page-body">
                    <div class="table-d2-view">
                        <table summary="제목, 파일, 이메일, 핸드폰, 답변, 질문내용, 질문답변" style="width: 900px">
                            <caption>상담내역</caption>
                            <colgroup>
                                <col width="150"/>
                                <col width="*"/>
                            </colgroup>
                            <tbody>
                            <c:if test="${result.hp == null}">
                                <script>
                                    alert('등록되었습니다.');
                                    location.href="list";
                                </script>
                            </c:if>
                            <tr>
                                <th scope="row">
                                    <div class="tb-center">제목</div>
                                </th>
                                <td style="width: 745px">
                                    <div class="tb-left tb-bold">${result.title}</div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">
                                    <div class="tb-center">이메일</div>
                                </th>
                                <td>
                                    <div class="tb-left">${result.email}</div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">
                                    <div class="tb-center">연락처</div>
                                </th>
                                <td>
                                    <div class="tb-left">${result.hp}</div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">
                                    <div class="tb-center">질문내용</div>
                                </th>
                                <td>
                                    <div class="tb-left tb-cont" style="float: left">${result.contents}</div>
                                </td>
                            </tr>
                            <%--                            <tr>--%>
                            <%--                                <th scope="row">--%>
                            <%--                                    <div class="tb-center">이미지</div>--%>
                            <%--                                </th>--%>
                            <%--                                <td>--%>
                            <%--                                    <div class="tb-left tb-cont">--%>
                            <%--                                        <img src="${result.filePath}" />${result.filePath}--%>
                            <%--                                    </div>--%>
                            <%--                                </td>--%>
                            <%--                            </tr>--%>
                            <form method="get" action="/watch?watch${idx}">
                                <tr>
                                    <th scope="row">
                                        <div class="tb-center">관리자 답변</div>
                                    </th>
                                    <c:choose>
                                        <c:when test="${admin eq 'admin_juston'}">
                                            <td>
                                                <textarea style="width: 740px; outline-color: #adafb0; border: 1px solid white" name="re_content" class="tb-left tb-cont" placeholder="댓글을 입력하세요." ></textarea>
                                                <input type="hidden" value="${idx}" name="inputReIdx">
                                                <input class="CSSbuttonBlackB" type="submit" value="댓글등록" style="margin-left: 78.7%">
                                            </td>
                                            <input type="hidden"  id="idxId">
                                        </c:when>
                                        <c:otherwise>
                                            <td>
                                                <div class="tb-left tb-cont">${replyWatch}</div>
                                            </td>
                                        </c:otherwise>

                                    </c:choose>


                                </tr>
                            </form>
                            </tbody>
                        </table>
                    </div>
                    <div class="btn-foot">
                        <a href="/list"><span class="CSSbuttonB">목록보기</span></a>
                    </div>
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