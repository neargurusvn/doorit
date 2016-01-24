/**
 * 
 */
package com.doorit.spring.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Version;
import org.hibernate.annotations.Parameter;


import org.hibernate.annotations.GenericGenerator;

/**
 * @author Anil
 *
 */
@Entity
@Table(name = "REQUESTANSWER")
public class RequestAnswer implements java.io.Serializable {
	
	private static final long serialVersionUID = 1L;
	
	public RequestAnswer(){
		
	}
	
	//@Id
	//@Column(name="request_id")
	//@GenericGenerator(name="gen",strategy="increment")
	//@GeneratedValue(generator="gen")
	/*
	@Id
    @Column(name="txn_id", unique=true, nullable=false)
    @GeneratedValue(generator="gen")
    @GenericGenerator(name="gen", strategy="foreign", parameters={@Parameter(name="property", value="txn")})
    private long id;
    */
	
	@Id
    @Column(name="request_id", unique=true, nullable=false)
    @GeneratedValue(generator="gen")
    @GenericGenerator(name="gen", strategy="foreign", parameters=@Parameter(name="property", value="requestService"))
	private long requestId;

	
	
	//private long requestId; // pk
	
	@Column(name="product_name", length = 2000)
	private String  product_name;
		
	@Version
	@Column(name = "version")
	private Date version;
	
	
	@Column(name="question1", length = 2000)
	private String  question1;
	
	@Column(name="answer1", length = 2000)
	private String  answer1;
	
	@Column(name="question2", length = 2000)
	private String  question2;
	
	@Column(name="answer2", length = 2000)
	private String  answer2;
	
	@Column(name="question3", length = 2000)
	private String  question3;
	
	@Column(name="answer3", length = 2000)
	private String  answer3;
	
	@Column(name="question4", length = 2000)
	private String  question4;
	
	@Column(name="answer4", length = 2000)
	private String  answer4;
	
	@Column(name="question5", length = 2000)
	private String  question5;
	
	@Column(name="answer5", length = 2000)
	private String  answer5;
	
	@Column(name="question6", length = 2000)
	private String  question6;
	
	@Column(name="answer6", length = 2000)
	private String  answer6;
	
	@Column(name="question7", length = 2000)
	private String  question7;
	
	@Column(name="answer7", length = 2000)
	private String  answer7;
	
	@Column(name="question8", length = 2000)
	private String  question8;
	
	@Column(name="answer8", length = 2000)
	private String  answer8;
	
	@Column(name="question9", length = 2000)
	private String  question9;
	
	@Column(name="answer9", length = 2000)
	private String  answer9;
	
	@Column(name="question10", length = 2000)
	private String  question10;
	
	@Column(name="answer10", length = 2000)
	private String  answer10;
	
	@Column(name="question11", length = 2000)
	private String  question11;
	
	@Column(name="answer11", length = 2000)
	private String  answer11;
	
	@Column(name="question12", length = 2000)
	private String  question12;
	
	@Column(name="answer12", length = 2000)
	private String  answer12;
	
	@Column(name="question13", length = 2000)
	private String  question13;
	
	@Column(name="answer13", length = 2000)
	private String  answer13;
	
	@Column(name="question14", length = 2000)
	private String  question14;
	
	@Column(name="answer14", length = 2000)
	private String  answer14;
	
	@Column(name="question15", length = 2000)
	private String  question15;
	
	@Column(name="answer15", length = 2000)
	private String  answer15;
	
	@Column(name="question16", length = 2000)
	private String  question16;
	
	@Column(name="answer16", length = 2000)
	private String  answer16;
	
	@Column(name="question17", length = 2000)
	private String  question17;
	
	@Column(name="answer17", length = 2000)
	private String  answer17;
	
	@Column(name="question18", length = 2000)
	private String  question18;
	
	@Column(name="answer18", length = 2000)
	private String  answer18;
	
	@Column(name="question19", length = 2000)
	private String  question19;
	
	@Column(name="answer19", length = 2000)
	private String  answer19;
	
	@Column(name="question20", length = 2000)
	private String  question20;
	
	@Column(name="answer20", length = 2000)
	private String  answer20;
	
		
	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public Date getVersion() {
		return version;
	}

	public void setVersion(Date version) {
		this.version = version;
	}

	public String getAnswer10() {
		return answer10;
	}

	public void setAnswer10(String answer10) {
		this.answer10 = answer10;
	}

	public String getQuestion3() {
		return question3;
	}

	public void setQuestion3(String question3) {
		this.question3 = question3;
	}

	public String getAnswer3() {
		return answer3;
	}

	public void setAnswer3(String answer3) {
		this.answer3 = answer3;
	}

	public String getQuestion4() {
		return question4;
	}

	public void setQuestion4(String question4) {
		this.question4 = question4;
	}

	public String getAnswer4() {
		return answer4;
	}

	public void setAnswer4(String answer4) {
		this.answer4 = answer4;
	}

	public String getQuestion5() {
		return question5;
	}

