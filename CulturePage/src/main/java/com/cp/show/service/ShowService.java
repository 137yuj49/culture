package com.cp.show.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cp.movie.Movie;
import com.cp.show.ShowDto;
import com.cp.show.dao.ShowDao;

import net.sf.cglib.core.Local;

@Service
public class ShowService implements IShowService{
	
	@Autowired
	ShowDao dao;
	
	@Override
	public void showInsert(ShowDto sDto) {
		System.out.println("service show id= " + sDto.getShow_id());
		System.out.println("service show name=" + sDto.getShow_name());
		System.out.println("service show fee=" + sDto.getShow_fee());
		System.out.println("service show mdate=" + sDto.getShow_mdate());
		System.out.println("service show genre=" + sDto.getShow_genre());
		System.out.println("service show phone=" + sDto.getShow_phone());
		System.out.println("service show picture=" + sDto.getShow_picture());
		System.out.println("service show concerthall id=" + sDto.getConcerthall_id());
		
		dao.showInsert(sDto);
		
	}
	
	@Override
	public List<ShowDto> allSelectShow() {
		System.out.println("service allSelectShow good");
		List<ShowDto> list = null;
		list =  dao.allSelectShow();
		return list;
	}
	
	@Override
	public List<ShowDto> selectTodayShow() {
		// Today Time
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd#HH:mm:ss",Locale.KOREA);
		Date currentTime = new Date();
		String time = mSimpleDateFormat.format(currentTime).trim();
		System.out.println("current day : " + time);
		
		String[] mTime = time.split("#");
		
		System.out.println("showService mTime : " + mTime[0]);
		
		List<ShowDto> list = dao.selectTodayShow(mTime[0]);
		
		return list;
	}
	
	@Override
	public Movie selectTheMovie(Movie movie) {
		Movie mov = dao.selectTheMovie(movie);
		return mov;
	}
}
