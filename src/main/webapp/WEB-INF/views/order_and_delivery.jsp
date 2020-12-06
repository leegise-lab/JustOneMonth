<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="./admin_head.jsp" %>
<%@ include file="./admin_check.jsp"%>
<html>
<head>
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="css/order_and_delivery.css?ver=1">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="box">
    <%--    검색박스 부분--%>
    <div class="search_box">
        <table class="no_margin" width="1000" height="100" align="center">
            <tr class="color_lightgray">
                <td width="200" class="color_gray">기간 선택</td>
                <td colspan="3"><input type="date" id="startDate"> ~ <input type="date" id="endDate"></td>
            </tr>
            <tr class="color_lightgray">
                <td class="color_gray">처리 단계</td>
                <td width="250">
                    <select name="delivery_status" id="delivery_status">
                        <option value="0">배송대기(발송 준비)</option>
                        <option value="1">배송중</option>
                    </select>
                </td>
                <td>검색어</td>
                <td>
                    <select name="delivery_status" id="search_category">
                        <option value="상품명">상품명</option>
                        <option value="주문 번호">주문 번호</option>
                        <option value="구매자 ID">구매자 ID</option>
                        <option value="구매자 성명">구매자 성명</option>
                    </select>
                    <%--   action에 데이터 처리할 페이지 추가  --%>
                    <input id="search" type="text">
                    <input type="button" value="검색" id="search_btn">
                </td>
            </tr>
        </table>
    </div>
    <%--  검색 조회 부분--%>
    <div class="order_lookup">
        <div class="box2">
            <div style="float: right">
            </div>
            <div class="float_left" style="margin-top: 10px">
                <div class="tap" style="width: 120px;">주문일자</div>
                <div class="tap" style="width: 120px;">아이디</div>
                <div class="tap" style="width: 350px;">상품명</div>
                <div class="tap" style="width: 120px;">총 결제 금액</div>
                <div class="tap" style="width: 130px;">배송현황</div>
                <div class="tap" style="width: 130px;">결제상태</div>
            </div>
        </div>
        <div id="listArea">
            <%--        검색 결과 출력부분     --%>
            <div class="box2">
                <c:forEach items="${buyInfo}" var="buy" varStatus="orderIdx">
                    <div class="float_left" style="background-color: darkgray">
                        <div class="view_list" style="width: 120px;">
                            <input type="checkbox" value="${buy.orderInfo.orderNum}" name="orderNum">
                            <fmt:formatDate value="${buy.orderInfo.date}" pattern="yyyy-MM-dd"/>
                        </div>
                        <div class="view_list" style="width: 120px;">${buy.orderInfo.orderId}</div>
                        <div class="view_list" style="width: 350px;">${buy.orderInfo.productName}</div>
                        <div class="view_list" style="width: 120px;">${buy.orderInfo.price}</div>
                        <div class="view_list" style="width: 130px;">
                            <c:if test="${buy.orderInfo.deliveryFinish eq '0'}">
                                배송 준비
                            </c:if>
                            <c:if test="${buy.orderInfo.deliveryFinish eq '1'}">
                                배송중
                            </c:if>
                        </div>
                        <div class="view_list" style="width: 130px; text-align: right">
                            <c:if test="${buy.orderInfo.payFinish eq '0'}">
                                결제 대기
                            </c:if>
                            <c:if test="${buy.orderInfo.payFinish eq '1'}">
                                결제 완료
                            </c:if>
                        </div>
                    </div>
                    <div style="width: 100%; text-align: center;">
                        <c:forEach items="${buy.buyInfo}" var="cart" varStatus="idx">
                            ${cart.cartProductName}1
                            ${cart.cartAmount}
                            ${cart.cartProductPrice}
                            ${cart.cartColor}
                            ${cart.cartSize}
                        </c:forEach>
                    </div>
                </c:forEach>
            </div>
            <c:forEach var="item" begin="1" end="${pageNums}" step="1" varStatus="status">
                <a name="pageNum" style="cursor: pointer" data-page="${item}"><span
                        class="font_orange2">[${item}]</span></a>
            </c:forEach>
            <input type="button" value="삭제" id="delete_btn">
            <input type="button" value="결제 완료 처리" id="pay_btn">
            <input type="button" value="배송 중 처리" id="delivery_btn">
        </div>
    </div>
