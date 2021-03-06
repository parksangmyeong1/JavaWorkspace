package com.bitcamp.cobsp.comment.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.post.dao.Dao;

@Service
public class CommentEditService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int editComment(int commIdx, String commContent) {
		return template.getMapper(Dao.class).editComment(commIdx, commContent);
	}
}
