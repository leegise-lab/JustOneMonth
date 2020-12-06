<%@ page language="java"  pageEncoding="UTF-8" %>
<% String useid=(String)session.getAttribute("loginId");%>
<html>
<title>저스트원</title>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/listmain_1.css">
    <link rel="stylesheet" href="/css/liststyle_1.css">
    <script src="./js/jquery-3.5.1.min.js"></script>
    <script src="./js/jq1.js"></script>
</head>
<header>
    <div id="headerTop">
        <!-- 로고 -->
        <h1 class="tlogo"><a href="/main">저스트원</a></h1>
        <!-- //로고 -->
        <!-- sns -->
        <div class="hdShare">
            <div id="langLink">
                <style>
                    #langLink {position:relative; top:0; left:0;}
                    .global_lang {cursor:pointer;}
                    .global_lang_content {display:none; position:absolute; top:25px; left:0; z-index: 1000; background-color:#fff; border:1px solid #dbdbdb; padding:8px 5px 0 5px;}
                    .global_lang_content li {float:none!important; }
                    .global_lang_content li a {background:none!important; text-indent:0!important; width:auto!important;}
                    .global_lang_content li a img {margin-right:7px;}
                </style>
                <script>
                    $(function(){
                        $(".global_lang").click(function(){
                            // var _this = $(this);
                            $(".global_lang_content").slideToggle('fast', function(){
                                if ( $(this).is(':visible'))
                                {
                                    $(".global_lang span").text('▲');
                                }else{
                                    $(".global_lang span").text('▼');
                                }
                            });
                        });
                    });
                </script>

                <div class="global_lang">Global <span>▼</span></div>
                <ul class="global_lang_content">
                    <li class="lang"><a href="//justone.co.kr/" target="_blank"><img src="http://en.justone.co.kr/Common/images/lang_icon_KR.gif"></a></li>
                    <li class="lang"><a href="//www.justonemall.jp"><img src="http://en.justone.co.kr/Common/images/lang_icon_JP.gif"></a></li>
                    <li class="lang"><a href="//en.justone.co.kr"><img src="http://en.justone.co.kr/Common/images/lang_icon_EN.gif"></a></li>
                    <li class="lang"><a href="//cn.justone.co.kr"><img src="http://en.justone.co.kr/Common/images/lang_icon_CN.gif"></a></li>
                    <li class="lang"><a href="//www.justonemall.tw"><img src="http://en.justone.co.kr/Common/images/lang_icon_TW.gif"></a></li>
                </ul>
            </div>

            <li><a href="javascript:CreateBookmarkLink('http://www.justone.co.kr', '여성의류 쇼핑몰 저스트원!!');" class="ic_bm" target="_blank">즐겨찾기</a></li>
            <li><a href="https://story.kakao.com/ch/justone" class="ic_ks" target="_blank">카카오스토리</a></li>

            <li><a href="https://www.instagram.com/justone_korea/" class="ic_in" target="_blank">인스타그램</a></li>
            <li><a href="https://itunes.apple.com/kr/app/%EA%B8%B0%EB%B6%84%EC%A2%8B%EC%9D%80-%EB%A1%9C%EB%A7%A8%ED%8B%B1-%EC%BA%90%EC%A3%BC%EC%96%BC-%EC%97%AC%EC%84%B1%EC%9D%98%EB%A5%98-%EC%87%BC%ED%95%91%EB%AA%B0-%EC%A0%80%EC%8A%A4%ED%8A%B8%EC%9B%90/id897007279?l=en&amp;mt=8" class="ic_as" target="_blank">애플스토어</a></li>
            <li><a href="https://play.google.com/store/apps/details?id=com.looket.justone&amp;hl=ko" class="ic_gs" target="_blank">구글스토어</a></li>

        </div>
        <!-- //sns -->
        <!-- 회원가입/로그인 -->
        <div class="hdGnb">
            <ul>
                <!--li><a href="http://www.justone.co.kr/"><img src="http://justone.globimg.com/lang_icon_KR.gif"></a></li>
                <li><a href="http://en.justone.co.kr/"><img src="http://justone.globimg.com/lang_icon_EN.gif"></a></li>
                <li><a href="http://cn.justone.co.kr/"><img src="http://justone.globimg.com/lang_icon_CN.gif"></a></li>
                <li><a href="http://jp.justone.co.kr/"><img src="http://justone.globimg.com/lang_icon_JP.gif"></a></li-->
                <% // 인증된 세션이 없는경우, 해당페이지를 볼 수 없게 함.
                    if (useid == null) {

                %>
                <li class="hdJoin"><a href="./login">로그인</a></li>
                <li class="hdJoin"><a href="./regist">회원가입</a></li>

                <% // 인증된 세션이 없는경우, 해당페이지를 볼 수 없게 함.
                } else {
                    if(useid.equals("admin_juston")){
                %>

                <li class="hdJoin"><a href="./adminMain">관리자 홈페이지 </a></li>
                <%      }%>
                <li class="hdJoin"><a href="./logOut">로그아웃</a></li>
                <li><a href="./cart">장바구니</a>
                </li>
                <li class="off"><a href="orderLookUp">주문조회</a></li>
                <li><a href="./list">고객센터</a></li>
                <%
                    }
                %>
            </ul>
        </div>
        <!-- //회원가입/로그인 -->


    </div>
    <div id="headerNavWrap">
        <div id="headerNavArea" class="">
            <div class="headerNav">
                <div id="allCateArea">

                    <div class="fixLogo"><a href="./index"><img src="./design/jojean/phps/common/tlogo.png"></a></div>

                    <!-- 상단 메뉴 -->
                    <div class="navArea subListWrap">
                        <ul>
                            <li><a href="AllAbout">AllAbout</a></li>
                            <li><a href="./OUTER" vaule="1">OUTER</a>
                                <p><a href="./OUTER">자켓</a><a href="./OUTER">가디건</a><a href="./OUTER">코트</a><a href="./OUTER">집업/점퍼</a><a href="./OUTER">패딩</a></p>
                            </li>
                            <li><a href="./PANTS"vaule="2">PANTS</a>
                                <p><a href="./PANTS">청바지</a><a href="./PANTS">슬랙스</a><a href="./PANTS">면바지</a><a href="./PANTS">짧은바지</a></p>
                            </li>
                            <li><a href="./OPS"vaule="3">OPS/SKIRT</a>
                                <p><a href="./OPS">원피스</a><a href="./OPS">스커트</a><a href="./OPS">치마바지</a></p></li>
                            <li><a href="./CARDIGAN"vaule="4">KNIT/CARDIGAN</a>
                                <p><a href="./CARDIGAN">니트</a><a href="./CARDIGAN">가디건</a><a href="./CARDIGAN">조끼</a></p></li>
                            <li><a href="./SHOES"vaule="5">BAG/SHOES/ACC</a>
                                <p><a href="./SHOES">신발</a><a href="./SHOES">가방</a><a href="./SHOES">머플러/스카프</a><a href="./SHOES">모자</a>
                                    <a href="./SHOES">주얼리</a><a href="./SHOES">기타</a></p></li>
                            <li><a href="./LEGGINGS"vaule="6">LEGGINGS/SOCKS</a>
                                <p><a href="./LEGGINGS">레깅스/스타킹</a><a href="./LEGGINGS">삭스</a><a href="./LEGGINGS">이너웨어</a><p>
                            </li>
                            <li class="search_wrap last">
                                <div class="search sch">
                                    <form method="get" action="item_search">
                                        <input name="search" class="MS_search_word">
                                        <button type="submit" class="schBtn"
                                                style="border:none;background-color:white;position:absolute;top:17px;}">
                                            <img src="./images/header_sch_btn.jpg"></button>
                                    </form>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- //상단 메뉴 -->
            </div>
        </div>
    </div>
    </div>

</header>
</html>
