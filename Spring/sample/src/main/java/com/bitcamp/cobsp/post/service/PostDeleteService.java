package com.bitcamp.cobsp.post.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.post.dao.Dao;

@Service
public class PostDeleteService {

	@Autowired
	private SqlSessionTemplate template;

	private Dao dao; // 이렇게 없어도 돌아가는데 선언 안해도 될지 한줄요약 가능
	
	public int deletePost(int postIdx){
		int resultCnt=0;
		dao = template.getMapper(Dao.class);
		resultCnt = dao.deletePost(postIdx);
		return resultCnt;
		
//		return template.getMapper(Dao.class).deletePost(postIdx);
	}
	
}
