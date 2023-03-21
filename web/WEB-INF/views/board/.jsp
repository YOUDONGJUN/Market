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
    <title> 문의 게시판 </title>
    <link rel="stylesheet" href="../front/css/reset.css">
    <link rel="stylesheet" href="../front/css/sub-style.css">
</head>
<body>
<div class="container">
    <!-- nav -->
    <c:import url="../default/nav.jsp"/>
    <!-- header -->
    <header>
        <h1>지상 최대 쇼핑몰 <span>동준</span>마켓</h1>
    </header>

    <!-- section -->
    <section>
        <div class="detail">
            <div class="detail-img">
                <c:if test="${data.product_img=='nan' }">
                    <b>이미지가 없습니다</b>
                </c:if>
                <c:if test="${data.product_img!='nan' }">
                    <img src="${contextPath }/board/download?file=${data.product_img }" width="200px" height="200px">
                </c:if>
            </div>

        </div>
        <br>
        <textarea id="content" name="content" rows="10" cols="110"
                  placeholder="상품 내용을 입력하세요">${data.product_main }</textarea>
        <br>
        <c:if test="${data.product_writer==loginUser }">
            <input type="button"
                   value="수정"
                   onclick="location.href='${contextPath}/board/qnaModifyForm.jsp?product_no=${data.product_no }'">
            <input type="button"
                   value="삭제"
                   onclick="location.href='${contextPath}/board/delete?product_no=${data.product_no }&product_img=${data.product_img }'">
            <c:choose>
                <c:when test="${not empty loginUser }"><input type="button"
                                                              onclick="location.href='reply.jsp?bid =${view.bid }'"
                                                              value="답글"> </c:when>
            </c:choose>
        </c:if>
        <input type="button" value="글목록" onclick="location.href='${contextPath}/board/qna.jsp'">
    </section>
</div>
<!-- footer -->
<c:import url="../default/footer.jsp"></c:import>
</body>
</html>