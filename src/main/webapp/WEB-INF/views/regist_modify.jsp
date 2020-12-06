<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보수정</title>
    <link rel="stylesheet" href="./css/board1v1.css">
    <link rel="stylesheet" href="/css/regist.css">
    <script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="./jquery-3.5.1.min.js"></script>
    <script src="./js/jq1.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <%@include file="user_header.jsp" %>
    <%@ include file="./userCheck.jsp"%>
    <script>
        function modifyit() {

            const idCheck = new RegExp(/^[a-zA-Z0-9]{6,20}$/);
            const expPwText = new RegExp(/^.*(?=^.{4,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()+=]).*$/);
            const expNameText = new RegExp(/[가-힣]+$/);
            const expEmailText = new RegExp(/^[A-Za-z0-9\.\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z0-9\.\-]+/);
            const expHpText = new RegExp(/^\d{3}-\d{3,4}-\d{4}$/);

            if (!expEmailText.test($("#email").val())) {
                alert("예 : dlwlsdud1734@naver.com");
                email.value = "";
                $("#email").focus();
                return false;
            }
            if ($("#password1").val() == "" || $("#password2").val() == "") {
                alert("비밀번호를 입력하세요.");
                $("#password1").focus();
                return false;
            }

            if ($("#password1").val().length < 4 || $("#password1").val().length > 20) {
                alert("비밀번호는 6~20자로 입력");
                password1.value = "";
                password2.value = "";
                $("#password1").focus();
                return false;
            }
            if (!expPwText.test($("#password1").val())) {
                alert("비밀번호는 6~20자의 영문 대소문자, 숫자, 특수문자 포함하여 입력");
                password1.value = "";
                password2.value = "";
                $("#password1").focus();
                return false;
            }
            if ($("#password1").val() != $("#password2").val()) {
                alert("비밀번호와 비밀번호 확인의 값이 다릅니다.");
                password1.value = "";
                password2.value = "";
                $("#password1").focus();
                return false;
            }
            return true;

        }
    </script>

</head>
<body>


