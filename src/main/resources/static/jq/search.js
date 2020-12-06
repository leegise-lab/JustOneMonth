$(function(){
    let pos = 0;
    let html1=('<a href="#"><img src="./img/0400030015543.gif" alt=""></a><ul class="explan"><li><p>요것은 첫번째</p></li><li><p>ddd</p></li><li><p>ddd</p></li><li><p>ddd</p></li></ul>')
    let html2=('<a href="#"><img src="./img/0400010010563.gif" alt=""></a><ul class="explan"><li><p>요것은 두번째</p></li><li><p>ddd</p></li><li><p>ddd</p></li><li><p>ddd</p></li></ul>')
    let html3=('<a href="#"><img src="./img/0400030015743.gif" alt=""></a><ul class="explan"><li><p>요것은 세번째</p></li><li><p>ddd</p></li><li><p>ddd</p></li><li><p>ddd</p></li></ul>')
    let html4=('<a href="#"><img src="./img/0400030012823.gif" alt=""></a><ul class="explan"><li><p>요것은 네번째</p></li><li><p>ddd</p></li><li><p>ddd</p></li><li><p>ddd</p></li></ul>')
    let html5=('<a href="#"><img src="./img/0340040014053.gif" alt=""></a><ul class="explan"><li><p>요것은 다섯번째</p></li><li><p>ddd</p></li><li><p>ddd</p></li><li><p>ddd</p></li></ul>')
    let html6=('<a href="#"><img src="./img/0620040004613.gif" alt=""></a><ul class="explan"><li><p>요것은 여섯번째</p></li><li><p>ddd</p></li><li><p>ddd</p></li><li><p>ddd</p></li></ul>')
    let html7=('<a href="#"><img src="./img/0400030015543.gif" alt=""></a><ul class="explan"><li><p>요것은 일곱번째</p></li><li><p>ddd</p></li><li><p>ddd</p></li><li><p>ddd</p></li></ul>')
    
        
    
    $('#Shortcuts>li:first-child').addClass('on');
    showwindow();
    showwindow2();

    $('.Shortcuts_btn ').on('click',function(){   
        pos=$(this).attr("value");
        if(pos==0){
            alert("신상품은 10% 할인")
        }
        movepage();
        clearwinodw();
        showwindow();
        showwindow2();
        
    });
        

    


    function movepage(){
        $('#Shortcuts .Shortcuts_btn').removeClass('on');
        $('#Shortcuts .Shortcuts_btn:eq('+pos+')').addClass('on');
    }
    function showwindow(){
        let d=0;
        for(let i =1;i<=5;i++){
            
            let div = document.createElement('div');
            $('.bestbox_top20').append(div);
            $('.bestbox_top20 div:eq('+d+')').addClass('bestbox_line');
            d++;
            
        }
    }
    function showwindow2(){
        let d=0;
        for(let g = 1;g<=5;g++){
            for(let i =1;i<=4;i++){
            
                let div = document.createElement('div');
                $('.bestbox_top20 .bestbox_line').append(div);
                $('.bestbox_top20 .bestbox_line:nth-child('+g+') div:eq('+d+')').addClass('bestbox_list');
                if(pos == 0){
                $('.bestbox_top20 .bestbox_line .bestbox_list:eq('+d+')').html(html1);
                d++;
                }else if(pos==1){
                    $('.bestbox_top20 .bestbox_line .bestbox_list:eq('+d+')').html(html2);
                d++;
                }else if(pos==2){
                    $('.bestbox_top20 .bestbox_line .bestbox_list:eq('+d+')').html(html3);
                    d++;
                }else if(pos==3){
                    $('.bestbox_top20 .bestbox_line .bestbox_list:eq('+d+')').html(html4);
                    d++;
                }else if(pos==4){
                    $('.bestbox_top20 .bestbox_line .bestbox_list:eq('+d+')').html(html5);
                    d++;
                }else if(pos==5){
                    $('.bestbox_top20 .bestbox_line .bestbox_list:eq('+d+')').html(html6);
                    d++;
                }else{
                    $('.bestbox_top20 .bestbox_line .bestbox_list:eq('+d+')').html(html7);
                    d++;
                }
                
            }
        }
    }
    function clearwinodw(){
        for(let i =1;i<=5;i++){
            $('.bestbox_top20').empty();
        }
    }    
    

});