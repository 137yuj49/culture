package com.cp.reservation.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cp.movie.Movie;
import com.cp.movieplace.MoviePlace;
import com.cp.reservation.dao.ReservationDao;
import com.cp.screeningplan.ScreeningPlan;
import com.cp.seat.Seat;
import com.cp.ticket.Ticket;

@Service
public class ReservationService implements IReservationService{
		
	@Autowired
	ReservationDao dao;		
	
	
	@Override
	public List<MoviePlace> selectAllMoviePlace() {
		List<MoviePlace> list = null;
		list = dao.selectAllMoviePlace();
		return null;
	}
	
	
	@Override
	public List<Movie> selectAllMovieAbout(MoviePlace movieplace) {
		System.out.println("MoviePlaceService moviePlace_no : " + movieplace.getMovieplace_no());
		List<Movie> list = null;
		list = dao.selectAllMovieAbout(movieplace);
		return list;
	}
	
	@Override
	public List<ScreeningPlan> getScreeningPlan(ScreeningPlan screeningPlan) {
		System.out.println("service movie title : "+screeningPlan.getMovie_no());
		System.out.println("service movie movieplace : "+screeningPlan.getMovieplace_no());
		List<ScreeningPlan> list = null;
		list = dao.getScreeningPlan(screeningPlan);
		return list;
	}
	
	@Override
	public void seatInsert(String[] seat_no, String movieplace_no) {		
		
		for(int i=0;i<seat_no.length;i++) {
			System.out.println("Service seat_no : " + seat_no[i]);			
		}
		System.out.println("Service movieplace_no : " + movieplace_no);
		
		//////////////////////////////////////////////////////////////////		
		List<Seat> list = new ArrayList<>();
		for(int i=0;i<seat_no.length;i++) {
			Seat seat = new Seat();
			seat.setSeat_no(seat_no[i]);
			seat.setMovieplace_no(movieplace_no);
			seat.setSeat_ox("true");
			list.add(seat);
		}					
		dao.seatInsert(list);
	}
	
	@Override
	public void reservationInfoInsert(String movieplace_no, String movie_title, String movie_no, 
			String moviedate, String screeningplan_no, List<String> checkboxValues,String id) {
		// 1. movie_no 얻어오기		
		// 2. screening_no 얻어오기
		System.out.println("Service Member ID : " + id);
		System.out.println("Service movieplace_no : " + movieplace_no);
		System.out.println("Service movie_title : " + movie_title);
		System.out.println("Service movie_no : " + movie_no);
		System.out.println("Service moviedate : " + moviedate);
		System.out.println("Service screeningplan_no : " + screeningplan_no);
		for(int i=0;i<checkboxValues.size();i++) {
			System.out.println("Service checkboxValues : " + i + " = "+ checkboxValues.get(i));
			// 3. seat insert 하고 
			
			Seat seat = new Seat(); 
			seat.setSeat_no(checkboxValues.get(i));
			seat.setMovieplace_no(movieplace_no);			 
			seat.setScreeningplan_no(screeningplan_no);
			seat.setSeat_ox("true");
			dao.seatInforInsert(seat);
		}
		
		// 4. ticket 정보 insert
		for(int i=0;i<checkboxValues.size();i++) {
			Ticket ticket = new Ticket();
			ticket.setMovie_no(movie_no);
			ticket.setScreeningplan_no(screeningplan_no);
			ticket.setMovieplace_no(movieplace_no);
			ticket.setSeat_no(checkboxValues.get(i));
			ticket.setId(id);						
			dao.ticketInsert(ticket);
		}
	}
	
	@Override
	public List<String> selectCheckedSeatNo(String movieplace_no, String screeningplan_no) {
		List<String> list = null;
		Seat seat = new Seat();
		seat.setMovieplace_no(movieplace_no);
		seat.setScreeningplan_no(screeningplan_no);
		list = dao.selectCheckedSeatNo(seat);
		return list;
	}
	
	@Override
	public List<Ticket> selectTicketInfo(String id, String screeningplan_no) {
		System.out.println("Service selectTicketInfo id : " + id);
		System.out.println("Service selectTicketInfo screeningplan_no : " + screeningplan_no);
		Ticket ticket = new Ticket();
		ticket.setId(id);
		ticket.setScreeningplan_no(screeningplan_no);
		List<Ticket> list = null;		
		list = dao.selectTicketInfo(ticket);
		return list;
	}
	
	@Override
	public List<ScreeningPlan> selectTheDate(ScreeningPlan screeningplan)  {
		System.out.println("Service Screeningplan movie_no : " + screeningplan.getMovie_no());
		List<ScreeningPlan> list = null;
		list = dao.selectTheDate(screeningplan);
	
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		try {
			Date start = sdf.parse("03/05/2019");
			Date temp = null;
			long diffDay;
			for(int i=0;i<list.size();i++) {
				Date end = sdf.parse(list.get(i).getScreeningdate());
				diffDay = (end.getTime()- start.getTime())/(24*60*60*1000);
				if(i==0) {
					if(diffDay>0) {
						temp = end;
					}					
				}
				if(i>0) {
					diffDay = (end.getTime() - temp.getTime())/(24*60*60*1000);
					if(diffDay>0) {
						temp = end;
					}
				}
			}
			
			// 가장 마지막 날짜를 String으로 변환하는 것
			//SimpleDateFormat transFormat = new SimpleDateFormat("MM/dd/yyyy");
			//String lastDate = transFormat.format(temp);
			//System.out.println("last Date : " + lastDate);
			
			Date date = new Date();
			
			long calDate = temp.getTime() - date.getTime();
			
			long calDateDays = calDate / (24*60*60*1000);
						
			calDateDays = Math.abs(calDateDays);
			
			System.out.println("마지막 공연일자와 오늘의 날짜 차이 : " + calDateDays);
			
			String gap = String.valueOf(calDateDays);
			
			// 가장 마지막 날짜와 오늘 날짜의 차이를 screeningplan 각 객체에 집어넣어
			for(int i=0;i<list.size();i++) {
				list.get(i).setDateGap(gap);
			}
		}catch(ParseException e) {
			e.printStackTrace();
		}				
		return list;
	}
	
	@Override
	public List<ScreeningPlan> selectTheTime(ScreeningPlan screeningplan) {
		System.out.println("Service selectTheTime movie_no : " + screeningplan.getMovie_no());
		System.out.println("Service selectTheTime getScreeningdate : " + screeningplan.getScreeningdate());
		List<ScreeningPlan> list =  dao.selectTheTime(screeningplan);
		
		return list;
	}
	
	@Override
	public List<ScreeningPlan> getTime(ScreeningPlan screeningplan) {
		System.out.println("Service getTime getScreeningdate : " + screeningplan.getScreeningdate());
		System.out.println("Service getTime movie_no : " + screeningplan.getMovie_no());
		System.out.println("Service getTime movieplace_no : " + screeningplan.getMovieplace_no());
		List<ScreeningPlan> list = dao.getTime(screeningplan);
		return list;
	}
	
	@Override
	public List<Ticket> paymentResultPage(Ticket ticket) {
		List<Ticket> list = dao.paymentResultPage(ticket);
		return list;
	}
	
}
