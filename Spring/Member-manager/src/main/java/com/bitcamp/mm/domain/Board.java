package com.bitcamp.mm.domain;

import java.sql.Timestamp;
import java.util.Date;

public class Board {

	private int boardidx;
	private String id;
	private String title;
	private String content;
	private int hit;
	private Timestamp boardregdate;
	
	public Board() {}

	public Board(int boardidx, String id, String title, String content, int hit, Timestamp boardregdate) {
		this.boardidx = boardidx;
		this.id = id;
		this.title = title;
		this.content = content;
		this.hit = hit;
		this.boardregdate = boardregdate;
	}

	public int getBoardidx() {
		return boardidx;
	}

	public void setBoardidx(int boardidx) {
		this.boardidx = boardidx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public Timestamp getBoardregdate() {
		return boardregdate;
	}

	public void setBoardregdate(Timestamp boardregdate) {
		this.boardregdate = boardregdate;
	}
	
	// java.sql.TimeStamp -> java.util.Date
		public Date getDate() {
			return new Date(getBoardregdate().getTime());
		}
	
}
