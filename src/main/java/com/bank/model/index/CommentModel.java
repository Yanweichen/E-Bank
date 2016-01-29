package com.bank.model.index;

import java.util.Date;
import java.util.List;

public class CommentModel {

	private Integer comment_id;
	private String comment_content;
	private Date comment_time;
	private Integer comment_user_id;
	private Integer comment_praise;
	private Integer comment_parent_id;
	private Integer comment_entry_id;
	private String user_name;
	private List<CommentModel> secondCommentList;
	
	public List<CommentModel> getSecondCommentList() {
		return secondCommentList;
	}

	public void setSecondCommentList(List<CommentModel> secondCommentList) {
		this.secondCommentList = secondCommentList;
	}

	public Integer getComment_id() {
		return comment_id;
	}

	public void setComment_id(Integer comment_id) {
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

	public Integer getComment_user_id() {
		return comment_user_id;
	}

	public void setComment_user_id(Integer comment_user_id) {
		this.comment_user_id = comment_user_id;
	}

	public Integer getComment_praise() {
		return comment_praise;
	}

	public void setComment_praise(Integer comment_praise) {
		this.comment_praise = comment_praise;
	}

	public Integer getComment_parent_id() {
		return comment_parent_id;
	}

	public void setComment_parent_id(Integer comment_parent_id) {
		this.comment_parent_id = comment_parent_id;
	}

	public Integer getComment_entry_id() {
		return comment_entry_id;
	}

	public void setComment_entry_id(Integer comment_entry_id) {
		this.comment_entry_id = comment_entry_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
}
