<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>뉴시니어스</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!-- Favicon -->
<link href="/resources/TGbtstr/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;500&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/resources/TGbtstr/lib/animate/animate.min.css"
	rel="stylesheet">
<link
	href="/resources/TGbtstr/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="/resources/TGbtstr/lib/lightbox/css/lightbox.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/resources/TGbtstr/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/TGbtstr/css/productList.css" rel="stylesheet">
<!-- Template Stylesheet -->
<link href="/resources/TGbtstr/css/styleTG.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!-- 로그인 모달 css
        <link href="/resources/css/login/login.css" rel="stylesheet">
        -->
        
        <!-- 카카오 로그인 -->
        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
        <!-- sweetalert -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>      
<style type="text/css">
@charset "UTF-8";

		.m-0 {
			text-align: center;
			padding-top: 25px;
			padding-bottom: 20px;
			color: #fff;
			font-size: 3em;
		}
			.detail {
			  display: inline-block;
			  cursor: pointer;
			}
			.popup00{
			  display: none;
			  width: 50%;
			  height: 80vh;
			  position: fixed;
			  top: 48%;
			  left: 50%;
			  transform: translate(-50%, -50%);
			  background: #fff;
			  box-shadow: 10px 10px 10px rgb(0 0 0 / 20%);
			  color: #000000;
			  padding: 2% 5%;
			  padding-bottom: 10%;
			  font-size: 12px;
			  line-height: 1.5rem;
			  border-radius: 15px;
			  z-index: 99999;
			  line-height: 1.5rem;
			  overflow-y: scroll;
			  
			}
			.zwicon-close00{
			  color: rgb(255, 255, 255);
			  font-size: 2em;
			  background-color: #0F4229;
			  padding-right: 10px;
			  padding-left: 10px;
			  border-radius: 70%;
			}
			.x_btn00{
			  text-align: right;
			  margin: 15px;
			  cursor: pointer;
			}
			.zwicon-close00:hover {
			  background-color: #b91a1a;
			}
			.cont00{
			  text-align: left;
			}
			.personal_pop00{
			  z-index: 300;
			}
			#login_header{
			  text-align: center;
			  font-size: 1.7rem;
			}
			.login_cont{
			  text-align: center;
			}
			.txt_1_1{
			  font-size: 1.1rem;
			}
			.txt_1{
			  font-size: 1rem;
			}
			.txt_07{
			  font-size: 0.7rem;
			}
			.txt_3{
			  font-size: 1.4rem;
			}
			.flex00{
			  display: flex;
			}
			.flex_01{
			  width: 60%;
			  justify-content: space-between;
			  margin: 10px auto;
			  margin-bottom: 30px;
			}
			.boxSize_2{
			  width: 60%;
			  padding: 2.5% 1%;
			  margin-top: 3%;
			  border-radius: 5px;
			  border: 1.5px solid rgb(176, 174, 174);
			}
			.boxSize_2:hover{
			  border: 1.5px solid rgb(120, 120, 120);
			}
			
			.color_g{
			  border: none;
			  background-color: #348E38;
			}
			.color_g_b{
			  border: 1px solid #348E38;
			}
			.bg_g{
			  background-color: rgba(0, 0, 0, 0.238);
			}
			.loginBtn_1{
			  cursor: pointer;
			}
			.loginBtn_1:hover{
			  border: none;
			  background-color: #217125;
			  color: #fff;
			}
			.c_red{
			color: #b91a1a;
			}
			.f_c{
			  color: #000000;
			}
			.f_c:hover{
			  color: #fff;
			}
			.txt_d1{
			  text-decoration: none;
			}
			.fw_8:hover{
			  font-weight: 800;
			}
			input[type=checkbox]{
			  width: 17px;
			  height: 17px;
			}
			.div1>a{
			display: none;
			}
			.d-flex{
			    justify-content: space-evenly;
			}
	</style>
             
