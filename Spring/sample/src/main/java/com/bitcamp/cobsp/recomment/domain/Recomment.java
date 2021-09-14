package com.bitcamp.cobsp.recomment.domain;

import java.sql.Timestamp;
import java.util.Date;

public class Recomment {

	private int recommIdx;
	private int postIdx;
	private int commIdx;
	private String recommWriter;
	private String recommContent;
	private Timestamp recommRegDate;
	private int recommLike;
	private int recommDislike;
	private int recommRep;
	
	public Recomment() {}
	
	
	public Recomment(int recommIdx, int postIdx, int commIdx, String recommWriter, String recommContent, Timestamp recommRegDate,
			int recommLike, int recommDislike, int recommRep) {
		this.recommIdx = recommIdx;
		this.postIdx = postIdx;
		this.commIdx = commIdx;
		this.recommWriter = recommWriter;
		this.recommContent = recommContent;
		this.recommRegDate = recommRegDate;
		this.recommLike = recommLike;
		this.recommDislike = recommDislike;
		this.recommRep = recommRep;
	}


	public int getRecommIdx() {
		return recommIdx;
	}


	public void setRecommIdx(int recommIdx) {
		this.recommIdx = recommIdx;
	}


	public int getPostIdx() {
		return postIdx;
	}


	public void setPostIdx(int postIdx) {
		this.postIdx = postIdx;
	}


	public int getCommIdx() {
		return commIdx;
	}


	public void setCommIdx(int commIdx) {
		this.commIdx = commIdx;
	}


	public String getRecommWriter() {
		return recommWriter;
	}


	public void setRecommWriter(String recommWriter) {
		this.recommWriter = recommWriter;
	}


	public String getRecommContent() {
		return recommContent;
	}


	public void setRecommContent(String recommContent) {
		this.recommContent = recommContent;
	}


	public Timestamp getRecommRegDate() {
		return new Timestamp(recommRegDate.getTime()-(1000*60*60*9));
		//return postRegDate;
	}


	public void setRecommRegDate(Timestamp recommRegDate) {
		this.recommRegDate = recommRegDate;
	}


	public int getRecommLike() {
		return recommLike;
	}


	public void setRecommLike(int recommLike) {
		this.recommLike = recommLike;
	}


	public int getRecommDislike() {
		return recommDislike;
	}


	public void setRecommDislike(int recommDislike) {
		this.recommDislike = recommDislike;
	}


	public int getRecommRep() {
		return recommRep;
	}


	public void setRecommRep(int recommRep) {
		this.recommRep = recommRep;
	}
	// java.sql.TimeStamp -> java.util.Date
	public Date getDate() {
		return new Date(getRecommRegDate().getTime());
	}


	@Override
	public String toString() {
		return "Recomment [recommIdx=" + recommIdx + ", postIdx=" + postIdx + ", commIdx=" + commIdx + ", recommWriter="
				+ recommWriter + ", recommContent=" + recommContent + ", recommRegDate=" + recommRegDate
				+ ", recommLike=" + recommLike + ", recommDislike=" + recommDislike + ", recommRep=" + recommRep + "]";
	}

}
