<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>저스트원: 주문서</title>
    <link rel="stylesheet" href="/css/orderlist.css">
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"/>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="/js/jquery-1.10.2.js"/>
    <script>
        /*
        * 장바구니쿠키(or 세션), DB에서 데이터 가져와 세팅
        * */
    </script>
    <%@include file="./user_header.jsp" %>
</head>
<body>
<%

%>
<div class="contentWrap-order">
    <div id="content-order">
        <div id="order">
            <h2 class="tit-page">주문서작성</h2>
            <div class="page-body">
                <fieldset>
                    <legend>주문 폼</legend>
                    <h3>주문리스트</h3>
                    <div class="table-order">
                        <%--onsubmit이 return true면 submit, false면 submit 안함 onsubmit="return checkNull()--%>
                        <form id="frm" method="post">
                            <table>
                                <caption>주문리스트</caption>
                                <colgroup>
                                    <col style="width: 100px;">
                                    <col style="width: 600px;">
                                    <col style="width: 100px;">
                                    <col style="width: 100px;">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>사진</th>
                                    <th>상품명</th>
                                    <th>수량</th>
                                    <th>가격</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var = "total" value = "0" />
                                <c:choose>
                                    <%--         장바구니를 통해 orderWrite에 왔을 때         --%>
                                    <c:when test="${buyType == 1}">
                                        <c:forEach var="pInfo" items="${cartList}" varStatus="status">
                                            <tr class="text_center">
                                                <td>
                                                    <div class="tb-center"><img src="${pInfo.getCart_productimg()}">
                                                        <input type="hidden" value="1" name="buyType"></div>
                                                </td>
                                                <td>
                                                    <div class="tb-left">
                                                        <input type="hidden" name="productName"
                                                               value="${pInfo.getCart_productname()}">
                                                            ${pInfo.getCart_productname()}
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="tb-center">${pInfo.getCart_amount()}</div>
                                                </td>
                                                <td>
                                                    <div class="tb-center tb-bold">
                                                        <input type="hidden" name="cart_price"
                                                               value="${pInfo.getCart_productprice()}">
                                                        <fmt:formatNumber value="${pInfo.getCart_productprice()}"/>원
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <div id="option">[옵션] : 색상
                                                        : ${pInfo.getCart_color()}, 사이즈
                                                        : ${pInfo.getCart_size()}</div>
                                                </td>
                                            </tr>
                                            <c:set var= "total" value='${total + pInfo.getCart_amount()*pInfo.getCart_productprice()}'/>
                                        </c:forEach>
                                    </c:when>
                                    <c:when test="${buyType == 0}">
                                        <%--         바로구매 통해 orderWrite에 왔을 때         --%>
                                        <tr class="text_center">
                                            <td>
                                                <c:set var="pInfo" value="${cartList}"></c:set>
                                                <div class="tb-center"><img src="${pInfo.getCartImg()}"></div>
                                                <input type="hidden" value="0" name="buyType">
                                                <input type="hidden" value="${pInfo.getCartImg()}" name="productImg">
                                            </td>
                                            <td>
                                                <div class="tb-left">
                                                    <input type="hidden" name="productName"
                                                           value="${pInfo.getCartProductName()}">
                                                        ${pInfo.getCartProductName()}
                                                </div>
                                            </td>
                                            <td>
                                                <div class="tb-center">${pInfo.getCartAmount()}</div>
                                                <input type="hidden" value="${pInfo.getCartAmount()}" name="productAmount">
                                            </td>
                                            <td>
                                                <div class="tb-center tb-bold">
                                                    <input type="hidden" name="cart_price"
                                                           value="${pInfo.getCartProductPrice()}">
                                                    <fmt:formatNumber value="${pInfo.getCartProductPrice()}"/>원
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <div id="option">[옵션] : 색상
                                                    : ${pInfo.getCartColor()}, 사이즈
                                                    : ${pInfo.getCartSize()}</div>
                                                <input type="hidden" value="${pInfo.getCartColor()}" name="productColor">
                                                <input type="hidden" value="${pInfo.getCartSize()}" name="productSize">
                                            </td>
                                        </tr>
                                        <c:set var= "total" value='${total + pInfo.getCartAmount()*pInfo.getCartProductPrice()}'/>
                                    </c:when>
                                </c:choose>
                                </tbody>
                            </table>
                            <h3 class="tit-cart2">주문자정보</h3>
                            <%--                    회원 정보(이름, 이메일, 전화번호 불러와서 세팅)                  --%>
                            <div class="table-order">
                                <c:forEach var="user" items="${setUserInfo}">
                                    <table>
                                        <colgroup>
                                            <col style="width: 150px;">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th>
                                                <div class="txt-l" id="name_txt">이름</div>
                                            </th>
                                            <td id="order_name">${user.mem_name}</td>
                                        </tr>
                                        <tr>
                                            <th>
                                                <div class="txt-l">이메일</div>
                                            </th>
                                            <td><input type="text" maxlength="20" class="MS_input_txt box" name="mail0"
                                                       value="${email0}"><span> @</span>
                                                <input type="text" id="mailbox" class="box" value="${email1}"
                                                       name="mail1"
                                                       style="margin-top: 3px; display: inline-block;" readonly>
                                                <select id="emailsel" class="MS_email" onchange="selectEmail(this);"
                                                        readonly>
                                                    <option value="naver.com">naver.com</option>
                                                    <option value="gmail.com">gmail.com</option>
                                                    <option value="hotmail.com">hotmail.com</option>
                                                    <option value="nate.com">nate.com</option>
                                                    <option value="direct" id="direct">직접입력</option>
                                                </select>
                                                <input type="hidden" name="mail" value="${email0}@${email1}">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                                <div class="txt-l">주소</div>
                                            </th>
                                            <td>
                                                <input type="text" id="post_code" placeholder="우편번호"
                                                       value="${user.mem_zipcode}"><br>
                                                <input type="text" id="address1" placeholder="주소"
                                                       value="${user.mem_address1}"
                                                       style="width: 400px"><br>
                                                <input type="text" id="address2" placeholder="상세주소"
                                                       value="${user.mem_address2}"
                                                       style="width: 400px">
                                                <input type="hidden" name="address"
                                                       value="${user.mem_address1} ${user.mem_address2}">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                                <div class="txt-l">연락처</div>
                                            </th>
                                            <td>
                                                <input type="text" placeholder="연락처" id="hp" name="hp"
                                                       value="${user.mem_hp}">
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </c:forEach>
                            </div>
                            <h3 class="tit-cart2" id="delivery_txt">배송정보
                                <%--                        체크시 배송정보 이름, 연락처 항목에 값 세팅--%>
                                <label><input type="checkbox" id="copybox" onclick="copyBox();"> 위 정보와 같음</label>
                            </h3>
                            <div class="table-order">
                                <table>
                                    <caption>배송 정보 입력</caption>
                                    <colgroup>
                                        <col style="width: 150px;">
                                        <col>
                                        <col style="width: 150px;">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th>
                                            <div class="txt-l">이름</div>
                                        </th>
                                        <td colspan="3"><input type="text" class="box" id="deliver_name" name="name"
                                                               value="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div class="txt-l">연락처</div>
                                        </th>
                                        <td>
                                            <input type="text" placeholder="연락처" name="hp" id="input_hp">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div class="txt-l">주소</div>
                                        </th>
                                        <td colspan="3">
                                            <input type="text" name="post_code" id="sample6_postcode"
                                                   placeholder="우편번호">
                                            <input type="button" onclick="sample6_execDaumPostcode()"
                                                   value="우편번호 찾기"><br>
                                            <input type="text" name="add1" id="sample6_address" placeholder="주소"
                                                   style="width: 400px"><br>
                                            <input type="text" name="add2" id="sample6_detailAddress" placeholder="상세주소"
                                                   style="width: 400px">
                                            <input type="text" id="sample6_extraAddress" placeholder="참고항목">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div class="txt-l">무통장 입금자명</div>
                                        </th>
                                        <td colspan="3">
                                            <input type="text" name="bankname" size="10" maxlength="40"
                                                   class="MS_input_txt">
                                            <span>(주문자와 같을경우 생략가능)</span>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                    </div>
                    <h3>결제정보</h3>
                    <div class="table-order">
                        <table>
                            <caption>결제정보</caption>
                            <colgroup>
                                <col style="width: 150px;">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th>
                                    <div class="txt-l">결제방법</div>
                                </th>
                                <td>
                                    <ul>
                                        <li>
                                            <label><input type="radio" class="chk-rdo" name="pay" value="카드"
                                                          checked><span>신용카드</span></label>
                                        </li>
                                        <li>
                                            <label><input type="radio" class="chk-rdo" name="pay"
                                                          value="cash"><span>무통장 입금</span></label>
                                            <select name="pay-data" id="pay-data"
                                                    class="w280 MK_bank_select_list MK_pay_add_choice">
                                                <option value="국민은행 : 10005655005031 (예금주: 한달짜리)">국민은행 : 10005655005031
                                                    (예금주: 한달짜리)
                                                </option>
                                                <option value="하나은행 : 10005655005031 (예금주: 한달짜리)">하나은행 : 10005655005031
                                                    (예금주: 한달짜리)
                                                </option>
                                                <option value="기업은행 : 10005655005031 (예금주: 한달짜리)">기업은행 : 10005655005031
                                                    (예금주: 한달짜리)
                                                </option>
                                            </select>
                                            <input type="hidden" name="payType" id="payType" value="">
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <h3>주문자 동의</h3>
                    <div class="table-order">
                        <table>
                            <caption>주문자 동의</caption>
                            <colgroup>
                                <col style="width: 150px;">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <td colspan="2">
                                    <label class="label">
                                        <input type="checkbox" id="pay_agree">
                                        <span> 상기 결제정보를 확인하였으며, 구매진행에 동의합니다.</span>
                                    </label>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="table-order tot-order">
                        <table>
                            <colgroup>
                                <col style="width: 150px;">
                                <col>
                            </colgroup>
                            <thead>
                            <tr>
                                <th>
                                    <div>최종 결제금액</div>
                                </th>
                                <td>
                                    <strong class="price">
                                        <em>
                                            <c:choose>
                                                <c:when test="${total > 50000}">
                                                         <span id="last_price_view">
                                                        <fmt:formatNumber value='${total}'/>
                                                             <c:set var = "total" value = "${total}" />
                                                         </span>
                                                </c:when>
                                                <c:otherwise>
                                                         <span id="last_price_view">
                                                        <fmt:formatNumber value='${total+2500}'/>
                                                               <c:set var = "total" value = "${total+2500}" />
                                                         </span>
                                                </c:otherwise>
                                            </c:choose>
                                            <input type="hidden" name="price" id="last_price" value="${total}">
                                        </em>
                                        <span>원</span>
                                    </strong>
                                    <c:choose>
                                        <c:when test="${total > 50000}">
                                            <span>&nbsp;&nbsp;&nbsp;(배송비 무료)</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span>&nbsp;&nbsp;&nbsp;(배송비 2,500원 포함)</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="paybutton">
                        <input type="button" class="CSSbuttonLog" onclick="checkNull()" value="주문하기">
                        <button class="CSSbuttonLogW">주문취소</button>
                    </div>
                    </form>
                </fieldset>
            </div>
        </div>
    </div>
</div>
<script src="/js/orderList.js"></script>
</body>
<footer>
    <%@include file="./user_footer.jsp" %>
</footer>
</html>