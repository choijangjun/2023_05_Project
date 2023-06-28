package com.koreaIT.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.service.EventArticleService;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.EventArticle;
import com.koreaIT.demo.vo.FileVO;
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
	
	@RequestMapping("/usr/eventArticle/writeEventArticle")
	public String writeEventArticle() {
		return "usr/eventArticle/writeEventArticle";
	}
	
	@RequestMapping("/usr/eventArticle/doWriteEventArticle")
	@ResponseBody
	public String doWriteEventArticle(String startDate, String endDate, String winningDate, String name, String title, String section, String goods, String needs, int price, String image, String site,@RequestParam(value = "kategorie") List<String> kategorie) {


		eventArticleService.writeEventArticle(rq.getLoginedMemberId(), startDate, endDate, winningDate, name, title, section, goods, needs, price, image, site);
		
		eventArticleService.doInsertKategorie(kategorie,rq.getLoginedMemberId());
		
		return Util.jsReplace(Util.f("%s 관련 이벤트 등록이 완료되었습니다", name),"/usr/eventArticle/listEventArticle");
	}
	
	@RequestMapping("/usr/eventArticle/listEventArticle")
	public String showList(Model model, @RequestParam(value = "", required = false) List<String> checkKeyword, 
			@RequestParam(defaultValue = "name") String searchKeywordType, 
			@RequestParam(defaultValue = "") String searchKeyword) {
		
		eventArticleService.updateEventArticlePG();
		
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