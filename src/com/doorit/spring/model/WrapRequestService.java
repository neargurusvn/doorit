package com.doorit.spring.model;

import java.util.List;

public class WrapRequestService {

	private User user ;
	
	private RequestAnswer requestAnswer;

	private RequestService requestService;
	
	private int feedbackCount;
	
	private Product product;
	
	private int feedbackAvg;
	
	private String serviceRequestedDate;
	
	private Document document;
	
	private List<User> listProsForMail;
	
	private User ProUser;
	
	
	public List<User> getListProsForMail() {
		return listProsForMail;
	}

	public void setListProsForMail(List<User> listProsForMail) {
		this.listProsForMail = listProsForMail;
	}

	public Document getDocument() {
		return document;
	}

	public void setDocument(Document document) {
		this.document = document;
	}

	public String getServiceRequestedDate() {
		return serviceRequestedDate;
	}

	public void setServiceRequestedDate(String serviceRequestedDate) {
		this.serviceRequestedDate = serviceRequestedDate;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getFeedbackAvg() {
		return feedbackAvg;
	}

	public void setFeedbackAvg(int feedbackAvg) {
		this.feedbackAvg = feedbackAvg;
	}

	public int getFeedbackCount() {
		return feedbackCount;
	}

	public void setFeedbackCount(int feedbackCount) {
		this.feedbackCount = feedbackCount;
	}

	private List<String> productsListed;
	public List<String> getProductsListed() {
		return productsListed;
	}

	public void setProductsListed(List<String> productsListed) {
		this.productsListed = productsListed;
	}

	private ProsProfile prosProfile;
	public ProsProfile getProsProfile() {
		return prosProfile;
	}

	public void setProsProfile(ProsProfile prosProfile) {
		this.prosProfile = prosProfile;
	}

	private Quotes quote;
	
	private Integer quoteNumber;
	

	public Integer getQuoteNumber() {
		return quoteNumber;
	}

	public void setQuoteNumber(Integer quoteNumber) {
		this.quoteNumber = quoteNumber;
	}

	public Quotes getQuote() {
		return quote;
	}

	public void setQuote(Quotes quote) {
		this.quote = quote;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public RequestAnswer getRequestAnswer() {
		return requestAnswer;
	}

	public void setRequestAnswer(RequestAnswer requestAnswer) {
		this.requestAnswer = requestAnswer;
	}

	public RequestService getRequestService() {
		return requestService;
	}

	public void setRequestService(RequestService requestService) {
		this.requestService = requestService;
	}

	public User getProUser() {
		return ProUser;
	}

	public void setProUser(User proUser) {
		ProUser = proUser;
	}
	
	

		
	
	
}
