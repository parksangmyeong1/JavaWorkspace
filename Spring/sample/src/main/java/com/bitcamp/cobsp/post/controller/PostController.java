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
import com.bitcamp.cobsp.post.service.PostDetailService;
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

	// 게시글 리스트 조회
	@RequestMapping("/post/postList")
	public String getList(Model model) {

		List<Post> list = null;

		list = listService.getPostList();

		model.addAttribute("postList", list);
		
		return "post/postList";
	}

	// 게시글 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String test() {
		return "post/postWrite";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String regPostView(@ModelAttribute("regRequest") PostRegRequest postRegRequest, HttpServletRequest request,
			Model model) {

		int resultCnt = regService.regPost(postRegRequest, request);
		model.addAttribute("resultReg", resultCnt);

		String view = "redirect:post/postList";

		return view;
	}

	// 게시글 들어가기
	@RequestMapping("/post/postDetail{postIdx}") 
	public String openPostDetail(Model model, @RequestParam("postIdx") int postIdx) {
	
		Post post = null;
		
		post = detailService.selectpostDetail(postIdx);
		
		model.addAttribute("postDetail", post);
		 
		return "post/viewForm"; 
	
	}

}