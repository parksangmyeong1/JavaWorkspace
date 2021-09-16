package com.bitcamp.cobsp.recomment.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.post.dao.Dao;

@Service
public class RecommentEditService {

	@Autowired
	SqlSessionTemplate template;

	public int editRecomment(int recommIdx, String recommContent) {
		return template.getMapper(Dao.class).editRecomment(recommIdx, recommContent);
	}
}
