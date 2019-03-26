package com.cp.show.service;

import java.util.List;

import com.cp.movie.Movie;
import com.cp.show.ShowDto;

public interface IShowService {
	void showInsert(ShowDto sDto);
	List<ShowDto> allSelectShow();
	List<ShowDto> selectTodayShow();
	Movie selectTheMovie(Movie movie);
}
