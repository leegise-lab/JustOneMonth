<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="admin_head.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="admin_check.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품정보 관리</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="./css/style.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
<body>
<script>
    $(function(){
        $('#checkbox').on('click',function(){
            if(this.checked){
                $('.checkbox').each(function() {
                    this.checked = true;
                });
            }else{
                $('.checkbox').each(function() {
                    this.checked = false;
                });
            }
        });
        $('.checkbox').on('click',function(){
            if($('.checkbox:checked').length == ${totcnt}){
                $('#checkbox').prop('checked', true);
            }else{
                $('#checkbox').prop('checked', false);
            }
        });
        $("#submitCheck").on("click", function(){
            if($("#search_start").val() == ""){
                alert('검색 기간을 입력하세요.');
                $("#search_start").focus();
                return false;
            }
            if($("#search_end").val() == ""){
                alert('검색 기간을 입력하세요.');
                $("#search_end").focus();
                return false;
            }
            if($("#search").val() == ""){
                alert('검색어를 입력하세요.');
                $("#search").focus();
                return false;
            }
        });
    });

</script>

<!-- right start -->
<div class="rightWrap" style="margin-left: 340px; margin-right: 10px;">
    <!--title start-->
    <div class="subTitleBg">
        <!--      <p class="current">
                  현재위치 : 회원관리 &gt; 회원정보 관리 &gt; <span class="2depth_select"
                                                      style="font-weight: bold;">회원정보 관리</span>
              </p> -->
    </div>
    <!--title end-->

    <!-- contents start -->
    <div class="conWrap1">
        <table cellpadding="0" cellspacing="0" width="90%">
            <tr>
                <td>
                    <div class="tableWrap_grayBg">
                        <div class="titleWrap1">
                            <p class="title">상품정보 관리</p>
                            <!--help-->

                            <!--help-->

                        </div>
                        <form name=form1 action="admin_product" method=post>
                            <input type=hidden name=type> <input type=hidden name=id>
                            <input type=hidden name=email> <input type=hidden
                                                                  name="mem_name">

                            <TABLE cellSpacing=0 cellPadding=0 width="100%"
                                   style="background-color: white;">
                                <colgroup>
                                    <col class="colThWidth"></col>
                                    <col></col>
                                </colgroup>


                                <TR id="div_group_code2" style="display: none;">
                                    <TD colspan="2" background="images/table_con_line.gif"></TD>
                                </TR>
                                <TR id="div_todaylogin">
                                    <TD class="table_cell">검색기간</TD>
                                    <TD class="td_con1"><input type=date name="search_start"
                                                               id="search_start" onfocus="this.blur();"> ~ <input
                                            type=date name="search_end" id="search_end"
                                            onfocus="this.blur();">
                                    </TD>
                                </TR>
                                <TR>
                                    <TD class="table_cellEnd">검색어 입력</TD>
                                    <TD class="td_con1"><input id="search" name=search size=80 class="input"
                                                               style="margin-left: 10px; padding: 7px;">
                                        <input class="middleButton margin-left" id="submitCheck" type="submit"
                                               style="vertical-align: middle;" value="검색">
                                    </TD>
                                </TR>
                            </TABLE>
                        </form>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="tableWrap_grayBg"
                         style="overflow: hidden; margin-top: 40px;">
                        <div style="float: right;">
                            <h2 style="text-align: right">검색된 상품목록</h2>
                            <div>전체 ${totcnt}건 조회, 현재 ${pageNum}/${pageNums} 페이지</div>
                        </div>


                        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0
                               class="table_top">
                            <TR align=center>
                                <th class="table_cellFirst table_cell1" style="padding-left: 5px;"><input
                                        class="totalcheckbox" type=checkbox id="checkbox" name=allcheck
                                        style="BORDER-RIGHT: medium none; BORDER-TOP: medium none; BORDER-LEFT: medium none; BORDER-BOTTOM: medium none;">
                                </th>
                                <th class="table_cell1" style="width:35px;">번호</th>
                                <th class="table_cell1">상품 이름</th>
                                <th class="table_cell1" style="width:50px;">카테고리</th>
                                <th class="table_cell1" style="width:80px;">세부 카테고리</th>
                                <th class="table_cell1">가격</th>
                                <th class="table_cell1" style="width: 300px">색상</th>
                                <th class="table_cell1End" style="font-size: 10px">사이즈</th>
                            </TR>


                            <form method="post" action="product_del_ok">
                                <c:forEach var="item" items="${list}" varStatus="status">
                                <tr>
                                    <TD class="td_con0" align="center"><input class="checkbox"
                                                                              type=checkbox name=ids_chk
                                                                              value="${item.up_idx}"
                                                                              style="width:12.5px; display: inline; BORDER-RIGHT: medium none; BORDER-TOP: medium none; BORDER-LEFT: medium none; BORDER-BOTTOM: medium none;">
                                    </td>
                                    <TD class="td_con1" align=center>${item.up_idx}</td>
                                    <TD align=center class="td_con1">
                                        <b><span class="font_orange">${item.up_name}</span></b>
                                    </td>
                                    <TD align=center class="td_con1">${item.up_category1}</td>
                                    <TD align=center class="td_con1">${item.up_category2}</td>
                                    <TD align=center class="td_con1">${item.up_price}</td>
                                    <TD align=center class="td_con1">${item.up_color}</TD>
                                    <TD align=center class="td_con1">${item.up_size}</TD>
                                </tr>
                                </c:forEach>


                        </TABLE>
                        <!-- table -->

                        <div style="text-align: left; padding: 10px">

                            <input type="submit" class="smallGrayButton1" value="삭 제"></input>

                            <p align="center">


                                <c:if test="${search == null}">
                                    <!-- 페이지 출력 ---------------------->
                                    <c:forEach var="item" begin="1" end="${pageNums}" step="1" varStatus="status">
                                        <a href='admin_product?pageNum=${item}'><span class=font_orange2><B>[${item}] </B></span></a>
                                    </c:forEach>
                                </c:if>

                                <c:if test="${search != null}">
                                    <!-- 페이지 출력 ---------------------->
                                    <c:forEach var="item" begin="1" end="${pageNums}" step="1" varStatus="status">
                                        <a href='admin_product?pageNum=${item}&search=${search}&search_start=${search_start}&search_end=${search_end}'><span class=font_orange2><B>[${item}] </B></span></a>
                                    </c:forEach>
                                </c:if>
                                <!-- 페이지 출력 끝 -->
                            </p>


                        </div>
                        </form>
                    </div>
                </td>
            </tr>
        </table>


        <input type=hidden name=tot value="4">
        </form>
        <form name=form2 action="member_reservelist.php" method=post
              target=reserve_info>
            <input type=hidden name=id> <input type=hidden name=type>
        </form>
        <form name=form3 method=post>
            <input type=hidden name=id>
        </form>
        <form name=reserveform action="reserve_money.php" method=post>
            <input type=hidden name=type> <input type=hidden name=id>
        </form>
        <form name=mailform action="member_mailsend.php" method=post>
            <input type=hidden name=rmail>
        </form>
        <form name=smsform action="sendsms.php" method=post
              target="sendsmspop">
            <input type=hidden name=number>
        </form>

        <form name=idxform action="/admin/member_list.php" method=post>
            <input type=hidden name=block value=""> <input type=hidden
                                                           name=gotopage value=""> <input type=hidden name=sort
                                                                                          value="0"> <input type=hidden
                                                                                                            name=scheck
                                                                                                            value="0">
            <input type=hidden name=group_code value=""> <input
                type=hidden name=vperiod value="0"> <input type=hidden
                                                           name=search_start value="2001-01-01"> <input type=hidden
                                                                                                        name=search_end
                                                                                                        value="2020-10-24">
            <input type=hidden
                   name=search value=""> <input type=hidden name=devices
                                                value="All">
        </form>

        <form name=excelform action="member_excel.php" method=post>
            <input type=hidden name=sort value="0"> <input type=hidden
                                                           name=scheck value="0"> <input type=hidden name=group_code
                                                                                         value=""> <input type=hidden
                                                                                                          name=search_start
                                                                                                          value="2001-01-01">
            <input type=hidden name=search_end
                   value="2020-10-24"> <input type=hidden name=search value="">
        </form>
    </div>
