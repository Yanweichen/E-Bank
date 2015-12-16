package com.bank.model.user;

public class UserModel {
	
	private String user_id;
	private String user_name;
	private String user_pass;
	private String user_paypass;
	private String user_city;
	private String user_obligate_info;
	private String user_face;
	private String user_idcard;
	private String user_phone;
	private String user_email;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public String getUser_paypass() {
		return user_paypass;
	}
	public void setUser_paypass(String user_paypass) {
		this.user_paypass = user_paypass;
	}
	public String getUser_city() {
		return user_city;
	}
	public void setUser_city(String user_city) {
		this.user_city = user_city;
	}
	public String getUser_obligate_info() {
		return user_obligate_info;
	}
	public void setUser_obligate_info(String user_obligate_info) {
		this.user_obligate_info = user_obligate_info;
	}
	public String getUser_face() {
		return user_face;
	}
	public void setUser_face(String user_face) {
		this.user_face = user_face;
	}
	public String getUser_idcard() {
		return user_idcard;
	}
	public void setUser_idcard(String user_idcard) {
		this.user_idcard = user_idcard;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	@Override
	public String toString() {
		return "UserModel [user_id=" + user_id + ", user_name=" + user_name + ", user_pass=" + user_pass
				+ ", user_paypass=" + user_paypass + ", user_city=" + user_city + ", user_obligate_info="
				+ user_obligate_info + ", user_face=" + user_face + ", user_idcard=" + user_idcard + ", user_phone="
				+ user_phone + ", user_email=" + user_email + "]";
	}
	
}
