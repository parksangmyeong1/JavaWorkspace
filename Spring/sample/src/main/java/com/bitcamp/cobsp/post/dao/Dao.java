package com.bitcamp.cobsp.post.dao;

import com.bitcamp.cobsp.post.domain.Post;

public interface Dao {
	
	// 게시글 등록
	int insertPost(Post post);
}
