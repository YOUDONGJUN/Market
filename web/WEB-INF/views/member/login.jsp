<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/sub-style.css">
    <style>
        section {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- nav -->
        <nav>
        	<div class="container">
	            <ul class="gnb-lnb">
	                <li class="left-nav home"><a href="/root/index"><span>중고</span>마켓</a></li>
	                <li class="right-nav join"><a href="/root/member/register_form">회원가입</a></li>
	                <li class="right-nav"><a href="/root/member/login">로그인</a></li>
	                <li class="right-nav"><a href="https://thecheat.co.kr/rb/?mod=_search">더치트 바로가기</a></li>
	            </ul>
            </div>
        </nav>
        <!-- section -->
        <section>
            <h2>로그인</h2>
            <p>중고마켓을 이용하시려면 로그인 해주세요.</p>
            <form action="${contextPath }/member/logintest" method="post">
                <fieldset>
                    <label for="id">아이디</label><input type="text" name="id" placeholder="아이디를 입력해주세요" required><br>

                    <label for="pw">비밀번호</label><input type="password" name="pw" placeholder="비밀번호를 입력해주세요" required><br>

                    <div style="text-align: center;" class="btn-wrapper">
                        <input class="btn btn-submit" type="submit" value="로그인">
                        <a href="/root/member/register_form" class="btn btn-submit">회원가입</a>
                    </div>
                </fieldset>
            </form>    
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