</div>
<!--contents end-->


</div>
<!--right end-->
</div>
<input type="hidden" class="lightbox bmd-modalButton"
       data-toggle="modal" id="execlselect"
       data-bmdSrc="execl_select.member.popup.php?type=7&fvalue=excelform"
       data-bmdWidth="800" data-bmdHeight="300" data-title="엑셀항목선택"
       data-target="#myModal">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<!-- footer 에서 jquery 파일 로드 이후에 코드 넣어줄것 -->
<script>
    (function ($) {
        $.fn.bmdIframe = function (options) {
            var self = this;
            var settings = $.extend({
                classBtn: '.bmd-modalButton',
                defaultW: 740,
                defaultH: 560
            }, options);

            $(settings.classBtn)
                .on(
                    'click',
                    function (e) {
                        var dataVideo = {
                            'src': $(this).attr('data-bmdSrc'),
                            'height': $(this).attr(
                                'data-bmdHeight')
                                || settings.defaultH,
                            'width': $(this).attr('data-bmdWidth')
                                || settings.defaultW
                        };
                        //타이틀 변경
                        document.getElementById("myModalLabel").innerHTML = $(
                            this).attr('data-title');

                        // stampiamo i nostri dati nell'iframe
                        $(".modal-dialog")
                            .css(
                                "width",
                                Number($(this).attr(
                                    'data-bmdWidth')) + 100);
                        $(self).find("iframe").attr(dataVideo);
                    });

            // se si chiude la modale resettiamo i dati dell'iframe per impedire ad un video di continuare a riprodursi anche quando la modale e chiusa
            this.on('hidden.bs.modal', function () {
                $(this).find('iframe').html("").attr("src", "");
            });

            return this;
        };

    })(jQuery);

    jQuery(document).ready(function () {
        jQuery("#myModal").bmdIframe();
    });
