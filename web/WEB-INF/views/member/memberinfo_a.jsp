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
    <title>마이페이지</title>
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
        <c:import url="../default/nav.jsp"/>
        <!-- section -->
        <section>
            <h2>회원 정보 수정</h2>
            <div class="mypage">
                <div class="mypage-con">
                    <form action="${contextPath }/member/infoUpdate_a" method="post">
                        <fieldset>
                            <label for="name">이름</label><input type="text" name="name" value="${info.name }" required readonly><br>
        
                            <label for="id">아이디</label><input type="text" name="id" value="${info.id }" required readonly><br>
        
                            <label for="password">비밀번호</label><input type="password" name="pw" value="${info.pw }" required><br>
        
                            <label for="nickname">닉네임</label><input type="text" name="nickname" value="${info.nickname }" required><br>
        
                            <label for="email">이메일</label><input type="email" name="email" value="${info.email }" required><br>
                            <div style="text-align: center;" class="btn-wrapper">
                                <input class="btn" type="submit" value="수정하기">
                                <input class="btn" type="button" value="취소" onClick="history.go(-1)"> 
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
            
        </section>
    </div>
    <!-- footer -->
    <c:import url="../default/footer.jsp"></c:import>
</body>
</html>