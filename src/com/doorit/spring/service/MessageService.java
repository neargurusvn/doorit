package com.doorit.spring.service;

import com.doorit.spring.model.User;
import com.doorit.spring.model.WrapQuotesMail;
import com.doorit.spring.model.WrapRequestService;

public interface MessageService {
	
	public void messagetoUserSignUp(final User user);

	void messagetoUserRequest(WrapRequestService wrapRequestService, User user);

	public void sendQuotationMsg(WrapQuotesMail wrapQuotesMail);

	void messagetoVendorSignUp(User user);

}
