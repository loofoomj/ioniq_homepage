package com.jose.util;

import java.util.ArrayList;

import com.jose.util.BoardDTO;

public interface BoardDAO {
	//리스트
	public ArrayList<BoardDTO> boardList(PageMaker pm);
	
	//글쓰기
	public int boardWrite(BoardDTO bDto);
	
	//view
	public BoardDTO boardView(int num);
	
	//글수정
	public BoardDTO boardMod(int num);
	
	//글수정프로세스
	public int boardModProcess(BoardDTO bDto);
	
	//글삭제
	public int boardDelete(int num);
	
	//글종류
	public String boardKind();
	
	
}
