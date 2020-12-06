<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>


<%
    String userid = (String)session.getAttribute("loginId");
    if (session.getAttribute("loginId") == null ) {
   %>
<script>alert("접근 권한이 없습니다");
location.href = "/main"
</script>
<%

    }else if(!userid.equals("admin_juston")){
  %>
<script>alert("접근 권한이 없습니다");
location.href = "/main"
</script>
<%
    }
%>