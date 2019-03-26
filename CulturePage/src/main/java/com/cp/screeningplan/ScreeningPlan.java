package com.cp.screeningplan;

public class ScreeningPlan {
	private String screeningplan_no;
	private String screeningdate;
	private String screeningtime;
	private String movie_no;
	private String movieplace_no;
	/////////////////////////////
	private String dateGap;
	private String movieplace_name;
	private int price;
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getMovieplace_name() {
		return movieplace_name;
	}
	public void setMovieplace_name(String movieplace_name) {
		this.movieplace_name = movieplace_name;
	}
	public String getDateGap() {
		return dateGap;
	}
	public void setDateGap(String dateGap) {
		this.dateGap = dateGap;
	}
	public String getScreeningplan_no() {
		return screeningplan_no;
	}
	public void setScreeningplan_no(String screeningplan_no) {
		this.screeningplan_no = screeningplan_no;
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
	public String getMovie_no() {
		return movie_no;
	}
	public void setMovie_no(String movie_no) {
		this.movie_no = movie_no;
	}
	public String getMovieplace_no() {
		return movieplace_no;
	}
	public void setMovieplace_no(String movieplace_no) {
		this.movieplace_no = movieplace_no;
	}

}
