package com.bitcamp.cobsp.recomment.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cobsp.comment.domain.Comment;
import com.bitcamp.cobsp.comment.service.CommentListService;
import com.bitcamp.cobsp.recomment.domain.Recomment;
import com.bitcamp.cobsp.recomment.domain.RecommentRegRequest;
import com.bitcamp.cobsp.recomment.service.RecommentListService;
import com.bitcamp.cobsp.recomment.service.RecommentRegService;

@Controller
public class recommentController {

	@Autowired
	private RecommentRegService regService;
	
	@Autowired
	private RecommentListService listService;
	
	// 대댓글 등록
	@RequestMapping(value = "/recomment/regComment", method = RequestMethod.POST) 
	@ResponseBody
	public void insertRecomment(
			@ModelAttribute("regRequest") RecommentRegRequest reommRegRequest, 
			HttpServletRequest request,
			Model model) {

		int resultCnt = 0;
		
		resultCnt = regService.regComment(reommRegRequest, request);

		model.addAttribute("resultCommReg", resultCnt);
	}
	
	// 댓글 조회
	@RequestMapping(value = "/recomment/recommList", method = RequestMethod.POST)
	@ResponseBody
	public List<Recomment> regRecommView( 
			@ModelAttribute("commIdx") int commIdx, 
			Model model) {

		List<Recomment> list = null;

		list = listService.getRecommentList(commIdx);
		System.out.println(list);
		return list;
	}

}