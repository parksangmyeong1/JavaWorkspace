package com.bitcamp.cobsp.post.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cobsp.common.utils.PagingVO;
import com.bitcamp.cobsp.post.dao.Dao;
import com.bitcamp.cobsp.post.domain.Post;

@Service
public class PagingPostService {

	@Autowired
	private SqlSessionTemplate template;
	
	private Dao dao;
	
	public List<Post> pagingPost(PagingVO vo) {
		
		return template.getMapper(Dao.class).pagingPost(vo);
		
	}

}
