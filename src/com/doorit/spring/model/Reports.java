package com.doorit.spring.model;

public class Reports {
	
	
	private User user;
	
	
	private Product product;
	
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	private ProsProfile prosProfile;
	
	private String listedin;
	public String getListedin() {
		return listedin;
	}

	public void setListedin(String listedin) {
		this.listedin = listedin;
	}

	private RequestService requestService;

	private String date;
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public ProsProfile getProsProfile() {
		return prosProfile;
	}

	public void setProsProfile(ProsProfile prosProfile) {
		this.prosProfile = prosProfile;
	}

	public RequestService getRequestService() {
		return requestService;
	}

	public void setRequestService(RequestService requestService) {
		this.requestService = requestService;
	}
	
	

}
