package com.bank.model.log;

import java.util.Date;

public class LogModel {

	private int log_id;
	private String log_user_id;
	private String log_user_name;
	private String log_class;
	private String log_method;
	private String log_exception_detail;
	private String log_params;
	private Date log_time;
	private String log_leavel;
	private String log_msg;
	private int log_type;
	private String log_ip;
	
	public String getLog_params() {
		return log_params;
	}
	public void setLog_params(String log_params) {
		this.log_params = log_params;
	}
	public String getLog_exception_detail() {
		return log_exception_detail;
	}
	public void setLog_exception_detail(String log_exception_detail) {
		this.log_exception_detail = log_exception_detail;
	}
	public String getLog_ip() {
		return log_ip;
	}
	public void setLog_ip(String log_ip) {
		this.log_ip = log_ip;
	}
	public int getLog_id() {
		return log_id;
	}
	public void setLog_id(int log_id) {
		this.log_id = log_id;
	}
	public String getLog_user_id() {
		return log_user_id;
	}
	public void setLog_user_id(String log_user_id) {
		this.log_user_id = log_user_id;
	}
	public String getLog_user_name() {
		return log_user_name;
	}
	public void setLog_user_name(String log_user_name) {
		this.log_user_name = log_user_name;
	}
	public String getLog_class() {
		return log_class;
	}
	public void setLog_class(String log_class) {
		this.log_class = log_class;
	}
	public String getLog_method() {
		return log_method;
	}
	public void setLog_method(String log_method) {
		this.log_method = log_method;
	}
	public Date getLog_time() {
		return log_time;
	}
	public void setLog_time(Date log_time) {
		this.log_time = log_time;
	}
	public String getLog_leavel() {
		return log_leavel;
	}
	public void setLog_leavel(String log_leavel) {
		this.log_leavel = log_leavel;
	}
	public String getLog_msg() {
		return log_msg;
	}
	public void setLog_msg(String log_msg) {
		this.log_msg = log_msg;
	}
	public int getLog_type() {
		return log_type;
	}
	public void setLog_type(int log_type) {
		this.log_type = log_type;
	}
	
}
