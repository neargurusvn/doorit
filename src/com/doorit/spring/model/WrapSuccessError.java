package com.doorit.spring.model;

public class WrapSuccessError {
	
	public boolean suceess=true;
	public String requesttype; 
	public String action; //updated,deleted,saved,insert
	public String cssClass;
	public boolean isSuceess() {
		return suceess;
	}
	public void setSuceess(boolean suceess) {
		this.suceess = suceess;
	}
	
	public String getAction() {
		return action;
	}
	public String getRequesttype() {
		return requesttype;
	}
	public void setRequesttype(String requesttype) {
		this.requesttype = requesttype;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getCssClass() {
		return cssClass;
	}
	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

}
