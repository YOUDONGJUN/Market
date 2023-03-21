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
    <title>팝니다🙌</title>
    <link rel="stylesheet" href="..front/css/reset.css">
    <link rel="stylesheet" href="..front/css/sub-style.css">
</head>
<body>
<!-- container -->
<div class="container">
    <!-- nav -->
    <c:import url="../default/nav.jsp"/>
    <!-- header -->
    <header class="sub">
        <h1>지상 최대 쇼핑몰 <br><span>동준</span>마켓</h1>
    </header>
    <!-- section -->
    <section>
        <h2>팝니다🙌</h2>
        <div class="notice">
            <div class="btn ico-notice">공지</div>
            <a href="Notice">공지사항</a>
        </div>
        <form class="search" action="${contextPath }/board/boardList.do" enctype="multipart/form-data" method="post">
            <select name="searchOption">
                <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
                <option value="product_title" <c:out value="${map.searchOption == 'product_title'?'selected':''}"/> >
                    제목
                </option>
                <option value="product_main" <c:out value="${map.searchOption == 'product_main'?'selected':''}"/> >내용
                </option>
                <option value="product_writer" <c:out value="${map.searchOption == 'product_writer'?'selected':''}"/> >
                    이름
                </option>
                <option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/> >제목+내용+이름</option>
            </select>
            <input name="keyword" value="${map.keyword}">
            <input type="submit" class="btn btn-submit" value="검색">
        </form>
        <c:if test="${boardList.size()==0 }">
            <div class="empty">
                <img src="../front/img/img-empty.png">
                <h2>게시글이 없어요...</h2>
                <h3>지금 첫 게시물을 등록해보세요!</h3>
            </div>
        </c:if>
        <c:set var="i" value="0"/>
        <c:set var="j" value="4"/>
        <!-- table 시작 -->
        <table class="pro-board">
            <c:forEach var="dto" items="${boardList }">
            <input type="hidden" name="type" value="A">
            <c:if test="{i%j==0}">
            <tr>
                </c:if>
                <td>
                    <div class="pro-column">
                        <a href="${contextPath }/board/contentView?product_no=${dto.product_no}">
                            <img src="${contextPath }/board/download?file=${dto.product_img }"
                                 onerror="this.src='https://ifh.cc/g/o5Tpl9.png';"/>
                        </a>
                        <p class="pro-title">
                            <a href="${contextPath }/board/contentView?product_no=${dto.product_no}">${dto.product_title }</a>
                        </p>
                    </div>

                </td>
                <c:if test="${i%j==j-1}">
            <tr>
                </c:if>
                    <c:set var="i" value="${i+1}"/>
                </c:forEach>
        </table>
        <table class="pro-board">
            <c:if test="${map.list.size()==0 }">
                <div class="empty">
                    <img src="..front/img/img-empty.png">
                    <h2>검색결과가 없습니다</h2>
                </div>
            </c:if>
            <c:forEach var="row" items="${map.list}">
            <input type="hidden" name="type" value="A">
            <c:if test="{i%j==0}">
            <tr>
                </c:if>
                <td>
                    <div class="pro-column">
                        <a href="${contextPath }/board/contentView?product_no=${row.product_no}">
                            <img src="${contextPath }/board/download?file=${row.product_img }"
                                 onerror="this.src='https://ifh.cc/g/o5Tpl9.png';">
                        </a>
                        <p class="pro-title">
                            <a href="${contextPath }/board/contentView?product_no=${row.product_no}">${row.product_title }</a>
                        </p>
                    </div>
                </td>
                <c:if test="${i%j==j-1}">
            <tr>
                </c:if>
                    <c:set var="i" value="${i+1}"/>
                </c:forEach>
        </table>
        <table class="paging">
            <tr>
                <td colspan="6" align="center">
                    <c:forEach var="num" begin="1" end="${repeat }">
                        <a href="boardAllList.jsp?num=${num }">${num }</a>
                    </c:forEach>
                </td>
            </tr>
        </table>
        <div class="btn-wrapper">
            <a href="../board/writeForm.jsp" class="btn btn-submit">글쓰기</a>
        </div>
    </section>
</div>
<!-- footer -->
<c:import url="../default/footer.jsp"></c:import>
</body>
</html>