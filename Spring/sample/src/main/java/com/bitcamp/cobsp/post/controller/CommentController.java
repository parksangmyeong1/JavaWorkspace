package com.bitcamp.cobsp.post.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.cobsp.comment.domain.CommentRegRequest;
import com.bitcamp.cobsp.comments.controller.CommentRegService;

@Controller
public class CommentController {

	@Autowired
	private CommentRegService regService;

	// 게시글 작성
	@RequestMapping(value = "/comment/regComment", method = RequestMethod.GET)
	public String regCommView( 
			@ModelAttribute("regRequest") CommentRegRequest commRegRequest, 
			HttpServletRequest request,
			Model model) {
		int resultCnt = 0;
				
		resultCnt = regService.regComment(commRegRequest, request);
		model.addAttribute("resultCommReg", resultCnt);

		String view = "redirect:/post/postDetail?postIdx="+commRegRequest.getPostIdx();

		return view;
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