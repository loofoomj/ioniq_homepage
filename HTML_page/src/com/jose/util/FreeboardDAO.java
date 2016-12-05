package com.jose.util;

import java.util.List;

public interface FreeboardDAO {
	//댓글
	public int freeReply(FreeboardDTO f);
	//보기
	public FreeboardDTO freeView(int num);
	//글쓰기
	public int freeWrite(FreeboardDTO f);
	//리스트
	public List<FreeboardDTO> freeList(PageMaker pm);
	//수정
	public FreeboardDTO freeboardMod(int num);
	//수정프로세스
	public int freeboardModProcess(FreeboardDTO f);
	//삭제
	public int freeboardDelete(int num);
	//글종류
	public String freeboardKind();
}
