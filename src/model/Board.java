package model;

import java.util.Date;

public class Board { 
	private int num;
	private String name;
	private String genre;
	private String title;
	private String content;
	private String poto;
	private String id;
	private Date date;
	private int cnt;
	private int plus;
	private String calender;
	private int grp;
	private int grplevel;
	private int grpstep;
	private int boardtype;
		
	// getter ,setter, toString
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
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
	public String getPoto() {
		return poto;
	}
	public void setPoto(String poto) {
		this.poto = poto;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getPlus() {
		return plus;
	}
	public void setPlus(int plus) {
		this.plus = plus;
	}
	public String getCalender() {
		return calender;
	}
	public void setCalender(String calender) {
		this.calender = calender;
	}
	public int getGrp() {
		return grp; 
	}
	public void setGrp(int grp) {
		this.grp = grp;
	}
	public int getGrplevel() {
		return grplevel;
	}
	public void setGrplevel(int grplevel) {
		this.grplevel = grplevel;
	}
	public int getGrpstep() {
		return grpstep;
	}
	public void setGrpstep(int grpstep) {
		this.grpstep = grpstep;
	}
	
	public int getBoardtype() {
		return boardtype;
	}
	public void setBoardtype(int boardtype) {
		this.boardtype = boardtype;
	}
	@Override
	public String toString() {
		return "Board [num=" + num + ", name=" + name + ", genre=" + genre + ", title=" + title + ", content=" + content
				+ ", poto=" + poto + ", id=" + id + ", date=" + date + ", cnt=" + cnt + ", plus=" + plus + ", calender="
				+ calender + ", grp=" + grp + ", grplevel=" + grplevel + ", grpstep=" + grpstep + ", boardtype="
				+ boardtype + "]";
	}

	
	
		
}
