package com.cp.reservation.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.cp.movie.Movie;
import com.cp.movieplace.MoviePlace;
import com.cp.screeningplan.ScreeningPlan;
import com.cp.ticket.Ticket;

public interface IReservationService {
	List<MoviePlace> selectAllMoviePlace();
	List<Movie> selectAllMovieAbout(MoviePlace movieplace);
	List<ScreeningPlan> getScreeningPlan(ScreeningPlan screeningPlan);
	void seatInsert(String[] seat_no, String movieplace_no);
	void reservationInfoInsert(String movieplace_no,String movie_title,String movie_no,String moviedate,String screeningplan_no,List<String> checkboxValues,String id);
	List<String> selectCheckedSeatNo(String movieplace_no, String screeningplan_no);
	List<Ticket> selectTicketInfo(String id, String screeningplan_no);
	List<ScreeningPlan> selectTheDate(ScreeningPlan screeningplan);
	List<ScreeningPlan> selectTheTime(ScreeningPlan screeningplan);
	List<ScreeningPlan> getTime(ScreeningPlan screeningplan);
	List<Ticket> paymentResultPage(Ticket ticket);
}
