package com.bitcamp.cobsp.post.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.cobsp.post.domain.Post;
import com.bitcamp.cobsp.post.domain.PostRegRequest;
import com.bitcamp.cobsp.post.service.PostDeleteService;
import com.bitcamp.cobsp.post.service.PostDetailService;
import com.bitcamp.cobsp.post.service.PostEditService;
import com.bitcamp.cobsp.post.service.PostListService;
import com.bitcamp.cobsp.post.service.PostRegService;

@Controller
public class PostController {

	@Autowired
	private PostListService listService;

	@Autowired
	private PostRegService regService;
	
	@Autowired
	private PostDetailService detailService;
	
	@Autowired
	private PostDeleteService deleteService;
	
	@Autowired
	private PostEditService editService;

	// 게시글 리스트 조회
	@RequestMapping("/post/postList")
	public String getList(Model model) {

		List<Post> list = null;

		list = listService.getPostList();

		model.addAttribute("postList", list);
		
		return "post/postList";
	}

	// 게시글 작성
	@RequestMapping(value = "/post/write", method = RequestMethod.GET)
	public String test() {
		return "post/postWrite";
	}

	@RequestMapping(value = "/post/write", method = RequestMethod.POST)
	public String regPostView(@ModelAttribute("regRequest") PostRegRequest postRegRequest, HttpServletRequest request,
			Model model) {

		int resultCnt = regService.regPost(postRegRequest, request);
		
		model.addAttribute("resultReg", resultCnt);

		String view = "redirect:postList";

		return view;
	}

	// 게시글 들어가기
	@RequestMapping("/post/postDetail{postIdx}") 
	public String openPostDetail(Model model, @RequestParam("postIdx") int postIdx) {
	
		List<Post> list = null;
		
		list = detailService.selectpostDetail(postIdx);
		
		model.addAttribute("postDetail", list);
		
		if(list != null) {
			return "post/postDetail";
		}
		
		return "post/postDetail";
	}
	
	// 게시글 삭제
	@RequestMapping("/post/postDelete{postIdx}") 
	public String postDelete(Model model, @RequestParam("postIdx") int postIdx) {

		int resultCnt = 0;
		
		resultCnt = deleteService.deletePost(postIdx);

		model.addAttribute("deleteResult", resultCnt);
		
		if(resultCnt != 0) {
			return "redirect:postList";
		}

		return "post/postDetail";
	}
		
	// 게시글 수정
	@RequestMapping(value = "/post/postEdit{postIdx}", method = RequestMethod.GET) 
	public String postEditForm(Model model, @RequestParam("postIdx") int postIdx) {

		Post post = null;
		
		post = editService.selectByIdx(postIdx);
		
		model.addAttribute("postEdit", post);

		if(post != null) {
			return "post/postEditForm";
		}

		return "post/postDetail";
	}
	
	// 게시글 수정
		@RequestMapping(value = "/post/postEdit{postIdx}", method = RequestMethod.POST) 
		public String postEditView(Model model,Post post, @RequestParam("postIdx") int postIdx) {

			int resultCnt = 0;
			
			resultCnt = editService.editPost(post);
			
			model.addAttribute("editResult", resultCnt);

			if(resultCnt != 0) {
				return "redirect:postDetail?postIdx="+postIdx;
			}

			return "post/postDetail";
		}
		
//	// 댓글 숫자 조회
//		@RequestMapping(value = "/post/getLike{postIdx}") 
//		public String getLike(Model model, @RequestParam("postIdx") int postIdx) {
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