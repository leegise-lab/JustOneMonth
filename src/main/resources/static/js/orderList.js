'use strict'
/*
//최종금액 반영하는 부분
let prices = document.getElementsByName('cart_price').values();
let price = prices[Symbol.iterator]();
let lastPrice = 0;

for (let letter of price) {
    lastPrice += parseInt(letter.value);
    console.log(letter.value);
}
document.getElementById('last_price_view').textContent = lastPrice;
document.getElementById('last_price').value = lastPrice;
*/


//이메일 셀렉트박스 구현부분
function selectEmail(selected) {
    //이메일 선택 박스 아이디 = emailsel
    let select = selected.value;
    let mailBox = document.getElementById('mailbox');
    mailBox.value = select;
    if (select === 'direct') {
        mailBox.value = "";
        mailBox.readOnly = false;
    }
}

//위 정보와 같음 체크박스 클릭 부분
function copyBox() {
    let checkbox = document.getElementById('copybox').checked;
    let name, Hp, inputHp, post_code, add1, add2;
    name = document.getElementById('order_name').textContent;
    Hp = document.getElementById('hp').value;
    post_code = document.getElementById('post_code').value;
    add1 = document.getElementById('address1').value;
    add2 = document.getElementById('address2').value;

    if (checkbox) {
        document.getElementById('deliver_name').value = name;
        document.getElementById('input_hp').value = Hp;
        document.getElementById('sample6_postcode').value = post_code;
        document.getElementById('sample6_address').value = add1;
        document.getElementById('sample6_detailAddress').value = add2;
    }
    //체크박스 초기화
    else if (!checkbox) {
        document.getElementById('deliver_name').value = "";
        document.getElementById('input_hp').value = "";
        document.getElementById('sample6_postcode').value = "";
        document.getElementById('sample6_address').value = "";
        document.getElementById('sample6_detailAddress').value = "";
        document.getElementById('sample6_extraAddress').value = "";
    }
}


//다음 우편번호 API
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if (data.userSelectedType === 'R') {
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraAddr !== '') {
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;

            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
    console.log("우편 api 실행완료");
}

//빈 칸 체크
function checkNull() {
    let deliver_name = document.getElementById('deliver_name').value;
    let hp = document.getElementById('input_hp').value;
    let post_code = document.getElementById('sample6_postcode').value;
    let add1 = document.getElementById('sample6_address').value;
    let add2 = document.getElementById('sample6_detailAddress').value;

    let checked = $("input:checkbox[id=pay_agree]").is(":checked");
    let pay = $("input:radio[name=pay]:checked").val();

    let payType = "카드";
    if (deliver_name === "" || hp === "" || post_code === "" || add1 === "" || add2 === "") {
        alert("작성되지 않은 칸이 있습니다.");
        return false;
        //결제를 카드로 진행하면 api 창 띄워주기
    } else if (checked === false) {
        alert('주문자 동의에 체크를 해주세요');
        document.getElementById('pay_agree').focus();
        return false;
    } else if (deliver_name !== "" && hp !== "" && post_code !== "" && add1 !== "" && add2 !== "") {
        if (pay === payType) {
            goPay();
        } else if (pay !== payType) {
            goFinishPage();
        }
    }
}

//카드결제 팝업창 띄우는 부분
function goPay() {
    let form = document.getElementById('frm');
    window.open('', 'result', 'width=850px,height=650px,toolbars=no,scrollbars=no');
    form.action = "pay";
    form.target = "result";
    form.submit();
}

//무통장입금 페이지로 이동하는 부분
function goFinishPage() {
    let payType = document.getElementById('pay-data').value;
    document.getElementById('payType').value = payType;
    let form = document.getElementById('frm');
    form.action = "orderFinish";
    form.submit();
}