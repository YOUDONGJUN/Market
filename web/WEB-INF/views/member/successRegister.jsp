<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 완료</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/sub-style.css">
</head>
<body>
    <div class="container">
        <!-- nav -->
        <nav>
        	<div class="container">
	            <ul class="gnb-lnb">
	                <li class="left-nav home"><a href="/root/index"><span>중고</span>마켓</a></li>
	                <!--  <li class="left-nav clicked"><a href="/root/board/boardAllList">팝니다🙌</a></li>-->
	                <!--  <li class="left-nav"><a href="/root/board/qna">문의하기</a></li>-->
	                <li class="right-nav join"><a href="/root/member/register_form">회원가입</a></li>
	                <li class="right-nav"><a href="/root/member/login">로그인</a></li>
	            </ul>
            </div>
        </nav>
        
        <!-- section -->
        <section class="join-complete">
            <p class="emoge">👏</p>
            <br>
            <h1> 환영합니다!</h1>
            <p>회원가입이 완료되었습니다!</p>
            <p>중고마켓에서 즐거운 거래되세요!</p>
            <div class="btn-wrapper">
                <a href="/root/index"><div>홈으로</div></a>
                <a href="/root/member/login"><div>로그인</div></a>
            </div>
            
        </section>
        
    </div>
    <!-- footer -->
    <footer>
        <div class="container">
            <a href="https://github.com/KoreaAcademeTeamFive" target="_blank"><img src="../img/icon-github.png" alt="" class="ico-github"></a>
            <div class="text">
                <p>안범기 유동준 이승정 이덕현</p>
                <p>Copyright 2022. TeamFive. All Rights Reserved.</p>
            </div>
        </div>
    </footer>
</body>
</html>