</div>
</div>
<script>
    $('a[name=pageNum]').click(function () {
        let pageNum = $(this).data("page")
        let pagePerCnt = ${pagePerCnt};
        let start = (pageNum - 1) * pagePerCnt;
        $.ajax({
            url: "/orderSearchListAjax",
            data: {
                "search": $('#search').val(),
                "searchCategory": $('#search_category').val(),
                "startDate": $("#startDate").val(),
                "endDate": $("#endDate").val(),
                "start": start,
                "pagePerCnt": pagePerCnt,
                "pageNum": pageNum,
                "delivery": $('#delivery_status').val(),
            },
            success: function (data) {
                $("#listArea").html(data);
            }
        });
    })


    //검색버튼 클릭부분
    $('#search_btn').click(function () {
        let start = ${start};
        let pagePerCnt = ${pagePerCnt};
        $.ajax({
            url: "/orderSearchListAjax",
            data: {
                "search": $('#search').val(),
                "searchCategory": $('#search_category').val(),
                "startDate": $("#startDate").val(),
                "endDate": $("#endDate").val(),
                "start": start,
                "pagePerCnt": pagePerCnt,
                "delivery": $('#delivery_status').val(),
            },
            success: function (data) {
                $("#listArea").html(data);
            }
        });
    })
    //삭제버튼 클릭부분
    $('#delete_btn').click(function () {
        let start = ${start};
        let pagePerCnt = ${pagePerCnt};
        let orderNumList = [];
        //체크박스 배열 가져오기
        $("input[name=orderNum]:checked").each(function (idx) {
            // 해당 체크박스의 Value 가져오기
            orderNumList.push($(this).val());
        });
        $.ajax({
            url: "/orderSearchListAjax",
            traditional: true,
            data: {
                "search": $('#search').val(),
                "searchCategory": $('#search_category').val(),
                "startDate": $("#startDate").val(),
                "endDate": $("#endDate").val(),
                "delivery": $('#delivery_status').val(),
                "start": start,
                "pagePerCnt": pagePerCnt,
                "orderNumList": orderNumList
            },
            success: function (data) {
                alert("삭제 처리가 완료되었습니다.");
                $("#listArea").html(data);
            }
        });
    });
    //결제완료 버튼 클릭부분
    $('#pay_btn').click(function () {
        let orderNumList = [];
        //체크박스 배열 가져오기
        $("input[name=orderNum]:checked").each(function (idx) {
            // 해당 체크박스의 Value 가져오기
            orderNumList.push($(this).val());
        });
        $.ajax({
            url: "/orderSearchListAjax",
            traditional: true,
            data: {
                "search": $('#search').val(),
                "searchCategory": $('#search_category').val(),
                "startDate": $("#startDate").val(),
                "endDate": $("#endDate").val(),
                "delivery": $('#delivery_status').val(),
                "updatePayList": orderNumList
            },
            success: function (data) {
                alert("결제 처리가 완료되었습니다.");
                $("#listArea").html(data);
            }
        });
    });
    //배송 처리 버튼 클릭부분
    $('#delivery_btn').click(function () {
        let orderNumList = [];
        //체크박스 배열 가져오기
        $("input[name=orderNum]:checked").each(function (idx) {
            // 해당 체크박스의 Value 가져오기
            orderNumList.push($(this).val());
        });
        $.ajax({
            url: "/orderSearchListAjax",
            traditional: true,
            data: {
                "search": $('#search').val(),
                "searchCategory": $('#search_category').val(),
                "startDate": $("#startDate").val(),
                "endDate": $("#endDate").val(),
                "delivery": $('#delivery_status').val(),
                "updateDeliveryList": orderNumList
            },
            success: function (data) {
                alert("배송 처리가 완료되었습니다.");
                $("#listArea").html(data);
            }
        });
    });
</script>
</body>
</html>