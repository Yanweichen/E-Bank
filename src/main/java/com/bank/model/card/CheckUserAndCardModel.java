package com.bank.model.card;

import java.util.Date;

public class CheckUserAndCardModel {

	private int user_id;
	private String user_name;
	private String user_city;
	private String user_face;
	private String user_idcard;
	private String user_state;
	private Date user_regist_time;
	private String user_regist_time_fmt;
	private Integer cardCheckOpencardId;
	private Date card_check_time;
	private String card_check_time_fmt;
	
	private String card_name;
	private String card_face;
	
	public Integer getCardCheckOpencardId() {
		return cardCheckOpencardId;
	}
	public void setCardCheckOpencardId(Integer cardCheckOpencardId) {
		this.cardCheckOpencardId = cardCheckOpencardId;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public Date getCard_check_time() {
		return card_check_time;
	}
	public void setCard_check_time(Date card_check_time) {
		this.card_check_time = card_check_time;
	}
	public String getCard_check_time_fmt() {
		return card_check_time_fmt;
	}
	public void setCard_check_time_fmt(String card_check_time_fmt) {
		this.card_check_time_fmt = card_check_time_fmt;
	}
	public String getUser_regist_time_fmt() {
		return user_regist_time_fmt;
	}
	public void setUser_regist_time_fmt(String user_regist_time_fmt) {
		this.user_regist_time_fmt = user_regist_time_fmt;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_city() {
		return user_city;
	}
	public void setUser_city(String user_city) {
		this.user_city = user_city;
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
	public String getUser_state() {
		return user_state;
	}
	public void setUser_state(String user_state) {
		this.user_state = user_state;
	}
	public Date getUser_regist_time() {
		return user_regist_time;
	}
	public void setUser_regist_time(Date user_regist_time) {
		this.user_regist_time = user_regist_time;
	}
	public String getCard_name() {
		return card_name;
	}
	public void setCard_name(String card_name) {
		this.card_name = card_name;
	}
	public String getCard_face() {
		return card_face;
	}
	public void setCard_face(String card_face) {
		this.card_face = card_face;
	}
	
}
