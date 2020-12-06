<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%  HttpSession httpSession = request.getSession();
    httpSession.invalidate();
    request.setCharacterEncoding("UTF-8");
%>




<meta charset="UTF-8">
<title>로그 아웃</title>


    <script>
    alert("로그아웃 되었습니다.");
    location.href='main';

    </script>