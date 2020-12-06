
/* 슬라이드 */
$(function(){

    let pos = 0;
    let totalSlides = $('#slider-wrap ul li').length;
    let sliderWidth = $('#slider-wrap').width();


    $(function(){
        $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
        $('#next').click(function(){
            slideRight();
        });
        $('#previous').click(function(){
            slideLeft();
        });
        $('#pagination-wrap ul li').click(function(){
            let qww=$(this).text()
            console.log(qww,"2222");

        });
        let autoSlider = setInterval(slideRight, 3000);
        $.each($('#slider-wrap ul li'), function() {
            let li = document.createElement('li');
            $('#pagination-wrap ul').append(li);

        });
        for(vala=1;vala<=totalSlides;vala++){
            $(`#pagination-wrap ul li:nth-child(${vala})`).html(`<div class="move" id="button${vala}" value=${vala}>${vala}</div>`);

        }
        for(vala=1;vala<=totalSlides;vala++){
            $(`#slider li:nth-child(${vala})`).html(`<a href="item?up_idx=${vala}"><img src="./images/top/ex${vala}.jpg"></a>`);

        }



        /*    $($('#slider-wrap ul li'), function() {

                //create a pagination
                const a = document.createElement('a');
                $('#pagination-wrap ul li').append(a);
                $('#pagination-wrap ul li a').attr('herf','#')

            }); */

        countSlides();

        pagination();

        $('#slider-wrap').hover(
            function(){ $(this).addClass('active'); clearInterval(autoSlider); },
            function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
        );
        /*     $('#pagination-wrap .active').on('click',function(){
                let num = $('#slider-wrap').each(index);
                let imgindex =$('#pagination-wrap .active').getAttribute();
                let btnindex =$('#slider-wrap').index();
                while(num.length){
                    if(imgindex == btnindex){
                        console.log(imgindex);
                    }
                    break;
                }


            }); */

    });



    function slideLeft(){
        pos--;
        if(pos==-1){ pos = totalSlides-1; }
        $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));
        countSlides();
        pagination();
    }
    function slideRight(){
        pos++;
        if(pos==totalSlides){ pos = 0; }
        $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));
        countSlides();
        pagination();
    }
    /* function moveclick(){
        $('.move').on('click',function(){
            let aaaa=$(this).val();
            console.log(aaaa);
        });
        for(vala=1;vala<=totalSlides;vala++){
            let num =  $(`#button${vala}`)

        }
        let num =  $("#id").val();
        console.log(num);
        if(pos==num){ pos = 0; }
        $('#slider-wrap ul#slider').css('left', -(sliderWidth*num));
        countSlidesmove();
        pagination();
    } */
    function countSlides(){
        $('#counter').html(pos+1 + ' / ' + totalSlides);
    }
    /* function countSlidesmove(){
        $('#counter').html(num+ ' / ' + totalSlides);
    }*/
    function pagination(){
        $('#pagination-wrap ul li div').removeClass('active');
        $('#pagination-wrap ul li div:eq('+pos+')').addClass('active');
    }






    /*상단 메뉴 고정 */
    const jbOffset = $( '#headerNavArea' ).offset();

    $( window ).scroll( function() {
        if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '#headerNavArea' ).addClass( 'fix' );
        }else {
            $( '#headerNavArea' ).removeClass( 'fix' );
        }
    });
    $(function(){
        $('.trans-line').on('click',function(){
            $('.displaynone').css('display','block').animate({

            },2000);

        });
    });
    /* 삼줄 메뉴 */
    $(function(){
        $('.is-open').on('click',function(){
            $('.displaynone').css('display','none').animate({

            },2000);

        });
    });


});

