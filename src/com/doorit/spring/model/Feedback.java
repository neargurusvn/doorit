package com.doorit.spring.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Version;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "FEEDBACK")
public class Feedback implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="feedback_id")
	@GenericGenerator(name="gen",strategy="increment")
	@GeneratedValue(generator="gen")
	
	private long feedbackId;
	
	@Column(name="user_id", length = 100)
	private long userId;
	
	@Column(name="rating", length = 10)
	private long rating;
	
	@Column(name="review", length = 4000)
	private String review;
	
	@Column(name="request_id", length = 100)
	private long requestId;
	
	@Column(name="pros_id", length = 100)
	private long prosId;
	
	@Version
	@Column(name = "version")
	private Date version;
	
	public Date getVersion() {
		return version;
	}

	
	public String getApprovedBy() {
		return approvedBy;
	}


	public void setApprovedBy(String approvedBy) {
		this.approvedBy = approvedBy;
	}


	public long getApproverComments() {
		return approverComments;
	}


	public void setApproverComments(long approverComments) {
		this.approverComments = approverComments;
	}


	public void setVersion(Date version) {
		this.version = version;
	}

	public long getProsId() {
		return prosId;
	}

	public void setProsId(long prosId) {
		this.prosId = prosId;
	}
	
	@Column(name="is_active")
	String isActive;
	
	@Column(name="approved_By")
	String approvedBy;
	
	@Column(name="approver_comments")
	private long approverComments; 
	

	public String getIsActive() {
		return isActive;
	}

	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}

	public Feedback() {
		
	}

	public long getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(long feedbackId) {
		this.feedbackId = feedbackId;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	
	public long getRating() {
		return rating;
	}

	public void setRating(long rating) {
		this.rating = rating;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public long getRequestId() {
		return requestId;
	}

	public void setRequestId(long requestId) {
		this.requestId = requestId;
	}

		
	
	
			
}
