<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="/resources/css/club/club-detail.css" rel="stylesheet">
    <script src="https://unpkg.com/mathjs/lib/browser/math.js"></script> <!-- math 사용 위한 라이브러리 -->
<title>동호회</title>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
        <!-- Page Header Start -->
        <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container text-center py-5">
                <h1 class="display-3 text-white mb-4 animated slideInDown">CLUB</h1>
                <nav aria-label="breadcrumb animated slideInDown">
                    <h4 class="mb-3 text-white">관심사를 검색하세요 ! </h4>
                    <input type="text" class="mt-2" id="serchInput"><button id="serchBtn" onclick="">찾기</button>
                    <input type="hidden" name="clubCategory" value="${clubCategory }">
                </nav>
            </div>
        </div>
        <!-- Page Header End -->
        
        <div style="width: 80%; display: flex; justify-content: space-between; margin: 0 auto;">
        	<div id="displayCount">
        	</div>
        	<div>
        		<a href="/insertClubFrm.do" class="btn btn-primary">동호회 생성</a><br>
        	</div>
        </div>
        
        <div> <!-- 인기 리스트 div  -->
        <c:if test="${not empty pList }">
	        <c:forEach items="${pList }" var="pl">
	        <div class="row mb-5">
				<div class="col-md-6 col-lg-4 mb-3">
					<div class="card h-100">
	      				<img>
	      				<div class="card-body">
			        		<h5 class="card-title">${pl.clubName }</h5>
			        		<p class="card-text">${pl.clubIntro }</p>
			        		<a href="javascript:void(0)" class="btn btn-outline-primary">상세보기</a>
		      			</div>
	    			</div>
	  			</div>
			</div>
	        </c:forEach>
	    </c:if>
        </div> <!-- 인기 리스트 div End  -->

		<!-- ajax로 추가 -->
		<div id="club-list" class="mt-5 club-list">
		</div>
		
		
		<div class="pagingBox mt-5">
			<ul id="pagingUl" class="pagination justify-content-center">
			</ul>
		</div>
		
	</div> <!-- pageContent End -->
	
	
<div class="modal-wrap">
    <div class="club-info-modal bg-secondary">
    	<div class="modal-title">
	        <div class="modal-img-div">
	            <img class="modal-img">
	        </div>
	    </div>
        <div class="club-info">
            <div class="club-info-box">
            	<h3 class="mb-3 text-light"></h3>
            	<p class="text-light"></p> 
            </div>
            <div class="modal-btn-box">
            	<button onclick="closeModal();" class="btn btn-primary">닫기</button>
            	<a href="/" class="btn btn-primary">입장하기</a>
            </div>
        </div>
    </div>
