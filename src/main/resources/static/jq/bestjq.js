$(function(){
    let pos = 0;
    $('#Shortcuts>li:first-child').addClass('on');
    // showwindow();
    // showwindow2();

    $('.Shortcuts_btn ').on('click',function(){
        pos=$(this).attr("value");

        movepage();


    });





    function movepage(){
        $('#Shortcuts .Shortcuts_btn').removeClass('on');
        $('#Shortcuts .Shortcuts_btn:eq('+pos+')').addClass('on');
        $('.bestbox_top20').addClass('displaynone1');
        $('.bestbox_top20:eq('+pos+')').removeClass('displaynone1');
    }
    // function showwindow(){
    //     let d=0;
    //     for(let i =1;i<=5;i++){
    //
    //         let div = document.createElement('div');
    //         $('.bestbox_top20').append(div);
    //         $('.bestbox_top20 div:eq('+d+')').addClass('bestbox_line');
    //         d++;
    //
    //     }
    // }
    // function showwindow2(){
    //     let d=0;
    //     for(let g = 1;g<=5;g++){
    //         for(let i =1;i<=4;i++){
    //
    //             let div = document.createElement('div');
    //             $('.bestbox_top20 .bestbox_line').append(div);
    //             $('.bestbox_top20 .bestbox_line:nth-child('+g+') div:eq('+d+')').addClass('bestbox_list');
    //             if(pos == 0){
    //                 $('.bestbox_top20 .bestbox_line .bestbox_list:eq('+d+')').html(html1);
    //             d++;
    //             }else if(pos==1){
    //                 $('.bestbox_top20 .bestbox_line .bestbox_list:eq('+d+')').html(html2);
    //             d++;
    //             }else if(pos==2){
    //                 $('.bestbox_top20 .bestbox_line .bestbox_list:eq('+d+')').html(html3);
    //                 d++;
    //             }else if(pos==3){
    //                 $('.bestbox_top20 .bestbox_line .bestbox_list:eq('+d+')').html(html4);
    //                 d++;
    //             }else if(pos==4){
    //                 $('.bestbox_top20 .bestbox_line .bestbox_list:eq('+d+')').html(html5);
    //                 d++;
    //             }else if(pos==5){
    //                 $('.bestbox_top20 .bestbox_line .bestbox_list:eq('+d+')').html(html6);
    //                 d++;
    //             }else{
    //                 $('.bestbox_top20 .bestbox_line .bestbox_list:eq('+d+')').html(html7);
    //                 d++;
    //             }
    //
    //         }
    //     }
    // }
    // function clearwinodw(){
    //     for(let i =1;i<=5;i++){
    //         $('.bestbox_top20').empty();
    //     }
    // }


});
