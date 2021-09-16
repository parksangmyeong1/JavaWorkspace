package com.bitcamp.cobsp.post.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.post.dao.Dao;
import com.bitcamp.cobsp.post.domain.CheckRequest;

@Service
public class AddService {

	@Autowired
	private SqlSessionTemplate template;
	
	public void addViews(int postIdx) {
		template.getMapper(Dao.class).addViews(postIdx);
	}

	public int addbutton(CheckRequest checkRequest) {
		return template.getMapper(Dao.class).addbutton(checkRequest);
	}
}