</script>
<!-- iframe modal -->
<div id="myModal" class="modal fade" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="border-radius: 0px">

            <!-- Modal Header -->
            <div class="modal-header" style="padding-bottom: 10px;">
                <button type="button" class="close" id="modalclose"
                        data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>

            <!-- Modal Body -->
            <div class="modal-body">
                <iframe class="embed-responsive-item" frameborder="0"
                        style="width: 100%;" scrolling="yes"></iframe>
            </div>

            <!-- Modal Footer -->
            <div class="modal-footer" style="padding: 15px 0px;">
                <button type="button" class="btn btn-default"
                        style="height: 30px; width: 70px; border-radius: 1px; padding: 0px"
                        data-dismiss="modal">Close
                </button>
            </div>

        </div>
    </div>
</div>
<SCRIPT LANGUAGE="JavaScript">
    function SendSMS() {
        window.open("sendsms.php", "sendsmspop",
            "width=220,height=350,scrollbars=no");
    }

    function MemberMemo() {
        window.open("member_memoconfirm.php", "memopop",
            "width=250,height=120,scrollbars=no");
    }

    //마우스오버시 말풍선보기
    function helperView(obj, type) {
        var obj;
        var div = eval("document.all." + obj);

        if (type == 'open') {
            div.style.display = "block";
        } else if (type == 'over') {
            div.style.display = "block";
        } else if (type == 'out') {
            div.style.display = "none";
        }
    }
</SCRIPT>

<style>
    .bottomWrap {
        border-top: 1px solid rgba(76, 87, 102, .1);
        height: 45px;
        overflow: hidden;
    }

    .bottomWrap ul {
        float: right;
        margin: 15px 20px 0px 0px;
        overflow: hidden;
    }

    .bottomWrap ul li {
        float: left;
        padding-left: 15px;
        font-size: 13px;
    }

    .bottomWrap ul li a:hover {
        color: #333333;
    }
</style>

<div class="bottomWrap">
    <ul>
        <li><a href="main.php">관리자메인</a></li>
        <li><a HREF="http://demo.getmall.kr/" name="shopurl"
               target="_blank">내 쇼핑몰</a></li>
        <li><a href="#top">위로이동</a></li>
    </ul>
</div>

<iframe name="processFrm" id="processFrm" value="" frameborder='0'
        width="0" height="0" style="display: none;"></iframe>
</body>

</html>
