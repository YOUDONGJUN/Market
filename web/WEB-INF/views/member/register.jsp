<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/sub-style.css">
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
	            	<li class="left-nav home"><a href="/root/index"><span>중고</span>마켓</a></li>
	                <li class="right-nav join"><a href="/root/member/register_form">회원가입</a></li>
	                <li class="right-nav"><a href="/root/member/login">로그인</a></li>
	                <li class="right-nav"><a href="https://thecheat.co.kr/rb/?mod=_search">더치트 바로가기</a></li>
	            </ul>
	        </div>    
        </nav>

        <!-- section -->
        <section>
            <h2>회원가입</h2>
            <p>중고마켓에 오신걸 환영합니다! 이제 몇가지 정보만 입력하면 완료됩니다.</p>

            <form id=register name="register" action="/root/member/register" method="post">
                <fieldset>
                    <label for="name">이름</label><input type="text" name="name" id="name" placeholder="이름을 입력해주세요" value="${member.name }" required><br>
                    <label for="id">아이디</label><input type="text" name="id" id="id" placeholder="아이디를 입력해주세요" value="${member.id }" required>
                    <!--  회원가입 버튼에 아이디 중복체크기능있어서 제외 -->
                      <button style="margin-left: 20px; class="btn" type="button" id="idChk" value="N">중복확인</button>
                    <!--  <a style="margin-left: 20px;" href="#" class="btn">중복 확인</a><br> -->
                    
                    <label for="pw">비밀번호</label><input type="password" name="pw" class="pw" placeholder="비밀번호를 입력해주세요"  id="pw" required><br>                   
                    <label for="pw2">비밀번호 확인</label><input type="password" name="pw2" class="pw" placeholder="비밀번호를 입력해주세요"  id="pw2" required><br>
                    	<!-- <div class="alert alert-success" id="alert-success" style ="display:none">비밀번호가 일치합니다.</div>
						<div class="alert alert-danger" id="alert-danger" style ="display:none">비밀번호가 일치하지 않습니다.</div> -->

                    <label for="nickname">닉네임</label><input type="text" name="nickname" id="nickname" placeholder="닉네임을 입력해주세요" value="${member.nickname }"  required><br>
					<div id="nicknamecheck" style="display:none"></div>
                    <label for="email">이메일</label><input type="email" name="email" id="email" placeholder="이메일을 입력해주세요" value="${member.email }" required><br>
                    <input type="hidden" name="type" value="B">
                    <div style="text-align: center;" class="btn-wrapper">
                        <input class="btn btn-submit" type="button" value="가입하기" id ="duplicatedId">			                                               
                    </div>
                </fieldset>
                <!-- <fieldset>
                    <p>이름<input type="text" name="name" placeholder="이름을 입력해주세요" value="${member.name }" required></p>
                    <p>아이디<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요" value="${member.id }" required></p>
                    <p>비밀번호<input type="password" name="pw" placeholder="비밀번호를 입력해주세요" required></p>
                    <p>닉네임<input type="text" name="nickname" placeholder="닉네임을 입력해주세요" value="${member.nickname }" required></p>
                    <p>이메일<input type="email" name="email" placeholder="이메일을 입력해주세요" value="${member.email }" required></p>
                    <input class="btn btn-submit" type="submit" value="가입하기">
                </fieldset> -->
            </form>
        </section>
    </div>

    <!-- footer -->
    <footer>
        <div class="container">
            <a href="https://github.com/KoreaAcademeTeamFive" target="_blank"><img src="../img/icon-github.png" alt="" class="ico-github"></a>
            <div class="text">
                <p>안범기 유동준 이승정 이덕현</p>
                <p>Copyright 2022. TeamFive. All Rights Reserved.</p>
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
	var mailJ =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	var idcheckk = false;
	var confirmpw = false;
	var confirmname = false;
	var confirmnickname = false;	
	var confirmemail = false;
	
$("#idChk").click(function(){
	var id=$("#id").val();
	idcheck(id);
	if(idcheckk == false){
		alert("소문자 숫자 포함 4~12자리로 입력해주세요");
	}else if(idcheckk == true){
		var frm=$("#register")[0];
		var param=$(frm).serialize();
		$.ajax({
			url:"/root/member/idcheck",
			type:"get",
			data:param,
			success:function(result){
				if(result == 1){
					alert("중복된 아이디 입니다");
					idcheckk=false;
					return idcheckk;
				}else{
					alert("사용 가능한 아이디 입니다");
					idcheckk=true;
					return idcheckk;
				}
			}
		});
	}
})

$("#duplicatedId").on('click', function(){
	var pw = $("#pw").val();
	var pw2 = $("#pw2").val();
	var name = $("#name").val();
	var nickname =$("#nickname").val();
	var email = $("#email").val();
	var frm=$("#register")[0];
	var param=$(frm).serialize();
	
	namecheck();
	passwordcheck();
	emailcheck();
	nicknamecheck();
	if(idcheckk == false){
		alert("아이디 중복 체크를 해주세요");
	}else if(confirmname == false){
		alert("이름은 한글2~6자리로 입력해주세요");
	}else if(!confirmpw){
		alert("비밀번호는 대소문자 숫자 포함 4~12자리로 입력해주세요");
	}else if(pw != pw2 || pw == null || pw == ""){
		alert("비밀번호가 다릅니다");	
	}else if(nickname == "" || nickname ==null){
		alert("닉네임을 입력해주세요");
	}else if(!confirmemail){
		alert("이메일 형식에 맞게 입력해주세요");
	}else{
		$("#register").submit();
	}
});

function idcheck(){
	var id=$("#id").val();
	idcheckk = idJ.test(id);
	return idcheckk;
}

function passwordcheck(){
	var pw=$("#pw").val();
	confirmpw = pwJ.test(pw);
	return confirmpw;		
}

function namecheck(){
	var name=$("#name").val();
	confirmname = nameJ.test(name);
	console.log("namecheck"+confirmname);
	return confirmname;
}
function nicknamecheck(){
	var nickname=$("#nickname").val();
	confirmnickname = nicknameJ.test(nickname);
	console.log("nicknamecheck"+confirmnickname);
	return confirmnickname;
}

function emailcheck(){
	var email=$("#email").val();
	confirmemail = mailJ.test(email);
	return confirmemail;
}


</script>​
</html>