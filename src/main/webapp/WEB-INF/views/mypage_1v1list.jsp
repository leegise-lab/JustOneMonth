<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="./user_header.jsp"%>
<%@ include file="./userCheck.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1 게시글 목록</title>
    <link rel="stylesheet" href="./css/board1v1.css">
    <script src="./js/jquery-3.5.1.min.js"></script>
    <script src="./js/jq1.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">

</head>
<body>
<div id="contentWrapper">
    <div id="contentWrap">
        <div id="list_content">
            <div id="board1v1">
                <h2 class="title-page">1:1 문의</h2>
                <div class="page-body">
                    <!-- 마이페이지 탭메뉴 -->
                    <link type="text/css" rel="stylesheet" href="#"/>
                    <!-- 마이페이지 탭메뉴 -->
                    <div class="mypage_menu">
                        <ul>
                            <li><a href="./orderLookUp">주문조회</a></li>
                            <li><a href="./list">1:1문의</a></li>
                            <li><a href="./memberModify">회원정보 수정</a></li>
                            <li><a href="./memberOut">회원탈퇴</a></li>
                        </ul>
                    </div>
                    <div class="total-page">
                        <p class="total">총 게시글: ${totalCount}건</p>
                        <p class="page">PAGE 1/1</p>
                    </div>
                    <div class="table-d2-list">
                        <table summary="번호, 제목, 날짜, 답변여부">
                            <caption>1:1 상담내역</caption>
                            <colgroup>
                                <col width="65"/>
                                <col width="20"/>
                                <col width="*"/>
                                <col width="100"/>
                                <col width="100"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="row">
                                    <div class="tb-center">번호</div>
                                </th>
                                <th scope="row" colspan="2">
                                    <div class="tb-center">제목</div>
                                </th>
                                <th scope="row">
                                    <div class="tb-center">작성일</div>
                                </th>
                                <th scope="row">
                                    <div class="tb-center">답변여부</div>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="notice" items="${notice}">
                                <form method="get" action="/notice">
                                    <tr>
                                        <td>
                                            <div class="tb-center">${notice.category}</div>
                                        </td>
                                        <td></td>
                                        <td colspan="3">
                                            <div><a href="/notice?title=${notice.title}">${notice.title}</a></div>
                                                <%--                                    <input type="submit" name="title" class="tb-left" value="${notice.title}" style="background-color: #fff; border: none">--%>
                                        </td>
                                    </tr>
                                </form>
                            </c:forEach>
                            <%--    session 아이디 넣어줘서 로그인시 id    --%>
                            <c:forEach var="row" items="${list}">
                                <tr>
                                    <td>
                                        <div class="tb-center">${row.idx}</div>
                                    </td>
                                    <td>
                                        <div class="tb-center"><img src="./images/default.gif" alt="내가쓴글"/></div>
                                    </td>
                                    <td>
                                        <div class="tb-left"><a href="/watch?idx=${row.idx}">${row.category} ${row.title}</a></div>
                                    </td>
                                    <td>
                                        <div class="tb-center">
                                            <fmt:formatDate value="${row.created_at}" pattern="yyyy-MM-dd" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="tb-center">
                                            <span class="CSSbuttonGray">${row.answer_yn}</span>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="paginate">
                        <c:forEach var="pageNum" begin="1" end="${pageNums}" step="1" varStatus="status">
                            <a class="now" href="/list?pageNum=${pageNum}"><span class="board_count"><B>[${pageNum}] </B></span></a>
                        </c:forEach>
                    </div>
                    <div class="btn-foot">
                        <a href="./write"><span class="CSSbuttonB">1:1 질문하기</span></a>
                    </div>
                </div><!-- .page-body -->
            </div><!-- #board1v1 -->
        </div><!-- #content -->
    </div><!-- #contentWrap -->
