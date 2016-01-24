package com.doorit.spring.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Version;

import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name = "NOTIFICATION")
public class Notification implements Serializable {
	
	public Notification(){
		
	}
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="notification_id")
	@GenericGenerator(name="gen",strategy="increment")
	@GeneratedValue(generator="gen")
	
	private long notificationId; 
	
	
	@OneToOne
	@MapsId
	@JoinColumn(name = "user_id")
	private User user;
	
	@Column(name="email", length = 10) 
	private boolean email =true;
	
	@Column(name="sms", length = 10)
	private boolean sms = true;
	
	@Column(name="news_letter", length = 10)
	private boolean newsLetter = true;
	
	@Column(name="daily_summary", length = 10)
	private boolean dailySummary = true;
	
	@Column(name="job_mails", length = 10)
	private boolean jobMails =true;
	
	private boolean others = true;
	
	private boolean others1 = true;
	
	@Version
	@Column(name = "version")
	private Date version;

		
	public long getNotificationId() {
		return notificationId;
	}

	public void setNotificationId(long notificationId) {
		this.notificationId = notificationId;
	}

	

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	
	
	

	
	public boolean isEmail() {
		return email;
	}

	public void setEmail(boolean email) {
		this.email = email;
	}

	public boolean isSms() {
		return sms;
	}

	public void setSms(boolean sms) {
		this.sms = sms;
	}

	public boolean isNewsLetter() {
		return newsLetter;
	}

	public void setNewsLetter(boolean newsLetter) {
		this.newsLetter = newsLetter;
	}

	public boolean isDailySummary() {
		return dailySummary;
	}

	public void setDailySummary(boolean dailySummary) {
		this.dailySummary = dailySummary;
	}

	public boolean isJobMails() {
		return jobMails;
	}

	public void setJobMails(boolean jobMails) {
		this.jobMails = jobMails;
	}

	public boolean isOthers() {
		return others;
	}

	public void setOthers(boolean others) {
		this.others = others;
	}

	public boolean isOthers1() {
		return others1;
	}

	public void setOthers1(boolean others1) {
		this.others1 = others1;
	}

	public Date getVersion() {
		return version;
	}

	public void setVersion(Date version) {
		this.version = version;
	}
		
	
}
