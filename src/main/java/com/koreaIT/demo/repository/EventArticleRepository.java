package com.koreaIT.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.koreaIT.demo.vo.EventArticle;

@Mapper
public interface EventArticleRepository {
	
	public List<EventArticle> getEventArticlesToSearchKeyword(String searchKeywordType, String searchKeyword); 
	public int getEventArticlesCntToSearchKeyword(String searchKeywordType, String searchKeyword);
	
	void increaseHitCount(int id);

	public List<EventArticle> getEventArticlesToCheckKeyword(List<String> checkKeyword); 
	public int getEventArticlesCntToCheckKeyword(List<String> checkKeyword);
}