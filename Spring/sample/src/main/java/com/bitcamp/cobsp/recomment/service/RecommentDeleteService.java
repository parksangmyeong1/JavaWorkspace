package com.bitcamp.cobsp.recomment.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.post.dao.Dao;

@Service
public class RecommentDeleteService {

	@Autowired
	SqlSessionTemplate template;

	public int deleteRecomment(int recommIdx) {
		return template.getMapper(Dao.class).deleteRecomment(recommIdx);
	}
	
}
