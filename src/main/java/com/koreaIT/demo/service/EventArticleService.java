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
	
	
	public List<EventArticle> getEventArticles(String searchKeywordType, String searchKeyword){
		
 		List<EventArticle> eventArticles = eventArticleRepository.getEventArticles(searchKeywordType, searchKeyword);
 		
		return eventArticles;
	}


	public int getEventArticlesCnt(String searchKeywordType, String searchKeyword) {
		return eventArticleRepository.getEventArticlesCnt(searchKeywordType, searchKeyword);
	}

	public void increaseHitCount(int id) {
		eventArticleRepository.increaseHitCount(id);
	}

	
}