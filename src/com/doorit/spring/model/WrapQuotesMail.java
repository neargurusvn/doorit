package com.doorit.spring.model;

public class WrapQuotesMail {
	
	private String prosEmail;
	
	private boolean enabled;
	

	private String prosName;
	
	private String custEmail;
	
	private String custName;
	
	private String requestId;
	
	private String productDesc;
	
	private long amount;
	
	private User user;
	
	private User ProUser;
	
	private String message;
	
	private String productName;
	
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProsName() {
		return prosName;
	}

	public void setProsName(String prosName) {
		this.prosName = prosName;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public WrapQuotesMail() {
		// TODO Auto-generated constructor stub
	}

	public String getProsEmail() {
		return prosEmail;
	}

	public void setProsEmail(String prosEmail) {
		this.prosEmail = prosEmail;
	}

	public String getCustEmail() {
		return custEmail;
	}

	public void setCustEmail(String custEmail) {
		this.custEmail = custEmail;
	}

	public String getRequestId() {
		return requestId;
	}

	public void setRequestId(String requestId) {
		this.requestId = requestId;
	}

	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	public long getAmount() {
		return amount;
	}

	public void setAmount(long amount) {
		this.amount = amount;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public User getProUser() {
		return ProUser;
	}

	public void setProUser(User proUser) {
		ProUser = proUser;
	}

}
