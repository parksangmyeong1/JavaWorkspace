package com.bitcamp.cobsp.post.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.post.dao.Dao;

@Service
public class CountPostService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int countPost(String postSort) {
		return template.getMapper(Dao.class).countPost(postSort);
	}
	
}
