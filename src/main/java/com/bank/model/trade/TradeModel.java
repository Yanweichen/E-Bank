package com.bank.model.trade;

import java.util.Date;

public class TradeModel {
    private Integer id;

    private String tradeNumber;

    private Integer tradeType;

    private Integer tradeUserId;

    private Integer tradeOtherUserId;

    private Integer tradeState;

    private Date tradeTime;

    private String tradeInfo;
    
    private double tradeIncomeMoney;
    private double tradeExpendMoney;

    public double getTradeIncomeMoney() {
		return tradeIncomeMoney;
	}

	public void setTradeIncomeMoney(double tradeIncomeMoney) {
		this.tradeIncomeMoney = tradeIncomeMoney;
	}

	public double getTradeExpendMoney() {
		return tradeExpendMoney;
	}

	public void setTradeExpendMoney(double tradeExpendMoney) {
		this.tradeExpendMoney = tradeExpendMoney;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTradeNumber() {
        return tradeNumber;
    }

    public void setTradeNumber(String tradeNumber) {
        this.tradeNumber = tradeNumber == null ? null : tradeNumber.trim();
    }

    public Integer getTradeType() {
        return tradeType;
    }

    public void setTradeType(Integer tradeType) {
        this.tradeType = tradeType;
    }

    public Integer getTradeUserId() {
        return tradeUserId;
    }

    public void setTradeUserId(Integer tradeUserId) {
        this.tradeUserId = tradeUserId;
    }

    public Integer getTradeOtherUserId() {
        return tradeOtherUserId;
    }

    public void setTradeOtherUserId(Integer tradeOtherUserId) {
        this.tradeOtherUserId = tradeOtherUserId;
    }

    public Integer getTradeState() {
        return tradeState;
    }

    public void setTradeState(Integer tradeState) {
        this.tradeState = tradeState;
    }

    public Date getTradeTime() {
        return tradeTime;
    }

    public void setTradeTime(Date tradeTime) {
        this.tradeTime = tradeTime;
    }

    public String getTradeInfo() {
        return tradeInfo;
    }

    public void setTradeInfo(String tradeInfo) {
        this.tradeInfo = tradeInfo == null ? null : tradeInfo.trim();
    }
}