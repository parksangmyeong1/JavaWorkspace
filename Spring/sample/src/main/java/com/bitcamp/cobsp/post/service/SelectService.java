package com.bitcamp.cobsp.post.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.post.dao.Dao;
import com.bitcamp.cobsp.post.domain.CheckRequest;

@Service
public class SelectService {

	@Autowired
	SqlSessionTemplate template;

	public int selectLikeCheck(CheckRequest checkRequest) {
		return template.getMapper(Dao.class).selectLikeCheck(checkRequest);
	}
	
	
	
}
