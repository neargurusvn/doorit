package com.doorit.spring.util;

import java.io.DataOutputStream;
import java.net.URL;

import org.apache.log4j.Logger;

import com.doorit.spring.Controller.CustomerController;

import sun.net.www.protocol.http.HttpURLConnection;

public class UtilityClass {
	
	private Logger logger = Logger.getLogger(UtilityClass.class);
	public  int  sendMessage(String url){
		
		int responseCode =0;
		try{		
			String messageUrl=null;
			messageUrl=url;
			final String USER_AGENT = "Mozilla/5.0";			
			URL obj = new URL(messageUrl);
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();
			//add reuqest header
			con.setRequestMethod("POST");
			con.setRequestProperty("User-Agent", USER_AGENT);
			con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
			// Send post request
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			//wr.writeBytes(urlParameters);
			wr.flush();
			wr.close();
			responseCode = con.getResponseCode();
					
		}
		catch(Exception ex){
			
			logger.info("sendMessage called"+this.getClass().getSimpleName());
		}
		
		return responseCode;
			}

	public String encodeCharacters(String message){
		
		String blankSpace=" ";
		String backslashSmybol="/";
		String atRateSmybol="@";
		String ColonSymbol=":";
		String commaSymbol=",";
		String percentSymbol="%";
		String andSymbol="&";
		boolean retval = message.contains(blankSpace);
		if(retval){
			
			message=message.replaceAll(blankSpace,"+");
		}
		 retval = message.contains(atRateSmybol);
		if(retval){
			
			message=message.replaceAll(atRateSmybol,"%40");
		}
		//replace / with http charcter encoding
		retval=message.contains(backslashSmybol);
		if(retval){
			message=message.replaceAll(backslashSmybol,"%2F");
		}
		//replace : with http character encoding
		retval=message.contains(ColonSymbol);
		if(retval){
			message=message.replaceAll(ColonSymbol,"%3A");
		}
		retval=message.contains(commaSymbol);
		if(retval){
			message=message.replaceAll(commaSymbol,"%2C");
		}
		retval=message.contains(percentSymbol);
		if(retval){
			message=message.replaceAll(percentSymbol,"%25");
		}
		retval=message.contains(andSymbol);
		if(retval){
			message=message.replaceAll(andSymbol,"%26");
		}
		
		return message;
	}
}
