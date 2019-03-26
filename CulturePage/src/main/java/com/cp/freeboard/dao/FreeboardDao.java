package com.cp.freeboard.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cp.freeboard.Freeboard;
import com.cp.paging.Criteria;
import com.cp.reply.Reply;

@Repository
public class FreeboardDao implements IFreeboardDao{
	
	@Autowired
	SqlSessionTemplate temp;
	
	///////////////////////페이징 처리
	 @Override
    public List<Freeboard> freeboardList(Criteria cri) {
	 	System.out.println("Dao freeboardList cri getPage : " + cri.getPage());
		System.out.println("Dao freeboardList cri getPageNum : " + cri.getPerPageNum());
		System.out.println("Dao freeboardList cri getPageStart : " + cri.getPageStart());
		
	 	System.out.println("freeboardList : " + temp.selectList("culturePage.listCriteria",cri));
        return temp.selectList("culturePage.listCriteria",cri);
    }
 
    @Override
    public Integer TotalCount(){
    	System.out.println("TotalCount : " + temp.selectOne("culturePage.getTotalCount"));
        return temp.selectOne("culturePage.getTotalCount");
    }

	
	@Override
	public List<Freeboard> freeboardList() {
		List<Freeboard> list = temp.selectList("culturePage.freeboardList");
		System.out.println("freeboardList success!!!");
		return list;
	}
	
	@Override
	public Freeboard detailFreeboard(Freeboard freeboard) {
		System.out.println("Dao detailFreeboard  id : "+ freeboard.getId());
		System.out.println("Dao detailFreeboard title : " + freeboard.getTitle());
		
		Freeboard detailFreeboard = temp.selectOne("culturePage.detailFreeboard", freeboard);
		System.out.println("detailFreeboard success!!!");
		return detailFreeboard;
	}
	
	@Override
	public void updateContent(Freeboard freeboard) {
		System.out.println("Dao freeboard id : " + freeboard.getId());
		System.out.println("Dao freeboard content : " + freeboard.getContent());
		System.out.println("Dao freeboard fdate : " + freeboard.getTitle());
		
		temp.update("culturePage.updateContent", freeboard);
		System.out.println("updateContent success !!!");
	}
	
	@Override
	public void deleteContent(Freeboard freeboard) {
		System.out.println("Dao freeboard id : " + freeboard.getId());
		System.out.println("Dao freeboard fdate : " + freeboard.getTitle());
		temp.delete("culturePage.deleteContent", freeboard);
		System.out.println("deleteContent success !!!");
	}
	
	@Override
	public void replyInsert(Reply reply) {
		temp.insert("culturePage.replyInsert", reply);
		System.out.println("replyInsert success !!!");
	}
	
	@Override
	public List<Reply> selectReply(Reply reply) {
		System.out.println("Dao selectReply id : " + reply.getId() );
		System.out.println("Dao selectReply title : " + reply.getTitle());
		
		List<Reply> list = temp.selectList("culturePage.selectReply", reply);
		System.out.println("selectReply success !!!");
		return list;
	}
	
	@Override
	public void replyDelete(Reply reply) {
		System.out.println("Dao replyDelete id : " + reply.getId() );
		System.out.println("Dao replyDelete writer : " + reply.getWriter());
		System.out.println("Dao replyDelete rcomment : " + reply.getRcomment());
		
		temp.delete("culturePage.replyDelete", reply);
		System.out.println("replyDelete success !!!");
		
	}
	
	@Override
	public void replyUpdate(Reply reply) {
		System.out.println("Dao replyDelete id : " + reply.getId() );
		System.out.println("Dao replyDelete writer : " + reply.getWriter());
		System.out.println("Dao replyDelete rcomment : " + reply.getRcomment());
		
		temp.update("culturePage.replyUpdate", reply);
		System.out.println("replyUpdate success !!!");
	}
}
