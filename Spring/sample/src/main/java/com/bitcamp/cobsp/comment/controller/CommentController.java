package com.bitcamp.cobsp.comment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cobsp.comment.domain.Comment;
import com.bitcamp.cobsp.comment.domain.CommentRegRequest;
import com.bitcamp.cobsp.comment.service.CommentCountService;
import com.bitcamp.cobsp.comment.service.CommentDeleteService;
import com.bitcamp.cobsp.comment.service.CommentEditService;
import com.bitcamp.cobsp.comment.service.CommentListService;
import com.bitcamp.cobsp.comment.service.CommentRegService;

@Controller
public class CommentController {

	@Autowired
	private CommentRegService regService;
	
	@Autowired
	private CommentListService listService;

	@Autowired
	private CommentDeleteService deleteService;
	
	@Autowired
	private CommentEditService editService;
	
	@Autowired
	private CommentCountService countService;
	
	// 댓글 작성
	@RequestMapping(value = "/comment/regComment", method = RequestMethod.POST)
	@ResponseBody
	public void regCommView( 
			@ModelAttribute("regRequest") CommentRegRequest commRegRequest, 
			HttpServletRequest request,
			Model model) {
		int resultCnt = 0;
				
		resultCnt = regService.regComment(commRegRequest, request);
		model.addAttribute("resultCommReg", resultCnt);

	}
	
	// 댓글 조회
	@RequestMapping(value = "/comment/commentList", method = RequestMethod.POST)
	@ResponseBody
	public List<Comment> regCommView( 
			@ModelAttribute("postIdx") int postIdx, 
			Model model) {

		List<Comment> list = null;
		
		list = listService.getCommentList(postIdx);
		System.out.println(list);
		return list;
	}
	
	// 댓글 삭제
	@RequestMapping(value="/comment/deleteComment", method=RequestMethod.POST) 
	@ResponseBody
	public Map<String, Object> deleteComment(
			@ModelAttribute("commIdx") int commIdx) throws Exception {
		
		int resultCnt = 0;
		Map<String, Object> result = new HashMap<>();
		try {
			
			resultCnt = deleteService.deleteComment(commIdx);
			result.put("status", "OK");

		} catch (Exception e) {
		e.printStackTrace();
		result.put("status", "False");
		}
		return result;
	}

		
	// 게시글 수정
	@RequestMapping(value = "/comment/editComment", method = RequestMethod.POST) 
	@ResponseBody
	public Map<String, Object> postEditView(
			@ModelAttribute("commIdx") int commIdx,
			@ModelAttribute("commContent") String commContent) {

		int resultCnt = 0;
		Map<String, Object> result = new HashMap<>();
		
		try {
			
			resultCnt = editService.editComment(commIdx, commContent);
			result.put("status", "OK");

		} catch (Exception e) {
		e.printStackTrace();
		result.put("status", "False");
		}
		return result;
	}
	
	// 댓글 수 조회
	@RequestMapping(value = "/comment/countComment", method = RequestMethod.POST) 
	@ResponseBody
	public int addViews(
			@ModelAttribute("postIdx") int postIdx) {
		int result = 0;
		result = countService.countComment(postIdx);
		
		return result;
	}

}