// /* $(function(){
//     $('.top_info').on('click',function(){
//         let thisid =$(this).attr("id");
//         console.log(thisid)
//         $(`${id} +content_info` ).css('display','block')
//         $(`${id} +content_info` ).removeClass("displaynone")
//     });
//  */
// $(function(){
//     $('#info121').on('click',function(){
//         $(this).addClass('up')
//         $('#info121 p img').remove();
//         $('#info121 p').append('<img id="up1" src="./img/iconfinder_03-Arrow-direction-pointer-up_4510581.png" alt=""></img>');
//         $('.displaynone1').css('display','block');
//     });
//     $('#info122').on('click',function(){
//         $(this).addClass('up')
//         $('#info122 p img').remove();
//         $('#info122 p').append('<img id="up2" src="./img/iconfinder_03-Arrow-direction-pointer-up_4510581.png" alt="">');
//         $('.displaynone2').css('display','block');
//     });
//     $('#down3').on('click',function(){
//         $('#info123 p img').remove();
//         $('#info123 p').append('<img  src="./img/iconfinder_03-Arrow-direction-pointer-up_4510581.png" alt="">');
//         $('.displaynone3').css('display','block');
//     });
//     $('#up3').on('click',function(){
//         $('#info123 p img').remove();
//         $('#info123 p').append('<img id="down3" src="./img/iconfinder_04-Arrow-direction-pointer-down_4510559.png" alt="">');
//         $('.displaynone3').css('display','none');
//     });
// });

// // $(function(){
// //     $('#up3').on('click',function(){
// //         console.log("12121212")
// //         $('#info123 p img').remove();
// //         $('#info123 p').append('<img id="down3" src="./img/iconfinder_04-Arrow-direction-pointer-down_4510559.png" alt="">');
// //         $('.displaynone3').css('display','none');
// //     });
// // });
//

let sell_price;
let amount;

function init () {
    sell_price = document.form.sell_price.value;
    amount = document.form.amount.value;
    document.form.sum.value = sell_price;
    change();
}

function add () {
    hm = document.form.amount;
    sum = document.form.sum;
    console.log(hm.value)
    hm.value ++ ;

    sum.value = parseInt(hm.value) * sell_price;
}

function del () {
    hm = document.form.amount;
    sum = document.form.sum;
    if (hm.value > 1) {
        hm.value -- ;
        sum.value = parseInt(hm.value) * sell_price;
    }
    console.log(sum.value())
}

function change () {
    hm = document.form.amount;
    sum = document.form.sum;

    if (hm.value < 0) {
        hm.value = 0;
    }
    sum.value = parseInt(hm.value) * sell_price;

}





function submit(index){
    if(index==1){
        document.form.action="item_ok";
    }
    if(index==2){
        document.form.action="orderWrite";
    }
    document.form.submit();
};

$(function(){
    $(".top_info").click(function (){
        let submenu = $(this).next("div");
        let imgbtn = $(this).find("img");
        if(submenu.is(":visible")){
            submenu.slideUp();
            imgbtn.attr("src","./images/iconfinder_04-Arrow-direction-pointer-down_4510559.png");
        }else{
            submenu.slideDown();
            imgbtn.attr("src","./images/iconfinder_03-Arrow-direction-pointer-up_4510581.png");
        }
    });


    let sh = $('#shwh').val();

    const toggled = $(".toggled");
    toggled.hide();


    for (let i=0;i<sh;i++){
        $(`.showbt${i}`).click(function(){
            $(`.show${i}`).toggle(['1s']);
        });
    }
});
