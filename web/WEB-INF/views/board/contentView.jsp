<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 팝니다.</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/sub-style.css">
</head>
<body>
    <div class="container">
        <!-- nav -->
		<c:import url="../default/nav.jsp"/>
        <!-- header -->
        <header class="sub">
            <h1>안쓰는 물건 사고팔땐, <span>중고</span>마켓</h1>
        </header>

        <!-- section -->
        <section>
            <div class="detail">
                <div class="detail-img">
                    <c:if test="${data.product_img=='nan' }">
						<b>이미지가 없습니다</b>
					</c:if>
					<c:if test="${data.product_img!='nan' }">
						<img src="${contextPath }/board/download?file=${data.product_img }" width="400px">
					</c:if>
                </div>
                <div class="detail-article">
                    <h2>${data.product_title }</h2>
                    <h2><fmt:formatNumber value="${data.product_price }" type="number" />원</h2>
                    <table border="1">
                        <tr>
                        	<th>글 번호</th>
                        	<td>${data.product_no }</td>
                        	<th>작성자</th>
                        	<td>${data.product_writer }</td>
                        </tr>
                        <tr>
                            <th>금액</th>
							<td><fmt:formatNumber value="${data.product_price }" type="number" />원</td>
                            <th>흥정 여부</th>
                        	<td>${data.product_status1 }</td>   
                        </tr>
                        <tr>
                            <th>상품 상태</th>
							<td>${data.product_status }</td>
                            <th>거래 방법</th>
							<td>${data.product_trade}</td>
                        </tr>
                    </table>
                </div>
            </div>
            <br>
			<textarea id="content" name="content" rows="10" cols="110" readonly placeholder="상품 내용을 입력하세요">${data.product_main }</textarea>
			<br>
			
				<div class="btn-wrapper">
					</div>
			<br>
			<c:choose>
				<c:when test="${not empty loginAdmin }">
					<div class="btn-wrapper">
						<input class="btn" type="button" 
						       value="수정" onclick="location.href='${contextPath}/board/modifyForm?product_no=${data.product_no }'">
						<input class="btn" type="button" 
					           value="삭제" onclick="location.href='${contextPath}/board/delete?product_no=${data.product_no }&product_img=${data.product_img }'">
					    <input class="btn" type="button" value="글목록" onclick="location.href='${contextPath}/board/boardAllList'">
				    </div>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${empty loginAdmin }">
					<c:if test="${data.product_writer==loginUser}">
						<div class="btn-wrapper">
							<input class="btn" type="button" 
							       value="수정" onclick="location.href='${contextPath}/board/modifyForm?product_no=${data.product_no }'">
							<input class="btn" type="button" 
						           value="삭제" onclick="location.href='${contextPath}/board/delete?product_no=${data.product_no }&product_img=${data.product_img }'">
						    <input class="btn" type="button" value="글목록" onclick="location.href='${contextPath}/board/boardAllList'">
						</div>
					</c:if>
				</c:when>
			</c:choose>
			
			
        </section>
    </div>
	<!-- footer -->
    <c:import url="../default/footer.jsp"></c:import>
</body>
</html>