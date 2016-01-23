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
	private String index_state;//文章状态
	private String index_label;//文章标签
	private String index_from;//文章来源
	private String index_href;//文章来源链接
	private boolean index_isindex;//是否在首页
	private int index_hitsnum;//点击量
	
	private String index_uptime_format;//格式化后的时间
	
	public String getIndex_from() {
		return index_from;
	}
	public void setIndex_from(String index_from) {
		this.index_from = index_from;
	}
	public String getIndex_href() {
		return index_href;
	}
	public void setIndex_href(String index_href) {
		this.index_href = index_href;
	}
	public String getIndex_label() {
		return index_label;
	}
	public void setIndex_label(String index_label) {
		this.index_label = index_label;
	}
	public int getIndex_hitsnum() {
		return index_hitsnum;
	}
	public void setIndex_hitsnum(int index_hitsnum) {
		this.index_hitsnum = index_hitsnum;
	}
	public boolean isIndex_isindex() {
		return index_isindex;
	}
	public void setIndex_isindex(boolean index_isindex) {
		this.index_isindex = index_isindex;
	}
	public String getIndex_state() {
		return index_state;
	}
	public void setIndex_state(String index_state) {
		this.index_state = index_state;
	}
	public String getIndex_uptime_format() {
		return index_uptime_format;
	}
	public void setIndex_uptime_format(String index_uptime_format) {
		this.index_uptime_format = index_uptime_format;
	}
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
				+ ", index_content=" + index_content + ", index_uptime=" + index_uptime + ", upfrom=" + upfrom
				+ ", index_state=" + index_state + ", index_uptime_format=" + index_uptime_format + "]";
	}
	
}
