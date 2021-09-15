package com.bitcamp.cobsp.post.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.post.dao.Dao;
import com.bitcamp.cobsp.post.domain.CheckRequest;
import com.bitcamp.cobsp.post.domain.Post;
import com.bitcamp.cobsp.post.domain.PostRegRequest;

@Service
public class PostRegService {

	@Autowired
	private SqlSessionTemplate template;
	
	private Dao dao;
	
	public int regPost(
			PostRegRequest regRequest,
			HttpServletRequest request) {
		
		int resultCnt = 0;

		Post post = regRequest.toPost();
		System.out.println(post);
		
		dao = template.getMapper(Dao.class);
		resultCnt = dao.insertPost(post);

		return resultCnt;
	}

	public int regCheck(CheckRequest checkRequest, 
			HttpServletRequest request) {
		
		int resultCnt = 0;
		dao = template.getMapper(Dao.class);
		resultCnt = dao.insertCheck(checkRequest);
		
		return resultCnt;
	}
}
