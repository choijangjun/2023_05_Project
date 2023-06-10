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
	
	public List<EventArticle> getEventArticles(List<String> checkKeyword, String searchKeywordType, String searchKeyword, int loginedMemberId){
		
		List<EventArticle> eventArticles = eventArticleRepository.getEventArticles(checkKeyword , searchKeywordType, searchKeyword, loginedMemberId);
		
		return eventArticles;
	}
	
	public int getEventArticlesCnt(List<String> checkKeyword, String searchKeywordType, String searchKeyword) {
		return eventArticleRepository.getEventArticlesCnt(checkKeyword, searchKeywordType, searchKeyword);
	}

	public void increaseHitCount(int id) {
		eventArticleRepository.increaseHitCount(id);
	}

	
}