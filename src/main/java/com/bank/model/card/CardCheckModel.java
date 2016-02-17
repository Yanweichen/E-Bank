package com.bank.model.card;

import java.util.Date;

public class CardCheckModel {
	
    private Integer cardCheckId;

    private Integer cardCheckUser;

    private Integer cardCheckCardtype;
    
    private Date card_check_time;
    
    public Date getCard_check_time() {
		return card_check_time;
	}

	public void setCard_check_time(Date card_check_time) {
		this.card_check_time = card_check_time;
	}

	public Integer getCardCheckId() {
        return cardCheckId;
    }

    public void setCardCheckId(Integer cardCheckId) {
        this.cardCheckId = cardCheckId;
    }

    public Integer getCardCheckUser() {
        return cardCheckUser;
    }

    public void setCardCheckUser(Integer cardCheckUser) {
        this.cardCheckUser = cardCheckUser;
    }

    public Integer getCardCheckCardtype() {
        return cardCheckCardtype;
    }

    public void setCardCheckCardtype(Integer cardCheckCardtype) {
        this.cardCheckCardtype = cardCheckCardtype;
    }
}