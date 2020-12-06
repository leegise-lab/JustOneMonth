//체크박스 전체 체크 및 해제
$(function(){
    let allcheck =  $("input[name='allcheck']");
    let checkbox = $("input[type='checkbox']");
    allcheck.click(function(){
        if(allcheck.prop("checked")){
            checkbox.prop("checked", true);
        }else{
            checkbox.prop("checked", false);
        }
    });
});

//선택상품 삭제 버튼
$(function(){
    $(".cssButtonGray").click(function(){
        $(".checkbox:checked").each(function(){
            $(this).parentsUntil("tbody").next().remove();
            $(this).parentsUntil("tbody").remove();
        });
        if($("tbody").children().length==0){
            let text = "<div class='tb-center'>장바구니에 담긴 상품이 없습니다.</div>";
            $(text).replaceAll("tfoot div");
        }
    });
});

$(function(){
    $("#remove").click(function(){
        let result = confirm("장바구니를 비우시겠습니까?")
        if(result){
            $("tbody").children("tr").remove();
            let text = "<div class='tb-center'>장바구니에 담긴 상품이 없습니다.</div>";
            $(text).replaceAll("tfoot div");
        }else{
            return false;
        }
    });
});
//상품이 하나도 없을때 table tfoot tag 대체(가격 내용 대체) 및 체크박스 체크 해제
$(function(){
    if($("tbody").children().length==0){
        let text = "<div class='tb-center'>장바구니에 담긴 상품이 없습니다.</div>";
        $(text).replaceAll("tfoot div");
        $("<div class='tb-center'>장바구니에 담긴 상품이 없습니다.</div>").replaceAll("tfoot div");
        $("input[name='allcheck']").prop("checked", false);
    }
});

//+, - 버튼
$(function(){
    $('.btn-up').click(function(){
        let n = $('.btn-up').index(this);
        let num = $(".txt-spin:eq("+n+")").val();
        num = $(".txt-spin:eq("+n+")").val(num*1+1);

    });
    $('.btn-dw').click(function(){
        let n = $('.btn-dw').index(this);
        let num = $(".txt-spin:eq("+n+")").val();
        if(num >1){
            num = $(".txt-spin:eq("+n+")").val(num*1-1);
        }
    });
});

function submit(index){
    if(index==1){
        document.cartform.action="cart_update";
    }
    if(index==2){
        document.cartform.action="cart_delete";
    }
    if(index==3){
        document.cartform.action="cart_reset";
    }
    document.cartform.submit();
};