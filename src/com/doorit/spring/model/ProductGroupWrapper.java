package com.doorit.spring.model;

public class ProductGroupWrapper {
	
	public long productGroupId;
	
	public String productGroupName;
	
	public String isActive;
	
	

	public  boolean listed;

	public boolean isListed() {
		return listed;
	}

	public void setListed(boolean listed) {
		this.listed = listed;
	}

	public long getProductGroupId() {
		return productGroupId;
	}

	public void setProductGroupId(long productGroupId) {
		this.productGroupId = productGroupId;
	}

	public String getProductGroupName() {
		return productGroupName;
	}

	public void setProductGroupName(String productGroupName) {
		this.productGroupName = productGroupName;
	}

	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}

	public String getIsActive() {
		return isActive;
	}

	
	
	

}