</style>
</head>
<body>
		<a href="/" class="navbar-brand d-flex align-items-center px-2 px-lg-3 m-0">
            <img src="/resources/MAINbtstr/img/로고1.png" width="400px;">
        </a>
	<div class="div1">
          <a href="javascript:void(0)" class="loginBtn">로그인</a>
   </div>
   
   <!-- 로그인 모달 -->
	<div class="popup_bg00"></div>
  <div class="popup00 personal_pop00 noto bg_s">
    <div class="x_btn00"><span class="zwicon-close00">X</span></div>
    <div class="cont00">
      <h1 id="login_header" style="color:#000;">로그인</h1>
     
      <hr>
      <div class="login_cont">
        <form action="/login.do" method="post" onsubmit="return loginchk();">
          <div>
            <input type="text" placeholder="아이디를 입력해주세요." class="boxSize_2" name="memberId" style="font-size: 1.3em;"><br>
            <input type="password" placeholder="비밀번호를 입력해주세요." class="boxSize_2" name="memberPw" style="font-size: 1.3em;"><br>
            <input type="submit" value="로그인" class="boxSize_2 color_g loginBtn_1 lb" style="color:#fff; font-size: 1.3rem;">
          </div>
        </form>
        <div class="txt_1 flex00 flex_01" style="width: 300px;">
          <div>
            <input type="checkbox">로그인 유지
          </div>
          <div>
            <a href="/searchInfoFrm.do" class="c_red txt_d1 fw_8" >아이디/비밀번호 찾기</a>
          </div>
        </div>
        <h3 class="txt_4" style="color:#000; font-size: 16px;">SNS계정으로 간편하게 로그인하세요.</h3>
        <div onclick="kakaoLogin();">
        	<a  href="javascript:void(0)">
        		 <span><img alt="카카오로그인" src="/resources/img/kakao_login.png" style="width: 50%;"></span>
        	</a>
        </div>
        <hr>
        <div><a href="/joinFrm.do"><input value="뉴시니어스 회원가입 하러가기" class="boxSize_2 color_g_b loginBtn_1 f_c" style="font-size: 1rem; text-align: center; "></a></div>
        
        <!-- 카카오 로그인 -->
     
        <ul style="display: none;">
			<li onclick="kakaoLogout();">
		      <a href="javascript:void(0)">
		          <span>카카오 회원 탈퇴</span>
		      </a>
			</li>
		</ul>
		
      </div>
    </div>
  </div>

   
   
   
   
   
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/TGbtstr/lib/wow/wow.min.js"></script>
	<script src="/resources/TGbtstr/lib/easing/easing.min.js"></script>
	<script src="/resources/TGbtstr/lib/waypoints/waypoints.min.js"></script>
	<script src="/resources/TGbtstr/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="/resources/TGbtstr/lib/counterup/counterup.min.js"></script>
	<script src="/resources/TGbtstr/lib/parallax/parallax.min.js"></script>
	<script src="/resources/TGbtstr/lib/isotope/isotope.pkgd.min.js"></script>
	<script src="/resources/TGbtstr/lib/lightbox/js/lightbox.min.js"></script>

	<!-- Template Javascript -->
	<script src="/resources/TGbtstr/js/mainTG.js"></script>
	<!-- 로그인 js 
    <script src="/resources/js/login.js"></script>
    -->
	<script type="text/javascript">
	 $(".loginBtn").click(function(){
	      $(".popup_bg00").stop().fadeIn();
	      $(".popup00.personal_pop00").stop().fadeIn();
	      $("body").addClass("bg_g");
	    });

	      $(".popup_bg00").on("click", onPopClose);
	      $(".x_btn00").on("click", onPopClose);

	    function onPopClose() {
	      $(".popup_bg00").stop().fadeOut();
	      $(".popup00.personal_pop00").stop().fadeOut();
	      $("body").removeClass("bg_g");
	    }
	    
	    function loginchk(){
	    	const memberId = $("[name=memberId]").val();
	    	const memberPw = $("[name=memberPw]").val();
	    	
	    	if(memberId == "" || memberPw == ""){
	    		alert("아이디와 비밀번호를 입력해주세요.");
	    		return false;
	    	}else{
	    		return true;
	    	}
	    }
	    
	    function alert(text){
			Swal.fire(text);
		}
	    
	    /*카카오 로그인 두번째 시도*/
	    //카카오로그인
		Kakao.init('6bc8b7d3275ee64d59901f933c4c45e5'); //발급받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
		function kakaoLogin() {
		    Kakao.Auth.login({
		      success: function (response) {
		        Kakao.API.request({
		          url: '/v2/user/me',
		          success: function (response) {
		        	  console.log(response)
		        	  console.log(response.id)
		        	  console.log(response.properties.nickname)
		        	  console.log(response.kakao_account.email)
		        	  //로그인 성공 후 insert 하기
		        	  $.ajax({
		        		  url: "/kakaoLogin.do",
		        		  type:'post',
		        		  data:{
		        			  kakaoLogin:response.id,
		        			  nickName:response.properties.nickname,
		        			  memberId:response.kakao_account.email,
		        			  memberEmail:response.kakao_account.email
		        			  },
		        		 success:function(data){
		        			 //로그인 성공
		        			 if(data == "0"){
		        				 alert("로그인 성공");
		        				 window.location.href = "/kakao.do";
		        				 //회원가입 성공
		        			 }else if(data == "1"){
		        				 alert("카카오 회원가입 성공하셨습니다. 로그인 해주세요");
		        				 window.location.href = "/kakao.do";
		        				 //실패
		        			 }else if(data == "4"){
		        				 alert("이미 탈퇴한 회원입니다.");
		        			 }else{
		        				 alert("실패")
		        			 }
		        		 }
		        	  });
		        	  
		          },
		          fail: function (error) {
		            console.log(error)
		          },
		        })
		      },
		      fail: function (error) {
		        console.log(error)
		      },
		    })
		  }
		//카카오 로그아웃
		function kakaoLogout() {
		    if (Kakao.Auth.getAccessToken()) {
		      Kakao.API.request({
		        url: '/v1/user/unlink',
		        success: function (response) {
		        	console.log(response)
		        	$.ajax({
		        		url:"/kakaoLogout.do",
		        		type:"post",
		        		data: {kakaoLogin:response.id},
		        		success:function(data){
		        			alert("로그아웃 성공");
		        		}
		        		
		        		
		        	});
		        },
		        fail: function (error) {
		          console.log(error)
		        },
		      })
		      Kakao.Auth.setAccessToken(undefined)
		    }
		  }  

	</script>


</body>
</html>