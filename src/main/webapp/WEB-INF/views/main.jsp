<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/cf.css">
    <link rel="stylesheet" href="./css/footer.css">
    <link rel="stylesheet" href="./css/best.css">
    <script src="./jq/jquery-3.5.1.min.js"></script>
    <script src="./jq/jq1.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <%@include file="./user_header.jsp" %>


</head>
<body>
    <menu>
        <div id="wrapper">
            <div id="slider-wrap">
                <ul id="slider">
                    <li >
                    </li>
                    <li>
                    </li>
                    <li>
                    </li>
                    <li>
                    </li>
                    <li>
                    </li>
                </ul>

                <!--controls-->
                <div class="btns" id="next"><img src="./images/rightpoint.png" alt=""><i class="fa fa-arrow-right"></i></div>
                <div class="btns" id="previous"><img src="./images/leftpoint.png" alt=""><i class="fa fa-arrow-left"></i></div>
                <div id="counter"></div>

                <div id="pagination-wrap">
                    <ul>
                    </ul>
                    <!-- <script>
                        'use strcit';
                        $('.move').on('click',function(){
                            let clicker =$(this).val();
                            console.log(clicker);
                        });
                    </script> -->
                </div>
                <!--controls-->
            </div>
        </div>
    </menu>

    <main>
        <div class="m_m_4 ">
            <ul>
                <li>
                    <a href="item?up_idx=8"><img src="./images/in/KakaoTalk_20201121_203919062.png" alt=""></a>
                </li>
                <li>
                    <a href="item?up_idx=6"><img src="./images/in/KakaoTalk_20201121_203926033.png" alt=""></a>
                </li>
                <li>
                    <a href="OUTER"><img src="./images/banner_four3.jpg" alt=""></a>
                </li>
                <li>
                    <a href="CARDIGAN"><img src="./images/banner_four4.jpg" alt=""></a>
                </li>
            </ul>
        </div>
        <div id="sale_time">
            <div id="text_time">
                <p id="size_up">TIME SALE</p>
                <p>*타임세일은 D-day 시간이 초과하면 이용하실수 없습니다.</p>
            </div>
            <div id="time_isnow" >
                <div class="time_box ">
                    <span class="days times"></span>
                    <div class="font_time">DAY</div>
                </div>
                <div class="colone">:</div>
                <div class="time_box" >
                    <span class="hours times"></span>
                    <div class="font_time">HOUR</div>
                </div>
                <div class="colone">:</div>
                <div class="time_box"  >
                    <span class="minutes times"></span>
                    <div class="font_time">MIN</div>
                </div>
                <div class="colone">:</div>
                <div class="time_box">
                    <span class="seconds times"></span>
                    <div class="font_time">SEC</div>
                </div>
            </div>
            <div class="weekbest">
                <ul>
                    <li>
                        <a href="item?up_idx=13"><img src="./images/in/top3.png" alt=""></a>
                    </li>
                    <li>
                        <a href="item?up_idx=17"><img src="./images/in/KakaoTalk_20201123_010415095.png" alt=""></a>
                    </li>
                    <li>
                        <a href="item?up_idx=14"><img src="./images/in/KakaoTalk_20201122_215853054.png" alt=""></a>
                    </li>
                    <li>
                        <a href="item?up_idx=15"><img src="./images/in/KakaoTalk_20201122_220424383.png" alt=""></a>
                    </li>
                </ul>
            </div>
        </div>
    </main>
    <footer>
        <%@include file="./user_footer.jsp" %>
    </footer>
</body>
</html>
