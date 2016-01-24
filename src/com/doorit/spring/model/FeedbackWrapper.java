package com.doorit.spring.model;

public class FeedbackWrapper {
	
	private  Feedback feedback;
	
	private long feedbackRating;
	

	private User user;

	private String fedbackWrittenDate;
	public String getFedbackWrittenDate() {
		return fedbackWrittenDate;
	}

	public void setFedbackWrittenDate(String fedbackWrittenDate) {
		this.fedbackWrittenDate = fedbackWrittenDate;
	}

	public Feedback getFeedback() {
		return feedback;
	}

	public void setFeedback(Feedback feedback) {
		this.feedback = feedback;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public long getFeedbackRating() {
		return feedbackRating;
	}

	public void setFeedbackRating(long feedbackRating) {
		this.feedbackRating = feedbackRating;
	}
	
}
