package com.bank.model.card;

public class CardModel {

	private int card_id;
	private String card_name;
	private String card_location;
	private String card_currency;
	private String card_face;
	private String card_info;
	
	public int getCard_id() {
		return card_id;
	}
	public void setCard_id(int card_id) {
		this.card_id = card_id;
	}
	public String getCard_name() {
		return card_name;
	}
	public void setCard_name(String card_name) {
		this.card_name = card_name;
	}
	public String getCard_location() {
		return card_location;
	}
	public void setCard_location(String card_location) {
		this.card_location = card_location;
	}
	public String getCard_currency() {
		return card_currency;
	}
	public void setCard_currency(String card_currency) {
		this.card_currency = card_currency;
	}
	public String getCard_face() {
		return card_face;
	}
	public void setCard_face(String card_face) {
		this.card_face = card_face;
	}
	public String getCard_info() {
		return card_info;
	}
	public void setCard_info(String card_info) {
		this.card_info = card_info;
	}
	@Override
	public String toString() {
		return "CardModel [card_id=" + card_id + ", card_name=" + card_name + ", card_location=" + card_location
				+ ", card_currency=" + card_currency + ", card_face=" + card_face + ", card_info=" + card_info + "]";
	}
	
}
