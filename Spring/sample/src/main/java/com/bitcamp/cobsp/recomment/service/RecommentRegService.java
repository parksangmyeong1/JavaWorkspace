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

	private Dao dao;
	
	@Autowired
	SqlSessionTemplate template;

	public int regComment(RecommentRegRequest reommRegRequest, 
			HttpServletRequest request) {
		
		int resultCnt = 0;
		
		Recomment recomment = reommRegRequest.toRecomment();
		System.out.println(recomment);
		
		dao = template.getMapper(Dao.class);
		resultCnt = dao.insertRecomment(recomment);
		
		return resultCnt;
	}
	
	
	
}
