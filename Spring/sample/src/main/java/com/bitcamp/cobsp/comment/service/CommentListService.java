package com.bitcamp.cobsp.comment.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.comment.domain.Comment;
import com.bitcamp.cobsp.post.dao.Dao;

@Service
public class CommentListService {

	private Dao dao;

	@Autowired
	private SqlSessionTemplate template;

	public List<Comment> getCommentList(int postIdx){
		return template.getMapper(Dao.class).selectCommList(postIdx);
	}
}