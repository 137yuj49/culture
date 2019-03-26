package com.cp.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cp.loginInfo.LoginInfo;
import com.cp.member.MemberDto;
import com.cp.member.exception.DuplicateMemberException;
import com.cp.member.service.MemberService;
import com.cp.member.validator.RegisterRequestValidator;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@RequestMapping("/idCheck.do")
	@ResponseBody
	public String idCheck(@RequestParam(value="id") String id) {
		System.out.println("controller id : " + id);
		String checkedId = service.idCheck(id);
		System.out.println("controller checkedId : " + checkedId );
		return checkedId;
	}
	
	
	@RequestMapping("/write.do")
	public String memberRegisterPage() {
		return "register/register";
	}	
		
	@RequestMapping(value="/memberJoin.do", method=RequestMethod.POST)
	public String memberJoin(MemberDto dto) {
		service.memberRegister(dto);			
		return "register/memberRegisterOk";		
	}
	
	
	@RequestMapping("/prelogin.do")
	public String memberLoginPage() {
		return "login/login";
	}
	
	// 濡
	@RequestMapping(value="/login.do")
	public String memberLogin(MemberDto dto, HttpServletRequest request) {
		System.out.println("controller login id = " + dto.getId());
		System.out.println("controller login pwd = " + dto.getPwd());
		
		MemberDto member = service.memberCheck(dto);				
		
		if(member!=null) {
			HttpSession session = request.getSession();
			System.out.println("session is New() = " + session.isNew());
			System.out.println("session Id is = " + session.getId());
			System.out.println("session createTime is  = " + session.getCreationTime());
			
			session.setAttribute("member", member);
			LoginInfo login = new LoginInfo();
			login.setId(dto.getId());
			login.setPwd(dto.getPwd());
			login.setEmail(member.getEmail());
			service.loginInfoInput(login);
			return "redirect:/index.jsp";							
		}else {
			return "prelogin.do";
		}
	}
	
	// 濡
	@RequestMapping("/logout.do")
	public String memberLogout(HttpServletRequest request) {
				
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("member");
		service.loginRemove(member);
		System.out.println("session logout session_Id = " + session.getId());
		session.invalidate();
		return "redirect:/index.jsp";
	}
	
	// 
	@RequestMapping("/memberRemove.do")
	public String memberRemove(MemberDto dto, HttpSession session) {
		MemberDto member = (MemberDto) session.getAttribute("member");		
		service.memberRemove(member);
		session.invalidate();
		return "member/memberRemoveOk";
	}
	
	// 
	@RequestMapping("/memberModifyForm.do")
	public ModelAndView memberModifyForm(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto)session.getAttribute("member");
		
		ModelAndView mav = new ModelAndView();
		//mav.addObject("member", service.memberSearch(member));
		mav.setViewName("member/memberModifyForm");
		return mav;
	}
	 
	// 
	@RequestMapping("/memberModify.do")
	public ModelAndView memberModify(MemberDto dto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		//MemberDto member = service.memberModify(dto);
		//session.setAttribute("member", value);
		ModelAndView mav = new ModelAndView();
		//mav.addObject("memberAfter", member);
		mav.setViewName("member/memberModifyOK");
		return mav;
	}
}
