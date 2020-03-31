package model;

import java.util.Date;

public class Review {
	 private String id;
	 private int req;
	 private int num;
	 private String tit;
	 private String content;
	 private int boardtype;
	 
	 //getter,setter,toString
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getReq() {
		return req;
	}
	public void setReq(int req) {
		this.req = req;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTit() {
		return tit;
	}
	public void setTit(String tit) {
		this.tit = tit;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getBoardtype() {
		return boardtype;
	}
	public void setBoardtype(int boardtype) {
		this.boardtype = boardtype;
	}
	
	@Override
	public String toString() {
		return "review [id=" + id + ", req=" + req + ", num=" + num + ", tit=" + tit + ", content=" + content
				+ ", boardtype=" + boardtype + "]";
	}
  
	 
}
