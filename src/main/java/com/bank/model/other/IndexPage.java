package com.bank.model.other;

public class IndexPage {

	private int limit;
	private int offset;
	private String order;
	private String sort;
	private String search;
	private String isView;
	private String startTime;
	private String endTime;
	private String timefmt;
	private Integer index_pid;//分类id
	
	public Integer getIndex_pid() {
		return index_pid;
	}
	public void setIndex_pid(Integer index_pid) {
		this.index_pid = index_pid;
	}
	public String getTimefmt() {
		return timefmt;
	}
	public void setTimefmt(String timefmt) {
		this.timefmt = timefmt;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime+" 23:59:59";
	}
	public String getIsView() {
		return isView;
	}
	public void setIsView(String isView) {
		this.isView = isView;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}

}
