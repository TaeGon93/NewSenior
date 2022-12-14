<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="../assets/"
	data-template="vertical-menu-template-free">

<head>
<meta charset="utf-8">
<title>Gardener - Gardening Website Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Core CSS -->
<link rel="stylesheet" href="/resources/JSbtstr/css/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet" href="/resources/JSbtstr/css/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet" href="/resources/JSbtstr/css/demo.css" />

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
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/resources/JSbtstr/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/resources/JSbtstr/css/style.css" rel="stylesheet">
<link href="/resources/css/mypage/mypage.css" rel="stylesheet">

<!--  
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
-->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
<body>
	<!-- Layout wrapper -->
	<div class="content-wrapper" style="left: 300px; flex-direction: row;">
		<!-- Menu -->
		<%@include file="/WEB-INF/views/common/aside.jsp"%>

		<!-- Content -->

		<!-- File input -->
		<div class="container-xxl flex-grow-1 container-p-y">
			<div style="font-size: 25px;">???????????????</div>
			<div class="div1 deliveryBtn">
				<button>
					<a href="#" style="color: #fff;">???????????????</a>
				</button>
			</div>
			<div class="card">
				<div class="table-responsive text-nowrap">

					<table class="table table-borderless">
						<thead>
							<tr>
								<th>?????????</th>
								<th>??????</th>
								<th>?????????</th>
								<th>??????????????</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="d" end="0">
								<tr class="showDeliveryDetail"
									onclick="goToDeliveryDetail(${d.deliveryNo});" id="btn-modal">
									<td><strong>${d.deliveryName }</strong><br>
										${d.receiverName }<br> <span
										style="border: 1px solid #6f42c1; background-color: #6f42c1; color: #fff">???????????????</span>
									</td>
									<td>${d.zipcode}<br> ${d.deliveryAddr }<br>
										${d.deliveryDetail }
									</td>
									<td style="line-height: 72px;">${d.deliveryPhone }</td>
									<td><button class="updateBtn delBtn btn btn-outline-warning" onclick="updateBtn(${d.deliveryNo});" style="position: relative; top:20px;">??????</button>
										<button class="delBtn btn btn-outline-warning "  style="position: relative; top:20px;">
											<a href="/deleteAddr.do?deliveryNo=${d.deliveryNo}">??????</a>
										</button>
									</td>
								</tr>
							</c:forEach>
							<c:forEach items="${list }" var="d" begin="1">
								<tr class="showDeliveryDetail" onclick="goToDeliveryDetail(${d.deliveryNo});" id="btn-modal">
									<td><strong>${d.deliveryName }</strong><br>
										${d.receiverName }<br></td>
									<td>${d.zipcode}<br> ${d.deliveryAddr }<br>
										${d.deliveryDetail }
									</td>
									<td style="line-height: 72px;">${d.deliveryPhone }</td>
									<td><button class="updateBtn delBtn btn btn-outline-warning" onclick="updateBtn(${d.deliveryNo});" style="position: relative; top:20px;" class="btn btn-outline-warning delbtn">??????</button>
										<button class="delBtn2 btn btn-outline-warning delbtn" style="position: relative; top:20px;">
											<a href="/deleteAddr.do?deliveryNo=${d.deliveryNo }" >??????</a>
										</button></td>
								</tr>
							</c:forEach>
							<c:if test="">
								<tr>
									<td style="text-align: center;">????????? ????????? ????????????.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- / Content -->

	<!-- Content wrapper -->
	</div>
	<!-- / Layout page -->
	</div>

	<!-- ????????? ?????? ?????? -->

	<div class="popup_bg00"></div>
	<div class="popup00 personal_pop00 noto bg_s" style="width: 60%;">
		<div class="x_btn00">
			<span class="zwicon-close00">X</span>
		</div>
		<div class="cont00"> 
			<h1 id="login_header">????????? ??????/????????????</h1>
			<hr>
			<div class="delivery_cont">
				<div class="container-xxl flex-grow-1 container-p-y">
					<!-- HTML5 Inputs -->
					<form action="/insertAddr.do" method="post" onsubmit="return deliverychk();" id="formId">
						<div class="card mb-4"  style="width: 80%;">
							<h5 class="card-header">???????????????/??????</h5>
							<div class="card-body" style="padding-top: 20px;">
								<div class="mb-3 row">
									<label for="html5-text-input" class="col-md-2 col-form-label">????????????</label>
									<div class="col-md-10">
										<input class="form-control" type="text" id="html5-text-input"
											name="deliveryName" />
									</div>
								</div>
								<div class="mb-3 row">
									<label for="html5-text-input" class="col-md-2 col-form-label">?????????</label>
									<div class="col-md-10">
										<input class="form-control" type="text" id="html5-text-input"
											name="receiverName" />
									</div>
								</div>
								<div class="mb-3 row">
									<label for="html5-text-input" class="col-md-2 col-form-label">??????</label>
									<div class="col-md-10">
										<span><input class="form-control " type="text"
											id="html5-text-input" name="zipcode"
											style="width: 30%; margin: 0; display: inline-block;" /></span>
										<button type="button" class="btn btn-outline-warning"
											onclick="searchAddr();">????????????</button>

									</div>
								</div>
								<div class="mb-3 row">
									<label for="html5-email-input" class="col-md-2 col-form-label"></label>
									<div class="col-md-10">
										<input class="form-control " type="text"
											id="html5-email-input" name="deliveryAddr" />
									</div>
								</div>
								<div class="mb-3 row co_btn">
									<label for="html5-url-input" class="col-md-2 col-form-label"></label>
									<div class="col-md-10">
										<input class="form-control " type="text" placeholder="????????????"
											id="html5-email-input" name="deliveryDetail"/>
									</div>
								</div>
								<div class="mb-3 row">
									<label for="html5-url-input" class="col-md-2 col-form-label">?????????</label>
									<div class="col-md-10">
										<input class="form-control" type="text" id="html5-url-input"
											placeholder="010-1234-5678" name="deliveryPhone"
											onkeyup="phone_keyup(this)" maxlength="13" />
									</div>
								</div>
								<div class="mb-3 row">
									<label for="html5-url-input" class="col-md-2 col-form-label">???????????????</label>
									<div class="col-md-10">
										<input type="checkbox" class="checkBtn" /> ?????????????????? ?????? <input
											type="hidden" name="defaultAddr" value='n'>
									</div>
								</div>
							</div>
						</div>
						<input type="hidden" value="${member.memberNo }" name="memberNum">
						<input type="hidden" name="deliveryNum">
						<div style="margin: 0 20px; ">
							<button type="button" class="btn btn-outline-warning closeBtn" style="width: 50%;">??????</button><button class="btn btn-outline-warning saveBtn" style="width: 50%;">??????</button><button class="btn btn-outline-warning updateBtn1" style="width: 50%; display: none;">??????</button>
						</div> 
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- ????????? ?????? ?????? ??? -->






	<!-- Overlay -->
	<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- / Layout wrapper -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>

	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<script src="../assets/vendor/libs/jquery/jquery.js"></script>
	<script src="../assets/vendor/libs/popper/popper.js"></script>
	<script src="../assets/vendor/js/bootstrap.js"></script>
	<script
		src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

	<script src="../assets/vendor/js/menu.js"></script>
	<!-- endbuild -->

	<!-- Vendors JS -->
	<script src="../assets/vendor/libs/masonry/masonry.js"></script>

	<!-- Main JS -->
	<script src="../assets/js/main.js"></script>

	<!-- Page JS -->

	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>

	<script type="text/javascript">
  	//???????????? ?????? ?????????
	function birth_keyup(obj){
    	let birth_len = obj.value.length;
	    if (event.keyCode==8){
	        obj.value = obj.value.slice(0,birth_len)
	        return 0;
	    }else if(birth_len==4 || birth_len==7){
	        obj.value += '-';
	    }
   	}
  	//????????? ?????? ?????????
	function phone_keyup(obj){
	    let phone_len=obj.value.length;
	    if(event.keyCode==8){
	        obj.value=obj.value.slice(0,phone_len); 
	        return 0; 
	    }else if (phone_len==3 || phone_len==8){
	        obj.value += '-';
	    }
	}
  	
	//????????? ?????? js
    $(".deliveryBtn").click(function(){
      $(".popup_bg00").stop().fadeIn();
      $(".popup00.personal_pop00").stop().fadeIn();
      $("body").addClass("bg_g");
      $(".saveBtn").css("display","inline-block");
  	$(".updateBtn1").css("display","none");
    });

      $(".popup_bg00").on("click", onPopClose);
      $(".x_btn00").on("click", onPopClose);
      $(".closeBtn").on("click", onPopClose);

    function onPopClose() {
      $(".popup_bg00").stop().fadeOut();
      $(".popup00.personal_pop00").stop().fadeOut();
      $("body").removeClass("bg_g");
    }
    
    //?????? ?????? ?????????
    function updateBtn(deliveryNo){
    	$(".popup_bg00").stop().fadeIn();
        $(".popup00.personal_pop00").stop().fadeIn();
        $("body").addClass("bg_g");
        
        const deliveryName = $("input[name=deliveryName]");
    	const receiverName = $("input[name=receiverName]");
    	const zipcode = $("input[name=zipcode]");
    	const deliveryAddr = $("input[name=deliveryAddr]");
    	const deliveryDetail = $("input[name=deliveryDetail]");
    	const deliveryPhone = $("input[name=deliveryPhone]");
    	const defaultAddr = $("input[name=defaultAddr]");
    	const deliveryNum = $("input[name=deliveryNum]");
    	
        
    	$(".saveBtn").css("display","none");
    	$(".updateBtn1").css("display","inline-block");
    	$.ajax({
 			url:"/selectAddr.do",
 			type:"post",
 			data:{deliveryNo:deliveryNo},
 			success:function(data){
 				deliveryName.val(data.deliveryName);
 				receiverName.val(data.receiverName);
 				zipcode.val(data.zipcode);
 				deliveryAddr.val(data.deliveryAddr);
 				deliveryDetail.val(data.deliveryDetail);
 				deliveryPhone.val(data.deliveryPhone);
 				defaultAddr.val(data.defaultAddr);
 				deliveryNum.val(deliveryNo);
 				//???????????? ?????????
 				$(".updateBtn1").on("click",function(){
 					$("#formId").attr("action", "/updateAddr.do");
 					/*??????????????? close
 					$.ajax({
 						url:"/updateAddr.do",
 						type:"post",
 			 			data:{deliveryNo:deliveryNo},
 			 			success:function(data){
 			 			}
 					});
 					*/
 				});
 			}
 		});
    }
    //????????? ?????? ??? ??????
    function deliverychk(){
    	const deliveryName = $("input[name=deliveryName]").val();
    	const receiverName = $("input[name=receiverName]").val();
    	const zipcode = $("input[name=zipcode]").val();
    	const deliveryAddr = $("input[name=deliveryAddr]").val();
    	const deliveryDetail = $("input[name=deliveryDetail]").val();
    	const deliveryPhone = $("input[name=deliveryPhone]").val();
    	const defaultAddr = $("input[name=defaultAddr]");
    	
    	
    	if(deliveryName == "" || deliveryName == null){
    		alert("??????????????? ??????????????????.");
    		return false;
    	}
    	if(receiverName == "" || receiverName == null){
    		alert("???????????? ??????????????????.");
    		return false;
    	}
    	if(zipcode == "" || zipcode == null){
    		alert("????????? ??????????????????.");
    		return false;
    	}
    	if(deliveryAddr == "" || deliveryAddr == null){
    		alert("????????? ??????????????????.");
    		return false;
    	}
    	
    	if(deliveryPhone == "" || deliveryPhone == null){
    		alert("??????????????? ??????????????????.");
    		return false;
    	}
    	
    	if($(".checkBtn").is(":checked")){
    		defaultAddr.val("y");
    	}else{
    		defaultAddr.val("n");
    	}
    	
    }
    
    
    //????????? ??????
    	function searchAddr() {
    	    new daum.Postcode({
    	        oncomplete: function(data) {
    	            // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.

    	            // ????????? ????????? ?????? ????????? ?????? ????????? ????????????.
    	            // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
    	            var roadAddr = data.roadAddress; // ????????? ?????? ??????
    	            var extraRoadAddr = ''; // ?????? ?????? ??????

    	            // ??????????????? ?????? ?????? ????????????. (???????????? ??????)
    	            // ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
    	            if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
    	                extraRoadAddr += data.bname;
    	            }
    	            // ???????????? ??????, ??????????????? ?????? ????????????.
    	            if(data.buildingName !== '' && data.apartment === 'Y'){
    	                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
    	            }
    	            // ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
    	            if(extraRoadAddr !== ''){
    	                extraRoadAddr = ' (' + extraRoadAddr + ')';
    	            }

    	            // ??????????????? ?????? ????????? ?????? ????????? ?????????.
    	            $("[name=zipcode]").val(data.zonecode);
    	            $("[name=deliveryAddr]").val(roadAddr);
    	            //document.getElementById('userAddr').value = data.zonecode+" "+roadAddr;
    	            if( $("[name=zipcode]").val()==null){
    	            	$("[name=zipcode]").val() = data.jibunAddress;
    	            }
    	            //
    	            
    	            
    	            // ???????????? ???????????? ?????? ?????? ?????? ????????? ?????????. 
    	            var guideTextBox = document.getElementById("guide");
    	            // ???????????? '?????? ??????'??? ????????? ??????, ?????? ???????????? ????????? ?????????.
    	            if(data.autoRoadAddress) {
    	                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
    	                guideTextBox.innerHTML = '(?????? ????????? ?????? : ' + expRoadAddr + ')';
    	                guideTextBox.style.display = 'block';

    	            } else if(data.autoJibunAddress) {
    	                var expJibunAddr = data.autoJibunAddress;
    	                guideTextBox.innerHTML = '(?????? ?????? ?????? : ' + expJibunAddr + ')';
    	                guideTextBox.style.display = 'block';
    	            }
    	        }
    	    }).open();
    	}
    	
    	//?????? ?????? ?????? ????????? comfirm
    	function delMember(){
    		if(window.confirm("?????? ????????? ?????? ???????????? ??? ?????? ???????????? ??? ????????????. ?????? ????????? ?????????????????????????")){
    			return true;
    		}else{
    			return false;
    		}
    	}
    	//?????? 
    	function imgdel(){
    		$(".fileImg").attr("src", "/resources/upload/member/user.png");
    		$(".upform").attr("action","/mypageUpdate.do?defaultImg=user.png");
    		 let reader = new FileReader();
    		 reader.onload = function (e) {
                 let img = $(".fileImg");
                 $(img).attr('src', e.target.result);
             }
    		
    	}
    	//????????????
    	function readURL(obj) {
            let reader = new FileReader();
            if(!obj.files.length) {
                return;
            }
            reader.readAsDataURL(obj.files[0]);
            reader.onload = function (e) {
                let img = $(".fileImg");
                $(img).attr('src', e.target.result);
            }
        }
    </script>
</body>
</html>
