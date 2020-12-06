<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<HTML>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@ include file="admin_head.jsp" %>
        <link rel="stylesheet" href="/css/admin_main.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
        <%@ include file="admin_check.jsp" %>

        <title>관리자 페이지 - 메인화면</title>
        <script src="./js/jquery-3.5.1.min.js"></script>
        <script src="./js/adminMain.js"></script>
    </head>
    <body>
    <div class="container">
        <div class="my-calendar clearfix">
            <div class="clicked-date">
                <div class="cal-day"></div>
                <div class="cal-date"></div>
            </div>
            <div class="calendar-box">
                <div class="ctr-box clearfix">
                    <button type="button" title="prev" class="btn-cal prev">
                    </button>
                    <span class="cal-month"></span>
                    <span class="cal-year"></span>
                    <button type="button" title="next" class="btn-cal next">
                    </button>
                </div>
                <table class="cal-table">
                    <thead>
                    <tr>
                        <th>S</th>
                        <th>M</th>
                        <th>T</th>
                        <th>W</th>
                        <th>T</th>
                        <th>F</th>
                        <th>S</th>
                    </tr>
                    </thead>
                    <tbody class="cal-body"></tbody>
                </table>
            </div>
        </div>
        <!-- // .my-calendar -->
    </div>
    </body>
</html>