</div>

	<%@include file="/WEB-INF/views/common/footer.jsp" %>
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>




    <script>
    var totalData; //총 데이터 수
    var dataPerPage; //한 페이지에 나타낼 글 수
    var pageCount = 5; //페이징에 나타낼 페이지 수
    var currentPage = 1; //현재 페이지
    var data; //controller에서 가져온 data 전역변수
    var keyword;
    
    $(document).ready(function () {
    	initClubList();
    });
    
    function initClubList() {
   	 	//dataPerPage 선택값 가져오기
	    dataPerPage = 3;
 		const keyword = $("#serchInput").val();
	    $.ajax({ // ajax로 데이터 가져오기
	    	method: "post",
	    	url: "/searchAllClub.do",
	    	data: {keyword : keyword},
	    	success: function (data) {
	    	   //totalData 구하기
	    	   totalData = data.length;
	    	   console.log("totalData:"+totalData);
	    	   displayData(1, dataPerPage); //글 목록 표시 호출 (테이블 생성)
	    	   paging(totalData, dataPerPage, pageCount, 1); //페이징 표시 호출
	    	}
    	});
	}

    function paging(totalData, dataPerPage, pageCount, currentPage) {
    	  console.log("currentPage:" + currentPage);
    	  
    	  console.log(totalData);
    	  var totalPage = Math.ceil(Number(totalData)/dataPerPage); //총 페이지 수
    	  // console.log(totalPage);
    	  
    	  if(totalPage<Number(pageCount)){
    		  pageCount=totalPage;
    	  }
    	  
    	  var pageGroup = Math.ceil(Number(currentPage)/Number(pageCount)); // 페이지 그룹
    	  var last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
    	  
    	  if (last > totalPage) {
    	    last = totalPage;
    	  }

    	  let first = last-(pageCount-1); //화면에 보여질 첫번째 페이지 번호
    	  let next = last+1;
    	  let prev = first-1;

    	  let pageHtml = "";

    	  if (prev > 0) {
    		  pageHtml += "<li class='page-item disabled'><a class='page-link' tabindex='-1' aria-disabled='true' href='#' id='prev'>이전</a></li>";
    	  }

    	 //페이징 번호 표시 
    	  for (var i = first; i <= last; i++) {
    	    if (currentPage == i) {
    	      pageHtml +=
    	        "<li class='page-item '><a class='page-link active-page' href='#' id='" + i + "'>" + i + "</a></li>";
    	    } else {
    	      pageHtml += "<li class='page-item'><a class='page-link' href='#' id='" + i + "'>" + i + "</a></li>";
    	    }
    	  }
    	  
    	  if (last < totalPage) {
    	    pageHtml += "<li class='page-item disabled'><a class='page-link' tabindex='-1' aria-disabled='true' href='#' id='next'> 다음 </a></li>";
    	  }

    	  $("#pagingUl").html(pageHtml);
    	  let displayCount = "";
    	  displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
    	  $("#displayCount").text(displayCount);


    	  //페이징 번호 클릭 이벤트 
    	    $("#pagingUl li a").click(function () {
    	    	$("#club-list div").remove();
    	        let $id = $(this).attr("id");
    	        selectedPage = $(this).text();

    	        if ($id == "next") selectedPage = next;
    	        if ($id == "prev") selectedPage = prev;

    	        //전역변수에 선택한 페이지 번호를 담는다...
    	       	CurrentPage = selectedPage;
    	        //페이징 표시 재호출
    	        paging(totalData, dataPerPage, pageCount, selectedPage);
    	        //글 목록 표시 재호출
    	        displayData(selectedPage, dataPerPage, data);
    	    });
    	}
    
	  //현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
	    function displayData(currentPage, dataPerPage) {
	      	currentPage = Number(currentPage);
	      	dataPerPage = Number(dataPerPage);
	      	$.ajax({ // ajax로 데이터 가져오기
		    	method: "post",
		    	url: "/searchAllClub.do",
		    	success: function (data) {
		    		console.log("currentPage"+currentPage);
		    		console.log("dataPerPage"+dataPerPage);
		    		console.log(data);
		    		for (let i=(currentPage-1)*dataPerPage; i<(currentPage-1)*dataPerPage+dataPerPage; i++) {
						const div = $("<div>");
						div.addClass("lists");
						div.attr("onclick", "clubInfoModal("+data[i].clubNo+")");
						div.append("<h4 class='mb-3'>"+data[i].clubName+"</h4");
						div.append("<p>참여인원수 : <span></span> / <span>"+data[i].clubLimit+"</span></p>");
						div.append("<a href='/clubDetail.do?clubNo="+data[i].clubNo+"'>들어가기</a>");
						$("#club-list").append(div);
					}
		    	}
		    });
	      	
	    }

    	function clubInfoModal(clubNo) {
			console.log(clubNo);
			$.ajax({
				url:"/selectOneClub.do",
				data:{clubNo:clubNo},
				success:function(one){
					const clubName = $(".club-info-box>h3");
					const clubContent = $(".club-info-box>p");
					const clubImg = $(".modal-img-div>img");
					clubName.text(one.clubName);
					clubContent.text(one.clubIntro);
					clubImg.attr("src", "/resources/upload/club/"+one.clubMainImg);
				}
			});
			$(".modal-wrap").css("display", "flex");
		}
    	
        function closeModal() {
        	$(".modal-wrap").css("display", "none");
    	}
    </script>
</body>
</html>