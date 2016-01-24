package com.doorit.spring.model;

import java.io.Serializable;
import java.sql.Blob;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Version;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="QUOTES")
public class Quotes implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="quote_id")
	@GenericGenerator(name="gen",strategy="increment")
	@GeneratedValue(generator="gen")
	
	private long quoteId;
	
	@Column(name="amount", length = 50)
	private long amount;
	
	@Column(name="message", length = 4000)
	private String message;
	
	private String file ;
	
	private String fileName;
		
	
	@Column(name="pros_id", length = 100)
	private long prosId;
	
	@Column(name="request_id", length = 100)
	private long requestId;
	
	@Column(name="status", length = 100)
	private String status;//in progress,hired,rejected,closed
	
	@Version
	@Column(name = "version")
	private Date version;
	
	@Column(name="is_active")
	String isActive;
	
	@Column(name="approver_Id")
	private long approverId; //	// active  - Y , N
	
	@Column(name="approver_comments")
	private long approverComments; 
	
	@Column(name="quoteFile")
	@Lob
	private Blob quoteFile;
	
	
	public String getIsActive() {
		return isActive;
	}

	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}

	public long getApproverId() {
		return approverId;
	}

	public void setApproverId(long approverId) {
		this.approverId = approverId;
	}

	public long getApproverComments() {
		return approverComments;
	}

	public void setApproverComments(long approverComments) {
		this.approverComments = approverComments;
	}

	public Date getVersion() {
		return version;
	}

	public void setVersion(Date version) {
		this.version = version;
	}

	public Quotes() {
		
	}

	public long getQuoteId() {
		return quoteId;
	}

	public void setQuoteId(long quoteId) {
		this.quoteId = quoteId;
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

	public long getProsId() {
		return prosId;
	}

	public void setProsId(long prosId) {
		this.prosId = prosId;
	}

	public long getRequestId() {
		return requestId;
	}

	public void setRequestId(long requestId) {
		this.requestId = requestId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
	
	
	// pros id fk 
	
	// request id 
	
	// quotes status // viwed , Awarded 
	  

}
