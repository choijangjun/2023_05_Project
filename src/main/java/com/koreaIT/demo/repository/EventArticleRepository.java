package com.koreaIT.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.koreaIT.demo.vo.EventArticle;

@Mapper
public interface EventArticleRepository {
	
	public List<EventArticle> getEventArticles(String searchKeywordType, String searchKeyword, String checkKeywordType, String checkKeyword); 
	
	void increaseHitCount(int id);

	public int getEventArticlesCnt(String searchKeywordType, String searchKeyword);
}