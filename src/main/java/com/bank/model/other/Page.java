package com.bank.model.other;

public class Page {

	private int start;
	private int max;
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	@Override
	public String toString() {
		return "Page [start=" + start + ", max=" + max + "]";
	}
	
	
}
