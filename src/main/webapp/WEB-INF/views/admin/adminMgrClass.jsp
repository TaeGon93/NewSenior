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
    <title>클래스 관리페이지</title>
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
<style>
.swal2-icon {
    position: relative;
    box-sizing: content-box;
    justify-content: center;
    width: 3em;
    height: 3em;
    margin: 1.25em auto 1.875em;
    border: 0.25em solid transparent;
    border-radius: 50%;
    font-family: inherit;
    line-height: 3em;
    cursor: default;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}
</style>
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


              <!-- Borderless Table -->
              <div style="font-size: 25px;">클래스 관리</div>
              <div class="card">
                <div class="table-responsive text-nowrap">
                  
                  <table class="table table-borderless">
                    <thead>
                      <tr>
                        <th>번호</th>
                        <th style="padding-left: 35px;">클래스명</th>
                        <th>강사</th>
                        <th>기간</th>
                        <th>가격</th>
                        <th>활동상태</th>
                        <th>활동변경</th>
                        <th>삭제</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list }" var="NsClass">
                      <tr>
                        <td>${NsClass.classNo }</td>
                        <td style="cursor:pointer;" onclick="move(${NsClass.classNo })"><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>${NsClass.className }</strong></td>
                        <td>${NsClass.teacherName }</td>
                        <td>${NsClass.dayDate}</td>
                        <td>${NsClass.classPrice }</td>
                        <td>
                       
                        <span class="badge bg-label-primary me-1">
                        <c:choose>
	                        <c:when test="${NsClass.classStatus == 1 }">
	                       		 승인
	                        </c:when>
	                         <c:when test="${NsClass.classStatus == 2 }">
	                       		 모집중
	                        </c:when>
	                         <c:when test="${NsClass.classStatus == 3 }">
	                       		 모집완료
	                        </c:when>
	                        <c:when test="${NsClass.classStatus == 4 }">
	                       		 진행중
	                        </c:when>
	                        <c:otherwise>
	                        	클래스 종료
	                        </c:otherwise>
                        </c:choose>
                       
                        </span>
                        
                        </td>
                        <td>
                        
                          <select class="changeLevel">
                        <c:choose>
                       
	                        <c:when test="${NsClass.classStatus == 1 }">
	                       
	                       		<option value="1" selected>승인</option>
		                        <option value="2">모집중</option>
		                        <option value="3">모집 완료</option>
		                        <option value="4">진행중</option>
		                        <option value="5">클래스 종료</option>
		                    
	                        </c:when>
	                         <c:when test="${NsClass.classStatus == 2 }">
	                        
	                       		<option value="1" >승인</option>
		                        <option value="2" selected>모집중</option>
		                        <option value="3">모집 완료</option>
		                        <option value="4">진행중</option>
		                        <option value="5">클래스 종료</option>
		                        
	                        </c:when>
	                         <c:when test="${NsClass.classStatus == 3 }">
	                         
	                       		<option value="1" >승인</option>
		                        <option value="2" >모집중</option>
		                        <option value="3" selected>모집 완료</option>
		                        <option value="4">진행중</option>
		                        <option value="5">클래스 종료</option>
		                    
	                        </c:when>
	                        <c:when test="${NsClass.classStatus == 4 }">
	                        
	                       		<option value="1" >승인</option>
		                        <option value="2" >모집중</option>
		                        <option value="3" >모집 완료</option>
		                        <option value="4" >진행중</option>
		                        <option value="5">클래스 종료</option>
		                        
	                        </c:when>
	                        <c:otherwise>
	                       
	                        	<option value="1" >승인</option>
		                        <option value="2" >모집중</option>
		                        <option value="3" >모집 완료</option>
		                        <option value="4" >진행중</option>
		                        <option value="5" selected>클래스 종료</option>
		                        
	                        </c:otherwise>
	                        
                        </c:choose>
                         </select>
                        </td>
                        <td><input type="button" class="btn btn-warning"
							value="삭제" onclick="classDelete(${NsClass.classNo})"></td>
                      </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                  <!-- 클래스관리 페이지네비 -->
                  
                </div>
              </div><br>
              <div id="pageNavi">${pageNavi }</div>
              <!--/ Borderless Table -->
              <br><br><br>
              <div style="font-size: 25px;">클래스 신청현황</div>
              <div class="card">

                <div class="table-responsive text-nowrap">
                  
                  <table class="table table-borderless">
                    <thead> 
                      <tr>
                        <th>번호</th>
                        <th style="padding-left: 35px;">클래스명</th>
                        <th>강사</th>
                        <th>기간</th>
                        <th>상태</th>
                      </tr>
                    </thead>
                    <tbody>
                    
                     <c:forEach items="${holdClass }" var="hCla">
                      <tr>
                        <td class="hClaNo">${hCla.classNo}</td>
                      
                        <td onclick="moveDetail(${hCla.classNo})"><i class="fab fa-angular fa-lg text-danger me-3"></i>
                         <strong>${hCla.className	}</strong></td>
                      
                        <td>${hCla.teacherName }</td>
                        <td>${hCla.dayDate }일</td>
                        <td><span class="badge bg-label-primary me-1">보류</span></td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-edit-alt me-1"></i>승인</a
                              >
                              <a class="dropdown-item" href="javascript:void(0);"
                              ><i class="bx bx-edit-alt me-1"></i>보류</a
                              >
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-trash me-1"></i>취소</a
                              >
                            </div>
                          </div>
                        </td>
                      </tr>
                      </c:forEach>
                      
                    </tbody>
                  </table>
                </div>
              </div>


             </div></div>

  
            <!-- / Content -->



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
<!-- Footer Start -->
<div class="container-fluid bg-dark text-light footer mt-5 py-5 wow fadeIn" data-wow-delay="0.1s" style="width: 100%;">
  <div class="container py-5">
      <div class="row g-5">
          <div class="col-lg-3 col-md-6">
              <h4 class="text-white mb-4">Our Office</h4>
              <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
              <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
              <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@example.com</p>
              <div class="d-flex pt-2">
                  <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i class="fab fa-twitter"></i></a>
                  <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i class="fab fa-facebook-f"></i></a>
                  <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i class="fab fa-youtube"></i></a>
                  <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i class="fab fa-linkedin-in"></i></a>
              </div>
          </div>
          <div class="col-lg-3 col-md-6">
              <h4 class="text-white mb-4">Services</h4>
              <a class="btn btn-link" href="">Landscaping</a>
              <a class="btn btn-link" href="">Pruning plants</a>
              <a class="btn btn-link" href="">Urban Gardening</a>
              <a class="btn btn-link" href="">Garden Maintenance</a>
              <a class="btn btn-link" href="">Green Technology</a>
          </div>
          <div class="col-lg-3 col-md-6">
              <h4 class="text-white mb-4">Quick Links</h4>
              <a class="btn btn-link" href="">About Us</a>
              <a class="btn btn-link" href="">Contact Us</a>
              <a class="btn btn-link" href="">Our Services</a>
              <a class="btn btn-link" href="">Terms & Condition</a>
              <a class="btn btn-link" href="">Support</a>
          </div>
          <div class="col-lg-3 col-md-6">
              <h4 class="text-white mb-4">Newsletter</h4>
              <p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
              <div class="position-relative w-100">
                  <input class="form-control bg-light border-light w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">
                  <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
              </div>
          </div>
      </div>
  </div>
