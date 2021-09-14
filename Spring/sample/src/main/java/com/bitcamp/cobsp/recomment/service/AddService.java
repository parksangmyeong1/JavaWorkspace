package com.bitcamp.cobsp.recomment.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.post.dao.Dao;

@Service
public class AddService {

	@Autowired
	SqlSessionTemplate template;

	public int addRecommLike(int recommIdx) {
		return template.getMapper(Dao.class).addRecommLike(recommIdx);
	}

	public int addRecommDislike(int recommIdx) {
		return template.getMapper(Dao.class).addRecommDislike(recommIdx);
	}

	public int addRecommRep(int recommIdx) {
		return template.getMapper(Dao.class).addRecommRep(recommIdx);
	}
	
	
	
}
