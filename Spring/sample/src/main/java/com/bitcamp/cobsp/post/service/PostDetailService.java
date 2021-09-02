package com.bitcamp.cobsp.post.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.post.dao.Dao;
import com.bitcamp.cobsp.post.domain.Post;

@Service
public class PostDetailService {

	@Autowired
	private SqlSessionTemplate template;
	
	private Dao dao;
	
	public Post selectpostDetail(int postIdx) {
		
		int resultCnt = 0;
		
		Post post = null;

		dao = template.getMapper(Dao.class);
		post = dao.selectPostByPostIdx(postIdx);

		return post;
	}
}
