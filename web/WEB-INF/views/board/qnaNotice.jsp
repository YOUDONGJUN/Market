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
    <title> 문의 게시판 공지사항</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/sub-style.css">
</head>
<body>
    <div class="container">
        <!-- nav -->
		<c:import url="../default/nav.jsp"/>
        <!-- header -->
        <header class="sub">
            <h1>안쓰는 물건 사고팔땐,<br><span>중고</span>마켓</h1>
        </header>

        <!-- section -->
        <section class="qna-form">
            <h2>문의 게시판 공지사항</h2>
            <!-- 내용 들어갈곳 -->
            <div class="title">"사기치지 말아주세요"</div>
			<br>
			<c:if test="${data.product_writer==loginUser }">
				<input type="button" 
				       value="수정" onclick="location.href='${contextPath}/board/qnamodifyform?product_no=${data.product_no }'">
				<input type="button" 
			           value="삭제" onclick="location.href='${contextPath}/board/qnadelete?product_no=${data.product_no }&product_img=${data.product_img }'">
			</c:if>
			<c:if test="${data.product_writer==loginUser }">
				<form method="post" action ="/reply/write">
				<p>
				<label>댓글 작성자</label> <input  type="text" name="${data.product_writer}">
				</p>
				<p>
				<textarea rows="5" cols="50" name="content"></textarea>
				</p>
				<input type="hidden" name="bno" value="${view.bno}">
					<button type="submit">댓글 작성</button>
				</form>
			</c:if>
			<div class="btn-wrapper">
				<input class="btn" type="button" value="글목록" onclick="location.href='${contextPath}/board/qna'">
			</div>
        </section>
    </div>
	<!-- footer -->
    <c:import url="../default/footer.jsp"></c:import>
</body>
</html>