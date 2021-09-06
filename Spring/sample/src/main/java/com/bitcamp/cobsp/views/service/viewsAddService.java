package com.bitcamp.cobsp.views.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.post.dao.Dao;

@Service
public class viewsAddService {
	
	private Dao dao;

	@Autowired
	private SqlSessionTemplate template;
	
	public void addViews(int postIdx) {
		
		template.getMapper(Dao.class).addViews(postIdx);

	}

}
