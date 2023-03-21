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
    <title> 판매 게시판 공지사항</title>
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
            <h2>공지사항</h2>
            <!-- 내용 들어갈곳 -->
            <c:if test="${NoticeList.size()==0 }">
            	<div class="empty">
            		<img src="../img/img-empty.png">
            		<h2>게시글이 없어요...</h2>
            		<h3>지금 첫 게시물을 등록해보세요!</h3>
            	</div>
			</c:if>
	        <c:if test="${NoticeList.size()!=0 }">
	        <table style="width: 100%;" class="table-style">
				<tr align = "center">
					<td></td>
					<td width="50%">제목</td>
					<td>작성자</td>
					<td>등록일</td>		
				</tr>
				<c:forEach var="dto" items="${NoticeList }">
				<tr>				
					<td>공지</td>
					<td style="font-weight:bold;"><a href="${contextPath }/board/NoticeView?product_no=${dto.product_no}">${dto.product_title }</a></td>
					<td>${dto.product_writer }</td>				
					<td>
						<fmt:parseDate value="${dto.product_day}" var="product_day" pattern="yyyy-MM-dd HH:mm:ss" />	
						<fmt:formatDate value="${product_day}" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
				</c:forEach>
			</table>
			</c:if>
			<c:choose>
		    	<c:when test="${not empty loginAdmin}">
		    		<div class="btn-wrapper">
		    			<a href="/root/board/NoticeWriteForm" class="btn btn-submit">공지사항 글쓰기</a>
		    		</div>
		    	</c:when>
	    	</c:choose>
        </section>
    </div>
	<!-- footer -->
    <c:import url="../default/footer.jsp"></c:import>
</body>
</html>