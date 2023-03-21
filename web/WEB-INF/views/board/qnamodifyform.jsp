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
    <title>문의 게시글 수정</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	function readURL(input){
		var file=input.files[0] // 파일 정보
		console.log(file)
		if(file!=""){
			var reader=new FileReader()
			reader.readAsDataURL(file) // 파일 정보 읽어오기
			reader.onload=function(e){ // 일기에 성공하면 결과 표시
				$("#preview").attr("src", e.target.result)
			}
		}
	}
	</script>
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
            <h2>문의 게시글수정</h2>
            <form action="${contextPath }/board/qnamodify" enctype="multipart/form-data" method="post">
                <fieldset>
                    <input type="hidden" name="product_type" value="B">
                	<input type="hidden" name="product_writer" value="${loginUser }">
                	<input type="hidden" name="originFileName" value="${data.product_img }">
                	<input type="hidden" name="product_no" value="${data.product_no }">
                    <p class="wr-title">제목<input type="text" name="product_title" value="${data.product_title }" required></p>
                    <textarea name="product_main" id="wr-con" cols="130" rows="20" required><c:out value="${data.product_main }"/></textarea>
                    <input type="file" class="file" name="product_img" onchange="readURL(this)" value="${data.product_img }">
                    <img id="preview" src="${contextPath }/board/download?file=${data.product_img }" width="100px" height="100px">
	               
                    <div class="btn-wrapper">
                        <div class="btn btn-submit"><a href="/root/board/qna">&lt; 취소</a></div>
                        <input class="btn" type="submit" value="수정">
                        <input class="btn" type="button" value="글목록" onclick="location.href='${contextPath }/board/qna'">
                    </div>
                </fieldset>
                
            </form>
        </section>
    </div>
	<!-- footer -->
    <c:import url="../default/footer.jsp"></c:import>
</body>
</html>