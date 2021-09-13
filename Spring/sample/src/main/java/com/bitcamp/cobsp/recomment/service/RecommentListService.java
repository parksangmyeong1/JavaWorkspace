package com.bitcamp.cobsp.recomment.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.post.dao.Dao;
import com.bitcamp.cobsp.recomment.domain.Recomment;

@Service
public class RecommentListService {

	@Autowired
	SqlSessionTemplate template;

	public List<Recomment> getRecommentList(int commIdx) {
		return template.getMapper(Dao.class).selectRecommList(commIdx);
	}
	
}
