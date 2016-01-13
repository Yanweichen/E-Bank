package com.bank.model.admin;

import java.util.Date;

public class AdminModel {

	private String admin_id;
	private String admin_name;
	private String admin_phone;
	private String admin_password;
	private Date admin_last_login;
	private String admin_power;
	
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_phone() {
		return admin_phone;
	}
	public void setAdmin_phone(String admin_phone) {
		this.admin_phone = admin_phone;
	}
	public String getAdmin_password() {
		return admin_password;
	}
	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}
	public Date getAdmin_last_login() {
		return admin_last_login;
	}
	public void setAdmin_last_login(Date admin_last_login) {
		this.admin_last_login = admin_last_login;
	}
	public String getAdmin_power() {
		return admin_power;
	}
	public void setAdmin_power(String admin_power) {
		this.admin_power = admin_power;
	}
	
}
