package com.cp.show.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cp.movie.Movie;
import com.cp.show.ShowDto;

@Repository
public class ShowDao implements IShowDao{
	
	@Autowired
	SqlSessionTemplate temp;
	
	@Override
	public void showInsert(ShowDto sDto) {
		temp.insert("culturePage.showInsert", sDto);
		System.out.println("show insert success!!!");
	}
	
	@Override
	public List<ShowDto> allSelectShow() {
		System.out.println("showdao allSelectShow good");
		List<ShowDto> list = null;
		list = temp.selectList("culturePage.allSelectShow");
		return list;
	}
	
	@Override
	public List<ShowDto> selectTodayShow(String mTime) {
		List<ShowDto> list = temp.selectList("culturePage.selectTodayShow", mTime);
		for(int i=0;i<list.size();i++) {
			System.out.println("dao today show list : " + list.get(i));
		}
		System.out.println("selectTodayShow list accept success !!!");
		return list;
	}
	
	@Override
	public Movie selectTheMovie(Movie movie) {
		Movie mov = temp.selectOne("culturePage.selectTheMovie", movie);
		System.out.println("selectTheMovie success !!!");
		return mov;
	}
}
