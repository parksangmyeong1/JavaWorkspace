package com.bitcamp.cobsp.recomment.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.comment.domain.Comment;
import com.bitcamp.cobsp.post.dao.Dao;
import com.bitcamp.cobsp.recomment.domain.Recomment;
import com.bitcamp.cobsp.recomment.domain.RecommentRegRequest;

@Service
public class RecommentRegService {

	@Autowired
	SqlSessionTemplate template;

	public int regComment(RecommentRegRequest recommRegRequest, 
			HttpServletRequest request) {
		
		int resultCnt = 0;
		
		Recomment recomment = recommRegRequest.toRecomment();
		System.out.println(recomment);
		
		resultCnt = template.getMapper(Dao.class).insertRecomment(recomment);
		return resultCnt;
	}
}