</div><!-- #contentWrapper-->
<hr/>
<footer>
    <link rel="stylesheet" href="css/footer.css">
    <div id="footer" style="margin-top: 200px; border-top:1px solid #eaeaea;">
        <div class="botline"></div>
        <div class="footerTop">
            <ul class="wrap1">
                <li class="tit">CUSTOMER CENTER</li>
                <li class="line"></li>
                <li class="num">1644-3662</li>
                <li class="fax">fax : 02-6969-5433</li>
                <li class="sub">MONDAY-FRIDAY 10:00 - 17:00</li>
                <li class="sub">LUNCH 13:00 - 14:00</li>
                <li class="sub">WEEKEND, HOLIDAY OFF</li>
                <li class="sub"></li>
            </ul>
            <!-- BANKING INFO -->
            <ul class="wrap2">
                <li class="tit">BANKING INFO</li>
                <li class="line"></li>
                <li class="bank"><img src="./images/kb_bk.gif"> 366901 - 04 - 153821</li>
                <li class="bank"><img src="./images/nh_bk.gif"> 100056 - 55 - 005031</li>
                <li class="bank"><img src="./images/wr_bk.gif"> 1005 - 302 - 421987</li>
                <li class="bank"><img src="http://img.just-one.co.kr/shopping_mall/mainimage/sh_bk.gif"> 100 - 032 - 135166
                </li>
                <li class="name">예금주 : (주)제이오진</li>
                <li class="tit tit2">DELIVERY</li>
                <li class="line"></li>
                <!-- 대한통운-->
                <li class="sub_cj">CJ 대한통운 고객센터 1588 - 1255</li>
                <li class="btn"><a href="https://www.doortodoor.co.kr/parcel/pa_004.jsp" target="_blank"><img
                        src="images/cj_t.gif"></a></li>
            </ul>
            <!-- BOARD -->
            <ul class="wrap4">
                <li class="tit">ABOUT US</li>
                <li class="line"></li>
                <li class="sub">
                    COMPANY : 주식회사 제이오진<br>
                    OWNER : 윤은해<br>
                    BUSINESS LICENSE : 204-86-00983 <a href="http://www.ftc.go.kr/info/bizinfo/communicationList.jsp"
                                                       target="_blank">사업자정보확인</a><br>
                    MAIL ORDER LICENSE : 제2015-서울성동-0152호<br>
                    ADRESS : 서울특별시 성동구 성수일로6길 33 6층 (성수동2가,아연디지털단지)<br>
                    RETURN : 경기 구리시 토평동 613-13 대한통운 광진지점 BSub 자양우리대리점 (저스트원)<br>
                    CHIEF PRIVACY OFFICER : 강대영 (온라인사업부)<br>
                    MAIL : justone@justone.co.kr<br>
                    제휴문의 : office@justone.co.kr
                </li>
                <li class="footerSns">
                    <a href="https://story.kakao.com/ch/justone" class="ic_ks" target="_blank">카카오스토리</a>
                    <a href="https://www.facebook.com/pages/저스트원-justone/1444409975842330" class="ic_fb" target="_blank">페이스북</a>
                    <a href="https://www.instagram.com/justone_korea/" class="ic_in" target="_blank">인스타그램</a>
                    <a href="https://itunes.apple.com/kr/app/%EA%B8%B0%EB%B6%84%EC%A2%8B%EC%9D%80-%EB%A1%9C%EB%A7%A8%ED%8B%B1-%EC%BA%90%EC%A3%BC%EC%96%BC-%EC%97%AC%EC%84%B1%EC%9D%98%EB%A5%98-%EC%87%BC%ED%95%91%EB%AA%B0-%EC%A0%80%EC%8A%A4%ED%8A%B8%EC%9B%90/id897007279?l=en&amp;mt=8"
                       class="ic_as" target="_blank">애플스토어</a>
                    <a href="https://play.google.com/store/apps/details?id=com.looket.justone&amp;hl=ko" class="ic_gs"
                       target="_blank">구글스토어</a>
                </li>
            </ul>
        </div>
        <div class="footerMiddle">
            <ul>
                <li style="padding-top: 15px"><a href="/shop/page.html?id=1">저스트원</a></li>
                <li style="padding-top: 15px"><a href="javascript:view_join_terms();">이용약관</a></li>
                <li style="padding-top: 15px"><a href="javascript:bottom_privacy();"><strong><span style="color:#2ba5ba">개인정보처리방침</span></strong></a>
                </li>
                <li style="padding-top: 15px"><a href="/shop/page.html?id=6">이용안내</a></li>
            </ul>
        </div>
        <div class="footerBottom">
            <ul class="icons cb_clear">
                <li><a><img src="http://img.just-one.co.kr/shopping_mall/mainimage/footer_img01.gif"></a></li>
                <!-- <li><a href="http://www.freechk.com/index/check/justone" target="_blank"><img src="/design/jojean/smartpc/img/footer_img02.gif"></a></li>-->
                <!-- <li><a href="https://goods.codes/justone" target="_blank"><img src="http://img.just-one.co.kr/shopping_mall/home2017/etc/footer_img04.gif"></a></li> -->
                <li>
                    <a href="javascript:void(window.open('https://okbfex.kbstar.com/quics?e2eType=10&amp;page=C021590&amp;cc=b034066%3Ab035526&amp;mHValue=21a2c973051ccdf0479c5d435caf7980201006161630492','win0','width=775,height=662,status=no,toolbar=no,scrollbars=yes'))"
                       target="_blank"><img src="/img/footer_img03.gif"></a></li>
            </ul>
            <div class="copyright">
                (주)제이오진[저스트원] 상호와 이미지/사용문구/디자인은 저작권법 7233호에 의해 보호받고 있습니다. 모든 자료 도용 시 고발조치 후 법적책임을 물을 수 있습니다.<br>
                <a href="" style="cursor:default;">copyright(c) <b>justone.co.kr</b> all rights reserved.</a>
            </div>
        </div>
    </div>
</footer>
</body>
</html>