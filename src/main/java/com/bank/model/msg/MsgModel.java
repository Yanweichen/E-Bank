package com.bank.model.msg;

import java.text.ParseException;
import java.util.Date;

import com.bank.utils.TimeUtil;

public class MsgModel {
    private Integer msgId;

    private String msgTitle;

    private Integer msgType;

    private Integer msgUserId;

    private Boolean msgState;

    private String msgContent;
    
    private Date msgTime;
    
    private String msgTime_fmt;
    
    public String getMsgTime_fmt() throws ParseException {
    	msgTime_fmt = TimeUtil.Date2String(msgTime, "yyyy-MM-dd HH:mm:ss");
		return msgTime_fmt;
	}

	public void setMsgTime_fmt(String msgTime_fmt) {
		this.msgTime_fmt = msgTime_fmt;
	}

	public Date getMsgTime() {
		return msgTime;
	}

	public void setMsgTime(Date msgTime) {
		this.msgTime = msgTime;
	}

	public Integer getMsgId() {
        return msgId;
    }

    public void setMsgId(Integer msgId) {
        this.msgId = msgId;
    }

    public String getMsgTitle() {
        return msgTitle;
    }

    public void setMsgTitle(String msgTitle) {
        this.msgTitle = msgTitle == null ? null : msgTitle.trim();
    }

    public Integer getMsgType() {
        return msgType;
    }

    public void setMsgType(Integer msgType) {
        this.msgType = msgType;
    }

    public Integer getMsgUserId() {
        return msgUserId;
    }

    public void setMsgUserId(Integer msgUserId) {
        this.msgUserId = msgUserId;
    }

    public Boolean getMsgState() {
        return msgState;
    }

    public void setMsgState(Boolean msgState) {
        this.msgState = msgState;
    }

    public String getMsgContent() {
        return msgContent;
    }

    public void setMsgContent(String msgContent) {
        this.msgContent = msgContent == null ? null : msgContent.trim();
    }
}