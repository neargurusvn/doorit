/**
 * 
 */
package com.doorit.spring.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
import javax.persistence.Version;

import org.hibernate.annotations.GenericGenerator;


/**
 *  Request service bean will hold the reference of user id , pros id , request form etc .
 * @author Anil
 *
 */
@Entity
@Table(name ="REQUESTSERVIC")
public class RequestService implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
/*
	@Id
	@Column(name="request_id")
	@GenericGenerator(name="gen",strategy="increment")
	@GeneratedValue(generator="gen")
	*/
	 @Id
	 @Column(name="request_id")
	 @GeneratedValue(generator="table",strategy=GenerationType.TABLE)
	 @TableGenerator(name="table", table="sequences",
	 pkColumnName="SEQ_NAME", // Specify the name of the column of the primary key
	 valueColumnName="SEQ_NUMBER", // Specify the name of the column that stores the last value generated
	 pkColumnValue="request_id", // Specify the primary key column value that would be considered as a primary key generator
	 initialValue=100,allocationSize=1)
	 private long requestId; // request_id 
	
	@Column(name="user_id", length = 100)
	private long UserId; // fk from user
	
	@Column(name="request_status", length = 100)
	private String status; // open for bid  , work in progress , closed 
	
	@Column(name="pros_id", length = 100)
	private long prosId; // pros id .
	
	@Column(name="product_id", length = 100)
	private long prodcutId ; // fk from product 
	
	@Version
	@Column(name = "version")
	private Date version;
	
	@Column(name="is_active")
	String isActive;
	
	@Column(name="approver_Id")
	private long approverId; //	// active  - Y , N
	
	@Column(name="approver_comments")
	private long approverComments; //	// active  - Y , N
	
	
	private String requestExpire ; // 10 day 
	
	private Integer maxNoQuotes ; // 5 or 10
	
	private String address;

	private String formatted_address;
	//private String street_number;
	private String locality;
	private String sublocality;
	private String postal_code;
	

	public String getIsNumberVisible() {
		return isNumberVisible;
	}

	public void setIsNumberVisible(String isNumberVisible) {
		this.isNumberVisible = isNumberVisible;
	}

	private String country;
	private String State;
	private String lat ;
	private String lng ;
	private String statusReason;
	
	private String isNumberVisible="false";
	public String getStatusReason() {
		return statusReason;
	}

	public void setStatusReason(String statusReason) {
		this.statusReason = statusReason;
	}

	public String getState() {
		return State;
	}

	public void setState(String state) {
		State = state;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRequestExpire() {
		return requestExpire;
	}

	public void setRequestExpire(String requestExpire) {
		this.requestExpire = requestExpire;
	}

	public Integer getMaxNoQuotes() {
		return maxNoQuotes;
	}

	public void setMaxNoQuotes(Integer maxNoQuotes) {
		this.maxNoQuotes = maxNoQuotes;
	}

	public String getFormatted_address() {
		return formatted_address;
	}

	public void setFormatted_address(String formatted_address) {
		this.formatted_address = formatted_address;
	}

	public String getLocality() {
		return locality;
	}

	public void setLocality(String locality) {
		this.locality = locality;
	}

	public String getSublocality() {
		return sublocality;
	}

	public void setSublocality(String sublocality) {
		this.sublocality = sublocality;
	}

	public String getPostal_code() {
		return postal_code;
	}

	public void setPostal_code(String postal_code) {
		this.postal_code = postal_code;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	
	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

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

	public RequestService() {
		
	}
	
    @OneToOne(fetch = FetchType.LAZY, mappedBy = "requestService", cascade = CascadeType.ALL)
	//@PrimaryKeyJoinColumn
	private RequestAnswer requestAnswer;
	  
	public RequestAnswer getRequestAnswer() {
		return requestAnswer;
	}

	public void setRequestAnswer(RequestAnswer requestAnswer) {
		this.requestAnswer = requestAnswer;
	}

	public long getRequestId() {
		return requestId;
	}

	public void setRequestId(long requestId) {
		this.requestId = requestId;
	}

	public long getUserId() {
		return UserId;
	}

	public void setUserId(long userId) {
		UserId = userId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public long getProsId() {
		return prosId;
	}

	public void setProsId(long prosId) {
		this.prosId = prosId;
	}

	public long getProdcutId() {
		return prodcutId;
	}

	public void setProdcutId(long prodcutId) {
		this.prodcutId = prodcutId;
	}
	
	

		
}
