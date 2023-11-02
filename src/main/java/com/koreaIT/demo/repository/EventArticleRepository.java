package com.koreaIT.demo.repository;

import java.util.List;	

import org.apache.ibatis.annotations.Mapper;

import com.koreaIT.demo.vo.EventArticle;

@Mapper
public interface EventArticleRepository {

	void increaseHitCount(int id);

	public List<EventArticle> getEventArticles(List<String> checkKeyword, String searchKeywordType, String searchKeyword, int loginedMemberId); 
	public int getEventArticlesCnt(List<String> checkKeyword, String searchKeywordType, String searchKeyword);

	void updateEventArticlePG();

	void writeEventArticle(int loginedMemberId, String startDate, String endDate, String winningDate, String name, String title,
			String goods, String needs, int price, String image, String site);

	void doInsertKategorie(List<String> kategorie, int loginedMemberId);

	List<EventArticle> getMyWriteEventArticles(int loginedMemberId, String searchKeyword, int progress);

	int getMyWriteEventArticleCnt(int loginedMemberId, String searchKeyword, int progress);

	void doDeleteEventArticle( int id);

	void doDeleteEventKategorie(int id);

	EventArticle getEventArticle(int id);

	void doModifyEventArticle(int id, String startDate, String endDate, String winningDate, String name, String title,
			String goods, String needs, int price, String image, String site);

	void doModifyKategorie(List<String> kategorie, int id);

}