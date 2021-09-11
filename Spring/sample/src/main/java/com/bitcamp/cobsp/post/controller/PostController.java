package com.bitcamp.cobsp.post.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cobsp.common.utils.PagingVO;
import com.bitcamp.cobsp.post.domain.Post;
import com.bitcamp.cobsp.post.domain.PostRegRequest;
import com.bitcamp.cobsp.post.domain.SearchType;
import com.bitcamp.cobsp.post.domain.request;
import com.bitcamp.cobsp.post.service.AddLikeService;
import com.bitcamp.cobsp.post.service.CountPostService;
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
	
	@Autowired
	private AddLikeService addLikeService;
	
	@Autowired
	private CountPostService countPostService;
	
	// 게시글 등록
	@RequestMapping(value = "/post/write", method = RequestMethod.GET)
	public String regPostForm() {

		return "post/postWrite";
	}

	@RequestMapping(value = "/post/write", method = RequestMethod.POST)
	public String regPostView(
			@ModelAttribute("regRequest") PostRegRequest postRegRequest, 
			HttpServletRequest request,
			Model model) {
		
		int resultCnt = 0;

		resultCnt = regService.regPost(postRegRequest, request);
		
		model.addAttribute("resultReg", resultCnt);

		String view = "redirect:postList";

		return view;
	}

	// 게시글 들어가기
	@RequestMapping("/post/postDetail{postIdx}") 
	public String openPostDetail(
			@RequestParam("postIdx") int postIdx, 
			Model model) {
	
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
	public String postDelete(
			@RequestParam("postIdx") int postIdx,
			Model model) {
		System.out.println(postIdx);
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
	public String postEditForm(
			@RequestParam("postIdx") int postIdx,
			Model model) {

		Post post = null;
		
		post = editService.selectByIdx(postIdx);
		
		model.addAttribute("postEdit", post);

		if(post != null) {
			return "post/postEditForm";
		}

		return "post/postDetail";
	}
	
	@RequestMapping(value = "/post/postEdit{postIdx}", method = RequestMethod.POST) 
	public String postEditView(
			@RequestParam("postIdx") int postIdx,
			Post post, Model model) {

		int resultCnt = 0;

		resultCnt = editService.editPost(post);

		model.addAttribute("editResult", resultCnt);

		if(resultCnt != 0) {
			return "redirect:postDetail?postIdx="+postIdx;
		}

		return "post/postDetail";
	}
		
	// 게시글 좋아요 증가
	@RequestMapping(value = "/post/addlLike", method = RequestMethod.POST)
	@ResponseBody
	public int addLike(
			@RequestParam("postIdx") int postIdx) {

		int resultCnt = 0;

		resultCnt = addLikeService.addLike(postIdx);

		return resultCnt;
	}
	
	// 게시글 리스트 출력
	@RequestMapping(value = "/post/postList", method = RequestMethod.GET)
	public String postList(PagingVO vo, Model model,
			@RequestParam(value="postSort", required = false)String postSort,
			@RequestParam(value="nowPage", required = false)String nowPage,
			@RequestParam(value="cntPerPage", required = false)String cntPerPage,
			SearchType searchType) {
		
		System.out.println("postSort : " + postSort + " nowPage : " + nowPage + " cntPerPage : " + cntPerPage);
		
		// 전체 리스트 출력
		List<Post> list = null;
		list = listService.getPostList();
		
		// 게시글 페이징하고 리스트 출력
		int total = countPostService.countPost(postSort);
		System.out.println(total);

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		
		// 카테고리별로 리스트 출력
		if(postSort != null) {
			list = listService.getPostList(postSort, vo);
		}else if(postSort == null || postSort.equals("")) {
			list = listService.getPostList(vo);
		}
		
		model.addAttribute("postList", list);
		model.addAttribute("postSort", postSort);
		
		System.out.println("vo : " + vo);
		System.out.println(listService.getPostList(vo));
		
		return "post/postList";
	}
	
	// 게시글 리스트 출력
		@RequestMapping(value = "/post/searchList", method = RequestMethod.GET)
		public String postList1(PagingVO vo, Model model,
				@RequestParam(value="postSort", required = false)String postSort,
				@RequestParam(value="nowPage", required = false)String nowPage,
				@RequestParam(value="cntPerPage", required = false)String cntPerPage,
				SearchType searchType) {
			
			System.out.println("postSort : " + postSort + " nowPage : " + nowPage + " cntPerPage : " + cntPerPage);
			
			// 전체 리스트 출력
			List<Post> list = null;
			list = listService.getPostList();
			
			// 게시글 페이징하고 리스트 출력
			int total = countPostService.countPost(postSort);
			System.out.println(total);

			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) {
				cntPerPage = "10";
			}
			
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("paging", vo);
			
			// 카테고리별로 리스트 출력
			if(postSort != null) {
				list = listService.getPostList(postSort, vo);
			}else if(postSort == null || postSort.equals("")) {
				list = listService.getPostList(vo);
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("item1", searchType);
			map.put("item2", vo);
			map.put("postSort", postSort);
			
			list = listService.getPostList(map);

			model.addAttribute("postList", list);
			model.addAttribute("postSort", postSort);
			
			System.out.println("vo : " + vo);
			System.out.println(listService.getPostList(vo));
			
			return "post/postList";
		}
}