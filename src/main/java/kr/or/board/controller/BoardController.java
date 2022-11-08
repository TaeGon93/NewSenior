package kr.or.board.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.multipart.MultipartFile;

import common.FileRename;
import kr.or.board.model.service.BoardService;
import kr.or.board.model.vo.Board;
import kr.or.board.model.vo.BoardComment;
import kr.or.board.model.vo.FileVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	@Autowired
	private FileRename fileRename;

	@RequestMapping(value="/boardList.do")
	public String boardList(int reqPage,Model model,String boardType) {
		HashMap<String, Object> pageMap = service.selectBoardList(reqPage,boardType);
		System.out.println(pageMap);
		model.addAttribute("list",(ArrayList<Board>)pageMap.get("list"));
		model.addAttribute("pageNavi",(String)pageMap.get("pageNavi"));
		model.addAttribute("reqPage",(int)pageMap.get("reqPage"));
		model.addAttribute("numPerPage",(int)pageMap.get("numPerPage"));
		//reqPage,numPerPage는 글번호와 상관없이 가장 최신글이 1번으로 출력되게 하기 위해서 보내줌
		return "board/boardList";
	}
	
	@RequestMapping(value="/boardView.do")
	public String boardView(int boardNo,Model model) {
		HashMap<String, Object> pageViewMap = service.selectOneBoard(boardNo);
		model.addAttribute("b",(Board)pageViewMap.get("b"));
		//댓글추가
		model.addAttribute("commentList",(ArrayList<BoardComment>)pageViewMap.get("commentList"));
		//대댓글 추가
		model.addAttribute("reCommentList",(ArrayList<BoardComment>)pageViewMap.get("reCommentList"));
		return "board/boardView";
	}
	
	@RequestMapping(value="/boardWriteFrm.do")
	public String boardWriteFrm() {
		return "board/boardWriteFrm";
	}
	
	@RequestMapping(value="/boardWrite.do")
	public String boardWrite(Board b,MultipartFile[] boardFile,HttpServletRequest request) {
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

		return "redirect:/boardList.do?reqPage=1";
		//return "redirect:/boardList.do?reqPage=1&boardType=F";
	}
	
	// 게시물 수정
	@RequestMapping(value="/boardUpdateFrm.do")
	public String boardUpdateFrm(int boardNo,Model model){
		HashMap<String, Object> Map = service.selectOneBoard(boardNo);
		model.addAttribute("b",(Board)Map.get("b"));
		return "board/boardUpdateFrm";
	}
	
	@RequestMapping(value="/boardUpdate.do")
	public String boardUpdate(int[] fileNoList, String[] filepathList,Board b,MultipartFile[] boardFile, HttpServletRequest request) {
								//ㄴ(jsp에서)데이터가 같은 name으로 여러개 넘어오면 배열로 받기
								// 배열: 삭제할파일 no, 삭제할 파일 경로
		ArrayList<FileVO> fileList = new ArrayList<FileVO>();
		
		
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
		
		return "redirect:/boardView.do?boardNo="+b.getBoardNo();
	}
	
	//게시물 삭제
	@RequestMapping(value="/boardDelete.do")
	public String boardDelete(int boardNo, HttpServletRequest request) {
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
		return "redirect:/boardList.do?reqPage=1";
	}
	
	//댓글입력
	
	@RequestMapping(value="/insertComment.do")
	public String insertComment(BoardComment bc) {
		int result = service.insertComment(bc);
//		return "board/boardView.do?boardNo="+bc.getBoardRef();
	
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
	
	
	// 에이터 사용 이미지 업로드
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
	public String searchCategory(int reqPage, String categoryTag, String searchTag, String searchInput,Model model) {
		
		HashMap<String, Object> categoryMap = service.selectBoardList(reqPage,categoryTag,searchTag,searchInput);
		
		model.addAttribute("list",(ArrayList<Board>)categoryMap.get("list"));
		model.addAttribute("pageNavi",(String)categoryMap.get("pageNavi"));
		model.addAttribute("reqPage",(int)categoryMap.get("reqPage"));
		model.addAttribute("numPerPage",(int)categoryMap.get("numPerPage"));
		//reqPage,numPerPage는 글번호와 상관없이 가장 최신글이 1번으로 출력되게 하기 위해서 보내줌
		model.addAttribute("categoryTag",(String)categoryMap.get("categoryTag"));
		model.addAttribute("searchTag",(String)categoryMap.get("searchTag"));
		model.addAttribute("searchInput",(String)categoryMap.get("searchInput"));
		
		
		return "board/boardList";
	}
	
	
}

























