package com.koreaIT.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.koreaIT.demo.vo.EventArticle;

@Mapper
public interface EventArticleRepository {

	void increaseHitCount(int id);

	public List<EventArticle> getEventArticles(List<String> checkKeyword, String searchKeywordType, String searchKeyword, int loginedMemberId); 
	public int getEventArticlesCnt(List<String> checkKeyword, String searchKeywordType, String searchKeyword);
}