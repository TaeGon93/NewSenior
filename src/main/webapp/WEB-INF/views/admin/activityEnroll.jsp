<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>

<head>
    <meta charset="utf-8">
    <title>액티비티 등록</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
	
    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Core CSS -->
    <link rel="stylesheet" href="/resources/JSbtstr/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="/resources/JSbtstr/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="/resources/JSbtstr/css/demo.css" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;500&display=swap" rel="stylesheet">  

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/resources/JSbtstr/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/resources/JSbtstr/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/resources/JSbtstr/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/resources/JSbtstr/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/resources/JSbtstr/css/style.css" rel="stylesheet">
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script><!--Datepicker-->

  <body>
    <!-- Layout wrapper -->
    <div class="content-wrapper" style="left: 300px; flex-direction: row; ">
        <!-- Menu -->

        <%@include file="/WEB-INF/views/common/aside.jsp" %>
        <!-- / Menu -->

        <!-- Layout container -->
        


          <!-- Content wrapper -->
          
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">

              <!-- HTML5 Inputs -->
            <form  id="insertActFrm">
              <div class="card mb-4">
                <h5 class="card-header" style="text-align: center; padding: 10px; ">액티비티 등록하기</h5>
                <div class="card-body" style="padding: 20px; ">
                  <div class="mb-3 row">
                    <label for="html5-text-input" class="col-md-2 col-form-label">액티비티명</label>
                    <div class="col-md-10">
                      <input class="form-control" type="text" name="activityName" id="html5-text-input" />
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <label for="html5-file-input" class="col-md-2 col-form-label">메인이미지</label>
                    <div class="col-md-10">
                      <input type="file" name="files" class="btn btn-outline-primary" id="html5-file-input">
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <label for="html5-select-input" class="col-md-2 col-form-label">담당자명</label>
                    <div class="col-md-10">
                      <select name="activityManager" id="html5-select-input">
                      	<c:forEach items="${list }" var="admin">
                      		<option value="${admin.memberNo }">${admin.memberName }</option>
                      	</c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <label for="html5-introduce-input" class="col-md-2 col-form-label">액티비티소개</label>
                    <div class="col-md-10">
                      <input class="form-control" name="activityIntroduce" id="html5-introduce-input" />
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <label for="html5-detail-input" class="col-md-2 col-form-label">상세소개</label>
                    <div class="col-md-10">
                      <textarea class="form-control" name="activityDetail" id="html5-detail-input" ></textarea>
                    </div>
                  </div>
                  
                  <div class="mb-3 row">
                      <label for="html5-tel-input" class="col-md-2 col-form-label">상세사진</label>
                       <div class="col-md-10">
                        <input type="file" class="form-control" name="detailFiles" id="html5-tel-input" multiple/>
                     </div>
                  </div>
				
				
                  <div class="mb-3 row">
                        <label for="activityStartDate" class="col-md-2 col-form-label">수강기간</label>
                        <div class="col-md-10">
                          <input class="form-control" name = "startDate"  id="activityStartDate" style="width: 300px; display: inline-block;" 
                          onclick="javascript:f_datepicker(this);" placeholder="시작일" readonly/>
                          <pre style="display: inline-block; margin: 0; margin-bottom: -5px;">  ~  </pre>
                          <input class="form-control" name ="endDate"  id="endDate" style="width: 300px; display: inline-block;" 
                           onclick="javascript:f_datepicker(this);" placeholder="종료일" readonly/>
                        </div>
                      </div>
                  
                  <div class="mb-3 row">
                    <label for="html5-cate-input" class="col-md-2 col-form-label">카테고리</label>
                      <div class="btn-group" style="width: 200px;">
                         <select name="activityCategory" id="html5-cate-input">
                         <c:forEach items="${cateList}" var="cateList">
					       <option value="${cateList.categoryCode }">${cateList.categoryName }</option>
					     </c:forEach>   
     					</select>
                      </div>
                  </div>
                 
                  <div class="mb-3 row">
                    <label for="html5-limit-input" class="col-md-2 col-form-label">모집정원</label>
                      <div class="btn-group" style="width: 150px;">
                      	<select id="html5-limit-input" name="activityLimit">
                      		
                      	</select>
                      </div>
                  </div>
                  <div class="mb-3 row">
                    <label for="html5-price-input" class="col-md-2 col-form-label">가격</label>
                    <div class="col-md-10">
                      <input class="form-control" name="activityPrice" id="html5-price-input" />
                    </div>
                  </div>
                  
                   <div class="mb-3 row">
                    <label for="html5-etc-input" class="col-md-2 col-form-label">기타사항</label>
                    <div class="col-md-10">
                      <textarea class="form-control" name="etc" id="html5-etc-input" ></textarea>
                    </div>
                  </div>
                  
                  <button type="button" class="btn btn-outline-primary" id="submitBtn" >등록하기</button>
                </div>
              </div>
            </form>
              <!-- File input -->
            </div>
