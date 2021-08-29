package com.bitcamp.cob.comment.domain;

import java.sql.Timestamp;
import java.util.Date;

public class Comment {

	private int commIdx;
	private int postIdx;
	private String commContent;
	private Timestamp commRegDate;
	private int commLike;
	private int commDislike;
	private int commRep;
	
	public Comment() {}

	public Comment(int commIdx, int postIdx, String commContent, Timestamp commRegDate, int commLike, int commDislike,
			int commRep) {
		this.commIdx = commIdx;
		this.postIdx = postIdx;
		this.commContent = commContent;
		this.commRegDate = commRegDate;
		this.commLike = commLike;
		this.commDislike = commDislike;
		this.commRep = commRep;
	}

	public int getCommIdx() {
		return commIdx;
	}

	public void setCommIdx(int commIdx) {
		this.commIdx = commIdx;
	}

	public int getPostIdx() {
		return postIdx;
	}

	public void setPostIdx(int postIdx) {
		this.postIdx = postIdx;
	}

	public String getCommContent() {
		return commContent;
	}

	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}

	public Timestamp getCommRegDate() {
		return new Timestamp(commRegDate.getTime()-(1000*60*60*9));
		//return commRegDate;
	}

	public void setCommRegDate(Timestamp commRegDate) {
		this.commRegDate = commRegDate;
	}

	public int getCommLike() {
		return commLike;
	}

	public void setCommLike(int commLike) {
		this.commLike = commLike;
	}

	public int getCommDislike() {
		return commDislike;
	}

	public void setCommDislike(int commDislike) {
		this.commDislike = commDislike;
	}

	public int getCommRep() {
		return commRep;
	}

	public void setCommRep(int commRep) {
		this.commRep = commRep;
	}
	// java.sql.TimeStamp -> java.util.Date
	public Date getDate() {
		return new Date(getCommRegDate().getTime());
	}

	@Override
	public String toString() {
		return "Comment [commIdx=" + commIdx + ", postIdx=" + postIdx + ", commContent=" + commContent
				+ ", commRegDate=" + commRegDate + ", commLike=" + commLike + ", commDislike=" + commDislike
				+ ", commRep=" + commRep + "]";
	}
	
}
