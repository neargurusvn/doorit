
package com.doorit.spring.model;

import java.io.Serializable;
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
 * @author Anil
 *
 */
@Entity
@Table(name="QUESTION")
public class Question implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="que_id")
	@GenericGenerator(name="gen",strategy="increment")
	@GeneratedValue(generator="gen")
	
	private long queId; // pk 
	
	@Column(name = "que_desc", length=2000)
	String queDesc;
	
	@Column(name = "que_type" , length=100)
	String queType; // check box , drop down 
	
	@Column(name = "name_class" , length=50)
	String name_class; ////invalidcheckbox,invalidcheckbox1,invalidcheckbox2,invalidcheckbox3,invalidcheckbox4,invalidcheckbox5
	
	@Column(name = "class_type" , length=50)
	String classType; // check box , drop down 
public String getClassType() {
		return classType;
	}

	public void setClassType(String classType) {
		this.classType = classType;
	}

public String getName_class() {
		return name_class;
	}

	public void setName_class(String name_class) {
		this.name_class = name_class;
	}

public String getQueReq() {
		return queReq;
	}

	public void setQueReq(String queReq) {
		this.queReq = queReq;
	}

	@Column(name="max_length")
	private int maxLen;
	
public int getMaxLen() {
		return maxLen;
	}

	public void setMaxLen(int maxLen) {
		this.maxLen = maxLen;
	}

@Column(name="que_Req",length=20)
String queReq;
	
	@Version
	@Column(name = "version")
	private Date version;
	
	
		
	public Question() {
		
	}
	
	@ManyToOne
	@JoinColumn(name = "product_id")
	private Product product;

	public Date getVersion() {
		return version;
	}

	public void setVersion(Date version) {
		this.version = version;
	}

	public List<Option> getOption() {
		return option;
	}

	public void setOption(List<Option> option) {
		this.option = option;
	}

	@OneToMany(mappedBy = "question" , cascade = CascadeType.ALL)
	private List<Option> option;
	
	public long getQueId() {
		return queId;
	}

	public void setQueId(long queId) {
		this.queId = queId;
	}

	public String getQueDesc() {
		return queDesc;
	}

	public void setQueDesc(String queDesc) {
		this.queDesc = queDesc;
	}

	public String getQueType() {
		return queType;
	}

	public void setQueType(String queType) {
		this.queType = queType;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
		
}
