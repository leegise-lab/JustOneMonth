<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>저스트원 결제창</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
    <script>
        IMP.init('imp90010320');  // 가맹점 식별 코드
        /*
        IMP.request_pay를 호출하기 전에 여러분의 (데이터베이스에 주문정보를 INSERT 하고
        서버가 생성한 주문 번호를 param의 merchant_uid속성에 지정하기를 권장드립니다.
        결제 완료 후 결제 위변조 여부를 검증하는 단계에서 신뢰도있는 검증을 위해
        여러분의 서버에서 주문정보를 조회해야 하기 때문입니다.
        */
        IMP.request_pay({
            pg: 'inicis', // 결제방식
            pay_method: 'card',	// 결제 수단
            merchant_uid: new Date().getDate() + new Date().getTime(),  // 주문번호
            name: '${orderInfo.productName}',	// 상품 명
            amount: '${orderInfo.price}',	// 결제 금액
            buyer_email: '${orderInfo.mail}',	// 구매자 email
            buyer_name: '${orderInfo.name}',	// 구매자 이름
            buyer_tel: '${orderInfo.hp}',	// 구매자 전화번호
            buyer_addr: '${orderInfo.address}',	// 구매자 주소
            buyer_postcode: '${orderInfo.post_code}', 	// 구매자 우편번호
            m_redirect_url: '/khx/payEnd.action'	// 결제 완료 후 보낼 컨트롤러의 메소드명
        }, function (rsp) {
            // 결제 성공시 로직
            if (rsp.success) {
                let msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '주문 번호 :' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                //자바스크립트에서 폼 생성(결제창이 iframe이라 html에서의 폼은 연결이 안됨)
                let form = document.createElement("form");
                form.setAttribute("charset", "UTF-8");
                form.setAttribute("method", "post");  //Post 방식
                form.setAttribute("action", "/orderFinish"); //요청 보낼 주소
                //구매자 이름 정보
                let hiddenField = document.createElement("input");
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("name", "name");
                hiddenField.setAttribute("value", rsp.buyer_name);
                form.appendChild(hiddenField);
                //구매자 이메일
                hiddenField = document.createElement("input");
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("name", "mail");
                hiddenField.setAttribute("value", rsp.buyer_email);
                form.appendChild(hiddenField);
                //구매자 결제 형태
                hiddenField = document.createElement("input");
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("name", "payType");
                hiddenField.setAttribute("value", '${orderInfo.payType}');
                form.appendChild(hiddenField);
                //결제 상품
                hiddenField = document.createElement("input");
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("name", "productName");
                hiddenField.setAttribute("value", rsp.name);
                form.appendChild(hiddenField);
                //가격
                hiddenField = document.createElement("input");
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("name", "price");
                hiddenField.setAttribute("value", rsp.paid_amount);
                form.appendChild(hiddenField);
                //결제 여부
                hiddenField = document.createElement("input");
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("name", "payFinish");
                hiddenField.setAttribute("value", 1);
                form.appendChild(hiddenField);
                //구매자 연락처
                hiddenField = document.createElement("input");
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("name", "hp");
                hiddenField.setAttribute("value", rsp.buyer_tel);
                form.appendChild(hiddenField);
                //구매자 주소
                hiddenField = document.createElement("input");
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("name", "address");
                hiddenField.setAttribute("value", rsp.buyer_addr);
                form.appendChild(hiddenField);
                //주문번호
                hiddenField = document.createElement("input");
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("name", "orderNum");
                hiddenField.setAttribute("value", rsp.merchant_uid);
                form.appendChild(hiddenField);
                //송장번호
                hiddenField = document.createElement("input");
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("name", "deliveryNum");
                hiddenField.setAttribute("value", rsp.merchant_uid);
                form.appendChild(hiddenField);
                //폼 전송하고 창닫기
                opener.document.body.appendChild(form);
                form.submit();
                window.close();
                // 결제 실패시 로직
            } else {
                let msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                window.close();
            }
        });
    </script>
</head>
<body>
<%--<form name="form" method="post">--%>
<%--    <input type="hidden" value="${orderInfo.productName}" name="productName">--%>
<%--    <input type="hidden" value="${orderInfo.price}" name="price">--%>
<%--    <input type="hidden" value="${orderInfo.mail}" name="mail">--%>
<%--    <input type="hidden" value="${orderInfo.name}" name="name">--%>
<%--    <input type="hidden" value="${orderInfo.hp}" name="hp">--%>
<%--    <input type="hidden" value="${orderInfo.address}" name="address">--%>
<%--    <input type="hidden" value="${orderInfo.post_code}" name="post_code">--%>
<%--</form>--%>
</body>
</html>