<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 완료</title>
    <link rel="stylesheet" href="../front/css/reset.css">
    <link rel="stylesheet" href="../front/css/sub-style.css">
</head>
<body>
<div class="container">
    <!-- nav -->
    <nav>
        <div class="container">
            <ul class="gnb-lnb">
                <li class="left-nav home"><a href="../index.jsp"><span>동준</span>마켓</a></li>
                <!--  <li class="left-nav clicked"><a href="/root/board/boardAllList">팝니다🙌</a></li>-->
                <!--  <li class="left-nav"><a href="/root/board/qna">문의하기</a></li>-->
                <li class="right-nav join"><a href="register.jsp">회원가입</a></li>
                <li class="right-nav"><a href="login.jsp">로그인</a></li>
            </ul>
        </div>
    </nav>

    <!-- section -->
    <section class="join-complete">
        <p class="emoge">👏</p>
        <br>
        <h1> 환영합니다!</h1>
        <p>회원가입이 완료되었습니다!</p>
        <p>동준마켓에서 돈 많이 쓰세용</p>
        <div class="btn-wrapper">
            <a href="../index">
                <div>홈으로</div>
            </a>
            <a href="login.jsp">
                <div>로그인</div>
            </a>
        </div>

    </section>

</div>
<!-- footer -->
<footer>
    <div class="container">
        <%--            <a href="https://github.com/KoreaAcademeTeamFive" target="_blank"><img src="../front/img/icon-github.png" alt="" class="ico-github"></a>--%>
        <div class="text">
            <p>WELCOME TO 동준 MARKET</p>
            <%--                <p>Copyright 2022. All Rights Reserved.</p>--%>
        </div>
    </div>
</footer>
</body>
</html>