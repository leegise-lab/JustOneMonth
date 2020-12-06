<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="./userCheck.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>저스트원: 주문내역</title>
    <%@include file="./user_header.jsp" %>
    <link rel="stylesheet" href="./css/orderdetail.css?ver=1">
</head>
<body>
<div class="content-orderDetail">
    <div id="orderDetail">
        <h2 class="tit-page">주문상세내역</h2>
        <div id="orderSt">
            <ul class="tab" style="display: none;">
                <li class="sel">
                    <a href="">주문상세조회</a>
                </li>
                <li></li>
                <li>
                    <a href="">상품후기등록</a>
                </li>
            </ul>
            <div id="orderInfo">
                <h3 class="tit-page-sub">주문자정보</h3>
                <div class="table-w table-order-info">
                    <table>
                        <colgroup>
                            <col width="160">
                            <col width="*">
                            <col width="160">
                            <col width="*">
                        </colgroup>
                        <tbody>
                        <tr>
                            <c:forEach items="${orderList}" var="orderList">
                            <th>
                                <div class="tb-center">주문번호</div>
                            </th>
                            <td>
                                <div class="tb-left">${orderList.orderNum}</div>
                            </td>
                            <th style="border-left: 1px solid #dedede;">
                                <div class="tb-center">주문일자</div>
                            </th>
                            <td>
                                <div class="tb-left">
                                    <fmt:formatDate value="${orderList.date}" pattern="yyyy-MM-dd"/>
                                        <%--                                    ${orderList.date}--%>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <div class="tb-center">주문자</div>
                            </th>
                            <td>
                                <div class="tb-left">${orderList.orderName}</div>
                            </td>
                            <th style="border-left: 1px solid #dedede;">
                                <div class="tb-center">입금현황</div>
                            </th>
                            <td>
                                <div class="tb-left">
                                    <c:if test="${orderList.payFinish eq '0'}">
                                        입금대기
                                    </c:if>
                                    <c:if test="${orderList.payFinish eq '1'}">
                                        결제완료
                                    </c:if>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <h3 class="tit-page-sub">배송지정보</h3>
                <div class="table-w table-region">
                    <table>
                        <colgroup>
                            <col width="160">
                            <col width="*">
                            <col width="160">
                            <col width="*">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>
                                <div class="tb-center">배송번호</div>
                            </th>
                            <td>
                                <div class="tb-left">${orderList.orderNum}</div>
                            </td>
                            <th style="border-left: 1px solid #dedede;">
                                <div class="tb-center">송장번호</div>
                            </th>
                            <td>
                                <div class="tb-left">${orderList.orderNum}</div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <div class="tb-center">수취인</div>
                            </th>
                            <td>
                                <div class="tb-left">${orderList.orderName}</div>
                            </td>
                            <th style="border-left: 1px solid #dedede;">
                                <div class="tb-center">연락처</div>
                            </th>
                            <td>
                                <div class="tb-left">${orderList.hp}</div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <div class="tb-center">주소</div>
                            </th>
                            <td colspan="3">
                                <div class="tb-left">${orderList.address}</div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <h3 class="tit-page-sub">주문상품정보</h3>
                <div class="table-w table-prdinfo">
                    <table>
                        <colgroup>
                            <col width="60">
                            <col width="80">
                            <col width="*">
                            <col width="130">
                            <col width="80">
                            <col width="80">
                            <col width="110">
                            <col width="110">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>
                                <div class="tb-right"><input type="checkbox" name="" id="" style="display:none">
                                </div>
                            </th>
                            <th colspan="2">
                                <div class="tb-center">주문상품정보</div>
                            </th>
                            <th>
                                <div class="tb-center">상품별주문번호</div>
                            </th>
                            <th>
                                <div class="tb-center">수량</div>
                            </th>
                            <th>
                                <div class="tb-center">가격</div>
                            </th>
                            <th>
                                <div class="tb-center">처리상태</div>
                            </th>
                            <th style="border-right:none">
                                <div class="tb-center">배송번호</div>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${itemList}">
                            <tr>
                                <td style="border-left: none;">
                                    <div class="tb-center"></div>
                                </td>
                                <td>
                                    <div class="tb-center"><img src="${item.cartImg}" alt="옷사진"
                                                                style="width: 58px; height: 58px;">
                                    </div>
                                </td>
                                <td>
                                    <div class="mb-10">
                                        <a href="" style="font-weight: 700;">${item.cartProductName}~<br></a>
                                        <span class="quantity order_table_Td style4"
                                              style="color:#999">[옵션] 색상: ${item.cartColor}, 사이즈 : ${item.cartSize}</span>
                                    </div>
                                    <div class="chkTradeLinkArea">
                                        <!-- 취소/반품/교환 버튼 -->
                                    </div>
                                </td>
                                <td>
                                    <div class="tb-center">${item.cartOrderNum}</div>
                                </td>
                                <td>
                                        <%--                                        주문 수량--%>
                                    <div class="tb-center"><input type="hidden">
                                        <p>${item.cartAmount}</p>
                                    </div>
                                </td>
                                <td>
                                    <div class="tb-center tb-price"><strong>
                                        <fmt:formatNumber value="${item.cartProductPrice}"/></strong>원</div>
                                </td>
                                <td>
                                    <div class="tb-center">
                                        <c:if test="${orderList.payFinish eq '0'}">
                                            결제대기
                                        </c:if>
                                        <c:if test="${orderList.payFinish eq '1'}">
                                            결제완료
                                        </c:if>
                                    </div>
                                </td>
                                <td>
                                    <div class="tb-center">${item.cartOrderNum}</div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                        <tfoot>
                        <td colspan="8" style="border-left: none;">
                            <div class="tb-right">
                                <fmt:formatNumber value='${orderList.price}'/>(상품구매금액 + 배송비포함) = <fmt:formatNumber value='${orderList.price}'/>원
                            </div>
                        </td>
                        </tfoot>
                    </table>
                </div>
                <h3 class="tit-page-sub">결제정보</h3>
                <div class="table-w table-payinfo">
                    <table>
                        <colgroup>
                            <col width="180">
                            <col width="360">
                            <col width="*">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>
                                <div class="tb-center">결제방법</div>
                            </th>
                            <th>
                                <div class="tb-center">결제금액</div>
                            </th>
                            <th style="border-right: none;">
                                <div class="tb-center">세부내역</div>
                            </th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <td style="border-left: none;">
                                <div class="tb-center">
                                    <c:choose>
                                        <c:when test="${orderList.payType eq '카드'}">
                                            카드 결제
                                        </c:when>
                                        <c:otherwise>
                                            무통장 입금
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </td>
                            <td>
                                <div class="tb-center">${orderList.price}</div>
                            </td>
                            <td>
                                <div class="tb-center">${orderList.payType} <span
                                        id="bankname_banker">${orderList.orderName}</span></div>
                            </td>
                        </tr>
                        </tfoot>
                    </table>
                    </c:forEach>
                </div>
                <div class="pop_order_btn_group">
                    <button class="CSSbuttonB"><a href="orderLookUp">목록</a></button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<footer>
    <%@include file="./user_footer.jsp" %>
</footer>
</html>