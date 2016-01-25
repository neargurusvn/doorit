package com.doorit.spring.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Version;

import org.hibernate.annotations.GenericGenerator;

/**
 * @param args
 * This class will hold the all product provided by door it .
 * @author Anil Patel
 * 08/11/2014
 */

@Entity
@Table(name = "PRODUCT")
public class Product implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="product_id")
	@GenericGenerator(name="gen",strategy="increment")
	@GeneratedValue(generator="gen")
	private long productId; // pk
	
	//@JsonView
	@Column(name="product_name", length = 1000)
	String productName;
	
	
	@Column(name="product_desc")
	String productDesc;
	
	@Column(name="created_By")
	String createdBy;
	
	@Column(name="approved_By")
	String approvedBy;
	
	@Column(name="approver_comments")
	private long approverComments; 
	
	@Column(name="is_active")                      //Set to nothing(Default) (sushant)
	String isActive;
	
	
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

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	
	public String getIsActive() {
		return isActive;
	}

	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}

	public Date getVersion() {
		return version;
	}

	public void setVersion(Date version) {
		this.version = version;
	}

	@Version
	@Column(name = "version")
	private Date version;
	
	
	@OneToMany(mappedBy = "product" , cascade=CascadeType.ALL )
	private List<Question> question;
	
	
		
	public List<Question> getQuestion() {
		return question;
	}

	public void setQuestion(List<Question> question) {
		this.question = question;
	}

	public Product() {
		// TODO Auto-generated constructor stub
	}
	
	@ManyToOne
	@JoinColumn(name = "productGroup_id")
	private ProductGroup productGroup;
	
		
	public ProductGroup getProductGroup() {
		return productGroup;
	}

	public void setProductGroup(ProductGroup productGroup) {
		this.productGroup = productGroup;
	}

	public long getProductId() {
		return productId;
	}

	public void setProductId(long productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}


	
	
}