/*sale 카운트  */
/* function getTime() { 
    now = new Date(); 
    dday = new Date(10,20,18,00); 
    days = (dday - now) / 1000 / 60 / 60 / 24; 
    daysRound = Math.floor(days); 
    hours = (dday - now) / 1000 / 60 / 60 - (24 * daysRound); 
    hoursRound = Math.floor(hours); 
    minutes = (dday - now) / 1000 /60 - (24 * 60 * daysRound) - (60 * hoursRound); 
    minutesRound = Math.floor(minutes); 
    seconds = (dday - now) / 1000 - (24 * 60 * 60 * daysRound) - (60 * 60 * hoursRound) - (60 * minutesRound); 
    secondsRound = Math.round(seconds); 
    
    document.getElementsByClassName("days").innerHTML = hoursRound; 
    document.getElementsByClassName("hours").innerHTML = minutesRound; 
    document.getElementsByClassName("minutes").innerHTML = secondsRound; 
    newtime = window.setTimeout("getTime();", 1000); 
}  */
/* $(function(){
    now = new Date();
    dday = new Date(2020,10,30,18,00,00);
    days=days = (dday - now)/ 1000 / 60 / 60 / 24; 
    daysRound = Math.floor(days);  
    hours = (dday - now) / 1000 / 60 / 60 - (24 * daysRound); 
    hoursRound = Math.floor(hours); 
    minutes = (dday - now) / 1000 /60 - (24 * 60 * daysRound) - (60 * hoursRound); 
    minutesRound = Math.floor(minutes); 
    seconds = (dday - now) / 1000 - (24 * 60 * 60 * daysRound) - (60 * 60 * hoursRound) - (60 * minutesRound); 
    secondsRound = Math.round(seconds); 
    $('.days').html(daysRound); 
    $('.hours').html(hoursRound);
    $('.minutes').html(minutesRound);
    $('.seconds').html(secondsRound);
    newtime = setTimeout(1000); 

});
$(function(){
    now = new Date();
    dday = new Date(2020,10,30,18,00,00);
    days= now /1000 / 60 / 60 / 24; 
    daysRound = Math.floor(days);  
    hours = 1000 / 60 / 60 - (24 * daysRound); 
    hoursRound = Math.floor(hours); 
    minutes =  1000 /60 - (24 * 60 * daysRound) - (60 * hoursRound); 
    minutesRound = Math.floor(minutes); 
    seconds = 1000 - (24 * 60 * 60 * daysRound) - (60 * 60 * hoursRound) - (60 * minutesRound); 
    secondsRound = Math.round(seconds); 
    $('.days').html(daysRound); 
    $('.hours').html(hoursRound);
    $('.minutes').html(minutesRound);
    $('.seconds').html(secondsRound);
    newtime = setTimeout(1000); 

}); */
function counter(){
    let dday = new Date("November 30,2020,19:00:00").getTime(); //디데이
    setInterval(function(){
        let now = new Date(); //현재 날짜 가져오기
        let distance = dday - now;
        let d = Math.floor(distance / (1000 * 60 * 60 * 24));
        let h = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        let m = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        let s = Math.floor((distance % (1000 * 60)) / 1000);
        if(s < 10){
            s = '0'+s;
        }
        $('.days').html(d);
        $('.hours').html(h);
        $('.minutes').html(m);
        $('.seconds').html(s);
    }, 1000);
}
counter();
//인기검색어
(function ($) {
    $(document).ready(function () {

        $(".MS_search_word").click(function () {
            event.stopPropagation();
            $(".keywordWrap").show();
            $(".smSch .keywordWrap").hide();

            return false;
        });


        $(document).click(function (e) {
            /* let rr=e.target;
            console.log(rr); */

            console.log(e.target)
            if (!$(e.target).is('.keywordWrap *','.keywordWrap')) {
                $('.keywordWrap').hide();
            }

        });

        $('.schPopClose').click(function () {
            $('.keywordWrap').hide();

        });
    })


})(jQuery);


//tag검색기능
(function ($) {
    $(document).ready(function () {

        $(".keywords .button").click(function () {
            var text = $(this).text();
            text = text.replace(/\#/g, '');

            $(".MS_search_word").val(text);
            $(".sch form a img").click();
        });
    })

})(jQuery);
// 간편 회원가입
(function($) {
    $(function() {
        // label text
        $('.input-label').focusin(function(){
            $(this).css({'opacity':1, filter: 'alpha(enabled="false")'});
        });
        $('.input-label').focusout(function(){
            if(!$(this).val()) {
                $(this).animate({'opacity':0}, 500);
            } else {
                $(this).css({'opacity':1});
            }
        });

    });

})(jQuery);

jQuery(document).ready(function(){
    //14세 이상 가입 필수 체크
    jQuery("input[name='user_age_check']").prop("checked",true);
    //이용약관,개인정보 수집, 개인정보 처리 위탁 체크
    jQuery("input[name='yaok2']").prop("checked",true);
    jQuery("input[name='privacy1']").prop("checked",true);
    jQuery("input[name='privacy3']").prop("checked",true);

    //이용약관, 수집 이용, 처리위탁 정보 처리
    var _marketing = jQuery(".marketing .mk-wrap"),
        _privercyCont1 = jQuery("h4#chk_cont1").next(),
        _privercyCont2_1 = jQuery("h4#chk_cont2").next(),
        _privercyCont2_2 = jQuery("input[id='agree_uidB']").next(),
        _privercyCont4 =  jQuery("input[id='agree_uidD']").next()
    jQuery(".appendMarketing").append(_marketing);
    jQuery("#chk_cont1_cont").append(_privercyCont1);
    jQuery("#chk_cont2_cont").append(_privercyCont2_1);
    jQuery("#chk_cont2_cont").append(_privercyCont2_2);
    jQuery("#chk_cont4_cont").append(_privercyCont4);

    jQuery(".privercyBtns a").on('click', function(){
        var _this = jQuery(this).attr("flag"),
            _thisCont = jQuery("#" + _this + "_cont");
        if ( jQuery(this).hasClass("active") == true ) {
            jQuery(".privercyBtns a").removeClass("active");
            jQuery(".appendPrivercy").hide();
        } else {
            jQuery(".appendPrivercy").hide();
            jQuery(_thisCont).show();
            jQuery(".privercyBtns a").removeClass("active");
            jQuery(this).addClass("active");
        }
    });
});

// 체크 사항
function checkAll(){
    if($('#ad_every_agree').is(':checked')) {
        $('.input-cbox').prop("checked", true);
    }else{
        $('.input-cbox').prop("checked", false);
    }
}


// 우편 번호
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
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
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
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
}

// 이메일 선택시 값 가져오기
$(function(){
    $('#emailSelection').change(function(){
        if($(this).val() == 'direct'){
            $('#email2').val("");
        }else{
            $('#email2').val($(this).val());
            $('#email2').attr('readonly', true)
        }
    });
});

$(function(){
    $("#sample6_postcode").css("opacity",1);
    $("#sample6_address").css("opacity",1);
});

$(function(){
    $("#sample6_postcode").click(function(){
        setTimeout(function(){
            $("#sample6_postcode").css("opacity",1);
            $("#sample6_address").css("opacity",1);
        },1000);
    });
});