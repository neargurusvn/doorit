package com.doorit.spring.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.apache.velocity.app.VelocityEngine;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.scheduling.annotation.Async;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.doorit.spring.model.ProsProfile;
import com.doorit.spring.model.User;
import com.doorit.spring.model.UserProsProfile;
import com.doorit.spring.model.WrapQuotesMail;
import com.doorit.spring.model.WrapRequestService;

public class EmailNotificationServiceImpl implements EmailNotificationService {

	
	private static final Logger logger = LoggerFactory.getLogger(EmailNotificationServiceImpl.class);
	
	@Autowired
	//private ConfigurationService configService;	
    private JavaMailSender mailSender;
    private VelocityEngine velocityEngine;
    
    private  ProsService prosService;
    
    
    
	public JavaMailSender getMailSender() {
		return mailSender;
	}



	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}



	public VelocityEngine getVelocityEngine() {
		return velocityEngine;
	}



	public void setVelocityEngine(VelocityEngine velocityEngine) {
		this.velocityEngine = velocityEngine;
	}


	@Async
	public void mailToUser(final User user) {
		//System.out.println(" I Will be formatting html mail and sending it  ");
	
		logger.info("mail to be sent to user for new user    -"+"method name - mailToUser  "+this.getClass().getSimpleName());
		
		try {
			//System.out.println("I am sleeping ................");
			Thread.sleep(10000);
			
			//System.out.println("I wack up ................");
	      MimeMessagePreparator preparator = new MimeMessagePreparator() {
		        @SuppressWarnings({ "rawtypes", "unchecked" })
				public void prepare(MimeMessage mimeMessage) throws Exception {
		        	
		             MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
		             message.setTo(user.getEmailId());
		            // message.setBcc("kumar.anil.patel@gmail.com");
		            // message.setFrom(new InternetAddress(suggestedPodcast.getEmailId()) );
		             message.setFrom("Nearguru.com <info@nearguru.com>");
		             message.setSubject(user.getName()+", welcome to www.nearguru.com");
		             message.setSentDate(new Date());
		             Map model = new HashMap();	             
		             model.put("user", user);
		             
		             String text = VelocityEngineUtils.mergeTemplateIntoString(
		                velocityEngine, "com/doorit/spring/velocity/mailToUser.vm", "UTF-8", model);
		             message.setText(text, true);
		             
		          }
		       };
		       mailSender.send(preparator);	
		   	logger.info("mail  sent to user for new user    -"+"method name - mailToUser  "+this.getClass().getSimpleName());
		}catch(Exception e){
			
			e.printStackTrace();
		  	logger.info("mail  sent to user for has  error    -"+"method name - mailToUser  "+this.getClass().getSimpleName()+"   -"+e.toString());
			}
	}


	@Async
	public void mailToUserRequest(final WrapRequestService wrapRequestService) {
		//System.out.println(">>>>>>>>>>>>>in site mailToUserRequest"+wrapRequestService.getUser().getEmailId());
		
		try{
			
			/*if(wrapRequestService.getUser().isEnabled())*/
			{
			
				logger.info("mail to be  sent to user for new service request     -"+"method name - mailToUserRequest  "+this.getClass().getSimpleName());
				Thread.sleep(10000);
				
				//System.out.println("I wack up ................");
			    MimeMessagePreparator preparator = new MimeMessagePreparator() {
				
		        @SuppressWarnings({ "rawtypes", "unchecked" })
				public void prepare(MimeMessage mimeMessage) throws Exception {
		             MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
		             message.setTo(wrapRequestService.getUser().getEmailId());
		            // message.setBcc("kumar.anil.patel@gmail.com");
		            // message.setFrom(new InternetAddress(suggestedPodcast.getEmailId()) );
		             message.setFrom("Nearguru.com <info@nearguru.com>" );
		             message.setSubject(wrapRequestService.getUser().getName()+" you have raised a "+wrapRequestService.getProduct().getProductName()+" request");
		             message.setSentDate(new Date());
		             Map model = new HashMap();	             
		             model.put("wrapRequestService", wrapRequestService);
		             
		             
		             String text = VelocityEngineUtils.mergeTemplateIntoString(
		                velocityEngine, "com/doorit/spring/velocity/mailToUserRequest.vm", "UTF-8", model);
		             message.setText(text, true);
		          }
		       };
		       mailSender.send(preparator);
		     	logger.info("mail  sent to user for new service request     -"+"method name - mailToUserRequest  "+this.getClass().getSimpleName());
		       
		       /* send mail to pros for this user service */
		       mailToProsForRequest( wrapRequestService);
			}
		  	
		
		}catch(Exception e){
			e.printStackTrace();
		  	logger.info("mail  sent to user for new service request  has error    -"+"method name - mailToUserRequest  "+this.getClass().getSimpleName()+"   -"+e.toString());
		}
	}


    @Async
	public void mailToPros(final UserProsProfile userProsProfile) {
		//System.out.println(">>>>>>>>>>>>>pros profile");
		try{
			
			/*if(userProsProfile.getUser().isEnabled())*/{
				
				logger.info("mail to be  sent to pros for  new service request     -"+"method name - mailToPros  "+this.getClass().getSimpleName());
			  	
				Thread.sleep(10000);
			MimeMessagePreparator preparator = new MimeMessagePreparator() {
		        @SuppressWarnings({ "rawtypes", "unchecked" })
				public void prepare(MimeMessage mimeMessage) throws Exception {
		             MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
		             message.setTo(userProsProfile.getUser().getEmailId());
		            // message.setBcc("kumar.anil.patel@gmail.com");
		            // message.setFrom(new InternetAddress(suggestedPodcast.getEmailId()) );
		             message.setFrom("Nearguru.com <info@nearguru.com>");
		             message.setSubject(userProsProfile.getUser().getName()+", welcome to www.nearguru.com");
		             message.setSentDate(new Date());
		             Map model = new HashMap();	             
		             model.put("userProsProfile", userProsProfile);
		             
		             String text = VelocityEngineUtils.mergeTemplateIntoString(
		                velocityEngine, "com/doorit/spring/velocity/mailToPros.vm", "UTF-8", model);
		             message.setText(text, true);
		          }
		       };
		       mailSender.send(preparator);
		       
		   	logger.info("mail  sent to pros for  new service request     -"+"method name - mailToPros  "+this.getClass().getSimpleName());
			}
		  	
		}catch(Exception e){
			e.printStackTrace();
			logger.info("mail to be  sent to pros for  new service request  has error    -"+"method name - mailToPros  "+this.getClass().getSimpleName()+"    -"+e.toString());
		}
		
		
	}
    @Async
	public void mailQuotes(final WrapQuotesMail wrapQuotesMail) {
		//System.out.println(">>>>>>>>>>>>>pros profile");
    	
    	if(wrapQuotesMail.isEnabled()){
    		
    		try{ 
    			
    			logger.info("mail to be  sent to user for  new quote     -"+"method name - mailQuotes  "+this.getClass().getSimpleName());
    		MimeMessagePreparator preparator = new MimeMessagePreparator() {
    	        @SuppressWarnings({ "rawtypes", "unchecked" })
    			public void prepare(MimeMessage mimeMessage) throws Exception {
    	             MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
    	             message.setTo(wrapQuotesMail.getProsEmail());
    	            // message.setBcc("divyanayanawasthi@gmail.com");
    	            // message.setFrom(new InternetAddress(suggestedPodcast.getEmailId()) );
    	             message.setFrom("Nearguru.com <info@nearguru.com>");
    	             message.setSubject(wrapQuotesMail.getCustName()+","+wrapQuotesMail.getProsName()+" is ready to work on your "+wrapQuotesMail.getProductName()+" need");
    	             message.setSentDate(new Date());
    	             Map model = new HashMap();	             
    	             model.put("wrapQuotesMail", wrapQuotesMail);
    	             
    	             String text = VelocityEngineUtils.mergeTemplateIntoString(
    	                velocityEngine, "com/doorit/spring/velocity/mailToQuotes.vm", "UTF-8", model);
    	             message.setText(text, true);
    	          }
    	       };
    	       mailSender.send(preparator);
    	   	logger.info("mail   sent to user for  new quote     -"+"method name - mailQuotes  "+this.getClass().getSimpleName());
    		}catch(Exception e){
    			
    			e.printStackTrace();
    			logger.info("mail to be  sent to user for  new quote has error     -"+"method name - mailQuotes  "+this.getClass().getSimpleName()+"   -"+e.toString());
    		
    		}
    		
    	}
	
		
		
	}

    @Async
	public void mailToProsForRequest(final WrapRequestService wrapQuotesMail) {
		//System.out.println(">>>>>>>>>>>>>pros profile email" + wrapQuotesMail.getRequestService().getProdcutId());
		
		//List<User> user = this.prosService.getProsEmailIds(1);
		
		
    	logger.info("mail to be  sent to pros for   new service request      -"+"method name - mailToProsForRequest  "+this.getClass().getSimpleName());
		for(final User list : wrapQuotesMail.getListProsForMail()){
		
				if(list.isEnabled()){
				
					try{
						//wrapQuotesMail.setProUser(list);
						MimeMessagePreparator preparator = new MimeMessagePreparator() {
					        @SuppressWarnings({ "rawtypes", "unchecked" })
							public void prepare(MimeMessage mimeMessage) throws Exception {
					             MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
					           //  message.setTo("rewa.anil@gmail.com");
					            message.setTo(list.getEmailId());
					          //   message.setBcc("divyanayanawasthi@gmail.com");  
					             
					            // message.setFrom(new InternetAddress(suggestedPodcast.getEmailId()) );
					             message.setFrom("Nearguru.com <info@nearguru.com>");
					             message.setSubject(wrapQuotesMail.getUser().getName()+" is looking  for "+wrapQuotesMail.getProduct().getProductName()+" professional like you");
					             message.setSentDate(new Date());
					             Map model = new HashMap();	  
					             wrapQuotesMail.setProUser(list);
					             model.put("wrapRequestService", wrapQuotesMail);
					             model.put("professionalName", list.getName());
					             String text = VelocityEngineUtils.mergeTemplateIntoString(
					                velocityEngine, "com/doorit/spring/velocity/mailToProForUserRequest.vm", "UTF-8", model);
					             message.setText(text, true);
					          }
					       };
					       mailSender.send(preparator);
					   	logger.info("mail   sent to pro for   new service request      -"+"method name - mailToProsForRequest  "+this.getClass().getSimpleName());
					 
						}catch(Exception e){
							e.printStackTrace();
							logger.info("mail to be  sent to pros for   new service request has error      -"+"method name - mailToProsForRequest  "+this.getClass().getSimpleName()+"    -"+e.toString());	
						
						}
				
				}
			
			}
		
		
		/* get the listed pros for the service based on locality and send the mail to them */
		
		
		
		
	}


	@Async
	@Override
	public void mailToprosawarded(final WrapRequestService wrapRequestService,
			final ProsProfile vendorObj) {
		
		if(vendorObj.getUser().isEnabled()){
		
			try {
				logger.info("mail to be  sent to pro for  project being awarded      -"+"method name - mailToprosawarded  "+this.getClass().getSimpleName());
						Thread.sleep(10000);
						
						
				      MimeMessagePreparator preparator = new MimeMessagePreparator() {
					        @SuppressWarnings({ "rawtypes", "unchecked" })
							public void prepare(MimeMessage mimeMessage) throws Exception {
					        	
					             MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
					             message.setTo(wrapRequestService.getUser().getEmailId());
					            // message.setBcc("divyanayanawasthi@gmail.com");
					            // message.setFrom(new InternetAddress(suggestedPodcast.getEmailId()) );
					             message.setFrom("Nearguru.com <info@nearguru.com>");
					             message.setSubject("Congratulations "+ vendorObj.getCompanyName()+","+wrapRequestService.getProduct().getProductName()+" assignment has been awarded to you by "+wrapRequestService.getUser().getName());
					             message.setSentDate(new Date());
					             Map model = new HashMap();	   
					             wrapRequestService.setProUser(vendorObj.getUser());
					             model.put("wrapRequestService", wrapRequestService);
					             model.put("vendorObj", vendorObj);
					             
					             String text = VelocityEngineUtils.mergeTemplateIntoString(
					                velocityEngine, "com/doorit/spring/velocity/mailToProsAward.vm", "UTF-8", model);
					             message.setText(text, true);
					             
					          }
					       };
					       mailSender.send(preparator);	
					       logger.info("mail sent to pro for  project being awarded      -"+"method name - mailToprosawarded  "+this.getClass().getSimpleName());
					}catch(Exception e){
						
						e.printStackTrace();
						   logger.info("mail sent to pro for  project being awarded  has error    -"+"method name - mailToprosawarded  "+this.getClass().getSimpleName()+"   -"+e.toString());
					}
			
		}

		
		
	}


	@Async
	@Override
	public void mailforForgotPassword(final User userObj) {
		
		if(userObj.isEnabled()){
			
			try {
				
				Thread.sleep(10000);
				
				   logger.info("mail to be sent for forgot password     -"+"method name - mailforForgotPassword  "+this.getClass().getSimpleName());
		      MimeMessagePreparator preparator = new MimeMessagePreparator() {
			        @SuppressWarnings({ "rawtypes", "unchecked" })
					public void prepare(MimeMessage mimeMessage) throws Exception {
			        	
			             MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
			             message.setTo(userObj.getEmailId());
			            // message.setBcc("divyanayanawasthi@gmail.com");
			            // message.setFrom(new InternetAddress(suggestedPodcast.getEmailId()) );
			             message.setFrom("Nearguru.com <info@nearguru.com>");
			             message.setSubject(userObj.getName()+" your login credentials for www.nearguru.com");
			             message.setSentDate(new Date());
			             Map model = new HashMap();	             
			             model.put("user", userObj);
			           
			             
			             String text = VelocityEngineUtils.mergeTemplateIntoString(
			                velocityEngine, "com/doorit/spring/velocity/mailforForgotPassword.vm", "UTF-8", model);
			             message.setText(text, true);
			             
			          }
			       };
			       mailSender.send(preparator);	
			       logger.info("mail  sent for forgot password     -"+"method name - mailforForgotPassword  "+this.getClass().getSimpleName());
			}catch(Exception e){
				
				e.printStackTrace();
				  logger.info("mail to be sent for forgot password  has error   -"+"method name - mailforForgotPassword  "+this.getClass().getSimpleName()+"   -"+e.toString());
			}
		}
		

		
		
	}


	@Async
	@Override
	public void mailToProsForUpdateRequestStatus(
			final WrapRequestService wrapRequestService) {
		

		
		  logger.info("mail to be sent for pros for updated status of service request      -"+"method name - mailToProsForUpdateRequestStatus  "+this.getClass().getSimpleName());
for(final User list : wrapRequestService.getListProsForMail()){
		
			if(list.isEnabled()){
				
				try{
					MimeMessagePreparator preparator = new MimeMessagePreparator() {
				        @SuppressWarnings({ "rawtypes", "unchecked" })
						public void prepare(MimeMessage mimeMessage) throws Exception {
				             MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
				           //  message.setTo("rewa.anil@gmail.com");
				            message.setTo(list.getEmailId());
				             //message.setBcc("divyanayanawasthi@gmail.com");
				             
				            // message.setFrom(new InternetAddress(suggestedPodcast.getEmailId()) );
				             message.setFrom("Nearguru.com <info@nearguru.com>");
				             message.setSubject(wrapRequestService.getUser().getName()+" has closed his "+wrapRequestService.getProduct().getProductName()+" request");
				             message.setSentDate(new Date());
				             Map model = new HashMap();	     
				             wrapRequestService.setProUser(list);
				             model.put("wrapRequestService", wrapRequestService);
				             model.put("professionalName", list.getName());
				             String text = VelocityEngineUtils.mergeTemplateIntoString(
				                velocityEngine, "com/doorit/spring/velocity/mailforUpdateRequestStatus.vm", "UTF-8", model);
				             message.setText(text, true);
				          }
				       };
				       mailSender.send(preparator);
				       logger.info("mail  sent for pros for updated status of service request      -"+"method name - mailToProsForUpdateRequestStatus  "+this.getClass().getSimpleName());
					}catch(Exception e){
						
						   logger.info("mail  sent for pros for updated status of service request  has error     -"+"method name - mailToProsForUpdateRequestStatus  "+this.getClass().getSimpleName()+"   -"+e.toString());
						e.printStackTrace();
						
					} 
				
			}
			
			
		}
		
	}



	
	@Async
	@Override
	public void mailToProsForVerify(final WrapRequestService wrapRequestService) {

		logger.info("mail to be sent to Pros after its verification    -"
				+ "method name - mailToProsForVerify  "
				+ this.getClass().getSimpleName());

		try {
			// System.out.println("I am sleeping ................");
			Thread.sleep(10000);

			// System.out.println("I wack up ................");
			MimeMessagePreparator preparator = new MimeMessagePreparator() {
				@SuppressWarnings({ "rawtypes", "unchecked" })
				public void prepare(MimeMessage mimeMessage) throws Exception {

					MimeMessageHelper message = new MimeMessageHelper(
							mimeMessage);
					message.setTo(wrapRequestService.getProUser().getEmailId());

					message.setFrom("Nearguru.com <info@nearguru.com>");
					message.setSubject("Congratulations ,"
							+ wrapRequestService.getProUser().getName()
							+ "Your verification is Successful");
					message.setSentDate(new Date());
					Map model = new HashMap();
					model.put("wrapRequestService", wrapRequestService);

					String text = VelocityEngineUtils
							.mergeTemplateIntoString(
									velocityEngine,
									"com/doorit/spring/velocity/mailToProsForVerify.vm",
									"UTF-8", model);
					message.setText(text, true);

				}
			};
			mailSender.send(preparator);
			logger.info("mail  sent to user for new user    -"
					+ "method name - mailToUser  "
					+ this.getClass().getSimpleName());
		} catch (Exception e) {

			e.printStackTrace();
			logger.info("mail  sent to user for has  error    -"
					+ "method name - mailToUser  "
					+ this.getClass().getSimpleName() + "   -" + e.toString());
		}

	}
	


	
	
//getters and setters omitted for brevity
	
}