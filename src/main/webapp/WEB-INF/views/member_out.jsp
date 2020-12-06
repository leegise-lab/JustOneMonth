<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<title>저스트원</title>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="./css/member_out.css">
    <%@ include file="user_header.jsp" %>
    <%@include file="userCheck.jsp" %>
</head>
<body>
<div class="box">
    <div class="out_txt">
        <h2 class="font">회원 탈퇴 신청</h2>
    </div>
    <script type="text/javascript">
        // $(document).ready(function(){
        //     // 취소
        //     $(".cancel_btn").on("click", function(){
        //
        //         location.href = "/login";
        //
        //     })
        //
        //     $("#submit").on("click", function(){
        //         if($("#memPass").val()==""){
        //             alert("비밀번호를 입력해주세요.");
        //             $("#memPass").focus();
        //             return false;
        //         }
        //     });
        //
        //
        //
        // })
    </script>
    <div class="margin_auto comment">
        <p>저희 쇼핑몰의 <span>부족했던 점</span> 과 <span>아쉬웠던 점</span>을 적어주십시오.<br>
            더 좋은 모습으로 발전하도록 최선을 다하겠습니다.<br>
            <br>
            <span style="font-weight: bold; color: black">앞으로 더 나은 모습으로 고객님을 다시 만날 수 있도록 노력하겠습니다.<br>
            그동안 이용해주신 것을 진심으로 감사드립니다 :-)</span>
        </p>
    </div>
    <div class="reason_box margin_auto">
        <table align="center">
            <td class="reason_table1" width="50"><span style="font-weight: bold">탈퇴 사유</span></td>
            <form method="Post" action="/memberOutOk">
                <td width="100" ><textarea type="text" class="write_box"></textarea></td>
        </table>
        <div class="margin_auto btn_box">
            <div class="form-group has-feedback">
                <label class="control-label" for="memPass" style="font-weight: bold">패스워드</label>
                <input class="form-control" type="password" id="memPass" name="memPass" />
            </div>
            <input type="submit" class="out_btn CSSbuttonOut" value="회원 탈퇴">
            <input type="button" class="cancel_btn CSSbuttonCancel" value="탈퇴 취소" onclick="location.href='/main'">
            </form>
        </div>
    </div>
</div>
<footer>
    <%@include file="user_footer.jsp" %>
</footer>
</body>
</html>