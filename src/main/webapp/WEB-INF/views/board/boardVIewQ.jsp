<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.inputCommentBox{
		color : blue;
	}
	.commentView{
		color : blue;
	}
	.inputRecommentBox{
		display:none;
		color : red;
	}
	.reCommentView{
		color : red;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<table border="1">
		<tr>
			<th>글번호</th>
			<td>${b.boardNo }</td>
		</tr>
		<tr>
			<th>카테고리</th>
			<!-- QNA -->
			<c:if test ="${b.boardCategory eq 'class'}">
				<td>클래스</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'club'}">
				<td>동호회</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'activity'}">
				<td>액티비티</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'product'}">
				<td>상품</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'pay'}">
				<td>결제</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'delivery'}">
				<td>배송</td>
			</c:if>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>${b.nickName }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${b.boardDate }</td>
		</tr>
		
			
			<tr>
				<th>제목</th>
				<td colspan="3">${b.boardTitle }</td>
			</tr>
			<tr>
				<th>보드타입</th>
				<td colspan="3">${b.boardType }</td>
			</tr>
		<tr>
			<th>첨부파일</th>
			<td colspan="3">
			<c:forEach items="${b.fileList }" var="bf">
				<p>
				<a href="/boardFileDown.do?fileNo=${bf.fileNo }">${bf.filename }</a>
				</p>
			</c:forEach>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="6">
				<div>${b.boardContent }</div>
			</td>
		</tr>
		<c:if test="${not empty sessionScope.m  && b.nickName eq sessionScope.m.nickName }">
			<tr class="tr-1">
				<th colspan="6">
					<button><a class="btn bc44" href="/boardUpdateFrm.do?boardNo=${b.boardNo}">수정</a></button>
					<!-- <button><a class="btn bc44" id="delBtn" href="/boardDelete.do?boardNo=${b.boardNo}">삭제</a></button> -->
					<button class="btn bc44" onclick="boardDelete(${b.boardNo});">삭제</button>
				</th>
			</tr>
			</c:if>
	</table>
	
		<%--댓글작성 form--%>
		<c:if test="${not empty sessionScope.m && sessionScope.m.memberGrade eq 3}">
		<div class="inputCommentBox">
			<form action="/insertComment.do" method="post">
				<ul>
					<li>
						<span>댓글boardViewQ</span>
					</li>
					<li>
						<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}">
						<input type="hidden" name="boardRef" value="${b.boardNo}">
													<!-- ㄴ몇 번 글의 댓글인지 -->
						<input type="hidden" name="boardCommRef" value="0">
							<!-- ㄴ어떤 댓글의 대댓글인지 -->	<!-- ㄴ댓글,대댓글 구분 (0번 시퀀스는 쓰지 않으므로 0번은 대댓글이 아닌 일반댓글)-->
														<!-- 참조하는 대댓글이 없음 -->
						<textarea name="boardCommContent"></textarea>
					</li>
					<li>
						<button type="submit">등록</button>
					</li>
				</ul>
			</form>
		</div>
		</c:if>
		
		<%--댓글 출력 --%>
		<%--forEach(1): 댓글반복문 시작(댓글 출력, 대댓글 출력, 대댓글 작성폼   --%>
		<div class="commentBox">
		
		 <c:forEach items="${commentList }" var="bc">
		 	<ul class="commentView">
		 		<li>
						<span>댓글</span>
				</li>
				<li>
					<p>
						<span>${bc.nickName }</span>
						<span>${bc.boardCommDate }</span>
					</p>
					<p>${bc.boardCommContent }</p>
					<textarea name="boardCommContent" style="display:none;">${bc.boardCommContent}</textarea>
					
					<p>
						<c:if test="${not empty sessionScope.m }">
							<c:if test="${sessionScope.m.memberGrade eq 3 }">
								<a href="javaScript:void(0)" onclick="modifyComment(this,${bc.boardCommNo},${b.boardNo})">수정</a>
								<a href="javaScript:void(0)" onclick="deleteComment(this,${bc.boardCommNo},${b.boardNo})">삭제</a>
							</c:if>
						</c:if>
						
						<a href="javaScript:void(0)" class="reCommentShow">답글달기</a>
									<%-- href는 효과만 / a태그 기본이벤트 제거 --%>
									<%--대댓글 작성 폼을 (댓글 나타내기창에) 숨겨두고 답글달기 누르면 나타나게 만든다 --%>
					</p>
				</li>
		 	</ul>
		 
		 </c:forEach><%--forEach(1): 댓글반복문 끝 --%>
		</div><%--commentBox끝--%>
		<script>
		
			//답글달기를 누르면 답글달기 - > 취소 / 취소 -> 답글달기
			$(".reCommentShow").on("click",function(){
				//클릭한 답글달기가 몇 번째 댓글 것인지 구함 (이벤트를 발생시킨것이 몇 번째 인덱스인지)
				const idx = $(".reCommentShow").index(this);
				if($(this).text() == "답글달기"){
					//답글달기를 누르면 답글달기  -> 취소로 변경
					$(this).text("취소");
				}else{
					$(this).text("답글달기");
				}
				
				//숨겨진 대댓글 폼을 나타나게 해준다 (대댓글 박스중 idx번쨰를 toggle)
				$(".inputRecommentBox").eq(idx).toggle();
				$(".inputRecommentBox").eq(idx).find("textarea").focus();
			});
			
//			수정		 삭제		 답글달기
			//-> <수정하기>	수정완료  수정취소   답글달기 x
			//-> <수정취소>	수정		삭제		답글달기 O
			
			//modifyComment 선언적함수 (수정하기)
			function modifyComment(obj,boardCommNo,boardNo){
								   //ㄴ해당하는객체(this)
				console.log(obj,boardCommNo,boardNo);
				$(obj).parent().prev().show(); // 수정용 textarea 화면에 보여줌
				$(obj).parent().prev().prev().hide();//내용을 보여주던 p태그 숨김
				//수정 - > 수정완료
				$(obj).text("수정완료");
				//-> 함수 바꿔줌(수정 - > 수정완료)
				$(obj). attr("onclick","modifyComplete(this,"+boardCommNo+","+boardNo+")");
				
				//삭제->수정취소
				$(obj).next().text("수정취소");
				//-> 함수 바꿔줌 (삭제 -> 수정취소)
				$(obj).next().attr("onclick","modifyCancel(this,"+boardCommNo+","+boardNo+")");
				
				//답글달기버튼 숨김 
				$(obj).next().next().hide();
			}
			
			//				수정		 삭제		 답글달기
			//-> <수정하기>	수정완료  수정취소   답글달기 x
			//-> <수정취소>	수정		삭제		답글달기 O
			
			//수정취소
			function modifyCancel(obj,boardCommNo,boardNo){
				
				//수정취소는 삭제 버튼이 바뀐 것. 삭제 버튼 기준으로 만들어주기
				$(obj).parent().prev().hide(); // textarea 숨김
				$(obj).parent().prev().prev().show(); // 기존댓글 보여줌
				
				//수정완료 - > 수정
				$(obj).prev().text("수정");
				//함수교체 (수정완료 -> 수정)
				$(obj).prev().attr("onclick","modifyComment(this,"+boardCommNo+","+boardNo+")");
				
				//수정취소 - > 삭제
				$(obj).text("삭제");
				//함수 바꿔줌 (수정취소 -> 삭제)
				$(obj).attr("onclick","deleteComment(this,"+boardCommNo+","+boardNo+")");
				
				//답글달기버튼 보여줌
				$(obj).next().show();
			}
			
			//수정완료시 동작하는 함수
			function modifyComplete(obj,boardCommNo,boardNo){
				
				//form 태그를 생성해서 전송(다른방법] form을 숨겨서 보내기(위의 대댓글 작성 폼처럼?) / a태그로 보내기)
				//1.form 태그 생성
				const form = $("<form action='/boardCommentUpdate.do' method='post'></form>");
				
				//2.input태그 생성(bcNo)
				const bcInput = $("<input type='text' name='boardCommNo'>");
				//ncNo 값 세팅 : input태그안에 value="${boardCommNo}"로 세팅 ??
				bcInput.val(boardCommNo);
				//ncInput을 form 태그에 추가
				form.append(bcInput);
				
				//3.input 태그 생성(boardNo)
				const boardInput=$("<input type='text' name='boardNo'>")
				boardInput.val(boardNo);
				form.append(boardInput);
				
				//4.textarea
				const boardCommContent = $(obj).parent().prev();
				form.append(boardCommContent);
				
				//body 태그에 생성한 form태그를 추가
				$("body").append(form);
				//form 태그 전송
				form.submit();
			}
			
			//게시글 삭제
			function boardDelete(boardNo){
				if(confirm("글을 삭제하시겠습니까?")){
					location.href="/boardDelete.do?boardNo="+boardNo;	
				}
			}
			//comment 삭제
			function deleteComment(obj,boardCommNo,boardNo){
			//obj는 사실 필요없는 매개변수(형식 맞춰주기 위해서 기입)
			if(confirm("댓글을 삭제하시겠습니까?")) {
				location.href="/deleteBoardComment.do?boardCommNo="+boardCommNo+"&boardNo="+boardNo;
			}
		}
			
			</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>























