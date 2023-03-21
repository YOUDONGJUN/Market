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
    <title>공지사항</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/sub-style.css">
    <style>
        section {
            text-align: center;
        }
    </style>
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
        <section class="writing">
            <h2>공지사항</h2>
            <form action="${contextPath }/board/NoticeWriteSave" method="post">
                <fieldset>
                    <input type="hidden" name="product_type" value="C">
                	<input type="hidden" name="product_writer" value="${loginAdmin }">
                	<p class="wr-title">제목<input type="text" name="product_title" placeholder="제목을 입력해주세요" required></p>
                    <textarea name="product_main" id="wr-con" cols="130" rows="20" placeholder="본문 내용을 입력해주세요." required></textarea>
                    <div class="btn-wrapper">
                        <div class="btn btn-submit"><a href="/root/board/boardAllList">&lt; back</a></div>
                        <input class="btn" type="submit" value="수정">
                    </div>
                </fieldset>
            </form>
        </section>
    </div>
	<!-- footer -->
    <c:import url="../default/footer.jsp"></c:import>
</body>
</html>