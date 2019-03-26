package com.cp.show.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cp.movie.Movie;
import com.cp.show.ShowDto;
import com.cp.show.service.ShowService;

@Controller
public class ShowController {
	
	@Autowired
	ShowService service;
	
	@Autowired
	private ServletContext application;
	
	@RequestMapping("/detailReservating.do")
	public String detailReservating() {
		return "reservation/detailReservating";
	}
	
	@RequestMapping("/showList.do")
	public String showList() {
		return "show/showList";
	}
	
	@RequestMapping("/detailPage.do")
	public String detailPage() {
		return "detailPage/detailPage";
	}
	
	@RequestMapping("/index.do")
	public String indexPage() {
		return "redirect:/index.jsp";
	}
	
	@RequestMapping("/showPage.do")
	public String showPage() {
		return "show/showPage";
	}
	
	@RequestMapping("/showInsertPage.do")
	public String showInsertPage() {
		return "showRegister/showRegister";
	}
	
	@RequestMapping("selectTheMovie.do")
	@ResponseBody
	public Movie selectTheMovie(Movie movie) {
		System.out.println("Controller selectTheMovie : " + movie.getMovie_title());
		Movie mov  = service.selectTheMovie(movie);
		
		System.out.println("Controller select the movie_content : " + mov.getMovie_content());
		System.out.println("Controller select the movie_no : " + mov.getMovie_no());
		return mov;
	}
	
	@RequestMapping(value="/showInsert.do", method=RequestMethod.POST)
	public String AllSelectShow(ShowDto sDto) {		
		
		String path = application.getRealPath("resources/upload");
		System.out.println("Path : " + path);
		
		String img = sDto.getUpload_f().getOriginalFilename();
		System.out.println("Img : " + img);
		
		File file = new File(path, img);
		try {
			sDto.getUpload_f().transferTo(file);
		}catch(Exception e) {
			System.out.println("" + e.getMessage());
		}
		
		sDto.setShow_picture(img);
		System.out.println("Controller file name = " + sDto.getShow_picture());
		
		service.showInsert(sDto);
		return "redirect:/index.do";
	}
	
	@RequestMapping("/allSelectShow.do")
	public ModelAndView allSelectShow() {
		System.out.println("controller allSelectShow good");
		
		ModelAndView mav = new ModelAndView();
		List<ShowDto> list = null;
		list = service.allSelectShow();
		
		mav.addObject("list", list);
		mav.setViewName("show/showPageCarousel");
		return mav;
	}
	
	@RequestMapping("/selectTodayShow.do")
	public ModelAndView selectTodayShow() {
		List<ShowDto> todayShowlist = null;
		todayShowlist = service.selectTodayShow();
		for(int i=0;i<todayShowlist.size();i++) {
			System.out.println("today Show List : " + todayShowlist.get(i));
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("todayShowList", todayShowlist);
		mav.setViewName("show/showPageCarousel");
		return mav;
	}
}
