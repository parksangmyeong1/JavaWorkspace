package com.bitcamp.cobsp.comment.controller;

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
import com.bitcamp.cobsp.comment.domain.CommentRegRequest;
import com.bitcamp.cobsp.comment.service.CommentListService;
import com.bitcamp.cobsp.comment.service.CommentRegService;

@Controller
public class CommentController {

	@Autowired
	private CommentRegService regService;
	
	@Autowired
	private CommentListService listService;

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
//	// 게시글 들어가기
//	@RequestMapping("/post/postDetail{postIdx}") 
//	public String openPostDetail(Model model, @RequestParam("postIdx") int postIdx) {
//	
//		List<Post> list = null;
//		
//		list = detailService.selectpostDetail(postIdx);
//		
//		model.addAttribute("postDetail", list);
//		
//		if(list != null) {
//			return "post/postDetail";
//		}
//		
//		return "post/postDetail";
//	}
//	
//	// 게시글 삭제
//	@RequestMapping("/post/postDelete{postIdx}") 
//	public String postDelete(Model model, @RequestParam("postIdx") int postIdx) {
//
//		int resultCnt = 0;
//		
//		resultCnt = deleteService.deletePost(postIdx);
//
//		model.addAttribute("deleteResult", resultCnt);
//		
//		if(resultCnt != 0) {
//			return "redirect:postList";
//		}
//
//		return "post/postDetail";
//	}
//		
//	// 게시글 수정
//	@RequestMapping(value = "/post/postEdit{postIdx}", method = RequestMethod.GET) 
//	public String postEditForm(Model model, @RequestParam("postIdx") int postIdx) {
//
//		Post post = null;
//		
//		post = editService.selectByIdx(postIdx);
//		
//		model.addAttribute("postEdit", post);
//
//		if(post != null) {
//			return "post/postEditForm";
//		}
//
//		return "post/postDetail";
//	}
//	
//	// 게시글 수정
//		@RequestMapping(value = "/post/postEdit{postIdx}", method = RequestMethod.POST) 
//		public String postEditView(Model model,Post post, @RequestParam("postIdx") int postIdx) {
//
//			int resultCnt = 0;
//			
//			resultCnt = editService.editPost(post);
//			
//			model.addAttribute("editResult", resultCnt);
//
//			if(resultCnt != 0) {
//				return "redirect:postDetail?postIdx="+postIdx;
//			}
//
//			return "post/postDetail";
//		}

}