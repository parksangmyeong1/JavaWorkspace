package com.bitcamp.cobsp.comment.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.post.dao.Dao;

@Service
public class CommentDeleteService {

	private Dao dao;

	@Autowired
	private SqlSessionTemplate template;

	public int deleteComment(int commIdx){
		return template.getMapper(Dao.class).deleteComment(commIdx);
	}
	
}
