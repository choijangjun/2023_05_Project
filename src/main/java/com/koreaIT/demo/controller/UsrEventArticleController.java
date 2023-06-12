package com.koreaIT.demo.controller;

import java.util.List;	

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.koreaIT.demo.service.EventArticleService;
import com.koreaIT.demo.vo.EventArticle;
import com.koreaIT.demo.vo.Rq;

@Controller
public class UsrEventArticleController {

	private EventArticleService eventArticleService;
	private Rq rq;

	@Autowired
	public UsrEventArticleController(EventArticleService eventArticleService, Rq rq) {
		this.eventArticleService = eventArticleService;
		this.rq = rq;
	}
	
	
	@RequestMapping("/usr/eventArticle/listEventArticle")
	public String showList(Model model, @RequestParam(defaultValue = "movie, fashion, dessert") List<String> checkKeyword, 
			@RequestParam(defaultValue = "name") String searchKeywordType, 
			@RequestParam(defaultValue = "") String searchKeyword) {
//		String[] checkKeywords = checkKeyword.split(",");
		List<EventArticle> eventArticles = eventArticleService.getEventArticles(checkKeyword, searchKeywordType, searchKeyword, rq.getLoginedMemberId());
		
		int eventArticlesCnt = eventArticleService.getEventArticlesCnt(checkKeyword, searchKeywordType, searchKeyword);
		
		model.addAttribute("eventArticlesCnt", eventArticlesCnt);
		model.addAttribute("eventArticles", eventArticles);
		model.addAttribute("searchKeywordType", searchKeywordType);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("checkKeyword", checkKeyword);
		
		return "usr/eventArticle/listEventArticle";
	}
	
	@RequestMapping("/")
	public String showRoot() {
		return "redirect:/usr/eventArticle/listEventArticle";
	}

	

	
}