<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<nav>
    <div class="container">
        <ul class="gnb-lnb">
            <li class="left-nav home"><a href="../index.jsp"><span>동준</span>마켓</a></li>
            <c:choose>
                <c:when test="${not empty loginUser || not empty loginAdmin}">
                    <li class="left-nav"><a href="../board/Notice.jsp">공지사항</a></li>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${not empty loginUser || not empty loginAdmin}">
                    <li class="left-nav"><a href="../board/boardAllList.jsp">팝니다🙌</a></li>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${empty loginUser && empty loginAdmin}">
                    <li class="right-nav"><a href="../user/register.jsp">회원가입</a></li>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${not empty loginUser || not empty loginAdmin}">
                    <li class="left-nav"><a href="../board/qna.jsp">문의 하기</a></li>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${empty loginUser && empty loginAdmin}">
                    <li class="right-nav"><a href="../user/login.jsp">로그인</a></li>
                </c:when>
                <c:when test="${not empty loginUser || not empty loginAdmin}">
                    <li class="right-nav"><a href="/user/logoutTest">로그아웃</a></li>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${not empty loginAdmin}">
                    <li class="right-nav clicked"><a href="../user/userList.jsp">회원 관리</a></li>
                    <li class="right-nav profile-ico"><a href="../user/userList.jsp"><img
                            src="../front/img/ico-profile.png" alt=""></a></li>
                </c:when>
                <c:when test="${not empty loginUser }">
                    <li class="right-nav clicked"><a href="../user/myPage.jsp?id=${loginUser }">마이페이지</a></li>
                    <li class="right-nav profile-ico"><a href="../user/myPage.jsp?id=${loginUser}"><img
                            src="../front/img/ico-profile.png" alt=""></a></li>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${empty loginUser && empty loginAdmin}">
                    <li class="right-nav"><a href="https://thecheat.co.kr/rb/?mod=_search">더치트 바로가기</a></li>
                </c:when>
                <c:when test="${not empty loginUser || not empty loginAdmin}">
                    <li class="right-nav"><a href="https://thecheat.co.kr/rb/?mod=_search">더치트 바로가기</a></li>
                </c:when>
            </c:choose>
        </ul>
    </div>
</nav>
</body>
</html>