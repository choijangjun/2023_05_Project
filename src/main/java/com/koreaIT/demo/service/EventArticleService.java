package com.koreaIT.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreaIT.demo.repository.EventArticleRepository;
import com.koreaIT.demo.vo.EventArticle;

@Service
public class EventArticleService {
	
	private EventArticleRepository eventArticleRepository;
	
	@Autowired
	public EventArticleService(EventArticleRepository eventArticleRepository) {
		this.eventArticleRepository = eventArticleRepository;
	}
	
	
	public List<EventArticle> getEventArticlesToSecrchKeyword(String searchKeywordType, String searchKeyword){
		
 		List<EventArticle> eventArticles = eventArticleRepository.getEventArticlesToSearchKeyword(searchKeywordType, searchKeyword);
 		
		return eventArticles;
	}


	public int getEventArticlesCntToSecrchKeyword(String searchKeywordType, String searchKeyword) {
		return eventArticleRepository.getEventArticlesCntToSearchKeyword(searchKeywordType, searchKeyword);
	}
	
	
	public List<EventArticle> getEventArticlesToCheckKeyword(List<String> checkKeyword){
		
		List<EventArticle> eventArticles = eventArticleRepository.getEventArticlesToCheckKeyword(checkKeyword);
		
		return eventArticles;
	}
	
	
	public int getEventArticlesCntToCheckKeyword(List<String> checkKeyword) {
		return eventArticleRepository.getEventArticlesCntToCheckKeyword(checkKeyword);
	}

	public void increaseHitCount(int id) {
		eventArticleRepository.increaseHitCount(id);
	}

	
}