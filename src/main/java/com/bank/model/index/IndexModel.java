package com.bank.model.index;

import java.util.Date;
/**
 * @author yanwe
 *	首页活动 公告模型
 */
public class IndexModel {

	private Integer index_id;//主键
	private String index_type;//分类
	private String index_title;//标题
	private String index_content;//内容
	private Date index_uptime;//上传时间
	private String upfrom;//上传者
	
	public String getUpfrom() {
		return upfrom;
	}
	public void setUpfrom(String upfrom) {
		this.upfrom = upfrom;
	}
	public Integer getIndex_id() {
		return index_id;
	}
	public void setIndex_id(Integer index_id) {
		this.index_id = index_id;
	}
	public String getIndex_type() {
		return index_type;
	}
	public void setIndex_type(String index_type) {
		this.index_type = index_type;
	}
	public String getIndex_title() {
		return index_title;
	}
	public void setIndex_title(String index_title) {
		this.index_title = index_title;
	}
	public String getIndex_content() {
		return index_content;
	}
	public void setIndex_content(String index_content) {
		this.index_content = index_content;
	}
	public Date getIndex_uptime() {
		return index_uptime;
	}
	public void setIndex_uptime(Date index_uptime) {
		this.index_uptime = index_uptime;
	}
	@Override
	public String toString() {
		return "IndexModel [index_id=" + index_id + ", index_type=" + index_type + ", index_title=" + index_title
				+ ", index_content=" + index_content + ", index_uptime=" + index_uptime + "]";
	}
	
}