	public void setQuestion5(String question5) {
		this.question5 = question5;
	}

	public String getAnswer5() {
		return answer5;
	}

	public void setAnswer5(String answer5) {
		this.answer5 = answer5;
	}

	public String getQuestion6() {
		return question6;
	}

	public void setQuestion6(String question6) {
		this.question6 = question6;
	}

	public String getAnswer6() {
		return answer6;
	}

	public void setAnswer6(String answer6) {
		this.answer6 = answer6;
	}

	public String getQuestion7() {
		return question7;
	}

	public void setQuestion7(String question7) {
		this.question7 = question7;
	}

	public String getAnswer7() {
		return answer7;
	}

	public void setAnswer7(String answer7) {
		this.answer7 = answer7;
	}

	public String getQuestion8() {
		return question8;
	}

	public void setQuestion8(String question8) {
		this.question8 = question8;
	}

	public String getAnswer8() {
		return answer8;
	}

	public void setAnswer8(String answer8) {
		this.answer8 = answer8;
	}

	public String getQuestion9() {
		return question9;
	}

	public void setQuestion9(String question9) {
		this.question9 = question9;
	}

	public String getAnswer9() {
		return answer9;
	}

	public void setAnswer9(String answer9) {
		this.answer9 = answer9;
	}

	public String getQuestion10() {
		return question10;
	}

	public void setQuestion10(String question10) {
		this.question10 = question10;
	}

	@OneToOne
	@PrimaryKeyJoinColumn
	private RequestService requestService;
	
		
	public RequestService getRequestService() {
		return requestService;
	}
	
	public void setRequestService(RequestService requestService) {
		this.requestService = requestService;
	}
	
	public long getRequestId() {
		return requestId;
	}
	public void setRequestId(long requestId) {
		this.requestId = requestId;
	}
	
	public String getQuestion1() {
		return question1;
	}
	public void setQuestion1(String question1) {
		this.question1 = question1;
	}
	public String getAnswer1() {
		return answer1;
	}
	public void setAnswer1(String answer1) {
		this.answer1 = answer1;
	}
	public String getQuestion2() {
		return question2;
	}
	public void setQuestion2(String question2) {
		this.question2 = question2;
	}
	public String getAnswer2() {
		return answer2;
	}
	public void setAnswer2(String answer2) {
		this.answer2 = answer2;
	}

	public String getQuestion11() {
		return question11;
	}

	public void setQuestion11(String question11) {
		this.question11 = question11;
	}

	public String getAnswer11() {
		return answer11;
	}

	public void setAnswer11(String answer11) {
		this.answer11 = answer11;
	}

	public String getQuestion12() {
		return question12;
	}

	public void setQuestion12(String question12) {
		this.question12 = question12;
	}

	public String getAnswer12() {
		return answer12;
	}

	public void setAnswer12(String answer12) {
		this.answer12 = answer12;
	}

	public String getQuestion13() {
		return question13;
	}

	public void setQuestion13(String question13) {
		this.question13 = question13;
	}

	public String getAnswer13() {
		return answer13;
	}

	public void setAnswer13(String answer13) {
		this.answer13 = answer13;
	}

	public String getQuestion14() {
		return question14;
	}

	public void setQuestion14(String question14) {
		this.question14 = question14;
	}

	public String getAnswer14() {
		return answer14;
	}

	public void setAnswer14(String answer14) {
		this.answer14 = answer14;
	}

	public String getQuestion15() {
		return question15;
	}

	public void setQuestion15(String question15) {
		this.question15 = question15;
	}

	public String getAnswer15() {
		return answer15;
	}

	public void setAnswer15(String answer15) {
		this.answer15 = answer15;
	}

	public String getQuestion16() {
		return question16;
	}

	public void setQuestion16(String question16) {
		this.question16 = question16;
	}

	public String getAnswer16() {
		return answer16;
	}

	public void setAnswer16(String answer16) {
		this.answer16 = answer16;
	}

	public String getQuestion17() {
		return question17;
	}

	public void setQuestion17(String question17) {
		this.question17 = question17;
	}

	public String getAnswer17() {
		return answer17;
	}

	public void setAnswer17(String answer17) {
		this.answer17 = answer17;
	}

	public String getQuestion18() {
		return question18;
	}

	public void setQuestion18(String question18) {
		this.question18 = question18;
	}

	public String getAnswer18() {
		return answer18;
	}

	public void setAnswer18(String answer18) {
		this.answer18 = answer18;
	}

	public String getQuestion19() {
		return question19;
	}

	public void setQuestion19(String question19) {
		this.question19 = question19;
	}

	public String getAnswer19() {
		return answer19;
	}

	public void setAnswer19(String answer19) {
		this.answer19 = answer19;
	}

	public String getQuestion20() {
		return question20;
	}

	public void setQuestion20(String question20) {
		this.question20 = question20;
	}

	public String getAnswer20() {
		return answer20;
	}

	public void setAnswer20(String answer20) {
		this.answer20 = answer20;
	}
	
	
			
}
