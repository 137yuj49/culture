package com.cp.reservation.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cp.movie.Movie;
import com.cp.movieplace.MoviePlace;
import com.cp.screeningplan.ScreeningPlan;
import com.cp.seat.Seat;
import com.cp.ticket.Ticket;

@Repository
public class ReservationDao implements IReservationDao{
	
	@Autowired
	SqlSessionTemplate temp;
	
	@Override
	public List<MoviePlace> selectAllMoviePlace() {
		List<MoviePlace> list = null;
		list = temp.selectList("culturePage.selectAllMoviePlace");
		return null;
	}
	
	@Override
	public List<Movie> selectAllMovieAbout(MoviePlace movieplace) {
		System.out.println("MoviePlaceDao moviePlace_no : " + movieplace.getMovieplace_no());
		List<Movie> list = null;
		list = temp.selectList("culturePage.selectAllMovieAbout", movieplace);
		System.out.println("dao select movie about the moviePlace, success!!!");
		return list;
	}
	
	@Override
	public List<ScreeningPlan> getScreeningPlan(ScreeningPlan screeningPlan) {
		System.out.println("dao movie title : "+screeningPlan.getMovie_no());
		System.out.println("dao movie movieplace : "+screeningPlan.getMovieplace_no());
		List<ScreeningPlan> list = null;
		list = temp.selectList("culturePage.getScreeningPlan", screeningPlan);
		System.out.println("dao moviedate select success!!!!");
		return list;
	}
	
	@Override
	public void seatInsert(List<Seat> list) {

		for(int i=0;i<list.size();i++) {
			System.out.println("Dao movieplace_no : " + i +":" + list.get(i).getSeat_no());
			System.out.println("Dao seat_no : " + i +":" + list.get(i).getMovieplace_no());
			Seat seat =  list.get(i);
			temp.insert("culturePage.seatInsert", seat);
		}
		System.out.println("seat insert success!!!");
	}
	
	@Override
	public String selectMovieNo(String movie_title) {
		String movie_no = temp.selectOne("culturePage.selectMovieNo", movie_title);
		System.out.println("selectMovieNo success!!!");
		return movie_no;
	}
	
	@Override
	public void ticketInsert(Ticket ticket) {
		temp.insert("culturePage.ticketInsert", ticket);
		System.out.println("Ticket insert success!!!");
	}
	
	@Override
	public void seatInforInsert(Seat seat) {
		temp.insert("culturePage.seatInforInsert", seat);
		System.out.println("Seat insert success!!!");
	}
	
	@Override
	public List<String> selectCheckedSeatNo(Seat seat) {
		List<String> list = null;
		list = temp.selectList("culturePage.selectCheckedSeatNo", seat);
		System.out.println("Select checked SeatNo success!!!!");
		return list;
	}
	
	@Override
	public List<Ticket> selectTicketInfo(Ticket ticket) {
		List<Ticket> list = null;
		list = temp.selectList("culturePage.selectTicketInfo", ticket);
		System.out.println("selectTicketInfo success!!!");
		return list;
	}
	
	@Override
	public List<ScreeningPlan> selectTheDate(ScreeningPlan screeningplan) {
		System.out.println("Dao selectTheDate movie_no : " + screeningplan.getMovie_no());
		List<ScreeningPlan> list = null;
		list = temp.selectList("culturePage.selectTheDate", screeningplan);		
		System.out.println("selectTheDate success !!!");
		return list;
	}
	
	@Override
	public List<ScreeningPlan> selectTheTime(ScreeningPlan screeningplan) {
		System.out.println("Dao selectTheTime movie_no : " + screeningplan.getMovie_no());
		System.out.println("Dao selectTheTime getScreeningdate : " + screeningplan.getScreeningdate());
		List<ScreeningPlan> list = temp.selectList("culturePage.selectTheTime", screeningplan);
		System.out.println("dao selectTheTime success !!!!");
		return list;
	}
	
	@Override
	public List<ScreeningPlan> getTime(ScreeningPlan screeningplan) {
		System.out.println("Dao getTime getScreeningdate : " + screeningplan.getScreeningdate());
		System.out.println("Dao getTime movie_no : " + screeningplan.getMovie_no());
		System.out.println("Dao getTime movieplace_no : " + screeningplan.getMovieplace_no());
		List<ScreeningPlan> list = temp.selectList("culturePage.getTime", screeningplan);
		System.out.println("getTime success!!!!!");
		return list;
	}
	
	@Override
	public List<Ticket> paymentResultPage(Ticket ticket) {
		List<Ticket> list = temp.selectList("culturePage.paymentResultPage", ticket);
		System.out.println("paymentResultPage select success !!!");
		return list;
	}
	
}
