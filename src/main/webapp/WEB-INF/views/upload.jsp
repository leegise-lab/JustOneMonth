
<%--
  Created by IntelliJ IDEA.
  User: 소정후
  Date: 2020-11-01
  Time: 오후 8:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="admin_check.jsp" %>
<!DOCTYPE html>
<HTML>
<%@ include file="admin_head.jsp" %>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<style>
    ul li{font-family: 'Nanum Gothic';}
    body{font-family: 'Nanum Gothic';}
    table td, table tr{font-family: 'Nanum Gothic';}
    table div{font-family: 'Nanum Gothic';}
    label, label p, label div, td label, tr label, p label{font-family: 'Nanum Gothic'; font-size: 13px;}
    td .table_cell{font-size: 15px;}

</style>
<body>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<META http-equiv="X-UA-Compatible" content="IE=edge"/>
<script src="./jq/jquery-3.5.1.min.js"></script>
<script src="./jq/jq1.js"></script>
<link href="./css/upload.css" rel="stylesheet">
<head>

</head>

<div class="rightWrap" style="margin-left: 340px; margin-right: 10px;">
    <h2>상품 등록</h2>
    <form name="regform" id="regform" method="post" action="upload_item_ok">
        <table class="main_table">
            <tr>
                <td class="title">제품명</td>
                <td><input type="text" name="up_name" id="up_name"></td>
            </tr>
            <tr>
                <td class="title">카테고리</td>
                <td>
                    <select class="item_option" name="up_category1" id="up_category1" onchange="categoryChange(this)">
                        <option value="#">-- 옵션 선택 --</option>
                        <option value="1">OUTER</option>
                        <option value="2">PANTS</option>
                        <option value="3">OPS/SKIRT</option>
                        <option value="4">KNIT/CARDIGAN</option>
                        <option value="5">BAG/SHOES/ACC</option>
                        <option value="6">LEGGINGS/SOCKS</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="title">세부 카테고리</td>
                <td>
                    <select class="item_option" name="up_category2" id="up_category2">
                        <option value="#">-- 옵션 선택 --</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="title">가격</td>
                <td>
                    <input type="text" name="up_price" id="up_price">
                </td>
            </tr>
            <tr>
                <td class="title">상품색상</td>
                <td>
                    <table cellpadding="0" cellspacing="0" class="inner_table">
                        <tr>
                            <td><label><input type="checkbox" id="color_idx1" name="color_idx[]" value="빨간색"
                                              class="checkbox" /> <span>빨간색</span></label>
                            </td>
                            <td><input type="checkbox" id="color_idx2" name="color_idx[]" value="주황색"
                                       class="checkbox" /> <label for="color_idx2">주황색</label>
                            </td>
                            <td><input type="checkbox" id="color_idx3" name="color_idx[]" value="황금색"
                                       class="checkbox" /> <label for="color_idx3">황금색</label>
                            </td>
                            <td><input type="checkbox" id="color_idx4" name="color_idx[]" value="노란색"
                                       class="checkbox" /> <label for="color_idx4">노란색</label>
                            </td>
                            <td><input type="checkbox" id="color_idx5" name="color_idx[]" value="연두색"
                                       class="checkbox" /> <label for="color_idx5">연두색</label>
                            </td>
                            <td><input type="checkbox" id="color_idx6" name="color_idx[]" value="초록색"
                                       class="checkbox" /> <label for="color_idx6">초록색</label>
                            </td>
                            <td><input type="checkbox" id="color_idx7" name="color_idx[]" value="하늘색"
                                       class="checkbox" /> <label for="color_idx7">하늘색</label>
                            </td>
                            <td><input type="checkbox" id="color_idx8" name="color_idx[]" value="파란색"
                                       class="checkbox" /> <label for="color_idx8">파란색</label>
                            </td>
                            <td><input type="checkbox" id="color_idx9" name="color_idx[]" value="남색"
                                       class="checkbox" /> <label for="color_idx9">남색</label>
                            </td>
                            <td><input type="checkbox" id="color_idx10" name="color_idx[]" value="흰색"
                                       class="checkbox" /> <label for="color_idx10">흰색</label></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="color_idx11" name="color_idx[]" value="은색"
                                       class="checkbox" /> <label for="color_idx11">은색</label></td>
                            <td><input type="checkbox" id="color_idx12" name="color_idx[]" value="검은색"
                                       class="checkbox" /> <label for="color_idx12">검은색</label></td>
                            <td><input type="checkbox" id="color_idx13" name="color_idx[]" value="카키색"
                                       class="checkbox" /> <label for="color_idx13">카키색</label></td>
                            <td><input type="checkbox" id="color_idx14" name="color_idx[]" value="갈색"
                                       class="checkbox" /> <label for="color_idx14">갈색</label></td>
                            <td><input type="checkbox" id="color_idx15" name="color_idx[]" value="보라색"
                                       class="checkbox" /> <label for="color_idx15">보라색</label></td>
                            <td><input type="checkbox" id="color_idx16" name="color_idx[]" value="자주색"
                                       class="checkbox" /> <label for="color_idx16">자주색</label></td>
                            <td><input type="checkbox" id="color_idx17" name="color_idx[]" value="분홍색"
                                       class="checkbox" /> <label for="color_idx17">분홍색</label></td>
                            <td><input type="checkbox" id="color_idx18" name="color_idx[]" value="회색"
                                       class="checkbox" /> <label for="color_idx18">회색</label></td>
                            <td><input type="checkbox" id="color_idx19" name="color_idx[]" value="기타"
                                       class="checkbox" /> <label for="color_idx19">기타</label></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="title">상품 사이즈</td>
                <td>

                    <table cellpadding="0" cellspacing="0" class="inner_table2">
                        <tr>
                            <td><input type="checkbox" name="up_size" value="XS(85)" class="checkbox" />
                                <label>XS(85)</label>
                            </td>
                            <td><input type="checkbox" name="up_size" value="S(90)" class="checkbox" />
                                <label>S(90)</label>
                            </td>
                            <td><input type="checkbox" name="up_size" value="M(95)" class="checkbox" />
                                <label>M(95)</label>
                            </td>
                            <td><input type="checkbox" name="up_size" value="L(100)" class="checkbox" />
                                <label>L(100)</label>
                            </td>
                            <td><input type="checkbox" name="up_size" value="XL(105)" class="checkbox" />
                                <label>XL(105)</label>
                            </td>
                            <td><input type="checkbox" name="up_size" value="XXL(110)" class="checkbox" />
                                <label>XXL(110)</label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="title">상품 대표 사진 </td>
                <td><input type="file" name="up_file1" id="file1"></td>
            </tr>
            <tr>
                <td class="title">상품 설명 사진 </td>
                <td><input type="file" multiple="multiple" name="up_file2" id="file2"></td>
            </tr>
            <tr>
                <td class="title">info pic </td>
                <td><input type="file" multiple="multiple" name="up_file3" id="file3"></td>
            </tr>
        </table>
        <p><input type="submit" value="상품 등록"></p>
    </form>
</div>
</body>
</html>
