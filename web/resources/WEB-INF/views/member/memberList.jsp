<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
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
        <section>
        	<h2>회원 관리</h2>
            <div class="mypage">
			<div class="mypage-con">
				<table border="1">
					<tr align = "center" bgcolor="#F2F2F2">
						<td>아이디</td>
						<td>비밀번호</td>
						<td>이름</td>
						<td>이메일</td>
						<td>닉네임</td>
						<td></td>		
					</tr>
					<c:forEach var="list" items="${list }">
					<tr>				
						<td>${list.id }</td>
						<td>${list.pw }</td>
						<td>${list.name }</td>
						<td>${list.email }</td>
						<td>${list.nickname }</td>
						<td>
							<input class="btn btn2" type="button" value="수정" onclick="location.href='info_a?id=${list.id }'">
							<input class="btn btn2" type="button" value="삭제" onclick="location.href='memberDelete?id=${list.id }'">	
						</td>
					</tr>
					</c:forEach>
				</table>
			</div>
			</div>
        </section>
    </div>
    <!-- footer -->
    <c:import url="../default/footer.jsp"></c:import>
</body>
</html>