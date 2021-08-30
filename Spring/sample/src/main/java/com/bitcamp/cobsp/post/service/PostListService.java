package com.bitcamp.cobsp.post.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.post.dao.Dao;
import com.bitcamp.cobsp.post.domain.Post;

@Service
public class PostListService {

	private Dao dao;

	@Autowired
	private SqlSessionTemplate template;

	public List<Post> getPostList(){
		return template.getMapper(Dao.class).selectAll();
	}
	
}
