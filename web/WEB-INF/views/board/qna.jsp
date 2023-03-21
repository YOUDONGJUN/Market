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
    <title>문의 게시판</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/sub-style.css">
</head>
<body>
	<!-- container -->
    <div class="container">
    	<!-- nav -->
        <c:import url="../default/nav.jsp"/>
        <!-- header -->
        <header class="sub">
            <h1>안쓰는 물건 사고팔땐,<br><span>중고</span>마켓</h1>
        </header>
        <!-- section -->
        <section>
            <h2>문의게시판 🙌</h2>
            <div class="notice">
                <div class="btn ico-notice">공지</div>
                <a href="Notice">공지사항</a>
            </div>
            <form class="search" action="${contextPath }/board/qnaList.do" enctype="multipart/form-data" method="post">
		        <select name="searchOption">
		            <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
		            <option value="product_title" <c:out value="${map.searchOption == 'product_title'?'selected':''}"/> >제목</option>
		            <option value="product_main" <c:out value="${map.searchOption == 'product_main'?'selected':''}"/> >내용</option>
		            <option value="product_writer" <c:out value="${map.searchOption == 'product_writer'?'selected':''}"/> >이름</option>
		            <option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/> >제목+내용+이름</option>
		        </select>
		        <input name="keyword" value="${map.keyword}">
		        <input type="submit" class="btn btn-submit" value="검색">
		    </form>
            <c:if test="${qna.size()==0 }">
            	<div class="empty">
            		<img src="../img/img-empty.png">
            		<h2>게시글이 없어요...</h2>
            		<h3>지금 첫 게시물을 등록해보세요!</h3>
            	</div>
			</c:if>
			<c:if test="${map.list.size()==0 }">
            	<div class="empty">
            		<img src="../img/img-empty.png">
            		<h2>검색결과가 없습니다</h2>
            	</div>
			</c:if>
	        <table style="width: 100%;" class="table-style">
				<c:if test="${qna.size()!=0 }">
				<c:if test="${map.list.size()!=0 }">
				<tr align = "center">
					<td>No.</td>
					<td width="50%">제목</td>
					<td>작성자</td>
					<td>등록일</td>		
				</tr>
				</c:if>
				</c:if>
				<c:forEach var="dto" items="${qna }">
				<tr>				
					<td>${dto.product_no }</td>
					<td><a href="${contextPath }/board/qnacontentView?product_no=${dto.product_no}">${dto.product_title }</a></td>
					<td>${dto.product_writer }</td>				
					<td>
						<fmt:parseDate value="${dto.product_day}" var="product_day" pattern="yyyy-MM-dd HH:mm:ss" />	
						<fmt:formatDate value="${product_day}" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
				</c:forEach>
				<c:forEach var="row" items="${map.list}">
				<tr>				
					<td>${row.product_no }</td>
					<td><a href="${contextPath }/board/qnacontentView?product_no=${row.product_no}">${row.product_title }</a></td>
					<td>${row.product_writer }</td>				
					<td>
						<fmt:parseDate value="${row.product_day}" var="product_day" pattern="yyyy-MM-dd HH:mm:ss" />	
						<fmt:formatDate value="${product_day}" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
				</c:forEach>
			</table>	
			<table class="paging">
				<tr>
					<td colspan="4" align="center">
						<c:forEach var="num" begin="1" end="${repeat }">
							<a href="qna?num=${num }">${num }</a>
						</c:forEach>
					</td>
				</tr>	
			</table>
			<div class="btn-wrapper">
				<a href="/root/board/qnawriteForm" class="btn">글쓰기</a>
			</div>
        </section>
    </div>  
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>