package com.cp.ticket;

public class Ticket {
	private String ticket_no;
	private String movie_no;
	private String screeningplan_no;
	private String movieplace_no;
	private String seat_no;
	private String id;
	/////////////////////////
	private String movie_title;
	private String screeningdate;
	private String screeningtime;

	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public String getScreeningdate() {
		return screeningdate;
	}
	public void setScreeningdate(String screeningdate) {
		this.screeningdate = screeningdate;
	}
	public String getScreeningtime() {
		return screeningtime;
	}
	public void setScreeningtime(String screeningtime) {
		this.screeningtime = screeningtime;
	}
	//////////////////////////////////////////
	public String getTicket_no() {
		return ticket_no;
	}
	public void setTicket_no(String ticket_no) {
		this.ticket_no = ticket_no;
	}
	public String getMovie_no() {
		return movie_no;
	}
	public void setMovie_no(String movie_no) {
		this.movie_no = movie_no;
	}
	public String getScreeningplan_no() {
		return screeningplan_no;
	}
	public void setScreeningplan_no(String screeningplan_no) {
		this.screeningplan_no = screeningplan_no;
	}
	public String getMovieplace_no() {
		return movieplace_no;
	}
	public void setMovieplace_no(String movieplace_no) {
		this.movieplace_no = movieplace_no;
	}
	public String getSeat_no() {
		return seat_no;
	}
	public void setSeat_no(String seat_no) {
		this.seat_no = seat_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}	
}
