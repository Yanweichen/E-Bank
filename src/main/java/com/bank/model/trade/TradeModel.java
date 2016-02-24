package com.bank.model.trade;

import java.util.Date;

public class TradeModel {
    private Integer id;

    private String tradeNumber;

    private Integer tradeTypeId;

    private Integer tradeUserId;

    private Integer tradeOtherUserId;
    private String tradeOhterName;

    private Integer tradeState;
    

    private Date tradeTime;

    private String tradeInfo;
    
    private double tradeIncomeMoney;
    private String tradeIncomeMoneystr;
    private double tradeExpendMoney;
    private String tradeExpendMoneystr;

    private String tradeUserCard;
    private String tradeOtherCard;
    
    private String tradeType;
    private String tradeTypeImage;
    
    private String tradeTimefmt;
    
	public String getTradeIncomeMoneystr() {
		return tradeIncomeMoneystr;
	}

	public void setTradeIncomeMoneystr(String tradeIncomeMoneystr) {
		this.tradeIncomeMoneystr = tradeIncomeMoneystr;
	}

	public String getTradeExpendMoneystr() {
		return tradeExpendMoneystr;
	}

	public void setTradeExpendMoneystr(String tradeExpendMoneystr) {
		this.tradeExpendMoneystr = tradeExpendMoneystr;
	}

	public String getTradeOhterName() {
		return tradeOhterName;
	}

	public void setTradeOhterName(String tradeOhterName) {
		this.tradeOhterName = tradeOhterName;
	}

	public String getTradeTimefmt() {
		return tradeTimefmt;
	}

	public void setTradeTimefmt(String tradeTimefmt) {
		this.tradeTimefmt = tradeTimefmt;
	}

	public Integer getTradeTypeId() {
		return tradeTypeId;
	}

	public void setTradeTypeId(Integer tradeTypeId) {
		this.tradeTypeId = tradeTypeId;
	}

	public String getTradeType() {
		return tradeType;
	}

	public void setTradeType(String tradeType) {
		this.tradeType = tradeType;
	}

	public String getTradeTypeImage() {
		return tradeTypeImage;
	}

	public void setTradeTypeImage(String tradeTypeImage) {
		this.tradeTypeImage = tradeTypeImage;
	}

	public String getTradeUserCard() {
		return tradeUserCard;
	}

	public void setTradeUserCard(String tradeUserCard) {
		this.tradeUserCard = tradeUserCard;
	}

	public String getTradeOtherCard() {
		return tradeOtherCard;
	}

	public void setTradeOtherCard(String tradeOtherCard) {
		this.tradeOtherCard = tradeOtherCard;
	}

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