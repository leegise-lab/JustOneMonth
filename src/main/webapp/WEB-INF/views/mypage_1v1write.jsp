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
    <title>1:1 게시글 쓰기</title>
    <link rel="stylesheet" href="./css/board1v1.css">
    <script src="./js/jquery-3.5.1.min.js"></script>
    <script src="./js/jq1.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">


</head>
<body>
<div id="contentWrapper">
    <div id="contentWrap">
        <div id="write_content">
            <div id="board1v1">
                <h2 class="title-page">1:1 문의</h2>
                <div class="page-body">
                    <form name="personal" id="personal_form" method="POST" action="/watch" enctype="multipart/form-data">
                        <fieldset>
                            <legend>상담 내역 폼</legend>
                            <div class="table-d2-view">
                                <table summary="이름, 분류, 이메일, 핸드폰, 제목, 내용">
                                    <caption>상담문의</caption>
                                    <colgroup>
                                        <col width="150"/>
                                        <col width="*"/>
                                    </colgroup>
                                <tbody>
                                    <c:forEach var="infos" items="${loginInfos}">
                                        <tr>
                                            <th scope="row">
                                                <div class="tb-center">이름</div>
                                            </th>
                                            <td>
                                                <div class="tb-left tb-bold">${infos.memName}</div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <tr>
                                        <th scope="row">
                                            <div class="tb-center">분류</div>
                                        </th>
                                        <td>
                                            <div class="tb-left">
                                                <select name="personal_type" class="MS_input_txt" id="preface">
                                                    <option name="category">선 택</option>
                                                    <option value="[교환&반품]">교환&반품</option>
                                                    <option value="[배송전변경&취소]">배송전변경&취소</option>
                                                    <option value="[결제&입금확인]">결제&입금확인</option>
                                                    <option value="[배송문의]">배송문의</option>
                                                    <option value="[상품문의]">상품문의</option>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                    <c:forEach var="infos" items="${loginInfos}">
                                        <tr>
                                            <th scope="row">
                                                <div class="tb-center">이메일</div>
                                            </th>
                                            <td>
                                                <div class="tb-left"><input type="text" value="${infos.memEmail}" name="email" class="MS_input_txt txt-area1"></div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <tr>
                                        <c:forEach var="infos" items="${loginInfos}">
                                        <th scope="row">
                                            <div class="tb-center">연락처</div>
                                        </th>
                                        <td>
                                            <div class="tb-left"><input value="${infos.memHp}" name="etcphone" class="MS_input_txt txt-area1"></div>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    <tr>
                                        <th scope="row">
                                            <div class="tb-center">제목</div>
                                        </th>
                                        <td>
                                            <div class="tb-left">
                                                <input type='text' name='title' class="MS_input_txt txt-area1" id='title'/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <div class="tb-center">내용</div>
                                        </th>
                                        <td>
                                            <div class="tb-left"><textarea name='contents' rows='15' cols='57'
                                                                           class="MS_input_txt MS_input_textarea"
                                                                           id='contents'></textarea></div>
                                        </td>
                                    </tr>
<%--                                    <tr>--%>
<%--                                        <th scope="row">--%>
<%--                                            <div class="tb-center">첨부</div>--%>
<%--                                        </th>--%>
<%--                                        <td>--%>
<%--                                            <div class="tb-left"><input type= "file" name="file" class="MS_input_file"/></div>--%>
<%--                                        </td>--%>
<%--                                    </tr>--%>
                                    </tbody>
                                </table>
                            </div>
                            <div class="btn-foot">
                                <input type="submit" value="문의하기" class="CSSbuttonBlackB"/>
                                <a href="/list"><span class="CSSbuttonB">목록보기</span></a>
                            </div>
                        </fieldset>
                    </form>
                </div><!-- .page-body -->
            </div><!-- #board1v1 -->
        </div><!-- #content -->
    </div><!-- #contentWrap -->
</div><!-- #contentWrapper-->
<footer>
    <%@include file="user_footer.jsp"%>
</footer>
</body>
</html>