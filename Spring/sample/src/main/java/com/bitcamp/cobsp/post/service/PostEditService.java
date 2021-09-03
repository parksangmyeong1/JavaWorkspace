package com.bitcamp.cobsp.post.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.post.dao.Dao;
import com.bitcamp.cobsp.post.domain.Post;

@Service
public class PostEditService {
	
	@Autowired
	private SqlSessionTemplate template;

	private Dao dao;
	
	public Post selectByIdx(int postIdx) {
		return template.getMapper(Dao.class).selectByIdx(postIdx);
	}
	public int editPost(Post post) {
		return template.getMapper(Dao.class).editPost(post);
	}
	
}
