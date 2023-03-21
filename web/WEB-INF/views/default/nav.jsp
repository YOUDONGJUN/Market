<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
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
	            <li class="left-nav home"><a href="/root/index"><span>동준</span>마켓</a></li>
	            <c:choose>
		   				<c:when test="${not empty loginUser || not empty loginAdmin}"><li class="left-nav"><a href="/root/board/Notice">공지사항</a></li></c:when>
		        </c:choose>
		        <c:choose>
	   				<c:when test="${not empty loginUser || not empty loginAdmin}"><li class="left-nav"><a href="/root/board/boardAllList">팝니다🙌</a></li></c:when>
	            </c:choose>
	            <c:choose>
	          		<c:when test="${empty loginUser && empty loginAdmin}"><li class="right-nav"><a href="/root/member/register_form">회원가입</a></li></c:when>
	            </c:choose>
	            <c:choose>
		   			<c:when test="${not empty loginUser || not empty loginAdmin}"><li class="left-nav"><a href="/root/board/qna">문의 하기</a></li></c:when>
		        </c:choose>
	            <c:choose>
				   	<c:when test="${empty loginUser && empty loginAdmin}"><li class="right-nav"><a href="/root/member/login">로그인</a></li></c:when>
				   	<c:when test="${not empty loginUser || not empty loginAdmin}"><li class="right-nav"><a href="/root/member/logouttest">로그아웃</a></li></c:when>
				</c:choose>
				<c:choose>
	   				<c:when test="${not empty loginAdmin}">
						<li class="right-nav clicked"><a href="/root/member/memberList">회원 관리</a></li>
						<li class="right-nav profile-ico"><a href="/root/member/memberList"><img src="../img/ico-profile.png" alt=""></a></li>
	   				</c:when>
	   				<c:when test="${not empty loginUser }">
	   					<li class="right-nav clicked"><a href="/root/member/mypage?id=${loginUser }">마이페이지</a></li>
	   					<li class="right-nav profile-ico"><a href="/root/member/mypage?id=${loginUser}"><img src="../img/ico-profile.png" alt=""></a></li>
	   				</c:when>
		    	</c:choose>
		    	<c:choose>
		            	<c:when test="${empty loginUser && empty loginAdmin}"><li class="right-nav"><a href="https://thecheat.co.kr/rb/?mod=_search">더치트 바로가기</a></li></c:when>
					   	<c:when test="${not empty loginUser || not empty loginAdmin}"><li class="right-nav"><a href="https://thecheat.co.kr/rb/?mod=_search">더치트 바로가기</a></li></c:when>
				</c:choose>
        	</ul>
        </div>
    </nav>
</body>
</html>