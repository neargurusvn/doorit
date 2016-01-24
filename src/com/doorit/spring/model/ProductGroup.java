package com.doorit.spring.model;

import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Version;

import org.hibernate.annotations.GenericGenerator;

//import org.codehaus.jackson.annotate.JsonIgnore;

/**
 * This domain will hold the  super set  of the services 
 * and will refer to product bean . 
 * @author Anil
 * 15-12-2014 
 *
 */
@Entity
@Table(name = "PRODUCTGROUP")
public class ProductGroup implements java.io.Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="productGroup_id")
	@GenericGenerator(name="gen",strategy="increment")
	@GeneratedValue(generator="gen")
	
	private long productGroupId; // pk
	
	@Column(name="productGroup_name", length = 1000)
	String productGroupName;
	
	
	@Column(name="productGroup_desc")
	String productGroupDesc;
	
	@Version
	@Column(name = "version")
	private Date version;
	
	@Column(name="created_By")
	String createdBy;
	
	@Column(name="approved_By")
	String approvedBy;
	
	@Column(name="approver_comments")
	private long approverComments; 
		
	
	@Column(name="Is_active")
	String isActive="Y";
    
	
	
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

	@OneToMany(mappedBy = "productGroup", cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private List<Product> product;

	public ProductGroup() {
		//super();
		// TODO Auto-generated constructor stub
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

	public String getProductGroupDesc() {
		return productGroupDesc;
	}

	public void setProductGroupDesc(String productGroupDesc) {
		this.productGroupDesc = productGroupDesc;
	}

	public List<Product> getProduct() {
		return product;
	}

	public void setProduct(List<Product> product) {
		this.product = product;
	}
	
	

}
