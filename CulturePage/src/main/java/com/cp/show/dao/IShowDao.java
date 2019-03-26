package com.cp.show.dao;

import java.util.List;

import com.cp.movie.Movie;
import com.cp.show.ShowDto;

public interface IShowDao {
	void showInsert(ShowDto sDto);
	List<ShowDto> allSelectShow();
	List<ShowDto> selectTodayShow(String mTime);
	Movie selectTheMovie(Movie movie);
}
