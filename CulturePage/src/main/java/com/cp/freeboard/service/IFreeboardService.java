package com.cp.freeboard.service;

import java.util.List;

import com.cp.freeboard.Freeboard;
import com.cp.paging.Criteria;
import com.cp.reply.Reply;

public interface IFreeboardService {
	List<Freeboard> freeboardList();
	Freeboard detailFreeboard(Freeboard freeboard);
	void updateContent(Freeboard freeboard);
	void deleteContent(Freeboard freeboard);
	
	// 페이징 처리 서비스 메서드
    public List<Freeboard> freeboardList(Criteria cri);
 
    // 전체 게시글 수 구하기
    public Integer totalCount();
    
    void replyInsert(Reply reply);    
    List<Reply> selectReply(Reply reply);
    void replyDelete(Reply reply);
    void replyUpdate(Reply reply);
}