<div id="contentWrapper">
    <div id="contentWrap">
        <div>
            <div id="join">
                <h2 class="title-page">회원정보수정</h2>
                <div class="mypage_menu">
                    <ul>
                        <li><a href="./orderLookUp">주문조회</a></li>
                        <li><a href="./list">1:1문의</a></li>
                        <li><a href="./memberModify">회원정보 수정</a></li>
                        <li><a href="./memberOut">회원탈퇴</a></li>
                    </ul>
                </div>
                <form name="modifyForm" method="post" id="join_form" onsubmit="return modifyit()" autocomplete="off" action="/memberModifyOk">
                    <!-- 일반회원 기본 노출 -->
                    <div class="table-order-info join-form">
                        <table class="order-table">
                            <colgroup>
                                <col width="170"/>
                                <col width="*">
                            </colgroup>
                            <c:forEach var="infos" items="${loginInfos}">
                                <tr>
                                    <th>
                                        <div class="tb-left">이름</div>
                                    </th>
                                    <td>
                                        <div class="tb-left">
                                            <input type="text" name="name" id="name" value="${infos.memName}"
                                                   class="MS_input_txt w200"
                                                   size="15" maxlength="30" disabled/>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:forEach var="infos" items="${loginInfos}">
                                <tr>
                                    <th>
                                        <div class="tb-left">아이디</div>
                                    </th>
                                    <td>
                                        <div class="tb-left">
                                            <input type="text" name="id" id="id" value="${infos.memUserid}"
                                                   class="MS_input_txt w200"
                                                   size="15" maxlength="30" disabled/>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

                            <tr>
                                <th>
                                    <div class="tb-left">비밀번호</div>
                                </th>
                                <td>
                                    <div class="tb-left">
                                        <input type="password" name="password1" id="password1"
                                               class="MS_input_txt w200"
                                               value="${infos.memPass}" size="15" maxlength="20"/>
                                        <span class="idpw-info">* 영문 대소문자/숫자/특수문자 혼용</span>
                                    </div>
                                </td>
                            </tr>


                            <tr>
                                <th>
                                    <div class="tb-left">비밀번호 확인</div>
                                </th>
                                <td>
                                    <div class="tb-left">
                                        <input type="password" name="password2" id="password2"
                                               class="MS_input_txt w200"
                                               value="${infos.memPass}" size="15 " maxlength="20"/>
                                    </div>
                                </td>
                            </tr>

                            <c:forEach var="infos" items="${loginInfos}">
                                <tr>
                                    <th>
                                        <div class="tb-left">우편번호</div>
                                    </th>
                                    <td>
                                        <div class="tb-left">
                                            <input type="text" name="zipcode" id="zipcode"
                                                   class="MS_input_txt zipcode" value="${infos.memZipcode}" size="5"
                                            />
                                            <input type="button" value="우편번호검색" onclick="sample6_execDaumPostcode()"
                                                   class="CSSbuttonGray_zip">
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:forEach var="infos" items="${loginInfos}">
                                <tr>
                                    <th>
                                        <div class="tb-left">주소</div>
                                    </th>
                                    <td>
                                        <div class="tb-left">
                                            <input type="text" name="address1" id="address1"
                                                   value="${infos.memAddress1}"
                                                   class="MS_input_txt w200" size='40' maxlength="100"
                                            />
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:forEach var="infos" items="${loginInfos}">
                                <tr>
                                    <th>
                                        <div class="tb-left">상세주소</div>
                                    </th>
                                    <td>
                                        <div class="tb-left">
                                            <input type="text" name="address2" id="sample6_detailAddress"
                                                   class="MS_input_txt address2 w415" value="${infos.memAddress2}"
                                                   size='40' maxlength="100"/>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:forEach var="infos" items="${loginInfos}">
                                <tr>
                                    <th>
                                        <div class="tb-left">이메일</div>
                                    </th>
                                    <td>
                                        <div class="tb-left">
                                            <input type="text" name="email" id="email" class="MS_input_txt w200"
                                                   size="10"
                                                   maxlength="35" value="${infos.memEmail}"/>
                                                <%--                                        <span>@</span>--%>
                                                <%--                                        <span id="direct_email" style="margin-top:3px;display:inline-block">--%>
                                                <%--                                        <input type="text" name="email" id="email" class="MS_input_txt w200" value=""--%>
                                                <%--                                               size="15" maxlength="25"/>--%>
                                                <%--                                        </span>--%>
                                                <%--                                        <select name="email" id="email" class="MS_select MS_email"--%>
                                                <%--                                                style="margin-right:5px;">--%>
                                                <%--                                            <option value='direct' selected="selected">직접입력</option>--%>
                                                <%--                                            <option value="naver.com">naver.com</option>--%>
                                                <%--                                            <option value="hotmail.com">hotmail.com</option>--%>
                                                <%--                                            <option value="hanmail.net">hanmail.net</option>--%>
                                                <%--                                        <option value="nate.com">nate.com</option>--%>
                                                <%--                                        <option value="gmail.com">gmail.com</option>--%>
                                                <%--                                        </select>--%>
                                                <%--                                        <a href="#" class="CSSbuttonGray">중복확인</a>--%>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

                            <c:forEach var="infos" items="${loginInfos}">
                            <tr>
                                <th>
                                    <div class="tb-left">휴대폰</div>
                                </th>
                                <td>
                                    <div class="tb-left">
                                        <input type="text" name="hp" form="join_form" value="${infos.memHp}"
                                               class="MS_input_txt w200"/>

                                            <%--                                        <select name="etcphone1" id="etcphone1" form="join_form"--%>
                                            <%--                                                class="MS_select MS_tel">--%>
                                            <%--                                            <option value=''>선택</option>--%>
                                            <%--                                            <option value="010">010</option>--%>
                                            <%--                                            <option value="011">011</option>--%>
                                            <%--                                            <option value="016">016</option>--%>
                                            <%--                                            <option value="017">017</option>--%>
                                            <%--                                            <option value="018">018</option>--%>
                                            <%--                                            <option value="019">019</option>--%>
                                            <%--                                        </select> - <input type="text" name='hp' form="join_form" id="hp"--%>
                                            <%--                                                           class="MS_input_tel w80" value="" size="4" maxlength="4"/> ---%>
                                            <%--                                        <input type="text" name="etcphone3" form="join_form" id="etcphone3"--%>
                                            <%--                                               class="MS_input_tel w80" value="" size="4" maxlength="4" minlength=4/>--%>
                                    </div>
                                </td>
                            </tr>


                                <%--                            <tr>--%>
                                <%--                                <th>--%>
                                <%--                                    <div class="tb-left">뉴스메일</div>--%>
                                <%--                                </th>--%>
                                <%--                                <td>--%>
                                <%--                                    <div class="tb-left">--%>
                                <%--                                        <label style="margin-right:20px;">--%>
                                <%--                                            <input type="radio" name="emailreceive" value="Y"/> 받습니다.</label>--%>
                                <%--                                        <label><input type="radio" name="emailreceive" value="N" checked/> 받지--%>
                                <%--                                            않습니다.</label>--%>
                                <%--                                    </div>--%>
                                <%--                                </td>--%>
                                <%--                            </tr>--%>
                                <%--                            <tr>--%>
                                <%--                                <th>--%>
                                <%--                                    <div class="tb-left">SMS안내</div>--%>
                                <%--                                </th>--%>
                                <%--                                <td>--%>
                                <%--                                    <div class="tb-left">--%>
                                <%--                                        <label style="margin-right:20px;"> <input type="radio" name="smsreceive"--%>
                                <%--                                                                                  form="join_form" value="Y"/>--%>
                                <%--                                            받습니다.</label>--%>
                                <%--                                        <label><input type="radio" name="smsreceive" form="join_form" value="N"--%>
                                <%--                                                      checked/> 받지 않습니다.</label>--%>
                                <%--                                    </div>--%>
                                <%--                                </td>--%>
                                <%--                            </tr>--%>

                        </table>
                    </div> <!-- #personInfo -->
                    </c:forEach>


                    <div class="btn-area">
                        <input type="submit" value="확인" class="CSSbuttonBlackB">
                        <input type="button" value="취소" class="CSSbuttonBlackB" onclick="location.href='/main'">
                    </div>
                </form>
                <!-- use_contract -->

            </div><!-- #join -->
        </div><!-- #content -->
    </div><!-- #contentWrap -->
</div><!-- #contentWrapper-->
<footer>
    <%@include file="user_footer.jsp" %>
</footer>
</body>
</html>