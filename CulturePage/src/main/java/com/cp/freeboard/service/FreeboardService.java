package com.cp.freeboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cp.freeboard.Freeboard;
import com.cp.freeboard.dao.FreeboardDao;
import com.cp.paging.Criteria;
import com.cp.reply.Reply;

@Service
public class FreeboardService implements IFreeboardService{
	
	@Autowired
	FreeboardDao dao;
	
	@Override
	public List<Freeboard> freeboardList() {
		// TODO Auto-generated method stub
		return null;
	}
 
    @Override
    public Integer totalCount() {
        return dao.TotalCount();
    }

	//////////////////////// 페이징 처리
	@Override
	public List<Freeboard> freeboardList(Criteria cri) {
		System.out.println("Service freeboardList cri getPage : " + cri.getPage());
		System.out.println("Service freeboardList cri getPageNum : " + cri.getPerPageNum());
		System.out.println("Service freeboardList cri getPageStart : " + cri.getPageStart());
		
		List<Freeboard> list = dao.freeboardList(cri);
		return list;
	}
	
	@Override
	public Freeboard detailFreeboard(Freeboard freeboard) {
		System.out.println("Service detailFreeboard  id : "+ freeboard.getId());
		System.out.println("Service detailFreeboard title : " + freeboard.getTitle());
		
		Freeboard detailFreeboard = dao.detailFreeboard(freeboard);
		return detailFreeboard;
	}
	
	@Override
	public void updateContent(Freeboard freeboard) {
		System.out.println("Service freeboard id : " + freeboard.getId());
		System.out.println("Service freeboard content : " + freeboard.getContent());
		System.out.println("Service freeboard fdate : " + freeboard.getTitle());
		
		dao.updateContent(freeboard);
		
	}
	
	@Override
	public void deleteContent(Freeboard freeboard) {
		System.out.println("Service freeboard id : " + freeboard.getId());
		System.out.println("Service freeboard fdate : " + freeboard.getTitle());
		dao.deleteContent(freeboard);
	}
	
	@Override
	public void replyInsert(Reply reply) {
		System.out.println("Service replyInsert id : " + reply.getId() );
		System.out.println("Service replyInsert rcomment : " + reply.getRcomment());
		System.out.println("Service replyInsert writer : " + reply.getWriter());
		System.out.println("Service replyInsert title : " + reply.getTitle());
		
		dao.replyInsert(reply);
		
	}
	
	@Override
	public List<Reply> selectReply(Reply reply) {
		System.out.println("Service selectReply id : " + reply.getId() );
		System.out.println("Service selectReply title : " + reply.getTitle());
		
		List<Reply> list = dao.selectReply(reply);
		return list;
	}
	
	@Override
	public void replyDelete(Reply reply) {
		System.out.println("Service replyDelete id : " + reply.getId() );
		System.out.println("Service replyDelete writer : " + reply.getWriter());
		System.out.println("Service replyDelete rcomment : " + reply.getRcomment());
		
		dao.replyDelete(reply);
		
	}
	
	@Override
	public void replyUpdate(Reply reply) {
		System.out.println("Service replyDelete id : " + reply.getId() );
		System.out.println("Service replyDelete writer : " + reply.getWriter());
		System.out.println("Service replyDelete rcomment : " + reply.getRcomment());
		
		dao.replyUpdate(reply);
		
	}
	
}
