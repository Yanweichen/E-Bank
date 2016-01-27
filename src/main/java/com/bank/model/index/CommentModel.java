package com.bank.model.index;

import java.util.Date;

public class CommentModel {

	private int comment_id;
	private String comment_content;
	private Date comment_time;
	private int comment_user_id;
	private int comment_praise;
	private int comment_second_id;
	private int comment_second_user_id;
	
	private String comment_time_fmt;

	public int getComment_id() {
		return comment_id;
	}

	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public Date getComment_time() {
		return comment_time;
	}

	public void setComment_time(Date comment_time) {
		this.comment_time = comment_time;
	}

	public int getComment_user_id() {
		return comment_user_id;
	}

	public void setComment_user_id(int comment_user_id) {
		this.comment_user_id = comment_user_id;
	}

	public int getComment_praise() {
		return comment_praise;
	}

	public void setComment_praise(int comment_praise) {
		this.comment_praise = comment_praise;
	}

	public int getComment_second_id() {
		return comment_second_id;
	}

	public void setComment_second_id(int comment_second_id) {
		this.comment_second_id = comment_second_id;
	}

	public int getComment_second_user_id() {
		return comment_second_user_id;
	}

	public void setComment_second_user_id(int comment_second_user_id) {
		this.comment_second_user_id = comment_second_user_id;
	}

	public String getComment_time_fmt() {
		return comment_time_fmt;
	}

	public void setComment_time_fmt(String comment_time_fmt) {
		this.comment_time_fmt = comment_time_fmt;
	}
	
}
