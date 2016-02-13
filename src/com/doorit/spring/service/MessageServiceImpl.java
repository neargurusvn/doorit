package com.doorit.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;

import com.doorit.spring.model.User;
import com.doorit.spring.model.WrapQuotesMail;
import com.doorit.spring.model.WrapRequestService;
import com.doorit.spring.util.UtilityClass;

public class MessageServiceImpl implements MessageService {

	
	@Autowired
	private ProsService prosService;
	
	/***********************************copyright@Nearguru************************************************************
	 * method -send message to vendor on sign up
	 * created date - 20nd  Jun 2015
	 * ******************************************************************************************/
	@Async
	@Override
	public void messagetoVendorSignUp(User user) {
		
	UtilityClass utilityClass=new UtilityClass();
	int messageResponseCode=0;
	
	String message="Hi,+Meet+new+customers+.http://nearguru.com/+sends+service+experts+like+you+requests+from+customers.+You+decide+who+to+respond+to+and+send+a+quote";
	message=utilityClass.encodeCharacters(message);
	String url="http://sms99.co.in/pushsms.php?username=trnrguru&password=TY639F&sender=NRGURU&message="
				+ message
				+ "&numbers="+user.getMobile();
	messageResponseCode=utilityClass.sendMessage(url);		
	}
	
	/***********************************copyright@Nearguru************************************************************
	 * method -send message to user on sign up
	 * created date - 20nd  Jun 2015
	 * ******************************************************************************************/
	@Async
	@Override
	public void messagetoUserSignUp(User user) {
		
	UtilityClass utilityClass=new UtilityClass();
	int messageResponseCode=0;
	String message="Hi,+Thanks+for+joining+us.+Save+up+to+30%+off+on+services,+compare+quotes+and+prices+online+and+Hire+the+best+service+provider+near+you+http://nearguru.com/";
	message=utilityClass.encodeCharacters(message);
	String url="http://sms99.co.in/pushsms.php?username=trnrguru&password=TY639F&sender=NRGURU&message="
				+ message
				+ "&numbers="+user.getMobile();
	messageResponseCode=utilityClass.sendMessage(url);		
	}
	
	/***********************************copyright@Nearguru************************************************************
	 * method -send message to user on request generartion and send messages to the corrospding vendors for the request.
	 * created date - 20nd  Jun 2015
	 * ******************************************************************************************/

	@Async
	@Override
	public void messagetoUserRequest(WrapRequestService wrapRequestService,User user) {
		
	//timer laga ke -
	UtilityClass utilityClass=new UtilityClass();
	int messageResponseCode=0;
	String message="Hi+,+you+have+raised+"+wrapRequestService.getProduct().getProductName()+"+request.+,+Relevant+expert+professionals+will+respond+with+their+quotes.+Compare+price,+reviews+&+Hire+the+best+http://nearguru.com/";
	message=utilityClass.encodeCharacters(message);
	String url="http://sms99.co.in/pushsms.php?username=trnrguru&password=TY639F&sender=NRGURU&message="
				+ message
				+ "&numbers="+user.getMobile(); 
	//messageResponseCode=utilityClass.sendMessage(url);	
	//send messages to vendors
	List<User> vendorsList = this.prosService.getProsEmailIds(wrapRequestService.getRequestService().getProdcutId());
	String numberofPros=",";
	for(User vendor:vendorsList){
		numberofPros+=vendor.getMobile()+",";
		}
	
	String messageVendors="Hi,+"+user.getName()+"+is looking for+"
	+wrapRequestService.getProduct().getProductName()+"+professional+like+you+,To+send+quote+login+to+http://nearguru.com/+"+"or+call+us+on+8600991383";
	messageVendors=utilityClass.encodeCharacters(messageVendors);
	String Prourl="http://sms99.co.in/pushsms.php?username=trnrguru&password=TY639F&sender=NRGURU&message="+messageVendors+"&numbers="+numberofPros;
	int responseCode1=utilityClass.sendMessage(Prourl);
	}

	/***********************************copyright@Nearguru************************************************************
	 * method -send message to user on when a vendor sends a quote to him
	 * created date - 21st  Jun 2015
	 * ******************************************************************************************/
	@Override
	public void sendQuotationMsg(WrapQuotesMail wrapQuotesMail) {
		
		UtilityClass utilityClass=new UtilityClass();
		int messageResponseCode=0;
		
		String message="Hi,+"+wrapQuotesMail.getProsName()+"+has+sent+you+a+custom+quote+for+your+"+wrapQuotesMail.getProductName()+"+need+.+Log+in+to+http://nearguru.com/+to+compare+the+prices";
		message=utilityClass.encodeCharacters(message);
		String url="http://sms99.co.in/pushsms.php?username=trnrguru&password=TY639F&sender=NRGURU&message="
					+ message
					+ "&numbers="+wrapQuotesMail.getUser().getMobile();
		messageResponseCode=utilityClass.sendMessage(url);	
		
	}

}
