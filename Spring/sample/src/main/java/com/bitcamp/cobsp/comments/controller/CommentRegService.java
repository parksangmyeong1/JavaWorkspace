package com.bitcamp.cobsp.comments.controller;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.comment.domain.Comment;
import com.bitcamp.cobsp.comment.domain.CommentRegRequest;
import com.bitcamp.cobsp.post.dao.Dao;
import com.bitcamp.cobsp.post.domain.Post;
import com.bitcamp.cobsp.post.domain.PostRegRequest;

@Service
public class CommentRegService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	private Dao dao;
	
	public int regComment(CommentRegRequest regRequest,
			HttpServletRequest request) {
		
		int resultCnt = 0;
		
		Comment comment = regRequest.toComment();
		System.out.println(comment);
		
		dao = template.getMapper(Dao.class);
		resultCnt = dao.insertComment(comment);
		
		return resultCnt;
	}
}
