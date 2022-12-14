package kr.or.board.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {
	private int boardNo;
	private int memberNo;
	private String boardTitle;
	private String boardContent;
	private int boardCount;
	private String boardDate;
	private String boardType;
	private String boardCategory;
	private int boardCommCnt;
	
	
	private String nickName; // 조인해서 가져온 컬럼
	private String memberImg; // 조인해서 가져온 컬럼
	
	
	
	private String boardName;
	private String categoryCode;
	private String categoryName;
	
	private ArrayList<FileVO> fileList; // 추가함
	
}
