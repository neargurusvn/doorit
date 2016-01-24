package com.doorit.spring.model;

import java.sql.Blob;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name="documents")
public class Document {
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer id;

	@Column(name="name")
	private String name;

	@Column(name="description")
	private String description;

	@Column(name="filename")
	private String filename;

	@Column(name="content")
	@Lob
	private Blob content;
	
	@Column(name="content_type")
	private String contentType;
	
	@Column(name="created")
	private Date created;
	
	public Integer getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getDescription() {
		return description;
	}
	public String getFilename() {
		return filename;
	}
	public Blob getContent() {
		return content;
	}
	public Date getCreated() {
		return created;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public void setContent(Blob content) {
		this.content = content;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public String getContentType() {
		return contentType;
	}
	private long requestId;
	private long prosId;
	//public User getUser() {
	/*	return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public RequestService getRequestService() {
		return requestService;
	}
	public void setRequestService(RequestService requestService) {
		this.requestService = requestService;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}*/
	/*@OneToOne
	@MapsId
	@JoinColumn(name = "pros_id")
	private User user;
	@OneToOne
	@MapsId
	@JoinColumn(name = "request_id")
	private RequestService requestService;*/

	public long getRequestId() {
		return requestId;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public void setRequestId(long requestId) {
		this.requestId = requestId;
	}
	public long getProsId() {
		return prosId;
	}
	public void setProsId(long prosId) {
		this.prosId = prosId;
	}
}
