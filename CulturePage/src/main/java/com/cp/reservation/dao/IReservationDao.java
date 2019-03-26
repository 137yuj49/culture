package com.cp.reservation.dao;

import java.util.List;

import com.cp.movie.Movie;
import com.cp.movieplace.MoviePlace;
import com.cp.screeningplan.ScreeningPlan;
import com.cp.seat.Seat;
import com.cp.ticket.Ticket;

public interface IReservationDao {
	List<MoviePlace> selectAllMoviePlace();
	List<Movie> selectAllMovieAbout(MoviePlace movieplace);
	List<ScreeningPlan> getScreeningPlan(ScreeningPlan screeningPlan);
	void seatInsert(List<Seat> list);
	String selectMovieNo(String movie_title);
	void ticketInsert(Ticket ticket);
	void seatInforInsert(Seat seat);
	List<String> selectCheckedSeatNo(Seat seat);
	List<Ticket> selectTicketInfo(Ticket ticket);
	List<ScreeningPlan> selectTheDate(ScreeningPlan screeningplan);
	List<ScreeningPlan> selectTheTime(ScreeningPlan screeningplan);
	List<ScreeningPlan> getTime(ScreeningPlan screeningplan);
	List<Ticket> paymentResultPage(Ticket ticket);
}
