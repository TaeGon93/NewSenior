package kr.or.board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.multipart.MultipartFile;

import common.FileRename;
import kr.or.board.model.service.BoardService;
import kr.or.board.model.vo.Board;
import kr.or.board.model.vo.BoardCategoryVO;
import kr.or.board.model.vo.BoardComment;
import kr.or.board.model.vo.FileVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	@Autowired
	private FileRename fileRename;

	@RequestMapping(value="/boardList.do")
	public String boardList(int reqPage,Model model,String boardType,HttpSession session) {
		HashMap<String, Object> pageMap = service.selectBoardList(reqPage,boardType);
		System.out.println("boardList pageMap : "+pageMap);
		model.addAttribute("list",(ArrayList<Board>)pageMap.get("list"));
		model.addAttribute("pageNavi",(String)pageMap.get("pageNavi"));
		model.addAttribute("reqPage",(Integer)pageMap.get("reqPage"));
		model.addAttribute("numPerPage",(Integer)pageMap.get("numPerPage"));
		//reqPage,numPerPage는 글번호와 상관없이 가장 최신글이 1번으로 출력되게 하기 위해서 보내줌
		//model.addAttribute("boardType",(int)pageMap.get("boardType"));
		model.addAttribute("boardType",boardType);
		model.addAttribute("cateList",(ArrayList<BoardCategoryVO>)pageMap.get("cateList"));
		session.setAttribute("boardType",boardType);// 매우중요 : 게실글 작성시, 게시글 작성 후 boardType별로 리스트 나타낼 때 꼭 필요
		System.out.println(boardType);
		return "board/boardList";
	}
	
	@RequestMapping(value="/boardView.do")
	public String boardView(int boardNo,Model model,String boardType,HttpSession session,Board b) {
		HashMap<String, Object> pageViewMap = service.selectOneBoard(boardNo);
		model.addAttribute("b",(Board)pageViewMap.get("b"));
		//댓글추가
		model.addAttribute("commentList",(ArrayList<BoardComment>)pageViewMap.get("commentList"));
		//대댓글 추가
		model.addAttribute("reCommentList",(ArrayList<BoardComment>)pageViewMap.get("reCommentList"));
		session.setAttribute("boardType",boardType);
		System.out.println("controllerView boardType :"+boardType);
		System.out.println("memberImg: "+b.getMemberImg());

		return "board/boardView";
			
			
	}
	
	@RequestMapping(value="/boardWriteFrm.do")
	public String boardWriteFrm() {
		return "board/boardWriteFrm";
	}
	
	@RequestMapping(value="/boardWrite.do")
	public String boardWrite(Board b,MultipartFile[] boardFile,HttpServletRequest request,String boardType) {
																//ㄴ파일업로드 경로 구하기 위해서
														//ㄴboardWriteFrm.jsp에 있는 이름 그대로
														//<input type="file" name="boardFile" multiple>
		ArrayList<FileVO> filelist = new ArrayList<FileVO>();
		if(!boardFile[0].isEmpty()) {
			//첨부파일이 있는 경우 파일업로드 수행
			//1.파일 업로드 경로 설정(getRealPath()까지가 webapp폴더)
			String savePath= request.getSession().getServletContext().getRealPath("/resources/upload/board/");
			
			//2.반복문을 이용한 파일 업로드
			for(MultipartFile file :  boardFile ) {
				//파일명이 기존 업로드한 파일명과 중복되는 경우, 기존파일을 삭제하고 새파일 남는 현상(덮어쓰기)
				//파일명 중복처리
				//사용자가 업로드한 파일 이름 추출
				String filename = file.getOriginalFilename();
				String filepath = fileRename.fileRename(savePath,filename);
				try {
					FileOutputStream fos = new FileOutputStream(savePath+filepath);
					//속도개선을 위한 보조스트림 사용
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					//파일 업로드
					byte[] bytes = file.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				//파일 업로드 끝(파일1개 업로드)
				FileVO fileVO = new FileVO();
				fileVO.setFilename(filename);
				fileVO.setFilepath(filepath);
				filelist.add(fileVO);
			} 
		}
		b.setFileList(filelist);
		int result = service.insertBoard(b);
		System.out.println("writeFrm : "+boardType);
		return "redirect:/boardList.do?reqPage=1&boardType="+boardType; //이건 성공
	
	}
	
	// 게시물 수정
	// 수정버튼 누르면 주소창에 boardType보내줌 
	//"/boardUpdateFrm.do?boardNo=${b.boardNo}&boardType=${b.boardType} // boardView.jsp
	@RequestMapping(value="/boardUpdateFrm.do")
	public String boardUpdateFrm(int boardNo,Model model){
		HashMap<String, Object> Map = service.selectOneBoard(boardNo);
		model.addAttribute("b",(Board)Map.get("b"));
		System.out.println("(Board)Map.get('b'):"+(Board)Map.get("b"));
		return "board/boardUpdateFrm";
	}
	
	@RequestMapping(value="/boardUpdate.do")
	public String boardUpdate(int[] fileNoList, String[] filepathList,Board b,MultipartFile[] boardFile, HttpServletRequest request,String boardType) {
								//ㄴ(jsp에서)데이터가 같은 name으로 여러개 넘어오면 배열로 받기
								// 배열: 삭제할파일 no, 삭제할 파일 경로
		ArrayList<FileVO> fileList = new ArrayList<FileVO>();
		
		System.out.println("fileNoList:"+fileNoList);
		System.out.println("filepathList:"+filepathList);
		System.out.println("boardFile:"+boardFile);
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/board/");
		
		if(!boardFile[0].isEmpty()) {
			for(MultipartFile file:boardFile) {
				String filename = file.getOriginalFilename();
				//ㄴ올린 원본파일명 가져오기
				String filepath = fileRename.fileRename(savePath,filename);
				//ㄴ중복체크
				File upFile = new File(savePath+filepath);
				
				try {
					FileOutputStream fos = new FileOutputStream(upFile);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = file.getBytes();
					bos.write(bytes);
					bos.close();
					//ㄴ서버에 파일 업로드
					
					FileVO f = new FileVO();
					f.setFilename(filename);
					f.setFilepath(filepath);
					fileList.add(f);
					
					System.out.println("f:"+f);
					
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}// if문 종료
		b.setFileList(fileList);
		int result = service.boardUpdate(b,fileNoList);
		if(fileNoList != null && result == (fileList.size()+fileNoList.length+1)) {
			if(filepathList != null) {
				//새 첨부파일 갯수, 삭제한 파일 갯수
				for(String filepath : filepathList) {
					File delFile = new File(savePath+filepath);
					delFile.delete();
				}
			}
		}
		
		//return "redirect:/boardView.do?boardNo="+b.getBoardNo()+"&boardType="+boardType;
		return "redirect:/boardView.do?boardNo="+b.getBoardNo();
	}
	
	//게시물 삭제
	//삭제버튼 누르면 주소창에 boardType보내줌
	///boardDelete.do?boardNo=${b.boardNo}&boardType=${b.boardType}(boardView.jsp)
	@RequestMapping(value="/boardDelete.do")
	public String boardDelete(int boardNo, HttpServletRequest request,String boardType) {
		//borad테이블 삭제
		ArrayList<FileVO> list = service.boardDelete(boardNo);
		
		//실제 파일 삭제
		if(list != null) {
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/board/");
			for(FileVO file : list) {
				File delFile = new File(path+file.getFilepath());
				delFile.delete();
			}
		}
		return "redirect:/boardList.do?reqPage=1&boardType="+boardType;
		//return "redirect:/boardList.do?reqPage=1";
	}
	
	//파일 다운로드
		@RequestMapping(value="/boardFileDown.do")
		public void boardFileDown(int fileNo,HttpServletResponse response,HttpServletRequest request) { 
			//fileNo : DB에서 filename,filepath를 조회하기 위한 값
			//request : 파일이 위치하는 경로를 찾기 위해서 필요
			//response : 사용자에게 파일을 보내주기 위해 필요
			
			//비즈니스 로직
			//ArrayList<FileVO> downfileList = service.getBoard(fileNo);
			FileVO f = service.boardFileDown(fileNo);
			//파일다운로드 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/board/");
			String downFile = savePath+f.getFilepath();
			
			 try {
				//속도개선
		         FileInputStream fis = new FileInputStream(downFile);
		         BufferedInputStream bis = new BufferedInputStream(fis);
		         //파일을 사용자에게 내보내기위한 스트림 생성
		         ServletOutputStream sos = response.getOutputStream();
		         BufferedOutputStream bos = new BufferedOutputStream(sos);
		         //파일명 처리
		         String resFilename = new String(f.getFilename().getBytes("utf-8"),"ISO-8859-1");//ISO-8859-1 크롬
		         //파일다운로드를 위한 http헤더 설정
		         response.setContentType("application/octet-stream");
		         response.setHeader("Content-Disposition", "attachment;filename="+resFilename);
		         //파일전송
		         while(true) {
		            int read = bis.read(); //읽어옴
		            if(read != -1) {
		               bos.write(read);
		            }else {
		               break;
		            }
		         }
		         bos.close();
		         bis.close(); //반환 
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	
	//댓글입력
	
	@RequestMapping(value="/insertComment.do")
	public String insertComment(BoardComment bc) {
		int result = service.insertComment(bc);
		return "redirect:/boardView.do?boardNo="+bc.getBoardRef();
		

	
	// 댓글 수정
	}
	@RequestMapping(value="/boardCommentUpdate.do")
	public String boardCommUpdate(BoardComment bc,int boardNo) {
		int result = service.updateBoardComment(bc);
		return "redirect:/boardView.do?boardNo="+boardNo;
		
	}
	
	//댓글삭제
	@RequestMapping(value="/deleteBoardComment.do")
	public String deleteBoardComment(BoardComment bc,int boardNo) {
		int result = service.deleteBoardComment(bc);
		return "redirect:/boardView.do?boardNo="+boardNo;
	}
	
	
	// 에디터 사용 이미지 업로드
	@RequestMapping(value="/uploadImages.do")
	public void uploadImage(Board b,MultipartFile[] file,HttpServletRequest request,HttpServletResponse response) throws IOException {
																//ㄴ파일업로드 경로 구하기 위해서
													
		response.setContentType("text/html;charset=utf-8");
		if(!file[0].isEmpty()) {
			//첨부파일이 있는 경우 파일업로드 수행
			//1.파일 업로드 경로 설정(getRealPath()까지가 webapp폴더)
			String savePath= request.getSession().getServletContext().getRealPath("/resources/upload/board/");
			
			//2.반복문을 이용한 파일 업로드
			for(MultipartFile file1 :  file ) {
				//파일명이 기존 업로드한 파일명과 중복되는 경우, 기존파일을 삭제하고 새파일 남는 현상(덮어쓰기)
				//파일명 중복처리
				//사용자가 업로드한 파일 이름 추출
				String filename = file1.getOriginalFilename();
				String filepath = fileRename.fileRename(savePath,filename);
				try {
					FileOutputStream fos = new FileOutputStream(savePath+filepath);
					//속도개선을 위한 보조스트림 사용
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					//파일 업로드
					byte[] bytes = file1.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				//파일 업로드 끝(파일1개 업로드)
				PrintWriter out = response.getWriter();
				out.print("/resources/upload/board/"+filepath);
			} 
		}
	}
	
	// 카테고리별 검색기능 -- 게시판 별로 따로 제작???
	@RequestMapping(value="/searchBoard.do")
	public String searchCategory(int reqPage, String categoryTag, String searchTag, String searchInput,Model model,HttpSession session,String boardType) {
		System.out.println(" 검색 categoryTag :" +categoryTag);
		System.out.println(" 검색 searchTag :" +searchTag);
		HashMap<String, Object> categoryMap = service.selectBoardList(reqPage,categoryTag,searchTag,searchInput,boardType);
		
		model.addAttribute("list",(ArrayList<Board>)categoryMap.get("list"));
		model.addAttribute("pageNavi",(String)categoryMap.get("pageNavi"));
		model.addAttribute("reqPage",(Integer)categoryMap.get("reqPage"));
		model.addAttribute("numPerPage",(Integer)categoryMap.get("numPerPage"));
		//reqPage,numPerPage는 글번호와 상관없이 가장 최신글이 1번으로 출력되게 하기 위해서 보내줌
		model.addAttribute("categoryTag",(String)categoryMap.get("categoryTag"));
		model.addAttribute("searchTag",(String)categoryMap.get("searchTag"));
		model.addAttribute("searchInput",(String)categoryMap.get("searchInput"));
		model.addAttribute("searchInput",(String)categoryMap.get("boardType"));
		
		session.setAttribute("categoryTag",(String)categoryMap.get("categoryTag"));
		session.setAttribute("searchTag",(String)categoryMap.get("searchTag"));
		session.setAttribute("searchInput",(String)categoryMap.get("searchInput"));	
		System.out.println("session :"+session);
		return "board/boardList";
		
	}
	
	
}

























