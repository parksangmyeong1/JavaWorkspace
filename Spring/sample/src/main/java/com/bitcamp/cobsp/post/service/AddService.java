package com.bitcamp.cobsp.post.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.post.dao.Dao;

@Service
public class AddService {

	@Autowired
	private SqlSessionTemplate template;
	
	public int addLike(int postIdx) {
		return template.getMapper(Dao.class).addLike(postIdx);
	}
	public int addDislike(int postIdx) {
		return template.getMapper(Dao.class).addDislike(postIdx);
	}
	public int addRep(int postIdx) {
		return template.getMapper(Dao.class).addRep(postIdx);
	}
	
	public int addCommLike(int commIdx) {
		return template.getMapper(Dao.class).addCommLike(commIdx);
	}
	public int addCommDislike(int commIdx) {
		return template.getMapper(Dao.class).addCommDislike(commIdx);
	}
	public int addCommRep(int commIdx) {
		return template.getMapper(Dao.class).addCommRep(commIdx);
	}
	
	public int addRecommLike(int recommIdx) {
		return template.getMapper(Dao.class).addRecommLike(recommIdx);
	}
	public int addRecommDislike(int recommIdx) {
		return template.getMapper(Dao.class).addRecommDislike(recommIdx);
	}
	public int addRecommRep(int recommIdx) {
		return template.getMapper(Dao.class).addRecommRep(recommIdx);
	}

	public void addViews(int postIdx) {
		template.getMapper(Dao.class).addViews(postIdx);
	}
}
