package com.doorit.spring.model;

public class UserProsProfile {

	private User user ;
	
	private ProsProfile profile;
	
	private Product product;
	
	private String productGroupId;
	private ProductGroup productGroup;
	//private Location userLocation;
	
	private Notification notification;

	public User getUser() {
		return user;
	}
	
		
	public Notification getNotification() {
		return notification;
	}

	public void setNotification(Notification notification) {
		this.notification = notification;
	}


	public Product getProduct() {
		return product;
	}


	public void setProduct(Product product) {
		this.product = product;
	}

	
/*	public Location getUserLocation() {
		return userLocation;
	}


	public void setUserLocation(Location userLocation) {
		this.userLocation = userLocation;
	}
*/

	public void setUser(User user) {
		this.user = user;
	}

	public ProsProfile getProfile() {
		return profile;
	}

	public void setProfile(ProsProfile profile) {
		this.profile = profile;
	}


	public ProductGroup getProductGroup() {
		return productGroup;
	}


	public void setProductGroup(ProductGroup productGroup) {
		this.productGroup = productGroup;
	}


	public String getProductGroupId() {
		return productGroupId;
	}


	public void setProductGroupId(String productGroupId) {
		this.productGroupId = productGroupId;
	}
	
	
	
}
