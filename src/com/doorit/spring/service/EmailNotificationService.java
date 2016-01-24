package com.doorit.spring.service;

import com.doorit.spring.model.ProsProfile;
import com.doorit.spring.model.User;
import com.doorit.spring.model.UserProsProfile;
import com.doorit.spring.model.WrapQuotesMail;
import com.doorit.spring.model.WrapRequestService;



public interface EmailNotificationService {

	public void mailToUser(final User user);
	public void mailToUserRequest(final WrapRequestService wrapRequestService) ;
	public void mailToPros(final UserProsProfile userProsProfile) ;
	public void mailQuotes(final WrapQuotesMail wrapQuotesMail);
	public void mailToprosawarded(WrapRequestService wrapRequestService,ProsProfile vendorObj);
	public void mailforForgotPassword(User userObj);
	public void mailToProsForUpdateRequestStatus(WrapRequestService wrapRequestService);
	public void mailToProsForVerify(WrapRequestService wrapRequestService);
       
}
