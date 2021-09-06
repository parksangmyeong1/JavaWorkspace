package com.bitcamp.cobsp.comment.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.post.dao.Dao;

@Service
public class CommentCountService {
	
	private Dao dao;

	@Autowired
	private SqlSessionTemplate template;
	
	public int countComment(int postIdx) {
		
		return template.getMapper(Dao.class).countComment(postIdx);
	}

}
