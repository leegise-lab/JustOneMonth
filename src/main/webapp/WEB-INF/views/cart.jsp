<%@ page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
    int j =0;
    String id = (String) session.getAttribute("loginId");
    String name = (String) session.getAttribute("name");
    request.setCharacterEncoding("UTF-8");
%>
<%@include file="./user_header.jsp" %>
<%@ include file="./userCheck.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/main_1 (1).css">
    <link rel="stylesheet" href="./css/style_1 (1).css">
    <link rel="stylesheet" href="./css/footer.css">
    <link rel="stylesheet" href="./css/cart.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="./js/jq1.js"></script>
    <script src="./js/cart.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
</head>
<body>
<header>
<%--    <div id="headerTop">--%>
<%--        <!-- 로고 -->--%>
<%--        <h1 class="tlogo"><a href="/index.html">저스트원</a></h1>--%>
<%--        <!-- //로고 -->--%>
<%--        <!-- sns -->--%>
<%--        <div class="hdShare">--%>
<%--            <div id="langLink">--%>
<%--                <style>--%>
<%--                    #langLink {position:relative; top:0; left:0;}--%>
<%--                    .global_lang {cursor:pointer;}--%>
<%--                    .global_lang_content {display:none; position:absolute; top:25px; left:0; z-index: 1000; background-color:#fff; border:1px solid #dbdbdb; padding:8px 5px 0 5px;}--%>
<%--                    .global_lang_content li {float:none!important; }--%>
<%--                    .global_lang_content li a {background:none!important; text-indent:0!important; width:auto!important;}--%>
<%--                    .global_lang_content li a img {margin-right:7px;}--%>
<%--                </style>--%>
<%--                <script>--%>
<%--                    $(function(){--%>
<%--                        $(".global_lang").click(function(){--%>
<%--                            // var _this = $(this);--%>
<%--                            $(".global_lang_content").slideToggle('fast', function(){--%>
<%--                                if ( $(this).is(':visible'))--%>
<%--                                {--%>
<%--                                    $(".global_lang span").text('▲');--%>
<%--                                }else{--%>
<%--                                    $(".global_lang span").text('▼');--%>
<%--                                }--%>
<%--                            });--%>
<%--                        });--%>
<%--                    });--%>
<%--                </script>--%>

<%--                <div class="global_lang">Global <span>▼</span></div>--%>
<%--                <ul class="global_lang_content">--%>
<%--                    <li class="lang"><a href="//justone.co.kr/" target="_blank"><img src="http://en.justone.co.kr/Common/img/lang_icon_KR.gif"></a></li>--%>
<%--                    <li class="lang"><a href="//www.justonemall.jp"><img src="http://en.justone.co.kr/Common/img/lang_icon_JP.gif"></a></li>--%>
<%--                    <li class="lang"><a href="//en.justone.co.kr"><img src="http://en.justone.co.kr/Common/img/lang_icon_EN.gif"></a></li>--%>
<%--                    <li class="lang"><a href="//cn.justone.co.kr"><img src="http://en.justone.co.kr/Common/img/lang_icon_CN.gif"></a></li>--%>
<%--                    <li class="lang"><a href="//www.justonemall.tw"><img src="http://en.justone.co.kr/Common/img/lang_icon_TW.gif"></a></li>--%>
<%--                </ul>--%>
<%--            </div>--%>

<%--            <li><a href="javascript:CreateBookmarkLink('http://www.justone.co.kr', '여성의류 쇼핑몰 저스트원!!');" class="ic_bm" target="_blank">즐겨찾기</a></li>--%>
<%--            <li><a href="https://story.kakao.com/ch/justone" class="ic_ks" target="_blank">카카오스토리</a></li>--%>

<%--            <li><a href="https://www.instagram.com/justone_korea/" class="ic_in" target="_blank">인스타그램</a></li>--%>
<%--            <li><a href="https://itunes.apple.com/kr/app/%EA%B8%B0%EB%B6%84%EC%A2%8B%EC%9D%80-%EB%A1%9C%EB%A7%A8%ED%8B%B1-%EC%BA%90%EC%A3%BC%EC%96%BC-%EC%97%AC%EC%84%B1%EC%9D%98%EB%A5%98-%EC%87%BC%ED%95%91%EB%AA%B0-%EC%A0%80%EC%8A%A4%ED%8A%B8%EC%9B%90/id897007279?l=en&amp;mt=8" class="ic_as" target="_blank">애플스토어</a></li>--%>
<%--            <li><a href="https://play.google.com/store/apps/details?id=com.looket.justone&amp;hl=ko" class="ic_gs" target="_blank">구글스토어</a></li>--%>

<%--        </div>--%>
<%--        <!-- //sns -->--%>
<%--        <!-- 회원가입/로그인 -->--%>
<%--        <div class="hdGnb">--%>
<%--            <ul>--%>
<%--                <!--li><a href="http://www.justone.co.kr/"><img src="http://justone.globimg.com/lang_icon_KR.gif"></a></li>--%>
<%--                <li><a href="http://en.justone.co.kr/"><img src="http://justone.globimg.com/lang_icon_EN.gif"></a></li>--%>
<%--                <li><a href="http://cn.justone.co.kr/"><img src="http://justone.globimg.com/lang_icon_CN.gif"></a></li>--%>
<%--                <li><a href="http://jp.justone.co.kr/"><img src="http://justone.globimg.com/lang_icon_JP.gif"></a></li-->--%>
<%--                <li class="hdJoin"><a href="https://www.justone.co.kr/shop/idinfo.html">회원가입</a><span class="bonus"></span></li>--%>
<%--                <li><a href="https://www.justone.co.kr/shop/member.html?type=login">로그인</a></li>--%>
<%--                <li><a href="/shop/basket.html">장바구니(<span id="user_basket_quantity" class="user_basket_quantity">0</span>)</a></li>--%>
<%--                <li class="off"><a href="https://www.justone.co.kr/shop/confirm_login.html?type=myorder">주문조회</a></li>--%>
<%--                <li><a href="https://www.justone.co.kr/shop/member.html?type=mynewmain">마이페이지</a></li>--%>
<%--                <li class="off"><a href="/board/board.html?code=jojean_board12">리뷰보기</a></li>--%>
<%--                <li><a href="/shop/faq.html">고객센터</a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--        <!-- //회원가입/로그인 -->--%>


<%--    </div>--%>
<%--    <div id="headerNavWrap">--%>
<%--        <div id="headerNavArea" class="">--%>
<%--            <div class="headerNav">--%>
<%--                <div id="allCateArea">--%>

<%--                    <div class="fixLogo"><a href="/index.html"><img src="/design/jojean/phps/common/tlogo.png"></a></div>--%>
<%--                    <div class="allCateBtns" >--%>
<%--                        <div class="btnAllCate">--%>
<%--                            <div class="trans-line">--%>
<%--                                <div class="line-top"></div>--%>
<%--                                <div class="line-middle"></div>--%>
<%--                                <div class="line-bottom"></div>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <!-- 전체 메뉴 -->--%>
<%--                        <div class="boxAllCate displaynone" >--%>
<%--                            <div class="allCateClose">--%>
<%--                                <div class="trans-line is-open">--%>
<%--                                    <img src="./img/getout.png" alt="나가기" width="20"height="20">--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="boxAllCateTop">--%>
<%--                                <a href="/shop/shopbrand.html?xcode=061&amp;type=Y"><span>NEW</span>신상 10%</a>--%>
<%--                                <a href="/shop/bestseller.html?xcode=BEST"><span>BEST</span>베스트</a>--%>
<%--                                <a href="/shop/shopbrand.html?xcode=048&amp;type=Y"><span>MADE</span>자체제작</a>--%>
<%--                            </div>--%>
<%--                            <div class="boxAllCateMid">--%>
<%--                                <ul class="fleft">--%>
<%--                                    <li>--%>
<%--                                        <span class="tit"><a href="/shop/shopbrand.html?xcode=062&amp;type=X">아우터</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=062&amp;type=&amp;mcode=001">자켓</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=062&amp;type=&amp;mcode=004">코트</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=062&amp;type=&amp;mcode=002">패딩/점퍼</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=062&amp;type=&amp;mcode=003">가디건/조끼</a></span>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <span class="tit"><a href="/shop/shopbrand.html?xcode=034&amp;type=X">탑</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=034&amp;type=&amp;mcode=001">티셔츠</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=034&amp;type=&amp;mcode=002">블라우스/셔츠</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=034&amp;type=&amp;mcode=003">캐미/탱크탑</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=034&amp;type=O&amp;mcode=004">니트</a></span>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <span class="tit"><a href="/shop/shopbrand.html?xcode=043&amp;type=X">원피스&amp;스커트</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=043&amp;type=&amp;mcode=002">원피스</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=043&amp;type=&amp;mcode=001">스커트</a></span>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <span class="tit"><a href="/shop/shopbrand.html?xcode=040&amp;type=X">팬츠</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=040&amp;type=&amp;mcode=001">청바지</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=040&amp;type=&amp;mcode=002">슬랙스</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=040&amp;type=&amp;mcode=003">면바지</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=040&amp;type=&amp;mcode=004">짧은바지</a></span>--%>
<%--                                    </li>--%>

<%--                                    <li>--%>
<%--                                        <span class="tit"><a href="/shop/shopbrand.html?xcode=051&amp;type=Y">+PLUS SIZE</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=051&amp;type=Y&amp;mcode=002">상의</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=051&amp;type=Y&amp;mcode=003">아우터</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=051&amp;type=Y&amp;mcode=004">바지</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=051&amp;type=Y&amp;mcode=005">원피스/스커트</a></span>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <span class="tit"><a href="/shop/shopbrand.html?xcode=010&amp;type=X">FITNESS</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=010&amp;type=X&amp;mcode=001">상의</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=010&amp;type=X&amp;mcode=002">하의</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=010&amp;type=X&amp;mcode=003">악세사리</a></span>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <span class="tit"><a href="/shop/shopbrand.html?xcode=020&amp;type=X">BAG&amp;SHOES&amp;ACC</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=020&amp;type=M&amp;mcode=001">신발</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=020&amp;type=M&amp;mcode=002">가방</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=020&amp;type=M&amp;mcode=003">머플러/스카프</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=020&amp;type=M&amp;mcode=005">모자</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=020&amp;type=M&amp;mcode=006">주얼리</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=020&amp;type=M&amp;mcode=007">기타</a></span>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <span class="tit"><a href="/shop/shopbrand.html?xcode=045&amp;type=X">LEGGINGS&amp;SOCKS</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=045&amp;type=M&amp;mcode=005">레깅스</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=045&amp;type=M&amp;mcode=006">삭스</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=045&amp;type=M&amp;mcode=001">이너웨어</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=045&amp;type=M&amp;mcode=005">스타킹</a></span>--%>
<%--                                    </li>--%>
<%--                                </ul>--%>
<%--                                <ul class="fright">--%>
<%--                                    <li>--%>
<%--                                        <span class="tit"><a href="">기획전</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=048&amp;type=N&amp;mcode=004">데.님.맛.집 저스트원!</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=065&amp;type=P">하나 사면, 하나 더! 1+1</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=010&amp;type=X">건강한 생활, 피트니스 웨어</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=045&amp;type=M&amp;mcode=001">입은 듯 안 입은 듯, 이너웨어</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=011&amp;type=P">집에서도 예쁘게, 홈웨어</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=034&amp;type=M&amp;mcode=001">매일 함께하는 티셔츠</a></span>--%>

<%--                                        <span class="tit2"><a href="/shop/shopbrand.html?xcode=066&amp;type=Y">니트&amp;가디건</a></span>--%>
<%--                                        <span class="tit2"><a href="/shop/shopbrand.html?xcode=029&amp;type=Y">휴양지룩</a></span>--%>
<%--                                        <span class="tit2"><a href="/shop/shopbrand.html?xcode=017&amp;type=X">SALE ~50%</a></span>--%>
<%--                                    </li>--%>
<%--                                </ul>--%>
<%--                            </div>--%>
<%--                            <div class="boxAllCateBottom">--%>
<%--                                <ul class="fleft">--%>
<%--                                    <li>--%>
<%--                                        <span class="tit"><a href="javascript:void(0);" class="notLink">고객센터</a></span>--%>
<%--                                        <span><a href="https://www.justone.co.kr/shop/mypage.html?mypage_type=mym2mboard">공지사항</a></span>--%>
<%--                                        <span><a href="/shop/faq.html">FAQ</a></span>--%>
<%--                                        <span><a href="/board/board.html?code=jojean_board9">메일링</a></span>--%>
<%--                                        <span><a href="/shop/page.html?id=4">제휴문의</a></span>--%>
<%--                                        <span><a href="/board/board.html?code=jojean_board10">입사지원</a></span>--%>
<%--                                        <span><a href="/board/board.html?code=jojean_board7">저작권침해신고</a></span>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <span class="tit"><a href="javascript:void(0);" class="notLink">1644-3662</a></span>--%>
<%--                                        <span><a href="/board/board.html?code=jojean_board15">VIP게시판</a></span>--%>
<%--                                        <span><a href="https://www.justone.co.kr/shop/mypage.html?mypage_type=mym2mboard">상품문의</a></span>--%>
<%--                                        <span><a href="https://www.justone.co.kr/shop/mypage.html?mypage_type=mym2mboard">배송전취소문의</a></span>--%>
<%--                                        <span><a href="https://www.justone.co.kr/shop/mypage.html?mypage_type=mym2mboard">교환반품문의</a></span>--%>
<%--                                        <span><a href="https://www.justone.co.kr/shop/mypage.html?mypage_type=mym2mboard">배송문의</a></span>--%>
<%--                                        <span><a href="/shop/shopbrand.html?xcode=064&amp;type=O">셀프배송비결제</a></span>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <span class="tit"><a href="javascript:void(0);" class="notLink">마이페이지</a></span>--%>
<%--                                        <span><a href="https://www.justone.co.kr/shop/member.html?type=login">로그인</a></span>--%>
<%--                                        <span><a href="https://www.justone.co.kr/shop/idinfo.html">회원가입</a></span>--%>
<%--                                        <span><a href="/shop/basket.html">장바구니</a></span>--%>
<%--                                        <span><a href="https://www.justone.co.kr/shop/confirm_login.html?type=myorder">주문내역</a></span>--%>
<%--                                        <span><a href="https://www.justone.co.kr/shop/mypage.html?mypage_type=mym2mboard">배송조회</a></span>--%>
<%--                                        <span><a href="https://www.justone.co.kr/shop/member.html?type=myreserve">적립금</a></span>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <span class="tit"></span>--%>
<%--                                        <span><a href="0">예치금</a></span>--%>
<%--                                        <span><a href="">쿠폰조회</a></span>--%>
<%--                                        <span><a href="/shop/todaygoods.html">최근본상품</a></span>--%>
<%--                                        <span><a href="https://www.justone.co.kr/shop/mypage.html?mypage_type=mym2mboard">1:1 문의하기</a></span>--%>
<%--                                        <span><a href="https://www.justone.co.kr/shop/idinfo.html">회원정보수정</a></span>--%>
<%--                                        <span><a href="http://www.justone.co.kr/shop/confirm_login.html?type=myorder">비회원주문조회</a></span>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <span class="tit"><a href="javascript:void(0);" class="notLink">SNS</a></span>--%>
<%--                                        <span><a href="https://www.facebook.com/pages/저스트원-justone/1444409975842330" target="_blank">페이스북</a></span>--%>
<%--                                        <span><a href="https://www.instagram.com/justone_korea/" target="_blank">인스타그램</a></span>--%>
<%--                                        <span><a href="https://story.kakao.com/ch/justone" target="_blank">카카오스토리</a></span>--%>
<%--                                        <span class="tit2"><a href="/board/board.html?code=jojean_image6&amp;board_cate=1">이벤트</a></span>--%>
<%--                                    </li>--%>
<%--                                </ul>--%>
<%--                                <div class="fright">--%>
<%--                                    <a href="https://www.justone.co.kr/shop/idinfo.html"><em>회원 가입 시</em>신규 가입 시 3,000원 즉시 할인</a>--%>
<%--                                    <a href="/board/board.html?code=jojean_board12"><em>매주 금요일 리뷰퀸</em>매주 금요일 총 3분의 리뷰퀸에게 총 35,000원의 적립금을 드립니다!</a>--%>
<%--                                    <a href="/board/board.html?code=jojean_image6&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999854&amp;num2=00000&amp;number=44&amp;lock=N"><em>등급별 혜택</em>패밀리/실버/골드/VIP/VVIP 회원 등급에 따라 혜택을 드립니다!</a>--%>
<%--                                    <a href="javascript:void(0);" class="notLink"><em>무료배송</em>전상품 5만원 이상 결제 시, 무.료.배.송!</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <!-- //전체 메뉴 -->--%>
<%--                        <!-- 상단 메뉴 -->--%>
<%--                        <div class="navArea subListWrap">--%>
<%--                            <ul>--%>
<%--                                <li><a href="/shop/bestseller.html?xcode=BEST">BEST100</a></li>--%>
<%--                                <li><a href="/shop/shopbrand.html?xcode=061&amp;type=Y">NEW10%</a>--%>
<%--                                    <p><a href="#">셔츠</a><a href="#">셔츠</a><a href="#">셔츠</a><a href="#">셔츠</a></p>--%>
<%--                                </li>--%>
<%--                                <li><a href="/shop/shopbrand.html?xcode=034&amp;type=X">TOP</a>--%>
<%--                                    <p><a href="#">셔츠</a><a href="#">셔츠</a><a href="#">셔츠</a><a href="#">셔츠</a></p></li>--%>
<%--                                <li><a href="/shop/shopbrand.html?xcode=043&amp;type=X">OPS/SKIRT</a>--%>
<%--                                    <p><a href="#">셔츠</a><a href="#">셔츠</a><a href="#">셔츠</a><a href="#">셔츠</a></p></li>--%>
<%--                                <li><a href="/shop/shopbrand.html?xcode=066&amp;type=Y">KNIT/CARDIGAN</a>--%>
<%--                                    <p><a href="#">셔츠</a><a href="#">셔츠</a><a href="#">셔츠</a><a href="#">셔츠</a></p></li>--%>
<%--                                <li><a href="/shop/shopbrand.html?xcode=020&amp;type=X">BAG/SHOES/ACC</a>--%>
<%--                                    <p><a href="#">셔츠</a><a href="#">셔츠</a><a href="#">셔츠</a><a href="#">셔츠</a></p></li>--%>
<%--                                <li><a href="/shop/shopbrand.html?xcode=045&amp;type=X">LEGGINGS/SOCKS</a></li>--%>
<%--                                <li class="search_wrap last">--%>
<%--                                    <div class="search sch">--%>
<%--                                        <form action="/shop/shopbrand.html" method="post" name="search" autocomplete="off">                                <fieldset>--%>
<%--                                            <legend>상품 검색 폼</legend>--%>
<%--                                            <input name="search" onkeydown="CheckKey_search();" value="" class="MS_search_word">                                    <a href="javascript:search_submit();" class="schBtn"><img src="/img/header_sch_btn.jpg"></a>--%>
<%--                                        </fieldset>--%>
<%--                                        </form>--%>
<%--                                    </div>--%>

<%--                                    <div class="keywordWrap" style="display: none;">--%>
<%--                                        <div class="schKeyword">--%>
<%--                                            <a href="javascript:void(0);" class="schPopClose"><img src="/design/jojean/phps/common/search_pop_close.png"></a>--%>
<%--                                            <h6 id="schPop" class="schActive">실시간 검색어</h6>--%>

<%--                                            <!-- 인기검색어 검색어 등록 -->--%>
<%--                                            <div class="keywords  keywordsActive" id="layerCont">--%>
<%--                                                <ol class="keywordRow">--%>
<%--                                                    <li>1<span class="button">원피스</span></li>--%>
<%--                                                    <li>2<span class="button">가디건</span></li>--%>

<%--                                                </ol>--%>
<%--                                                <ol class="keywordRow">--%>
<%--                                                    <li>3<span class="button">청바지</span></li>--%>
<%--                                                    <li>4<span class="button">맨투맨</span></li>--%>

<%--                                                </ol>--%>
<%--                                                <ol class="keywordRow">--%>
<%--                                                    <li>5<span class="button">니트</span></li>--%>
<%--                                                    <li>6<span class="button">슬랙스</span></li>--%>
<%--                                                </ol>--%>
<%--                                                <ol class="keywordRow">--%>
<%--                                                    <li>7<span class="button" style="margin-left:0;">블라우스</span></li>--%>
<%--                                                    <li>8<span class="button" style="margin-left:0;">마스크</span></li>--%>


<%--                                                </ol>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <!-- 인기검색어 검색어 등록 -->--%>

<%--                                        <!-- 인기검색어 레이어 이미지배너 -->--%>
<%--                                        <div class="schPopImg">--%>
<%--                                            <a href="/shop/shopbrand.html?xcode=048&amp;type=N&amp;mcode=004"><img src="/design/jojean/phps/common/search_bn01.jpg"></a>--%>
<%--                                            <a href="/shop/shopbrand.html?xcode=065&amp;type=P"><img src="/design/jojean/phps/common/search_bn02.jpg"></a>--%>
<%--                                        </div>--%>
<%--                                        <!-- 인기검색어 레이어 이미지배너 -->--%>
<%--                                    </div>--%>

<%--                                </li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- //상단 메뉴 -->--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>


    <div style="margin-bottom: 100px">
        <div id="cartWrap">
            <h2 class="tit-page">장바구니</h2>
            <div class="page-body">
                <div class="tablecart">
                    <form method="post" action="cart_update" name="cartform">
                        <table>
                            <thead>
                            <tr>
                                <th><div><input type="checkbox" name="allcheck" checked></div></th>
                                <th><div class="tb-center">사진</div></th>
                                <th><div class="tb-center">상품명</div></th>
                                <th><div class="tb-center">수량</div></th>
                                <th><div class="tb-center">가격</div></th>
                                <th><div class="tb-center">배송비</div></th>
                                <th><div class="tb-center">선택</div></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:set var = "total" value = "0" />
                            <c:forEach var="cartList" items="${cartList}" varStatus="status">
                                <tr>
                                <tr>
                                    <td><div class="tb-center"><input type="checkbox" class="checkbox" value="${cartList.getCart_idx()}" name="checkbox" checked></div></td>
                                    <td>
                                        <div class="tb-center"><img width="70" height="70" src="${cartList.getCart_productimg()}"></div>
                                    </td>
                                    <td>
                                        <div class="tb-left">
                                            <a href="" name="productName">${cartList.getCart_productname()}</a>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="tb-center">
                                            <div class="optspin">
                                                <a class="btn-dw" id="btndown${status.count}">-</a>
                                                <input type="text" class="txt-spin" id="value${status.count}" name="productAmount" value="${cartList.getCart_amount()}">
                                                <a class="btn-up" id="btnup${status.count}">+</a>
                                                <a class="cssButtonCorrect"  name="correction" onclick="submit(1)">수정</a>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="tb-center tb-bold" ><span><p name="productPrice"><fmt:formatNumber value='${cartList.getCart_productprice()}'/>원</p></span></div>
                                    </td>
                                    <td>
                                        <div>
                                            <div class="tb-center tb-delivery">
                                                <div class="MS_tb_delivery">
                                                    <span> [기본배송]<br>조건</span>
                                                    <div class="MS_layer_delivery deliverycase" style="display:none">
                                                        <ol>
                                                            <li style="font-weight: bold;">배송조건 : 기본배송(조건)</li>
                                                            <li>배송비 : 2,500원이 청구됩니다.</li>
                                                        </ol>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="tb-center">
                                            <span><a href=""></a></span>
                                            <i class="xi-close"><a href=""></a></i>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="7">
                                        <div class="tb-left tb-opt" name="option">[옵션] 색상 : ${cartList.getCart_color()}, 사이즈 : ${cartList.getCart_size()}</div>
                                    </td>
                                </tr>
                                <tr style="display: none" name="productinfo">
                                    <td>
                                        <input type="hidden" value="${cartList.getCart_idx()}" name="productidx">
                                    </td>
                                    <td>
                                        <input type="hidden" value="${cartList.getCart_productname()}" name="productName">
                                    </td>
                                    <td>
                                        <input type="hidden" value="${cartList.getCart_productprice()}" name="productPrice">
                                    </td>
                                    <td>
                                        <input type="hidden" value="${cartList.getCart_color()}" name="productColor">
                                    </td>
                                    <td>
                                        <input type="hidden" value="${cartList.getCart_size()}" name="productSize">
                                    </td>
                                </tr>
                                </tr>
                                <c:set var= "total" value='${total + cartList.getCart_amount()*cartList.getCart_productprice()}'/>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="7">
                                    <c:choose>
                                        <c:when test="${empty cartList}">
                                            <c:set var="deliveryPrice" value="0"/>
                                        </c:when>
                                        <c:when test="${total>= 50000}">
                                            <c:set var="deliveryPrice" value="0"/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:set var="deliveryPrice" value="2500"/>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="tb-right">총 구매금액 <fmt:formatNumber value='${total}'></fmt:formatNumber>원 + 배송료
                                        ${deliveryPrice}원 = <strong><fmt:formatNumber value='${total + deliveryPrice}'></fmt:formatNumber>원</strong></div>
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                    </form>
                </div>
                <div class="btnControl_1"><input onclick="submit(2)" class="cssButtonGray" type="submit" value="선택상품 삭제"></div>
                <div class="delivery" style="margin:20px 0;text-align:center;"><a>50,000원 미만의 주문은 배송료를 청구합니다.</a></div>
                <c:if test="${total < 50000}">
                    <div class="deliveryFree"><p><span><fmt:formatNumber value="${50000- total}"></fmt:formatNumber></span>원 이상 추가 구매 시 배송비 무료</p></div>
                </c:if>
                <div class="btnControl_2">
                    <a href="/orderWrite" class="cssButtonBlack">상품 주문하기</a>
                    <a onclick="submit(3)" id="remove" class="cssButtonWhite">장바구니 비우기</a>
                    <a href="/main" class="cssButtonWhite">쇼핑 계속하기</a>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <%@include file="./user_footer.jsp" %>
    </footer>
</body>
</html>