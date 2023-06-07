package com.koreaIT.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.koreaIT.demo.service.EventArticleService;
import com.koreaIT.demo.vo.Article;
import com.koreaIT.demo.vo.Board;
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
	
	@RequestMapping("/usr/eventArticle/list")
	public String showList(Model model, @RequestParam(defaultValue = "name") String searchKeywordType,
			@RequestParam(defaultValue = "") String searchKeyword, @RequestParam(defaultValue = "") String checkKeywordType,
			@RequestParam(defaultValue = "") String checkKeyword ) {
		int eventArticlesCnt = eventArticleService.getEventArticlesCnt(searchKeywordType, searchKeyword);
		String[] checkKeywords = checkKeyword.split(",");

		List<EventArticle> eventArticles = eventArticleService.getEventArticles(searchKeywordType, searchKeyword, checkKeywordType, checkKeyword);
		

		model.addAttribute("eventArticlesCnt", eventArticlesCnt);
		model.addAttribute("eventArticles", eventArticles);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("searchKeywordType", searchKeywordType);
		model.addAttribute("checkKeyword", checkKeyword);
		model.addAttribute("checkKeywordType", checkKeywordType);
		
		
		return "usr/eventArticle/list";
	}
	
	@RequestMapping("/usr/myPage/myEventArticle")
	public String showList(Model model, int id, @RequestParam(defaultValue = "1") int page, 
			@RequestParam(defaultValue = "title") String searchKeywordType,
			@RequestParam(defaultValue = "") String searchKeyword) {

		if (page <= 0) {
			return rq.jsReturnOnView("페이지번호가 올바르지 않습니다", true);
		}

		int articlesCnt = eventArticleService.getEventArticlesCnt(searchKeywordType, searchKeyword);

		int itemsInAPage = 10;

		int pagesCount = (int) Math.ceil((double) articlesCnt / itemsInAPage);

		List<Article> articles = eventArticleService.getMyEventArticles(id, itemsInAPage, page);

		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("page", page);
		model.addAttribute("articlesCnt", articlesCnt);
		model.addAttribute("articles", articles);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("searchKeywordType", searchKeywordType);

		return "usr/myPage/myEventArticle";
	}
	
	@RequestMapping("/usr/eventArticle/share")
	public String showShare() {
		return "usr/eventArticle/share";
	}
	
}