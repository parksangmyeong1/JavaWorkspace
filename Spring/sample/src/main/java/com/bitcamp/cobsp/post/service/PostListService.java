package com.bitcamp.cobsp.post.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.common.utils.PagingVO;
import com.bitcamp.cobsp.post.dao.Dao;
import com.bitcamp.cobsp.post.domain.Post;
import com.bitcamp.cobsp.post.domain.SearchType;

@Service
public class PostListService {

	@Autowired
	private SqlSessionTemplate template;

	public List<Post> getPostList(){
		return template.getMapper(Dao.class).selectAll();
	}
	
	public List<Post> getPostListSearchType(Map<String, Object> map) {
		System.out.println("검색 + 페이징 서비스");
		return template.getMapper(Dao.class).selectBySearch1(map);
	}
	
	public List<Post> getPostList(Map<String, Object> map) {
		System.out.println("검색 + 페이징 서비스2");
		return template.getMapper(Dao.class).selectBySearchAndPaging(map);
	}
	
	public List<Post> getPostList(PagingVO vo) {
		System.out.println("페이징 서비스");
		return template.getMapper(Dao.class).pagingPost(vo);
	}
	
	public List<Post> getPostList(String postSrot, PagingVO vo){
		System.out.println("페이징 + 카테고리 서비스");
		return template.getMapper(Dao.class).selectBySAP(postSrot, vo);
	}
}
