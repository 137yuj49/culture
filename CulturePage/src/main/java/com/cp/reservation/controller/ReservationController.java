package com.cp.reservation.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cp.movie.Movie;
import com.cp.movieplace.MoviePlace;
import com.cp.reservation.service.ReservationService;
import com.cp.screeningplan.ScreeningPlan;
import com.cp.ticket.Ticket;

@Controller
public class ReservationController {
	
	@Autowired
	ReservationService service;	
	
	@RequestMapping("/paymentResultPage1.do")
	public String paymentResult() {
		return "reservation/paymentResultPage";
	}
	
	@RequestMapping("/paymentResultPage.do")
	public ModelAndView paymentResultPage(Ticket ticket, @RequestParam("price") String price){
		System.out.println("Controller ticket id : " + ticket.getId());
		System.out.println("Controller ticket movie_no : " + ticket.getMovie_no());
		System.out.println("Controller ticket movieplace_no : " + ticket.getMovieplace_no());
		System.out.println("Controller ticket screeningplan_no : " + ticket.getScreeningplan_no());
		System.out.println("Controller ticket totalprice : " + price);
		List<Ticket> list = service.paymentResultPage(ticket);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("price", price);
		mav.setViewName("reservation/paymentResultPage");
		return mav;
	}
	
	@RequestMapping("/getTime.do")
	@ResponseBody
	public List<ScreeningPlan> getTime(ScreeningPlan screeningplan){
		System.out.println("Controller getTime getScreeningdate : " + screeningplan.getScreeningdate());
		System.out.println("Controller getTime movie_no : " + screeningplan.getMovie_no());
		System.out.println("Controller getTime movieplace_no : " + screeningplan.getMovieplace_no());
		List<ScreeningPlan> list = null;
		list = service.getTime(screeningplan);
		return list;
	}
	
	@RequestMapping("/selectTheTime.do")
	@ResponseBody
	public List<ScreeningPlan> selectTheTime(ScreeningPlan screeningplan){
		System.out.println("Controller screeningplan getScreeningdate : " + screeningplan.getScreeningdate());
		System.out.println("Controller screeningplan getScreeningdate : " + screeningplan.getMovie_no());
		List<ScreeningPlan> list = null;
		list = service.selectTheTime(screeningplan);
		for(int i=0;i<list.size();i++) {
			System.out.println("screeningtime > " + list.get(i).getScreeningtime() + 
					" : movieplace_no > " + list.get(i).getMovieplace_no());
		}
		return list;
	}
	
	@RequestMapping("/selectTheDate.do")
	@ResponseBody
	public List<ScreeningPlan> selectTheDate(ScreeningPlan screeningplan) {
		System.out.println("Controller Screeningplan movie_no : " + screeningplan.getMovie_no());
		List<ScreeningPlan> list = null;
		list = service.selectTheDate(screeningplan);
		return list;
	}
	
	@RequestMapping("/selectCheckedSeatNo.do")
	@ResponseBody
	public List<String> selectCheckedSeatNo(@RequestParam(value="movieplace_no") String movieplace_no, 
			@RequestParam("screeningplan_no") String screeningplan_no) {
		System.out.println("selectCheckedSeatNo movieplace_no : " + movieplace_no);
		System.out.println("selectCheckedSeatNo screeningplan_no : " + screeningplan_no);
		List<String> list = service.selectCheckedSeatNo(movieplace_no,screeningplan_no);
		return list;
	}
	
	@RequestMapping("/reservationInfoInsert.do")
	@ResponseBody
	public String reservationInfoInsert(@RequestParam(value="id") String id, 
			@RequestParam(value="movieplace_no") String movieplace_no, 
			@RequestParam(value="movie") String movie_title,
			@RequestParam(value="movie_no") String movie_no,
			@RequestParam(value="moviedate") String moviedate,
			@RequestParam(value="screeningplan_no") String screeningplan_no,
			@RequestParam(value="checkboxValues[]") List<String> checkboxValues,
			HttpSession session) {
		
		System.out.println("Member ID : " + id);
		System.out.println("movieplace_no : " + movieplace_no);
		System.out.println("movie_title : " + movie_title);
		System.out.println("movie_no : " + movie_no);
		System.out.println("moviedate : " + moviedate);
		System.out.println("screeningplan_no : " + screeningplan_no);
		List<String> checkboxValues2 = new ArrayList<String>();
		for(int i=0;i<checkboxValues.size();i++) {
			System.out.println("checkboxValues : " + i + " = "+ checkboxValues.get(i));
			
		}
		/*
		 * String[] ID = id.split(" "); for(int i=0;i<checkboxValues2.size();i++) {
		 * System.out.println("checkboxValues2 : " + checkboxValues2.get(i)); }
		 */
		service.reservationInfoInsert(movieplace_no,movie_title,movie_no,moviedate,screeningplan_no,checkboxValues,id);
		session.setAttribute("screeningplan_no", screeningplan_no);
		return "true";
	}
	
	@RequestMapping("/seatInsert.do")
	public ModelAndView seatInsert(HttpServletRequest request) {
		String[] seat_no = request.getParameterValues("seat_no");
		String movieplace_no = request.getParameter("movieplace_no");
		String movietime = request.getParameter("movietime");
		for(int i=0;i<seat_no.length;i++) {
			System.out.print(" Controller seat_no : " + seat_no[i]);			
		}
		System.out.println("Controller movieplace_no : " + movieplace_no);
		
		service.seatInsert(seat_no, movieplace_no);				
		ModelAndView mav = new ModelAndView();
		mav.addObject("seat_no", seat_no);
		mav.addObject("movieplace_no", movieplace_no);
		mav.setViewName("reservation/reservating");
		return mav;
	}
	
	@RequestMapping("/seatArrangementCGV.do")
	public String seatArrangementCGV() {
		return "seat/seatArrangementCGV";
	}
	
	@RequestMapping("/seatArrangementMEGABOX.do")
	public String seatArrangementMEGABOX() {
		return "seat/seatArrangementMEGABOX";
	}
	
	@RequestMapping("/reservationPage.do")
	public String reservationPage() {
		return "reservation/reservating";
	}
	
	@RequestMapping("/seatArrangementKuklib.do")
	public String seatArrangementKuklib() {
		return "seat/seatArrangementKuklib";
	}
	
	//select all movie
	@RequestMapping("/selectAllMovieAbout.do")
	@ResponseBody
	public List<Movie> selectAllMovieAbout(MoviePlace movieplace){
		System.out.println("controller moviePlace_no : " + movieplace.getMovieplace_name());
		List<Movie> list = null;
		list = service.selectAllMovieAbout(movieplace);
		for(int i=0;i<list.size();i++) {
			System.out.println("All Movie About : " + list.get(i).getPrice());
		}				
		return list;
	}
	
	@RequestMapping("/getScreeningPlan.do")
	@ResponseBody
	public List<ScreeningPlan> getScreeningPlan(ScreeningPlan screeningPlan){
		System.out.println("controller movie no : "+screeningPlan.getMovie_no());
		System.out.println("controller movie movieplace_no : "+screeningPlan.getMovieplace_no());
		List<ScreeningPlan> list = null;
		list = service.getScreeningPlan(screeningPlan);
		for(int i=0;i<list.size();i++) {
			System.out.println("screeingDate About : " + list.get(i).getScreeningdate());
			System.out.println("screeingTime About : " + list.get(i).getScreeningtime());
		}
		return list;
	}
}