</div>
<!-- Footer End -->

	<!-- Core JS -->
	<script>
		function moveDetail(classNo){
			location.href="/classUpdateFrm.do?classNo="+classNo;
		}
		                                        
 		$(".changeLevel").on("change",function(){
			const classNo = $(this).parent().parent().children().eq(0).text();
			//클릭한 버튼 기준으로 선택한 등급
			const classStatus = $(this).val();
			location.href = "/changeStatus2.do?classNo="+classNo+"&classStatus="+classStatus;
		});
                 
 		function move(number){
 			location.href= "/classDetail.do?classNo="+number;
 		}
 		
 		  function classDelete(number){
 		    	
 		    	Swal.fire({
 					  title: "선택한 목록을 삭제하시겠습니까??",//제목
 					  icon: "warning",//아이콘
 					  imageWidth: "30",
 					  imageHeight: "30",
 					  showCancelButton: true,
 					  confirmButtonColor: '#3085d6',
 					  cancelButtonColor: '#d33',
 					  confirmButtonText: '삭제',
 					  cancelButtonText: '취소'
 					}).then((result) => {
 						//result.value == true이니까 트루일때만 실행하는거
 					  if (result.value) {
 						  location.href="/classDelete.do?classNo="+number;
 					  }
 					})//then끝
 		  
 		    }
  	</script>

	<!-- build:js assets/vendor/js/core.js -->
    <script src="../assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../assets/vendor/libs/popper/popper.js"></script>
    <script src="../assets/vendor/js/bootstrap.js"></script>
    <script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="../assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="../assets/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>
