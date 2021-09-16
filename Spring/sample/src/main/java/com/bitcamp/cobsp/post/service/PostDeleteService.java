package com.bitcamp.cobsp.post.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.post.dao.Dao;

@Service
public class PostDeleteService {

	@Autowired
	private SqlSessionTemplate template;

	public int deletePost(int postIdx){
		int resultCnt=0;
		resultCnt = template.getMapper(Dao.class).deletePost(postIdx);
		return resultCnt;
	}
}
