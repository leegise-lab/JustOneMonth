<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>저스트원: 주문완료</title>
    <link rel="stylesheet" href="./css/ordercomplete.css">
    <%--    헤드 파일 적용--%>
    <%@ include file="./user_header.jsp" %>
    <script src="./jquery-3.5.1.min.js"></script>
    <script>
        /*
        * 구현할 스크립트
        * 2. 목록 클릭이벤트 처리
        * */
    </script>
</head>
<body>
<div id="contentWrap-order">
    <div id="content-order">
        <div id="ordercomplete">
            <div class="page-body">
                <h3 class="stit">주문 상세 내역</h3>
                <div class="table-cart">
                    <table>
                        <colgroup>
                            <col width="150">
                            <col width="*">
                            <col width="110">
                            <col width="110">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>
                                <div class="tb-center">사진</div>
                            </th>
                            <th>
                                <div class="tb-center">상품명</div>
                            </th>
                            <th>
                                <div class="tb-center">수량</div>
                            </th>
                            <th>
                                <div class="tb-center">가격</div>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${buyType==1}">
                                <c:forEach var="item" items="${cartList}" varStatus="status">
                                    <tr>
                                        <td>
                                            <div class="tb-center"><span
                                                    style="display: inline-block; width: 70px; height: 70px;">
                                                <img src="${item.cartImg}">
                                            </span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="tb-left"><a href="">${item.cartProductName}</a></div>
                                        </td>
                                        <td>
                                            <div class="tb-center">${item.cartAmount}</div>
                                        </td>
                                        <td>
                                            <div class="tb-center tb-bold">
                                                <fmt:formatNumber value="${item.cartProductPrice}"/>원
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <div class="tb-left" id="option">색상 : ${item.cartColor}
                                                사이즈: ${item.cartSize}</div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:when test="${buyType==0}">
                                <c:set var="item" value="${cartList}"></c:set>
                                <tr>
                                    <td>
                                        <div class="tb-center"><span
                                                style="display: inline-block; width: 70px; height: 70px;">
                                                <img src="${item.cartImg}"></span>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="tb-left"><a href="">${item.cartProductName}</a></div>
                                    </td>
                                    <td>
                                        <div class="tb-center">${item.cartAmount}</div>
                                    </td>
                                    <td>
                                        <div class="tb-center tb-bold">${item.cartProductPrice}</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <div class="tb-left" id="option">색상 : ${item.cartColor}
                                            사이즈: ${item.cartSize}</div>
                                    </td>
                                </tr>
                            </c:when>
                        </c:choose>
                        </tbody>
                        <tfoot>
                        <tr>
                            <td colspan="4">
                                <div class="tb-right">총 상품금액 : <fmt:formatNumber value="${payInfo.price}"/>원
                                    <c:choose>
                                        <c:when test="${payInfo.price > 50000}">
                                            (배송비 무료)
                                        </c:when>
                                        <c:otherwise>
                                            (배송비 2,500원 포함)
                                        </c:otherwise>
                                    </c:choose>
                                    = <strong
                                            id="order_price"><fmt:formatNumber value="${payInfo.price}"/></strong>원
                                </div>
                            </td>
                        </tr>
                        </tfoot>
                    </table>
                </div>
                <h3 class="stit">결제방법</h3>
                <div>
                    <table class="table-ordercomplete-info">
                        <colgroup>
                            <col width="170">
                            <col width="*">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>
                                <div class="tb-left">결제방법</div>
                            </th>
                            <td>
                                <div class="tb-left">
                                    <p><span
                                            class="pay_method">${payInfo.payType}</span>
                                        <span class="pay_info">&nbsp;(무통장입금의 경우 입금확인 후 배송 됩니다.)</span></p>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <h3 class="stit">배송지 정보</h3>
                <div>
                    <table class="table-ordercomplete-info">
                        <colgroup>
                            <col width="170">
                            <col width="*">
                        </colgroup>
                        <tbody>
                        <tr class="nbg">
                            <th>
                                <div class="tb-left">이름</div>
                            </th>
                            <td>
                                <div class="tb-left" id="finish_name">${payInfo.name}</div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <div class="tb-left">연락처</div>
                            </th>
                            <td>
                                <div class="tb-left" id="finish_hp">${payInfo.orderHp}</div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <div class="tb-left">메일</div>
                            </th>
                            <td>
                                <div class="tb-left" id="finish_mail">${payInfo.mail}</div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <div class="tb-left">주소</div>
                            </th>
                            <td>
                                <div class="tb-left" id="finish_address">${payInfo.orderAddress}</div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="admin-msg">
                    <p><label>${payInfo.name}</label>님의 주문이 완료되었습니다.</p>
                    <br>
                    <p>귀하의 주문확인 번호는 <span id="order_num">${payInfo.orderNum}</span>입니다.</p>
                    <p>입금방법이 무통장입금의 경우 계좌번호를 메모하세요.</p>
                    <p>입금 확인 후 상품을 준비하여 배송해 드리겠습니다.</p>
                    <br>
                </div>
                <div class="btn-foot">
                    <a href="./orderLookUp" class="CSSbuttonLog">주문확인</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<footer>
    <%@ include file="./user_footer.jsp" %>
</footer>
<input type="hidden" value="" id="pName">
<input type="hidden" value="" id="price">
<input type="hidden" value="" id="mail">
<input type="hidden" value="" id="name">
<input type="hidden" value="" id="hp">
<input type="hidden" value="" id="address">
<input type="hidden" value="" id="post_code">
<script src="/js/orderFinish.js"></script>
</html>