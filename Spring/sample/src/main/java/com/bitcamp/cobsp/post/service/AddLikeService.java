package com.bitcamp.cobsp.post.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.post.dao.Dao;

@Service
public class AddLikeService {

	@Autowired
	private SqlSessionTemplate template;
	
	public int addLike(int postIdx) {
		return template.getMapper(Dao.class).addLike(postIdx);
	}
	
	public int addDislike(int postIdx) {
		return template.getMapper(Dao.class).addDislike(postIdx);
	}

}
