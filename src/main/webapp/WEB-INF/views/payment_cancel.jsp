<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>저스트원 관리자</title>
    <%@ include file="./admin_head.jsp" %>
    <%@ include file="./admin_check.jsp"%>
    <link rel="stylesheet" href="css/payment_cancel.css">
</head>
<body>
<div class="box">
    <%--    상단 취소, 교환, 환불 박스 부분--%>
    <div class="cancel_cnt">
        <div class="box_1">
            <div class="img_frame"><img class="img" src="images/X.JPG">
                <%--        이미지 링크삽입할 것--%>
            </div>
            <div class="box_2">취소
                <%--                db에서 불러온 취소 개수는 b태그에 삽입--%>
                <div><b>0</b></div>
            </div>
        </div>
    </div>
    <div class="cancel_cnt">
        <div class="box_1">
            <div class="img_frame"><img class="img" src="images/change.JPG">
                <%--        이미지 링크삽입할 것--%>
            </div>
            <div class="box_2">교환
                <%--db에서 불러온 교환 개수는 b태그에 삽입--%>
                <div><b>0</b></div>
            </div>
        </div>
    </div>
    <div class="cancel_cnt" style="border-right: 1px solid black">
        <div class="box_1">
            <div class="img_frame"><img class="img" src="images/return.JPG">
                <%--        이미지 링크삽입할 것--%>
            </div>
            <div class="box_2">반품
                <%--                db에서 불러온 반품 개수는 b태그에 삽입--%>
                <div><b>0</b></div>
            </div>
        </div>
    </div>
    <%--    검색어 박스 부분--%>
        <table width="1000" height="100" align="center" style="margin-top: 70px">
            <tr>
                <td width="50" class="color_gray">검색어</td>
                <td colspan="3"><select name="delivery_status">
                    <option value="상품명">상품명</option>
                    <option value="주문 번호">주문 번호</option>
                    <option value="구매자 ID">구매자 ID</option>
                    <option value="구매자 성명">구매자 성명</option>
                </select></td>
            </tr>
            <tr>
                <td class="color_gray">기간</td>
                <td><input type="date">~<input type="date"></td>
            </tr>
            <tr>
                <td class="color_gray">주문 상태</td>
                <td>
                    <input class="check-box" type="checkbox"> 전체
                    <input class="check-box" type="checkbox"> 취소 신청
                    <input class="check-box" type="checkbox"> 취소 완료
                    <input class="check-box" type="checkbox"> 입금 전 취소
                </td>
            </tr>
        </table>
    <%--    검색, 초기화 버튼 --%>
    <div class="search_initialization">
        <div style="margin: 0 auto; width: 200px; height: 50px">
            <input type="button" class="search_btn" id="search_btn" value="검색">
            <input type="button" class="initial_btn" id="initial_btn" value="초기화">
            <script>
                let searchBtn = document.getElementById('search_btn');
                let initialBtn = document.getElementById('initial_btn');

                searchBtn.onclick = function() {
                    alert("검버클");
                };
                initialBtn.onclick = function() {
                    alert("초버클");
                };
            </script>
        </div>
    </div>
    <p style="color: darkgray">[검색 결과<a style="color: red">
        <b>0</b></a>건]</p>
    <%--        검색 결과 테이블 부분--%>
    <table width="1000" align="center" style="font-size: small; text-align: center">
        <tr style="background-color: lightgray">
            <td width="80"><b>취소신청일(취소접수일)</b></td>
            <td><b>품목별 주문번호/취소번호</b></td>
            <td><b>주문자</b></td>
            <td width="200"><b>상품명/옵션</b></td>
            <td width="50"><b>수량</b></td>
            <td><b>취소 금액</b></td>
            <td><b>결제 수단</b></td>
            <td><b>주문 상태</b></td>
            <td><b>취소처리</b></td>
            <td><b>메모</b></td>
        </tr>
        <%--        검색결과 부분 값은 b태그에 넣어주기 --%>
        <tr height="30">
            <td width="80"><b>2020-10-21</b></td>
            <td><b>20201021191718</b></td>
            <td><b>order_id</b></td>
            <td width="200"><b>겨울패딩 어쩌고저쩌고 가나다라마바사</b></td>
            <td width="50"><b>1</b></td>
            <td><b>999,000</b></td>
            <td><b>카드</b></td>
            <td><b>주문 상태</b></td>
            <td><b>취소처리</b></td>
            <td><b></b></td>
        </tr>
    </table>
</div>
<footer>
    <%@include file="./user_footer.jsp" %>
</footer>
</body>
</html>
