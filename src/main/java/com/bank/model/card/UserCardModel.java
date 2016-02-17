package com.bank.model.card;

import java.util.Date;

public class UserCardModel {
    private Integer userCardId;

    private String userCardNum;

    private double userCardBalance;

    private Integer userCardState;

    private Integer userCardUserId;

    private Integer userCardType;
    
    private Date user_card_opentime;
    private String user_card_opentime_fmt;
    
    public Date getUser_card_opentime() {
		return user_card_opentime;
	}

	public void setUser_card_opentime(Date user_card_opentime) {
		this.user_card_opentime = user_card_opentime;
	}

	public String getUser_card_opentime_fmt() {
		return user_card_opentime_fmt;
	}

	public void setUser_card_opentime_fmt(String user_card_opentime_fmt) {
		this.user_card_opentime_fmt = user_card_opentime_fmt;
	}

	public Integer getUserCardId() {
        return userCardId;
    }

    public void setUserCardId(Integer userCardId) {
        this.userCardId = userCardId;
    }

    public String getUserCardNum() {
        return userCardNum;
    }

    public void setUserCardNum(String userCardNum) {
        this.userCardNum = userCardNum == null ? null : userCardNum.trim();
    }

    public double getUserCardBalance() {
		return userCardBalance;
	}

	public void setUserCardBalance(double userCardBalance) {
		this.userCardBalance = userCardBalance;
	}

	public Integer getUserCardState() {
        return userCardState;
    }

    public void setUserCardState(Integer userCardState) {
        this.userCardState = userCardState;
    }

    public Integer getUserCardUserId() {
        return userCardUserId;
    }

    public void setUserCardUserId(Integer userCardUserId) {
        this.userCardUserId = userCardUserId;
    }

    public Integer getUserCardType() {
        return userCardType;
    }

    public void setUserCardType(Integer userCardType) {
        this.userCardType = userCardType;
    }
}