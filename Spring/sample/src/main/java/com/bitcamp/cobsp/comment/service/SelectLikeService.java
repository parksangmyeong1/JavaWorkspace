package com.bitcamp.cobsp.comment.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.post.dao.Dao;

@Service
public class SelectLikeService {

	@Autowired
	SqlSessionTemplate template;
	
	public int selectCommLike(int commIdx) {
		return template.getMapper(Dao.class).selectLike(commIdx);
	}

	
	
}
