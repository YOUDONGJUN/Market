<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <link rel="stylesheet" href="../front/css/reset.css">
    <link rel="stylesheet" href="../front/css/sub-style.css">
    <style>
        section {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <!-- nav -->
    <c:import url="../default/nav.jsp"/>
    <!-- section -->
    <section class="myPage-home">
        <h2>마이페이지</h2>
        <div>
            <a href="info?id=${user.id }" id="">
                <img src="../front/img/ico-profile.png" alt="">
                <h3>내 정보 수정</h3>
            </a>
        </div>
        <div>
            <a href="../board/myPageList.jsp?id=${user.id }">
                <img src="../front/img/ico-board.png" alt="">
                <h3>내가 쓴 글</h3>
            </a>
        </div>
        <div>
            <a href="userDelete?id=${user.id }">
                <img src="../front/img/ico-exit.png" alt="">
                <h3>회원탈퇴</h3>
            </a>
        </div>

    </section>
</div>
<!-- footer -->
<c:import url="../default/footer.jsp"></c:import>
</body>
</html>