package com.cp.freeboard.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cp.freeboard.Freeboard;
import com.cp.freeboard.service.FreeboardService;
import com.cp.paging.Criteria;
import com.cp.paging.PageMaker;
import com.cp.reply.Reply;

@Controller
public class FreeboardController {
	
	@Autowired
	FreeboardService service;
	
	@RequestMapping("/editor.do")
	public String editor() {
		return "freeboard/editor";
	}
	
	@RequestMapping("/replyUpdate.do")
	@ResponseBody
	public void replyUpdate(Reply reply) {
		System.out.println("Controller replyDelete id : " + reply.getId() );
		System.out.println("Controller replyDelete writer : " + reply.getWriter());
		System.out.println("Controller replyDelete rcomment : " + reply.getRcomment());
		
		service.replyUpdate(reply);
	}
	
	@RequestMapping("/replyDelete.do")
	@ResponseBody
	public void replyDelete(Reply reply) {
		System.out.println("Controller replyDelete id : " + reply.getId() );
		System.out.println("Controller replyDelete writer : " + reply.getWriter());
		System.out.println("Controller replyDelete rcomment : " + reply.getRcomment());
		
		service.replyDelete(reply);

	}
	
	@RequestMapping("/selectReply.do")
	@ResponseBody
	public List<Reply> selectReply(Reply reply){
		System.out.println("Controller selectReply id : " + reply.getId() );
		System.out.println("Controller selectReply title : " + reply.getTitle());
		
		List<Reply> list = service.selectReply(reply);
		return list;
	}
	
	@RequestMapping("/replyInsert.do")
	@ResponseBody
	public void replyInsert(Reply reply) {
		System.out.println("Controller replyInsert id : " + reply.getId() );
		System.out.println("Controller replyInsert rcomment : " + reply.getRcomment());
		System.out.println("Controller replyInsert writer : " + reply.getWriter());
		System.out.println("Controller replyInsert title : " + reply.getTitle());
		
		service.replyInsert(reply);
		
	}
	
	@RequestMapping("/deleteContent.do")
	public void deleteContent(Freeboard freeboard) {
		System.out.println("Controller freeboard id : " + freeboard.getId());
		System.out.println("Controller freeboard fdate : " + freeboard.getTitle());
		
		service.deleteContent(freeboard);
	}
	
	@RequestMapping(value="/updateContent.do")
	@ResponseBody
	public void updateContent(Freeboard freeboard) {
		System.out.println("Controller freeboard id : " + freeboard.getId());
		System.out.println("Controller freeboard content : " + freeboard.getContent());
		System.out.println("Controller freeboard fdate : " + freeboard.getTitle());
		
		service.updateContent(freeboard);		
	}
	

	///////////////////페이징 처리
	@RequestMapping("/freeboard.do")
	public ModelAndView freeboardList(Criteria cri){
		System.out.println("Controller freeboardList cri getPage : " + cri.getPage());
		System.out.println("Controller freeboardList cri getPageNum : " + cri.getPerPageNum());
		System.out.println("Controller freeboardList cri getPageStart : " + cri.getPageStart());
		
		ModelAndView mav = new ModelAndView();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.totalCount());
		
		List<Freeboard> list = service.freeboardList(cri);
		
		mav.addObject("list", list);
		mav.addObject("pageMaker", pageMaker);
		
		mav.setViewName("freeboard/freeboard");
		return mav;
	}
	
	
	
	
	@RequestMapping("/detailFreeboard.do")
	@ResponseBody
	public ModelAndView detailFreeboard(Freeboard freeboard) {
		System.out.println("Controller detailFreeboard  id : "+ freeboard.getId());
		System.out.println("Controller detailFreeboard title : " + freeboard.getTitle());
		
		Freeboard detailFreeboard = service.detailFreeboard(freeboard);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("detailFreeboard", detailFreeboard);
		mav.setViewName("freeboard/detailPage");
		
		return mav;
	}
	
}
