<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    int j =0;
    String id = (String) session.getAttribute("loginId");
    String name = (String) session.getAttribute("name");
    request.setCharacterEncoding("UTF-8");
    %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/main_1.css">
    <link rel="stylesheet" href="./css/style_1.css">
    <link rel="stylesheet" href="./css/footer.css">
    <link rel="stylesheet" href="./css/best.css">
    <link rel="stylesheet" href="./css/item.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="./jq/jquery-3.5.1.min.js"></script>
    <script src="./jq/bestjq.js"></script>
    <script src="./jq/jq1.js"></script>
    <script src="./jq/item.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <%@include file="./user_header.jsp" %>
</head>
<body onload="init();">
        <main >

            <div class="item-body">
                <div class="item-list ">
                        <form method="post" name="form" action="item_ok"  >
                            <div id="item-pic" class="item1">
                                <c:forEach var="item" items="${list}">
                                <img src="./images/in/${item.up_file1}" alt="">
                                <input type="hidden" name="productImage" value="./images/in/${item.up_file1}">
                            </div>
                            <div id="item-ex" class="item1">
                                <p>${item.up_name}</p>
                                <input hidden name="productName" value="${item.up_name}">
                                <p id="size_1">${item.up_size}</p>
                                <table class="itemtable">
                                    <colgroup>
                                        <col width="70">
                                        <col width="*">
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th><div class="item-left">판매가</div></th>
                                        <td><div class="item-price"><fmt:formatNumber value="${item.up_price}" pattern="#,###" />원</div>
                                            <input type="hidden" name="productPrice" value="${item.up_price}"></td>
                                    </tr>
                                    <tr>
                                        <th><div class="item-left">색상</div></th>
                                        <td>
                                            <div>
                                                <select class="item_option" style="width: 82%;height: 30px;" name="productColor">
                                                    <option value="#">-- 옵션 선택 --</option>
                                                    <c:forEach var="color" items="${up_color}">
                                                        <option value="${color}">${color}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><div class="item-left">사이즈</div></th>
                                        <td>
                                            <div>
                                                <select class="item_option" style="width: 82%;height: 30px;" name="productSize">
                                                    <option value="#">-- 옵션 선택 --</option>
                                                    <c:forEach var="size" items="${up_size}">
                                                        <option value="${size}">${size}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><div class="item-left">수량</div></th>
                                        <td>
                                            <div>
                                                <input type=hidden name="sell_price" value="${item.up_price}">
                                                <input type="text" name="amount" value="1" size="3" onchange="change();" id="num_item" >
                                                <input type="button" value=" + " onclick="add();"class="add_del"><input type="button" value=" - " onclick="del();"class="add_del"><br>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <p id="price">금액 : <em><input type="text" name="sum" id="sum_in" readonly></em>원 </p>


                                <div id="buy">
                                    <input onclick="submit(1)" type="submit" value="장바구니" id="getout" style="border: none;background-color: #FFF5EE">
                                </div>
                                <div id="sh_basket">
                                    <a id="height-adjust" onclick="submit(2)">바로 구매</a>
                                </div>
                            </div>
                        </form>
                    <div class="both"></div>
                    <div class="item_rmc">
                        <div class="item_rmcontrol" id="up_info">
                            <a href=""><span> 상품 상세 정보</span></a>
                        </div>
                        <div class="item_rmcontrol ex">
                            <a href="#ex">상품 후기 (<em>${review_list.size()}</em>)</a>
                        </div>
                    </div>
                </div>
                <div class="item-list main_list">
                    <img src="./images/in/${item.up_file3}" alt=""><br>
                    <img src="./images/in/${item.up_file4}" alt=""><br>
                    <img src="./images/in/${item.up_file5}" alt=""><br>
                    <div class="min_list">
                        <img src="./images/in/${item.up_file6}" alt="">
                    </div>
                    <div class="washing">
                        <img src="./images/in/${item.up_file7}" alt="">
                    </div>
                    <div class="washing">
                            <img src="./images/in/${item.up_file8}" alt="">
                    </div>
                    <div class="washing">
                        <img src="./images/in/${item.up_file9}" alt="">
                    </div>


                    <div></div>
                    <div></div>
                </div>
                <div class="allinfo">
                    <div class="3_info">
                        <div class="info" id="info1">
                            <div class="top_info" id="info121"><p>배송안내 <img src="./images/iconfinder_04-Arrow-direction-pointer-down_4510559.png" alt=""></p></div>
                            
                            <div class="content_info toggled">
                                <p>
                                    배송업체 : CJ대한통운(1588-1255)<br>
                                                    배송지역 : 전국 (해외배송불가)<br>
                                                    배송비용 : 2,500원 / 50,000원 이상 구매시 무료배송<br>
                                                    배송기간 : 2일-7일(지연발생시 1-2주 소요)
                                </p>
                                <p>
                                    - 주문일기준 3일 이상 발송이 지연된 경우 먼저 준비된 상품부터 선발송 해드립니다.<br>
                                    - 부분배송을 원하지 않으시면 게시판이나 고객센터로 연락부탁드립니다.<br>
                                    - 공급처 사정으로 인한 입고지연 및 품절이 발생할 수 있습니다.<br>
                                    - 배송지연 및 품절시 개별연락드리겠습니다.<br>
                                    - 슈즈, 잡화의 경우 물량확보 상황에 따라 일정 변동 및 추가 준비기간이 소요될 수 있습니다.
                                </p>
                            </div>
                        </div>
                        <div class="info" id="info2">
                            <div class="top_info" id="info122">
                                <p>취소&환불안내<img src="./images/iconfinder_04-Arrow-direction-pointer-down_4510559.png" alt=""></p>
                            </div>
                            <div class="content_info toggled">
                                <p >
                                    - 주문결제 후 마이페이지 주문내역에서 취소신청가능합니다.<br>
                                    - <b>[마이페이지 → 주문내역조회→ 주문상세 조회]</b>에서 취소&amp;변경 신청<br>
                                    - 1:1게시판 또는 고객센터(1644-3662)로 연락주셔도 처리가능합니다.<br>
                                    - 배송준비 상태인 경우 취소문의시 처리가능여부 확인후 안내드립니다.<br>
                                    - 송장등록 연동이 지연되어 배송준비상태이더라도 출고된 상품은 취소환불이 어렵습니다.<br> 
                                    - 배송전 변심으로 인한 부분취소시 5만원미만 인 경우 무료배송이 불가하여 초기배송비 2,500원이 차감됩니다.<br>
                                    - 배송중,배송완료 상태에서는 취소&amp;변경이 불가능합니다.<br>
                                    - 무통장주문 취소시 환불정보(은행,계좌번호,예금주)를 기재해주세요.<br>
                                    - 휴대폰소액결제는 부분환불이나 익월취소가 불가능하여 통장으로 환불해드립니다.<br>
                                    - 취소 신청 시, 환불정보(은행,계좌번호,예금주)를 기재해주시거나 1:1게시판 또는 고객센터로 문의바랍니다.
                                </p>
                            </div>
                        </div>
                        <div class="info" id="info3" >
                            <div class="top_info" id="info123"><p>교환&반품안내<img id="down3" src="./images/iconfinder_04-Arrow-direction-pointer-down_4510559.png" alt=""></p></div>
                            <div class="content_info toggled">
                                <p id="#up3">
                                                - 상품 수령 후 7일이내 교환/반품 신청 또는 게시판(Q＆A),고객센터(1644-3662)로 접수부탁드립니다.<br>
                                                - 마이페이지 주문조회 상세에서 교환/반품 신청가능합니다.<br>
                                                - 지정된 택배사 반품을 누르시면 CJ대한통운 으로 회수접수 가능합니다.<br>
                                                - 단순교환 5,000원 / 일부반품 2,500원 / 전체반품 5,000원의 배송비가 부과됩니다.<br>
                                                - 교환은 왕복배송비, 전체반품은 초기배송비가 환불되어 5,000원입니다.<br>
                                                - 무료배송이벤트, 무료배송쿠폰 사용 후 반품시에도 초기배송비가 청구됩니다.<br>
                                                - 타택배 이용고객님은 개별반품을 눌러주시고 타택배 선불로접수 후 반품주소로 보내주세요.<br>
                                                - 타택배 착불 이용 시 고객부담입니다.<br>
                                                - 교환&amp;반품 배송비 <b>입금계좌 : 우리은행 1005-302-421987 / 예금주 (주)제이오진</b>
                                </p>
                                <h4>[교환반품 불가항목]</h4>
                                <p>
                                                반품시일이 지난 경우<br>
                                                소비자에게 책임있는 사유로 재화가 멸실 또는 훼손된 경우<br>
                                                소비자의 사용 또는 소비에 의하여 재화의 가치가 현저히 감소한 경우<br>
                                                시간의 경과에 의하여 재판매가 곤란할 정도로 재화의 가치가 현저히 감소한 경우<br>
                                </p>
                                <h4>[보내시는 곳]</h4>
                                <p>
                                                반품주소 : 경기 구리시 토평동 613-13 대한통운 광진지점 BSub 자양우리대리점저스트원)<br>
                                                타택배시 : 서울 성동구 성수동2가 314-37 아연디지털타워 6층 저스트원<br>
                                                <br>
                                                AS책임자 : 저스트원 1644-3662<br>
                                                품질보증기준 : 관련법 및 소비자분쟁해결기준에 따름
                                </p>
                                </div>
                        </div>
                    </div>
                </div>
                <div class="item-list ">
                    <div class="item_rmc">
                        <div class="item_rmcontrol">
                            <a href="#up_info">상품 상세 정보</a>
                        </div>
                        <div class="item_rmcontrol ex" id="ex">
                            <a href=""><span>상품 후기(<em>${review_list.size()}</em>)</span></a>
                        </div>
                    </div>
                </div>
                <div class="review_cont">
                    <div class="review_form">
                            <form action="review_item_ok" method="POST" enctype="multipart/form-data">
                            <!-- <img src="./images/iconfinder_Camera_2742769.png" alt="사진 첨부"> -->
                            <%--<c:if test="${idx != null}">--%>
                                <input type="hidden" name="idx" value="${item.up_idx}"/>
                                </c:forEach>
                                <p class="review_form_user"><%=id%></p>
                                <p><textarea name="re_content" id="" cols="30" rows="10" placeholder="내용을 입력해 주세요."></textarea></p>
                                <p><input type="file" name="re_image"><input class="review_btn" type="submit" value="등 록"></p>
                            <%--</c:if>--%>
                            </form>
                            </div>
                            <div class="review_list">
                            <c:forEach var="list" items="${review_list}" varStatus="status">
                                <div class="review_show showbt${status.index}">
                                    <div class="review_user">${list.re_userid} ♡</div>
                                    <div class="review_title"><div>${list.re_content}</div></div>
                                    <div class="review_regdate">${list.re_regdate}</div>
                                </div>
                                <div class="review_detail show${status.index} toggled">
                                    <c:if test="${list.re_image != null}">
                                    <p class="p_img" style="text-align: center;"><img src="${list.re_image}" style="width: 400px;"></p>
                                    </c:if>
                                    <p>${list.re_content}</p>
                                </div>
                            </c:forEach>
                                <input type="hidden" value="${review_list.size()}" id="shwh">
                            </div>
                </div>
            </div>
        </main>
        <div class="both"></div>
        <footer>
            <%@include file="./user_footer.jsp" %>
        </footer>

</body>
</html>
