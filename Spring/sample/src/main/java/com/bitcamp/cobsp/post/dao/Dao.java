package com.bitcamp.cobsp.post.dao;

import java.util.List;

import com.bitcamp.cobsp.post.domain.Post;

public interface Dao {
	
	// 게시글 등록
	int insertPost(Post post);
	// 게시글 리스트
	List<Post> selectAll();
}
