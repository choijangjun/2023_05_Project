package com.koreaIT.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.service.ReactionPointService;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.ReactionPoint;
import com.koreaIT.demo.vo.ResultData;
import com.koreaIT.demo.vo.Rq;

//@Controller
//public class UsrSaveEventArticleController {
//
//	private SaveEventArticleService saveEventArticleService;
//	private Rq rq;
//
//	@Autowired
//	public UsrSaveEventArticleController(SaveEventArticleService saveEventArticleService, Rq rq) {
//		this.saveEventArticleService = saveEventArticleService;
//		this.rq = rq;
//	}
//	
//	@RequestMapping("/usr/saveEventArticle/doInsertSaveEventArticle")
//	@ResponseBody
//	public String doInsertReactionPoint(int relId, String relTypeCode, int point) {
//		
//		ReactionPoint reactionPoint = reactionPointService.getReactionPoint(rq.getLoginedMemberId(), relId, relTypeCode);
//		
//		if (reactionPoint.getSumReactionPoint() != 0) {
//			reactionPointService.doDeleteReactionPoint(rq.getLoginedMemberId(), relId, relTypeCode);
//		}
//		
//		reactionPointService.doInsertReactionPoint(rq.getLoginedMemberId(), relId, relTypeCode, point);
//		
//		if (point == 1) {
//			return Util.jsReplace(Util.f("%d번 글에 좋아요", relId), Util.f("../article/detail?id=%d", relId));
//		} else {
//			return Util.jsReplace(Util.f("%d번 글에 싫어요", relId), Util.f("../article/detail?id=%d", relId));
//		}
//	}
//	
//	
//	
//}