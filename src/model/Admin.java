package model;

public class Admin {
	private String calender;
	private String todayti;
	private int num;
	public String getCalender() {
		return calender;
	}
	public void setCalender(String string) {
		this.calender = string;
	}
	public String getTodayti() {
		return todayti;
	}
	public void setTodayti(String todayti) {
		this.todayti = todayti;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() { 
		return "Admin [calender=" + calender + ", todayti=" + todayti + ", num=" + num + "]";
	} 
}