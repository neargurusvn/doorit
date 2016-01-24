/**
 * 
 */
package com.doorit.spring.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Version;

import org.hibernate.annotations.GenericGenerator;

/**
 * @author Anil
 *
 */
@Entity
@Table(name="OPTIONS")
public class Option implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="opt_id")
	@GenericGenerator(name="gen",strategy="increment")
	@GeneratedValue(generator="gen")
	
	private long  optId; // pk 
	
	@Column(name="opt_desc")
	private String optDesc; //
	
	@Column(name="product_id")
	private long productId; // pk
	
		
	public long getProductId() {
		return productId;
	}

	public void setProductId(long productId) {
		this.productId = productId;
	}

	public Option() {
		
	}
	
	@ManyToOne
	@JoinColumn(name="que_id")
	private Question question;
	
	@Version
	@Column(name = "version")
	private Date version;
	
	

	public Date getVersion() {
		return version;
	}

	public void setVersion(Date version) {
		this.version = version;
	}

	public long getOptId() {
		return optId;
	}

	public void setOptId(long optId) {
		this.optId = optId;
	}

	public String getOptDesc() {
		return optDesc;
	}

	public void setOptDesc(String optDesc) {
		this.optDesc = optDesc;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

		

}
