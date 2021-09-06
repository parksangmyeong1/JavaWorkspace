package com.bitcamp.cobsp.comment.domain;

public class CommentRegRequest {

	// 사용자의 입력을 저장하는 용도의 클래스
	// regForm의 name과 일치시켜야 알아서 저장해준다.
	// 알아서 넣어주기 때문에 생성자 필요가 없다.
	private int postIdx;
	private String commContent;
	private String commWriter;

	public CommentRegRequest() {}
	
	public CommentRegRequest(int postIdx, String commWriter, String commContent) {
		this.postIdx = postIdx;
		this.commWriter = commWriter;
		this.commContent = commContent;
	}

	public int getPostIdx() {
		return postIdx;
	}

	public void setPostIdx(int postIdx) {
		this.postIdx = postIdx;
	}
	
	public void setCommWriter(String commWriter) {
		this.commWriter = commWriter;
	}

	public String getCommWriter() {
		return commWriter;
	}

	public String getCommContent() {
		return commContent;
	}

	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}

	@Override
	public String toString() {
		return "CommentRegRequest [postIdx=" + postIdx + ", commWriter=" + commWriter + ", commContent=" + commContent + "]";
	}

	// MemberRegRequest -> Member 
	// 사용자에게 받는 건 MemberRegRequest지만 DB저장은 Member라서 바꿔줘야한다.
	public Comment toComment() {
		return new Comment(0, postIdx, commWriter, commContent, null, 0, 0, 0);
	}

	
}
