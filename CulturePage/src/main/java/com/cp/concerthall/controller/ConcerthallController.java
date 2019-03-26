package com.cp.concerthall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cp.concerthall.service.ConcerthallService;

@Controller
public class ConcerthallController {
	
	@Autowired
	ConcerthallService service;
	
	@RequestMapping("/searchConcerthall.do")
	public String searchConcerthall() {
		
		return "concerthall/searchConcerthall";
	}
}