</div>
<script>

function f_datepicker(obj) {
	 $( obj ).datepicker().datepicker("show");
	}
	
	
//인원수 옵션값넣기
const limitSelect = $("select[name=activityLimit]");
	for(let i=1;i<=30;i++){
		limitSelect.append(
				$('<option>').prop({
					innerHTML: i+'명',
					value: i
				})
				)
	}
	
	$("#submitBtn").on("click",function(){
		const activityName = $("input[name=activityName]").val();
		let files = document.querySelector("input[name=files]").files[0];
		const activityManager = $("select[name=activityManager]").val();
		const activityIntroduce = $("input[name=activityIntroduce]").val();
		const activityDetail = $("textarea[name=activityDetail]").val();
		const activityCategory = $("select[name=activityCategory]").val();
		const activityLimit = $("select[name=activityLimit]").val();
		const activityPrice = $("input[name=activityPrice]").val();
		const startDate = $("input[name=startDate]").val();
		const endDate = $("input[name=endDate]").val();
		const files2 = document.querySelector("input[name=detailFiles]").files;
		const etc = $("textarea[name=etc]").val();
		
	
		var formData = new FormData();
		formData.append('activityName',activityName);
		if(files!=null){
			formData.append('files',files);
		}else{
			formData.append('files',null);
		}
		
		formData.append('activityManager',activityManager);
		formData.append('activityIntroduce',activityIntroduce);
		formData.append('activityDetail',activityDetail);
		formData.append('activityLimit',activityLimit);
		formData.append('activityCategory',activityCategory);
		formData.append('activityPrice',activityPrice);
		formData.append('startDate',startDate);
		formData.append('endDate',endDate);
		formData.append('etc',etc);
		if(files2.length==0){
			formData.append('detailFiles',null);
		}else{
			for(let i=0;i<files2.length;i++){
				formData.append('detailFiles',files2[i]);
			}
		}
		
		

		if(activityName==""){
			alert("액티비티명을 입력해주세요.");
			return false;
		}
		if(files==""||files==null){
			alert("파일을 등록해주세요.");
			return false;
		}
		if(activityManager==""){
			alert("액티비티 관리자를 입력해주세요.");
			return false;
		}
		if(activityIntroduce==""){
			alert("액티비티명을 소개를 입력해주세요.");
			return false;
		}
		if(files2.length==0||files2.length==null){
			alert("액티비티 상세 사진을 입력해주세요.");
			return false;
		}
		if(activityDetail==""){
			alert("액티비티명 상세 소개를 입력해주세요.");
			return false;
		}
		if(activityCategory==""){
			alert("액티비티명 카테고리를 입력해주세요.");
			return false;
		}
		
		if(activityPrice==""){
			alert("액티비티 가격을 입력해주세요.");
			return false;
		}
		if(startDate==""){
			alert("시작날을 입력해주세요.");
			return false;
		}
		if(endDate==""){
			alert("종료날을 입력해주세요.");
			return false;
		}

		
		
		$.ajax({
 			url : "/insertActivity.do",
			type:"post",
			data: formData,
			contentType: false,
            processData: false,
            enctype	: 'multipart/form-data',
			success:function(){
				location.href="activityMgrAdmin.do?reqPage=1";
			},error:function(){
				alert("error");
			}
			
			
 		})//ajax
	
	});
	
	
	$.datepicker.setDefaults({
		dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		minDate: '-100y',
		showMonthAfterYear: true,
		changeYear: true,
		yearSuffix: '년'
	});
		
	
		
	
		
</script>

        <!-- / Content -->
<!-- Footer Start -->
	<%@include file="/WEB-INF/views/common/footer.jsp" %>

<!-- Footer End -->

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->



    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="../assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../assets/vendor/libs/popper/popper.js"></script>
    <script src="../assets/vendor/js/bootstrap.js"></script>
    <script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="../assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="../assets/vendor/libs/masonry/masonry.js"></script>

    <!-- Main JS -->
    <script src="../assets/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>
