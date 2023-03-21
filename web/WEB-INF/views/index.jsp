<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동준 마켓</title>
    <link rel="stylesheet" href="../front/css/reset.css">
    <link rel="stylesheet" href="../front/css/index-style.css">
    <script src="../front/js/jquery-3.6.0.min.js"></script>
    <style>
      .main {
         width:1200px;
         margin:0 auto;
      }

      #slide {
         position:relative;
         width:100%;
         height:800px;
         overflow:hidden;
      }

      #slide * {
         display: inline-block;
      }

      #slide > div {
         position:absolute;
         top:0;
         left:0;
         width: 100%;
         height: 100%;
      }

      #slide .slide-img {
         width: 450px;
         float:right;
         margin-top: 100px;
      }
    </style>
</head>
<body>
   <div class="container">
      <!-- nav -->
      <nav>
         <div class="container">
            <ul class="gnb-lnb">
                  <li class="left-nav home"><a href="/root/index"><span>중고</span>마켓</a></li>
                  <c:choose>
                     <c:when test="${not empty loginUser || not empty loginAdmin}"><li class="left-nav"><a href="/root/board/Notice">공지사항</a></li></c:when>
                  </c:choose>
                  <c:choose>
                     <c:when test="${not empty loginUser || not empty loginAdmin}"><li class="left-nav"><a href="/root/board/boardAllList">팝니다🙌</a></li></c:when>
                  </c:choose>
                  <c:choose>
                      <c:when test="${empty loginUser && empty loginAdmin}"><li class="right-nav"><a href="/root/member/register_form">회원가입</a></li></c:when>
                  </c:choose>
                  <c:choose>
                     <c:when test="${not empty loginUser || not empty loginAdmin}"><li class="left-nav"><a href="/root/board/qna">문의 하기</a></li></c:when>
                  </c:choose>
               <c:choose>      
                     <c:when test="${empty loginUser && empty loginAdmin}"><li class="right-nav"><a href="/root/member/login">로그인</a></li></c:when>
                     <c:when test="${not empty loginUser || not empty loginAdmin}"><li class="right-nav"><a href="/root/member/logouttest">로그아웃</a></li></c:when>
               </c:choose>
               <c:choose>
                     <c:when test="${not empty loginAdmin}">
                        <li class="right-nav clicked"><a href="/root/member/memberList">회원 관리</a></li>
                        <li class="right-nav profile-ico"><a href="/root/member/memberList"><img src="img/ico-profile.png" alt=""></a></li>
                     </c:when>
                     <c:when test="${not empty loginUser }">
                        <li class="right-nav clicked"><a href="/root/member/mypage?id=${loginUser }">마이페이지</a></li>
                        <li class="right-nav profile-ico"><a href="/root/member/mypage?id=${loginUser}"><img src="img/ico-profile.png" alt=""></a></li>
                     </c:when>
                  </c:choose>
                  <c:choose>
                     <c:when test="${empty loginUser && empty loginAdmin}"><li class="right-nav"><a href="https://thecheat.co.kr/rb/?mod=_search">더치트 바로가기</a></li></c:when>
                     <c:when test="${not empty loginUser || not empty loginAdmin}"><li class="right-nav"><a href="https://thecheat.co.kr/rb/?mod=_search">더치트 바로가기</a></li></c:when>
               </c:choose>
              </ul>
         </div>
           
       </nav>
        <!-- header -->
        <header>
            <div class="main">
		        <div id="slide">
		            <div><h1>편리한 중고 거래 플랫폼,<br><span>중고</span>마켓</h1><img class="slide-img" src="img/index-img.png" alt=""></div>
		            <div><h1>집 안에 안쓰는 물건이 있으신가요?<br>중고마켓에 올려보세요! 💰</h1><img class="slide-img" src="img/index-img3.png" alt=""></div>
		        </div>
	    	</div>
        </header>
    </div>
    <!-- section -->
    <section>
        <article>
            <div class="container">
                <h2>지금 중고마켓과 함께 하세요!</h2>
                  <c:if test="${empty loginUser && empty loginAdmin}">
               <div class="btn-wrapper">
                  <div class="btn"><a href="/root/member/register_form">가입하기</a></div>
               </div>
                   
                </c:if>
                <c:if test="${not empty loginUser }">
                   <h2>${loginUser }님 환영합니다</h2>
                </c:if>
                <c:if test="${not empty loginAdmin }">
                   <h2>${loginAdmin }님 환영합니다</h2>
                </c:if>
            </div>
        </article>
    </section>
    <!-- footer -->
    <footer>
       <div class="container">
           <a href="https://github.com/KoreaAcademeTeamFive" target="_blank"><img src="img/icon-github.png" alt="" class="ico-github"></a>
           <div class="text">
               <p>안범기 유동준 이승정 이덕현</p>
               <p>Copyright 2022. TeamFive. All Rights Reserved.</p>
           </div>
       </div>
    </footer>
    <script>
        $('#slide > div:gt(0)').hide();

        setInterval(function(){
            $('#slide > div:first')
                .fadeOut(1000)
                .next()
                .fadeIn(1000)
                .end()
                .appendTo('#slide');
        },2000);
    </script>
</body>
</html>