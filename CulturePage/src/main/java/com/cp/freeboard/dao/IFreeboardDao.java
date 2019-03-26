package com.cp.freeboard.dao;

import java.util.List;

import com.cp.freeboard.Freeboard;
import com.cp.paging.Criteria;
import com.cp.reply.Reply;

public interface IFreeboardDao {
	List<Freeboard> freeboardList();
	Freeboard detailFreeboard(Freeboard freeboard);
	void updateContent(Freeboard freeboard);
	void deleteContent(Freeboard freeboard);
	
	// [ 페이징 처리를 위한 메서드 ]
    public List<Freeboard> freeboardList(Criteria cri);
 
    // 전체 게시글 수 구하기
    public Integer TotalCount();
    
    void replyInsert(Reply reply);   
    List<Reply> selectReply(Reply reply);
    void replyDelete(Reply reply);
    void replyUpdate(Reply reply);
}
