package com.bitcamp.cobsp.post.dao;

import java.util.List;
import java.util.Map;

import com.bitcamp.cobsp.comment.domain.Comment;
import com.bitcamp.cobsp.common.utils.PagingVO;
import com.bitcamp.cobsp.post.domain.CheckRequest;
import com.bitcamp.cobsp.post.domain.Post;
import com.bitcamp.cobsp.post.domain.SearchType;
import com.bitcamp.cobsp.recomment.domain.Recomment;

public interface Dao {
	
	// 게시글 등록
	int insertPost(Post post);
	// 게시글 정보 수정
	int editPost(Post post);
	// 게시글 삭제
	int deletePost(int postIdx);
	// 수정할 게시글 가져오기
	Post selectByIdx(int postIdx);
	// 상세 게시글
	List<Post> selectPostDetail(int postIdx);
	// 게시글 리스트
	List<Post> selectAll();
	// 게시글 카테고리로 조회
	List<Post> selectBySort(String postSort);
	
	// 게시글 좋아요 증가
	int addLike(int postIdx);
	// 게시글 좋아요 증가
	int addDislike(int postIdx);
	// 게시글 조회수 증가
	void addViews(int postIdx);
	// 게시글 댓글 수 조회
	int countComment(int postIdx);
	
	// 댓글 등록
	int insertComment(Comment comment);
	// 댓글 조회
	List<Comment> selectCommList(int postIdx);
	// 댓글 삭제
	int deleteComment(int commIdx);
	// 댓글 수정
	int editComment(int commIdx, String commContent);
	// 댓글 좋아요 1 증가
	int addcommLike(int commIdx);
	// 댓글 좋아요 조회
	int selectLike(int commIdx);
	// 댓글 좋아요 1 증가
	int addcommDislike(int commIdx);
	// 댓글 좋아요 조회
	int selectDislike(int commIdx);
	
	// 게시글 총 갯수
	int countPost(String postSort);
	// 페이징 처리 게시글 조회
	List<Post>pagingPost(PagingVO vo);
	// 카테고리와 페이징하고 게시글 조회
	List<Post> selectBySAP(String postSrot, PagingVO vo);
	// 검색으로 리스트 조회
	List<Post> selectBySearch1(Map<String, Object> map);
	// 검색으로 리스트 조회
	List<Post> selectBySearchAndPaging(Map<String, Object> map);
	
	
	
	// 대댓글 등록
	int insertRecomment(Recomment recomment);
	// 대댓글 리스트 출력
	List<Recomment> selectRecommList(int postIdx);
	// 베스트 댓글 조회
	Comment selectBestComment(int postIdx);
	// 대댓글 삭제
	int deleteRecomment(int recommIdx);
	// 대댓글 수정
	int editRecomment(int recommIdx, String recommContent);
	// 대댓글 좋아요
	int addRecommLike(int recommIdx);
	// 대댓글 싫어요
	int addRecommDislike(int recommIdx);
	// 대댓글 신고
	int addRecommRep(int recommIdx);
	
	// check용 등록
	int insertCheck(CheckRequest checkRequest);
	// 좋아요 했는지 찾기
	int selectLikeCheck(CheckRequest checkRequest);
	
		
}
