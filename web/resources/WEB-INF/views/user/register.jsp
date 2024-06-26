<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="../front/css/reset.css">
    <link rel="stylesheet" href="../front/css/sub-style.css">
    <style>
        section {
            text-align: center;
        }
    </style>

</head>
<body>
<div class="container">
    <!-- nav -->
    <nav>
        <div class="container">
            <ul class="gnb-lnb">
                <li class="left-nav home"><a href="../index.jsp"><span>동준</span>마켓</a></li>
                <li class="right-nav join"><a href="register.jsp">회원가입</a></li>
                <li class="right-nav"><a href="login.jsp">로그인</a></li>
                <li class="right-nav"><a href="https://thecheat.co.kr/rb/?mod=_search">더치트 바로가기</a></li>
            </ul>
        </div>
    </nav>

    <!-- section -->
    <section>
        <h2>회원가입</h2>
        <p>동준마켓에 오신걸 환영합니다! 이제 몇가지 정보만 입력하면 완료됩니다.</p>

        <form id=register name="register" action="register.jsp" method="post">
            <fieldset>
                <label for="name">이름</label><input type="text" name="name" id="name" placeholder="이름을 입력해주세요"
                                                   value="${user.name }" required><br>
                <label for="id">아이디</label><input type="text" name="id" id="id" placeholder="아이디를 입력해주세요"
                                                  value="${user.id }" required>
                <!--  회원가입 버튼에 아이디 중복체크기능있어서 제외 -->
                <button style="margin-left: 20px;" class="btn" type="button" id="idChk" value="N">중복확인</button>
                <!--  <a style="margin-left: 20px;" href="#" class="btn">중복 확인</a><br> -->

                <label for="pw">비밀번호</label><input type="password" name="pw" class="pw" placeholder="비밀번호를 입력해주세요"
                                                   id="pw" required><br>
                <label for="pw2">비밀번호 확인</label><input type="password" name="pw2" class="pw" placeholder="비밀번호를 입력해주세요"
                                                       id="pw2" required><br>
                <!-- <div class="alert alert-success" id="alert-success" style ="display:none">비밀번호가 일치합니다.</div>
                <div class="alert alert-danger" id="alert-danger" style ="display:none">비밀번호가 일치하지 않습니다.</div> -->

                <label for="nickname">닉네임</label><input type="text" name="nickname" id="nickname"
                                                        placeholder="닉네임을 입력해주세요" value="${user.nickname }"
                                                        required><br>
                <div id="nicknameCheck" style="display:none"></div>
                <label for="email">이메일</label><input type="email" name="email" id="email" placeholder="이메일을 입력해주세요"
                                                     value="${user.email }" required><br>
                <input type="hidden" name="type" value="B">
                <div style="text-align: center;" class="btn-wrapper">
                    <input class="btn btn-submit" type="button" value="가입하기" id="duplicatedId">
                </div>
            </fieldset>
            <!-- <fieldset>
                    <p>이름<input type="text" name="name" placeholder="이름을 입력해주세요" value="${user.name }" required></p>
                    <p>아이디<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요" value="${user.id }" required></p>
                    <p>비밀번호<input type="password" name="pw" placeholder="비밀번호를 입력해주세요" required></p>
                    <p>닉네임<input type="text" name="nickname" placeholder="닉네임을 입력해주세요" value="${user.nickname }" required></p>
                    <p>이메일<input type="email" name="email" placeholder="이메일을 입력해주세요" value="${user.email }" required></p>
                    <input class="btn btn-submit" type="submit" value="가입하기">
                </fieldset> -->
        </form>
    </section>
</div>

<!-- footer -->
<footer>
    <div class="container">
<%--        <a href="https://github.com/KoreaAcademeTeamFive" target="_blank"><img src="../front/img/icon-github.png" alt=""--%>
<%--                                                                               class="ico-github"></a>--%>
        <div class="text">
            <p>WELCOME TO 동준 MARKET</p>
            <%--                <p>Copyright 2022. All Rights Reserved.</p>--%>
        </div>
    </div>
</footer>
</body>
<script type="text/javascript">
    //비밀번호 체크2
    //이름 체크1
    //닉네임 체크3
    //이메일 체크4
    //모든 공백 체크 정규식
    var empJ = /\s/g;
    //아이디 정규식 알파벳 소문자+숫자0~9 4~12자리
    var idJ = /^[a-z0-9]{4,12}$/;
    // 비밀번호 정규식 대소문자+숫자 4~12자리
    var pwJ = /^[A-Za-z0-9]{4,12}$/;
    // 이름 정규식 가~힣 2~6자리
    var nameJ = /^[가-힣]{2,6}$/;
    // 닉네임 정규식 가~힣 2~6자리
    var nicknameJ = /^[가-힣]{2,6}$/;
    // 이메일 검사 정규식 대소문자+숫자(특수문자 가능)@ 대소문자+숫자(특수문자 가능).2~3자리
    var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

    var idCheck = false;
    var confirmPw = false;
    var confirmName = false;
    var confirmNickname = false;
    var confirmEmail = false;

    $("#idChk").click(function () {
        var id = $("#id").val();
        idCheck(id);
        if (idCheck == false) {
            alert("소문자 숫자 포함 4~12자리로 입력해주세요");
        } else if (idCheck == true) {
            var frm = $("#register")[0];
            var param = $(frm).serialize();
            $.ajax({
                url: "user/idCheck",
                type: "get",
                data: param,
                success: function (result) {
                    if (result == 1) {
                        alert("중복된 아이디 입니다");
                        idCheck = false;
                        return idCheck;
                    } else {
                        alert("사용 가능한 아이디 입니다");
                        idCheck = true;
                        return idCheck;
                    }
                }
            });
        }
    })

    $("#duplicatedId").on('click', function () {
        var pw = $("#pw").val();
        var pw2 = $("#pw2").val();
        var name = $("#name").val();
        var nickname = $("#nickname").val();
        var email = $("#email").val();
        var frm = $("#register")[0];
        var param = $(frm).serialize();

        nameCheck();
        passwordCheck();
        emailCheck();
        nicknameCheck();
        if (idCheck == false) {
            alert("아이디 중복 체크를 해주세요");
        } else if (confirmName == false) {
            alert("이름은 한글2~6자리로 입력해주세요");
        } else if (!confirmPw) {
            alert("비밀번호는 대소문자 숫자 포함 4~12자리로 입력해주세요");
        } else if (pw != pw2 || pw == null || pw == "") {
            alert("비밀번호가 다릅니다");
        } else if (nickname == "" || nickname == null) {
            alert("닉네임을 입력해주세요");
        } else if (!confirmEmail) {
            alert("이메일 형식에 맞게 입력해주세요");
        } else {
            $("#register").submit();
        }
    });

    function idCheck() {
        var id = $("#id").val();
        idCheck = idJ.test(id);
        return idCheck;
    }

    function passwordCheck() {
        var pw = $("#pw").val();
        confirmPw = pwJ.test(pw);
        return confirmPw;
    }

    function nameCheck() {
        var name = $("#name").val();
        confirmName = nameJ.test(name);
        console.log("nameCheck" + confirmName);
        return confirmName;
    }

    function nicknameCheck() {
        var nickname = $("#nickname").val();
        confirmNickname = nicknameJ.test(nickname);
        console.log("nicknameCheck" + confirmNickname);
        return confirmNickname;
    }

    function emailCheck() {
        var email = $("#email").val();
        confirmEmail = mailJ.test(email);
        return confirmEmail;
    }


</script>
​
</html>