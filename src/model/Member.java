package model;
//Bean Ŭ����
public class Member{
	private String id;
	private String pass;
	private String name;
	private String nicname;	
	private String tel;
	private String email;
	private String picture;
	//getter, setter, toString
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNicname() {
		return nicname;
	}
	public void setNicname(String nicname) {
		this.nicname = nicname;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	} 
	@Override 
	public String toString() {   
		return "Member [id=" + id + ", pass=" + pass + ", name=" + name + ", nicname=" + nicname + ", tel=" + tel
				+ ", email=" + email + ", picture=" + picture + "]";
	}
	
}