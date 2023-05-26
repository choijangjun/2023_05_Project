package com.koreaIT.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.koreaIT.demo.service.EventArticleService;
import com.koreaIT.demo.vo.Rq;
import com.koreaIT.demo.vo.EventArticle;

@Controller
public class UsrEventArticleController {

	private EventArticleService eventArticleService;
	private Rq rq;

	@Autowired
	public UsrEventArticleController(EventArticleService eventArticleService, Rq rq) {
		this.eventArticleService = eventArticleService;
		this.rq = rq;
	}
	
	@RequestMapping("/usr/eventArticle/list")
	public String showList(Model model, @RequestParam(defaultValue = "name") String searchKeywordType,
			@RequestParam(defaultValue = "") String searchKeyword) {

		int eventArticlesCnt = eventArticleService.getEventArticlesCnt(searchKeywordType, searchKeyword);

		List<EventArticle> eventArticles = eventArticleService.getEventArticles(searchKeywordType, searchKeyword);

		model.addAttribute("eventArticlesCnt", eventArticlesCnt);
		model.addAttribute("eventArticles", eventArticles);

		return "usr/eventArticle/list";
	}
	
	@RequestMapping("/usr/eventArticle/share")
	public String showShare() {
		return "usr/eventArticle/share";
	}
	
}