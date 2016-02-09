package com.doorit.spring.Controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.doorit.spring.model.Document;
import com.doorit.spring.model.Feedback;
import com.doorit.spring.model.FeedbackWrapper;
import com.doorit.spring.model.NavigationWrapper;
import com.doorit.spring.model.Notification;
import com.doorit.spring.model.Product;
import com.doorit.spring.model.ProductGroup;
import com.doorit.spring.model.ProductGroupWrapper;
import com.doorit.spring.model.ProsProfile;
import com.doorit.spring.model.Quotes;
import com.doorit.spring.model.RequestService;
import com.doorit.spring.model.User;
import com.doorit.spring.model.UserProsProfile;
import com.doorit.spring.model.WrapQuotesMail;
import com.doorit.spring.model.WrapRequestService;
import com.doorit.spring.model.WrapSuccessError;
import com.doorit.spring.service.AdminService;
import com.doorit.spring.service.CustomerService;
import com.doorit.spring.service.CustomerServiceImpl;
import com.doorit.spring.service.DocumentService;
import com.doorit.spring.service.EmailNotificationService;
import com.doorit.spring.service.MessageService;
import com.doorit.spring.service.ProsService;
//import org.eclipse.jdt.internal.compiler.ast.ThisReference;
//import com.doorit.spring.model.FeedbackWrapper;
import com.doorit.spring.util.UtilityClass;

@Controller
//@RequestMapping(value="/user")
//@PreAuthorize("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
public class ProsController {
	
	private Logger logger = Logger.getLogger(ProsController.class);
	
	@Autowired
	private EmailNotificationService mainMailService;
	
	@Autowired
	private DocumentService documentService;
	
	@Autowired
	private MessageService messageService;
	
	private ProsService prosService;
	private CustomerService customerService; 
	private AdminService adminService;
	
	@Autowired
	private  WrapSuccessError WrapSuccessError;
	
	@Autowired
	private  NavigationWrapper navigationWrapper;
		
	@Autowired(required=true)
	@Qualifier(value="prosService")
	public void setProsService(ProsService prosService) {
		this.prosService = prosService;
	}
	
	@Autowired(required=true)
	@Qualifier(value="customerService")
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
	
	
	@Autowired(required=true)
	@Qualifier(value="adminService")
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	/**
	 * @param model
	 * @param session
	 * @param proId
	 * @param requestId
	 * @return
	 */
	
		@RequestMapping(value="/prosReviews/{proId}/{requestId}", method = RequestMethod.GET)
		public String getProReviews(Model model,HttpSession session,@PathVariable("proId") long proId,@PathVariable("requestId") String requestId){
			
	logger.info("pro reviews called   -"+"method name - getProReviews  "+this.getClass().getSimpleName());
		List<FeedbackWrapper> feedbackList=	this.prosService.getFeedback(proId);
		User user = new User();
		if (session.getAttribute("user") != null)
		{
			user =  (User) session.getAttribute("user");
			model.addAttribute("user",user);
		}
		WrapRequestService wrapRequestService=new WrapRequestService();  
		wrapRequestService.setProsProfile(this.prosService.getVendorProfile((int) proId));
		wrapRequestService.setUser(this.customerService.getUserById(proId));
		model.addAttribute("wrapRequestService", wrapRequestService);
		if(feedbackList!=null){
			
			model.addAttribute("feedbackAvg", this.prosService.getFeedbackAvg(proId));
			model.addAttribute("feedbackNumber", this.prosService.getFeedbackNumber(proId));
			model.addAttribute("feedbackList", feedbackList);
			model.addAttribute("requestId", requestId);
			}
			return "proReviews";
		}
		
		/*
		 * This method is use for place bid
		 * 
		 */
	@RequestMapping(value= "/placeBid", method = RequestMethod.POST)
	public String addBids(@ModelAttribute("quotes") Quotes quotes , HttpSession session,@RequestParam("file") MultipartFile file){
		
		
		logger.info("place a bid on request called   -"+"method name - addBids  "+this.getClass().getSimpleName());
		if (session.getAttribute("user") != null)
		{
			Document document=new Document();
			User user =  (User) session.getAttribute("user");
			quotes.setProsId(user.getUserId());
			quotes.setStatus("IP"); //
			//System.out.println("File:" + file.getName());
			//System.out.println("ContentType:" + file.getContentType());
			//System.out.println("pros id"+quotes.getRequestId()+user.getUserId());
			document.setProsId(user.getUserId());
			document.setRequestId(quotes.getRequestId());
			//System.out.println("file name>>>>>"+file.getName());
			if(file.getSize()!=0){
			documentService.save(file,document);
			}
			this.prosService.placeBid(quotes);
			/* mail servie */
			
			// need requested user email and name 
			
			// need request id + product name 
			
			// fetch user id form request id 
			
			RequestService requestService = this.customerService.getRequestServiceById(quotes.getRequestId());
			Product product=this.customerService.getProductById(requestService.getProdcutId());
			if(requestService.getUserId()!=0){
				User cust = this.customerService.getUserById(requestService.getUserId());
				WrapQuotesMail wrapQuotesMail = new WrapQuotesMail();
				wrapQuotesMail.setProsEmail(cust.getEmailId()); // email
				wrapQuotesMail.setCustName(cust.getName()); // name
				wrapQuotesMail.setAmount(quotes.getAmount()); // quote amt
				wrapQuotesMail.setMessage(quotes.getMessage()); // message
				wrapQuotesMail.setProsName(user.getName());
				wrapQuotesMail.setProductName(product.getProductName());
				wrapQuotesMail.setProductDesc(product.getProductDesc());
				wrapQuotesMail.setEnabled(cust.isEnabled());
				wrapQuotesMail.setUser(cust);
				mainMailService.mailQuotes(wrapQuotesMail);
				messageService.sendQuotationMsg(wrapQuotesMail);
				
			}
			
			// fetch cust/user from user id;
			
			
			/* mail to pros */
			
			
		
		}
		
		
		
		return "redirect:/manageRequestsVendor";
		
	}
	
	@RequestMapping(value = "/bidService", method = { RequestMethod.GET, RequestMethod.POST })
	public String bidService(Model model ,@ModelAttribute("document") Document document, @ModelAttribute("wrapRequestService") WrapRequestService wrapRequestService,HttpSession session) {
		
		logger.info("user can bid service  now   -"+"method name - bidService  "+this.getClass().getSimpleName());
		
		model.addAttribute("quotes", new Quotes());
	
		model.addAttribute("document", new Document());
		
		User user = new User();
		if (session.getAttribute("user") != null)
		{
			user =  (User) session.getAttribute("user");
			model.addAttribute("user",user);
		}
		model.addAttribute("requestAnswer", this.prosService.getAnswerById(wrapRequestService.getRequestAnswer().getRequestId()));
		List<WrapRequestService> leads= this.prosService.fetchProsDashboard(user);
		model.addAttribute("LeadsNo", leads.size());
		RequestService requestService=this.customerService.getRequestServiceById(wrapRequestService.getRequestAnswer().getRequestId());
		Product product=this.adminService.getProductById(requestService.getProdcutId());
		model.addAttribute("product", product);
		model.addAttribute("serviceReqeustedUser", this.customerService.getServiceUser(requestService.getRequestId()));
		model.addAttribute("requestService", requestService);
		
		return "bidService";
	}
	
	//@RequestMapping(value="/viewRequest/{requestId}",method=RequestMethod.GET)
	//public String viewRequest(Model model,HttpSession session,@PathVariable("requestId") long requestId){
	
	
	@RequestMapping(value = "/viewBidService/{quoteId}", method = RequestMethod.GET)
	public String viewBidService(Model model , @PathVariable("quoteId") long quoteId,HttpSession session,HttpServletResponse response) {
		
		logger.info("view  bids on service  called  -"+"method name - viewBidService  "+this.getClass().getSimpleName());
		User user = new User();
		if (session.getAttribute("user") != null)
		{
			user =  (User) session.getAttribute("user");
			model.addAttribute("user",user);
		}
		Quotes quotes = this.prosService.getQuoteById(quoteId);
		model.addAttribute("quotes", quotes);
		model.addAttribute("serviceUser",this.customerService.getServiceUser(quotes.getRequestId()));
		//model.addAttribute("requestAnswer", this.prosService.getAnswerById(wrapRequestService.getRequestAnswer().getRequestId()));
		RequestService requestService=this.customerService.getRequestServiceById(quotes.getRequestId());
		model.addAttribute("requestService",requestService);
		model.addAttribute("requestAnswer", this.prosService.getAnswerById(quotes.getRequestId()));
		
		//System.out.println(">>>>>>>>>>>>>>>>>>>"+quoteId);
		
		Document doc = documentService.getQuoteFile(quotes.getProsId(),requestService.getRequestId());
		
		model.addAttribute("doc", doc);
		try{
			
			List<WrapRequestService> leads= this.prosService.fetchProsDashboard(user);
			model.addAttribute("LeadsNo", leads.size());
		}
		catch(Exception ex){
			
			//model.addAttribute("LeadsNo", 0);
			//System.out.println(ex.toString());
		}
		return "viewBidService";
	}
	
	@RequestMapping(value = "/prosDashboard", method = RequestMethod.GET)
	public String manageRequest(Model model,HttpSession session) {
		
		logger.info("leads of vendors will be displayed   -"+"method name - manageRequest  "+this.getClass().getSimpleName());
		model.addAttribute("wrapRequestService", new WrapRequestService());
		
		User user = new User();
		
		if (session.getAttribute("user") != null  )
		{
			user =  (User) session.getAttribute("user");
			model.addAttribute("user",user);
		}
		List<WrapRequestService> leads= this.prosService.fetchProsDashboard(user);
		model.addAttribute("userRequests", leads);
		
		model.addAttribute("LeadsNo", leads.size());
	
		
		
		model.addAttribute("proActionLead", "Leads");  
		model.addAttribute("proActionQuote", "");
		model.addAttribute("proActionManageRequest", "");
		
		return "prosDashboard";
	}
	
	@RequestMapping(value="/manageRequestsVendor",method=RequestMethod.GET)
	public String manageRequestsVendors(Model model,HttpSession session){
		
		logger.info("manageRequestsVendor called  -"+"method name - manageRequestsVendor  "+this.getClass().getSimpleName());
		String requestType="IP";
		User user = new User();
		if (session.getAttribute("user") != null)
		{
			user =  (User) session.getAttribute("user");
			model.addAttribute("logeduser",user);
		}
		
		model.addAttribute("user", user);
		model.addAttribute("vendorRequests", this.prosService.manageRequests(user,requestType));
		model.addAttribute("proActionLead", "");  
		model.addAttribute("proActionQuote", "Quotes");
		List<WrapRequestService> leads= this.prosService.fetchProsDashboard(user);
		model.addAttribute("LeadsNo", leads.size());
		model.addAttribute("proActionManageRequest", "");
		
		
	
		model.addAttribute("QuoteInProgressNo",this.prosService.getQuotesNoforPros("IP",user));
		model.addAttribute("QuoteWIPNo",this.prosService.getQuotesNoforPros("WIP",user));
		model.addAttribute("requestType",requestType);
		return "ManageRequestsVendor";
	}
	@RequestMapping(value="/manageRequestsVendors/{requestStatus}",method=RequestMethod.GET)
	public String manageRequestsVendorsStatus(Model model,HttpSession session,@PathVariable("requestStatus") String  requestType){
		
		logger.info("manageRequestsVendor called  -"+"method name - manageRequestsVendorsStatus  "+this.getClass().getSimpleName());
		User user = new User();
		if (session.getAttribute("user") != null)
		{
			user =  (User) session.getAttribute("user");
			model.addAttribute("logeduser",user);
		}
		List<WrapRequestService> leads= this.prosService.fetchProsDashboard(user);
		model.addAttribute("user", user);
		model.addAttribute("vendorRequests", this.prosService.manageRequests(user,requestType));
		model.addAttribute("proActionLead", "");  
		model.addAttribute("proActionQuote", "Quotes");
		model.addAttribute("proActionManageRequest", "");
		model.addAttribute("LeadsNo", leads.size());
		model.addAttribute("requestType",requestType);
		model.addAttribute("QuoteInProgressNo",this.prosService.getQuotesNoforPros("IP",user));
		model.addAttribute("QuoteWIPNo",this.prosService.getQuotesNoforPros("WIP",user));
		return "ManageRequestsVendor";
	}
	@RequestMapping(value = "/vendorProfile/{prosId}/{serviceRequestId}", method = RequestMethod.GET)
	public String vendorProfile(Model model,@PathVariable("prosId") int prosId,HttpSession session,@PathVariable("serviceRequestId") long serviceRequestId) {
		
		
		logger.info("vendorProfile called  -"+"method name - vendorProfile  "+this.getClass().getSimpleName());
		User user=null;
		if (session.getAttribute("user") != null)
		{
			 user =  (User) session.getAttribute("user");
			
			model.addAttribute("user",user);
		}
	
		//wrapRequestService.getQuote().setProsId(2);
		//System.out.println("Pro id"+prosId);
		model.addAttribute("serviceRequestId",serviceRequestId);
		model.addAttribute("vendorProfile", this.prosService.getVendorProfile(prosId));
		model.addAttribute("products", this.prosService.getProductsListedfor(prosId));
		model.addAttribute("feedbackList", this.prosService.getFeedback(prosId));
		model.addAttribute("proId", prosId);
		int feedbackNumber=this.prosService.getFeedbackNumber(prosId);
				
		int feedbackAvg=this.prosService.getFeedbackAvg(prosId);
		model.addAttribute("feedbackNumber",feedbackNumber);
		model.addAttribute("feedbackAvg",feedbackAvg);
		model.addAttribute("quotesRecived", this.customerService.getQuotesRecived(new Long(serviceRequestId)));
		try{
			
			List<WrapRequestService> leads= this.prosService.fetchProsDashboard(user);
			model.addAttribute("LeadsNo", leads.size());
		}
		catch(Exception ex){
			
			//model.addAttribute("LeadsNo", 0);
			//System.out.println(ex.toString());
		}
		return "VendorProfile";
	}	
	
	@RequestMapping(value = "/viewProfile/{prosId}", method = RequestMethod.GET)
	public String viewProfile(Model model,@PathVariable("prosId") int prosId,HttpSession session) {
	
		logger.info("viewProfile called  -"+"method name - viewProfile  "+this.getClass().getSimpleName());
		User user=null;
		if (session.getAttribute("user") != null)
		{
			 user =  (User) session.getAttribute("user");
			
			model.addAttribute("user",user);
		}
	
		//wrapRequestService.getQuote().setProsId(2);
		//System.out.println("Pro id"+prosId);
		//model.addAttribute("serviceRequestId",serviceRequestId);
		model.addAttribute("vendorProfile", this.prosService.getVendorProfile(prosId));
		model.addAttribute("products", this.prosService.getProductsListedfor(prosId));
		model.addAttribute("feedbackList", this.prosService.getFeedback(prosId));
		model.addAttribute("proId", prosId);
		int feedbackNumber=this.prosService.getFeedbackNumber(prosId);
				
		int feedbackAvg=this.prosService.getFeedbackAvg(prosId);
		model.addAttribute("feedbackNumber",feedbackNumber);
		model.addAttribute("feedbackAvg",feedbackAvg);
		navigationWrapper.setEditProfile(null);
		navigationWrapper.setViewProfile("VP");
		model.addAttribute("navigationWrapper",navigationWrapper);
		try{
			
			List<WrapRequestService> leads= this.prosService.fetchProsDashboard(user);
			model.addAttribute("LeadsNo", leads.size());
		}
		catch(Exception ex){
			
			logger.info("viewProfile called  -"+"method name - viewProfile  "+this.getClass().getSimpleName()+"  -"+ex.toString());
			//model.addAttribute("LeadsNo", 0);
			//System.out.println(ex.toString());
		}
		return "viewProfile";
	}	
	
	@RequestMapping(value="/listBussiness",method=RequestMethod.GET)
	public String displayProductGroup(Model model,HttpSession session,@ModelAttribute("userProsProfile") UserProsProfile userProsProfile){
		
		  
		model.addAttribute("productGroup",new ProductGroup());
		model.addAttribute("productGroupList",this.adminService.listProductGroup());
		
		return "productGroups";
	}
	/*@RequestMapping(value = "/pros", method = RequestMethod.POST)
	public String pros(Model model,@ModelAttribute("userProsProfile") UserProsProfile userProsProfile) {
		
		logger.info("pros registration   -"+"method name - pros  "+this.getClass().getSimpleName());
		model.addAttribute("userProsProfile", new UserProsProfile());
		model.addAttribute("productGroup", new Product()); 
		model.addAttribute("listProductGroup", this.adminService.listProductByProductGroup(new Long(userProsProfile.getProductGroupId())));
		//model.addAttribute("product", new Product());
	//	model.addAttribute("listProductGroup", this.adminService.listProduct());
		//System.out.println(" ################ prosRegistration page");
		return "prosRegistration";
	}	*/
	@RequestMapping(value = "/pros", method = RequestMethod.GET)
	public String pros(Model model,@ModelAttribute("userProsProfile") UserProsProfile userProsProfile) {
		
		//logger.info("pros registration   -"+"method name - pros  "+this.getClass().getSimpleName());
		model.addAttribute("userProsProfile", new UserProsProfile());
		model.addAttribute("productGroup", new Product()); 
		//model.addAttribute("listProductGroup", this.adminService.listProductByProductGroup(new Long(userProsProfile.getProductGroupId())));
		//model.addAttribute("product", new Product());
		model.addAttribute("listProductGroup", this.adminService.listProduct());
		//System.out.println(" ################ prosRegistration page");
		return "prosRegistration";
	}	
	
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
		public String signUp(){
		
		return "SignUp";
	}
	
	@RequestMapping(value="/email/verify/{emailId}/{UniqueIdentification}",method=RequestMethod.GET)
	public String verifyemail(Model model,HttpSession session,@PathVariable("emailId") String emailid,@PathVariable("UniqueIdentification") UUID UniqueIdentification){
		
		logger.info("email verification started  -"+"method name - verifyemail  "+this.getClass().getSimpleName());
		
			 User user = null;
			 user=this.customerService.getUserByEmail(emailid);
			 if(UniqueIdentification.equals(user.getUUIDNo()) && user.getUserType().equals("pros")){
			logger.info("identification number -"+UniqueIdentification+"UID from URL"+user.getUUIDNo()+"method name - verifyemail  "+this.getClass().getSimpleName());
			 boolean isVendorVerified= this.customerService.isVendorVerified(user);
			 session.setAttribute("user",user);
			 return "redirect:/prosDashboard";
			 }
			 else  if(UniqueIdentification.equals(user.getUUIDNo()) && user.getUserType().equals("cust")){
					logger.info("identification number -"+UniqueIdentification+"UID from URL"+user.getUUIDNo()+"method name - verifyemail  "+this.getClass().getSimpleName());
					 boolean isVendorVerified= this.customerService.isVendorVerified(user);
					 session.setAttribute("user",user);
					 return "redirect:/manageRequest";
					 }
			 else{
				 
				 return "redirect:/index"; 
			 }
			
			
	
		
	}
	@RequestMapping(value = "/addPros", method = RequestMethod.POST)
	public String createuser(Model model,@ModelAttribute("userProsProfile") UserProsProfile userProsProfile , HttpSession session) {
	
		
		logger.info("pros registration started   -"+"method name - createuser  "+this.getClass().getSimpleName());
		
		try{
		userProsProfile.getUser().setUserType("pros");
		userProsProfile.getUser().setUUIDNo(UUID.randomUUID());
		 this.customerService.addUser(userProsProfile);
		//System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>HHHHHHHHHHHHHHHHHHhh");
		session.setAttribute("user", userProsProfile.getUser());
		mainMailService.mailToPros(userProsProfile);
		WrapSuccessError.setSuceess(true);
		//WrapSuccessError.setAction(userProsProfile.getUser().getEmailId()+"already Exists");
		model.addAttribute("wrapSuccessError", WrapSuccessError);
		
		this.messageService.messagetoVendorSignUp(userProsProfile.getUser());
		
				
		return "redirect:/prosDashboard"; 
		}
		catch(Exception ex){
			
			WrapSuccessError.setSuceess(false);
			WrapSuccessError.setAction(userProsProfile.getUser().getEmailId()+" " +"already exists");
			model.addAttribute("wrapSuccessError", WrapSuccessError);
			
			model.addAttribute("userProsProfile", userProsProfile);
			model.addAttribute("productGroup", new Product());
			String listedIn=userProsProfile.getProfile().getListedIn();
			List<String> productList=Arrays.asList(listedIn.split(","));
			ProductGroup productGroup=this.adminService.getProductGroupById(Long.parseLong(productList.get(0)));
			//model.addAttribute("listProductGroup", this.adminService.listProductByProductGroup(productGroup.getProductGroupId()));
			model.addAttribute("listProductGroup", this.adminService.listProduct());
			
			//model.addAttribute("listProductGroup", this.adminService.listProductByProductGroup(productGroupId));
			//model.addAttribute("listProductGroup", this.adminService.listProductByProductGroup(new Long(userProsProfile.getProductGroupId())));
			
			  
			//model.addAttribute("product", new Product());
			//model.addAttribute("listProduct", this.adminService.listProduct());
			//System.out.println(" ################ prosRegistration page");
			return "prosRegistration";
		}
	}
	
	
	@RequestMapping(value = "/userSettings", method = RequestMethod.GET)
	public String userSettings(Model model,@ModelAttribute("userSettings") User userSettings,@ModelAttribute("notification") Notification notification,HttpSession session) {
		
		logger.info("user settings retrival started   -"+"method name - userSettings  "+this.getClass().getSimpleName());
		User user = null;
		if (session.getAttribute("user") != null)
		{
			 user =  (User) session.getAttribute("user");
			 //System.out.println(">>>>>>>>>>>>>>>>>>>>>>>");
			 //System.out.println(">>>>>>>>"+user.getUserId());
			 //System.out.println(">>>>>>>>"+user.getFilename());
			 user = this.customerService.getUserById(user.getUserId());
			 //System.out.println(">>>>>>>>"+user.getUserId());
			 //System.out.println(">>>>>>>>"+user.getFilename());
			 
			model.addAttribute("user",user);
		}
		
	  model.addAttribute("userSettings", this.prosService.userSettings(user));
	  model.addAttribute("notification",this.prosService.getUserNotification(user));
	  try{
			
			List<WrapRequestService> leads= this.prosService.fetchProsDashboard(user);
			model.addAttribute("LeadsNo", leads.size());
		}
		catch(Exception ex){
			
			//model.addAttribute("LeadsNo", 0);
			//System.out.println(ex.toString());
		}
		return "userSettings";
	}	
	@RequestMapping(value="/changePassword", method=RequestMethod.POST)
	public String changePassword(Model model,@ModelAttribute("userSettings") User userSettings,@ModelAttribute("notification") Notification notification,HttpSession session){
		
		logger.info("change password started  -"+"method name - changePassword  "+this.getClass().getSimpleName());
		User user=null;
		if (session.getAttribute("user") != null)
		{
			user =  (User) session.getAttribute("user");
				
				model.addAttribute("user",user);
		}
	boolean isSuccess=	this.prosService.changePassword(userSettings,user);
		  model.addAttribute("notification",this.prosService.getUserNotification(user));
		model.addAttribute("userSettings", this.prosService.userSettings(user));
if(isSuccess){
			
			WrapSuccessError.setSuceess(isSuccess);
			WrapSuccessError.setAction("Password changed Successfully");
			model.addAttribute("wrapSuccessErrorPassword", WrapSuccessError);
		}
		else{
			WrapSuccessError.setSuceess(isSuccess);
			WrapSuccessError.setAction("Some error Occured");
			model.addAttribute("wrapSuccessErrorPassword", WrapSuccessError);
		}

		return "userSettings";
	}
	@RequestMapping(value="/saveUserSettings" ,method=RequestMethod.POST)
	public String saveUserSettings(Model model,@ModelAttribute("userSettings") User userSettings,@ModelAttribute("notification") Notification notification,HttpSession session){
		
		
		logger.info("update user settings started   -"+"method name - saveUserSettings  "+this.getClass().getSimpleName());
		User user=null;
		//System.out.println(">>>>>>"+userSettings.getUserId());
		
		
		boolean isSuccess=this.prosService.saveUserSettings(userSettings);
		if (session.getAttribute("user") != null)
		{
			user=this.prosService.userSettings(userSettings);
		 session.setAttribute("user",user );
			
				model.addAttribute("user",user);
		}
		
		if(isSuccess){
			
			WrapSuccessError.setSuceess(isSuccess);
			WrapSuccessError.setAction("Setting updated Successfully");
			model.addAttribute("wrapSuccessError", WrapSuccessError);
		}
		else{
			WrapSuccessError.setSuceess(isSuccess);
			WrapSuccessError.setAction("Some error Occured");
			model.addAttribute("wrapSuccessError", WrapSuccessError);
		}
		model.addAttribute("userSettings", this.prosService.userSettings(user));
		  model.addAttribute("notification",this.prosService.getUserNotification(user));
		  try{
				
				List<WrapRequestService> leads= this.prosService.fetchProsDashboard(user);
				model.addAttribute("LeadsNo", leads.size());
			}
			catch(Exception ex){
				
				logger.info("update user settings started   -"+"method name - saveUserSettings  "+this.getClass().getSimpleName()+"   -"+ex.toString());
				//model.addAttribute("LeadsNo", 0);
				//System.out.println(ex.toString());
			}
		return "userSettings";
	}
	@RequestMapping(value="/editProfile",method=RequestMethod.GET)
	public String editProfile(@ModelAttribute("prosProfile") ProsProfile prosProfile,@ModelAttribute("document") Document document ,HttpSession session,Model model){
		
		
		logger.info("update profile of vendor  started   -"+"method name - editProfile  "+this.getClass().getSimpleName());
		User user = new User();
		if (session.getAttribute("user") != null)
		{
			user =  (User) session.getAttribute("user");
			model.addAttribute("user",user);
		}
		
		Map<Long,ProductGroupWrapper> productGroupWrapperList=new  HashMap<Long,ProductGroupWrapper>();
		prosProfile=this.prosService.editProfile(user);
		String[] productsListed=prosProfile.getListedIn().split(",");
		//fetch here the product details
		Product productdetails=this.adminService.getProductById(new Long(productsListed[0].toString()));
		//fetch here the  product group id
		ProductGroup productGroupObj=this.adminService.getProductGroupById(productdetails.getProductGroup().getProductGroupId());
		long productGroupId=productGroupObj.getProductGroupId();
		
		List<Long> productsListedin=new ArrayList<Long>();
		for (String product : productsListed) {
			
			productsListedin.add(new Long(product));
		}
		List<Product> listproduct=new ArrayList<Product>();
		//listproduct=this.adminService.listProductByProductGroup(productGroupId);
		listproduct=this.adminService.listProduct();
		for(Product product:listproduct){
			
			for(Long listedProduct :productsListedin){
				
				ProductGroupWrapper productGroupWrapper=new ProductGroupWrapper();
				//blocking the already existing prducts
				//productGroupWrapper.setLive_productGroup(product.isLive_product());
				productGroupWrapper.setIsActive(product.getIsActive());
				
				if(listedProduct==product.getProductId()){
					
				
					productGroupWrapper.setListed(true);
					productGroupWrapper.setProductGroupId(product.getProductId());
					productGroupWrapper.setProductGroupName(product.getProductName());
					productGroupWrapperList.put(product.getProductId(),productGroupWrapper);
				}
				else{
					
					//System.out.println(productGroupWrapperList.get(product.getProductGroupId()));
					
						if(productGroupWrapperList.get(product.getProductId())==null){
							productGroupWrapper.setListed(false);
						productGroupWrapper.setProductGroupId(product.getProductId());
						productGroupWrapper.setProductGroupName(product.getProductName());
						productGroupWrapperList.put(product.getProductId(),productGroupWrapper);
						}
						else{
							
							
						}
				}
				
			}
			
		}
		for (Map.Entry<Long, ProductGroupWrapper> entry : productGroupWrapperList.entrySet()) {
			//System.out.println("Key : " + entry.getKey() + " Value : " + entry.getValue().getProductGroupName()+"boolean"+entry.getValue().isListed());
		}
		////System.out.println("test this>>>"+productGroupWrapperList.get(1).getProductGroupName());
		//model.addAttribute("productGroup", new ProductGroup());
		model.addAttribute("listProductGroup", productGroupWrapperList);
		//model.addAttribute("listProductGroup" , this.adminService.listProduct());
		//model.addAttribute("productsListedin", productsListedin);
		model.addAttribute("prosProfile", prosProfile);
		model.addAttribute("documentList", documentService.list());
		navigationWrapper.setEditProfile("EP");
		navigationWrapper.setViewProfile(null);
		model.addAttribute("navigationWrapper",navigationWrapper);
		try{
			
			List<WrapRequestService> leads= this.prosService.fetchProsDashboard(user);
			model.addAttribute("LeadsNo", leads.size());
		}
		catch(Exception ex){
			
			//model.addAttribute("LeadsNo", 0);
			//System.out.println(ex.toString());
		}
		return "editProfile";
	}
	@RequestMapping(value="/saveEditProfile",method=RequestMethod.POST)
	public String saveEditProfile(@ModelAttribute("prosProfile") ProsProfile prosProfile,Model model,HttpSession session){
		try{
	
		logger.info(" profile  update   started   -"+"method name - saveEditProfile  "+this.getClass().getSimpleName());
		
		User user = new User();
		if (session.getAttribute("user") != null)
		{
			user =  (User) session.getAttribute("user");
			model.addAttribute("user",user);
		}
		boolean isSuccess=	this.prosService.saveEditProfile(prosProfile);
		
		
		model.addAttribute("QuoteInProgressNo",this.prosService.getQuotesNoforPros("IP",user));
		model.addAttribute("QuoteWIPNo",this.prosService.getQuotesNoforPros("WIP",user));
		Map<Long,ProductGroupWrapper> productGroupWrapperList=new  HashMap<Long,ProductGroupWrapper>();
		prosProfile=this.prosService.editProfile(user);
		String[] productsListed=prosProfile.getListedIn().split(",");
		List<Long> productsListedin=new ArrayList<Long>();
		for (String product : productsListed) {
			
			productsListedin.add(new Long(product));
		}
		//fetch product Group
		Product productObj=this.adminService.getProductById(productsListedin.get(0));
		//fetch Product Group
		ProductGroup productGroupObj=this.adminService.getProductGroupById(productObj.getProductGroup().getProductGroupId());
		List<Product> productGroup=new ArrayList<Product>();
		productGroup=this.adminService.listProductByProductGroup(productGroupObj.getProductGroupId());
		for(Product product:productGroup){
			
			
			for(Long listedProduct :productsListedin){
				
				ProductGroupWrapper productGroupWrapper=new ProductGroupWrapper();
				productGroupWrapper.setIsActive(product.getIsActive());
				if(listedProduct==product.getProductId()){
					
					productGroupWrapper.setListed(true);
					productGroupWrapper.setProductGroupId(product.getProductId());
					productGroupWrapper.setProductGroupName(product.getProductName());
					productGroupWrapperList.put(product.getProductId(),productGroupWrapper);
				}
				else {
					
					//System.out.println(productGroupWrapperList.get(product.getProductGroupId()));
				productGroupWrapper.setIsActive(product.getIsActive());
					if(productGroupWrapperList.get(product.getProductId())==null){
						productGroupWrapper.setListed(false);
					productGroupWrapper.setProductGroupId(product.getProductId());
					productGroupWrapper.setProductGroupName(product.getProductName());
					productGroupWrapperList.put(product.getProductId(),productGroupWrapper);
					}
					else{
						
						
					}
				
				}
				
			}
			
		}
		for (Map.Entry<Long, ProductGroupWrapper> entry : productGroupWrapperList.entrySet()) {
			//System.out.println("Key : " + entry.getKey() + " Value : " 	+ entry.getValue().getProductGroupName());
		}
		//model.addAttribute("productGroup", new ProductGroup());
		model.addAttribute("listProductGroup",productGroupWrapperList);
		model.addAttribute("prosProfile",prosProfile);
	
	if(isSuccess){
		
		WrapSuccessError.setSuceess(isSuccess);
		WrapSuccessError.setAction("Profile updated Successfully");
		model.addAttribute("wrapSuccessError", WrapSuccessError);
	}
	
	
		
		List<WrapRequestService> leads= this.prosService.fetchProsDashboard(user);
		model.addAttribute("LeadsNo", leads.size());
		}
	
	
		
		catch(Exception ex){
	
			logger.info(" profile  update   error   -"+"method name - saveEditProfile  "+this.getClass().getSimpleName()+"    -"+ex.toString());
			WrapSuccessError.setSuceess(false);
			WrapSuccessError.setAction("Some error Occured");
			model.addAttribute("wrapSuccessError", WrapSuccessError);
		}
		navigationWrapper.setEditProfile("EP");
		navigationWrapper.setViewProfile(null);
		model.addAttribute("navigationWrapper",navigationWrapper);
		
		return "editProfile";
	}
	@RequestMapping(value="/updateServices",method=RequestMethod.POST)
	public String updateRegisteredServices(@ModelAttribute("prosProfile") ProsProfile prosProfile,Model model,HttpSession session){
		try{
			
			logger.info(" update  service offered by vendors   started   -"+"method name - updateRegisteredServices  "+this.getClass().getSimpleName());
		
		User user = new User();
		if (session.getAttribute("user") != null)
		{
			user =  (User) session.getAttribute("user");
			model.addAttribute("user",user);
		}
		model.addAttribute("QuoteInProgressNo",this.prosService.getQuotesNoforPros("IP",user));
		model.addAttribute("QuoteWIPNo",this.prosService.getQuotesNoforPros("WIP",user));
		//System.out.println(prosProfile.getListedIn().length());
		ProsProfile prosProfileObj=new ProsProfile();
		prosProfileObj=this.prosService.editProfile(user);
		prosProfileObj.setListedIn(prosProfile.getListedIn());
		this.prosService.saveUpdatedServices(prosProfileObj);
		
		Map<Long,ProductGroupWrapper> productGroupWrapperList=new  HashMap<Long,ProductGroupWrapper>();
		prosProfile=this.prosService.editProfile(user);
		String[] productsListed=prosProfile.getListedIn().split(",");
		List<Long> productsListedin=new ArrayList<Long>();
		for (String product : productsListed) {
			
			productsListedin.add(new Long(product));
		}
		Product productObj=this.adminService.getProductById(new Long(productsListed[0]));
		ProductGroup productGroupObj=this.adminService.getProductGroupById(productObj.getProductGroup().getProductGroupId());
		List<Product> productGroup=new ArrayList<Product>();
		//productGroup=this.adminService.listProductByProductGroup(productGroupObj.getProductGroupId());
		productGroup=this.adminService.listProduct();
		for(Product product:productGroup){
			
			for(Long listedProduct :productsListedin){
				
				ProductGroupWrapper productGroupWrapper=new ProductGroupWrapper();
				productGroupWrapper.setIsActive(product.getIsActive());
				if(listedProduct==product.getProductId()){
					
					productGroupWrapper.setListed(true);
					productGroupWrapper.setProductGroupId(product.getProductId());
					productGroupWrapper.setProductGroupName(product.getProductName());
					productGroupWrapperList.put(product.getProductId(),productGroupWrapper);
				}
				else{
					
					//System.out.println(productGroupWrapperList.get(product.getProductGroupId()));
					
					if(productGroupWrapperList.get(product.getProductId())==null){
						productGroupWrapper.setListed(false);
					productGroupWrapper.setProductGroupId(product.getProductId());
					productGroupWrapper.setProductGroupName(product.getProductName());
					productGroupWrapperList.put(product.getProductId(),productGroupWrapper);
					}
					else{
						
						
					}
				
				}
				
			}
			
		}
		navigationWrapper.setEditProfile("EP");
		navigationWrapper.setViewProfile(null);
		model.addAttribute("navigationWrapper",navigationWrapper);
		model.addAttribute("productGroup", new ProductGroup());
		model.addAttribute("listProductGroup", productGroupWrapperList);
		model.addAttribute("prosProfile", prosProfileObj);
		WrapSuccessError.setSuceess(true);
		WrapSuccessError.setAction("Services Provided updated Successfully");
		model.addAttribute("wrapSuccessServices", WrapSuccessError);
		List<WrapRequestService> leads= this.prosService.fetchProsDashboard(user);
		model.addAttribute("LeadsNo", leads.size());
		return "editProfile";
		}
		catch(Exception ex){
			
			logger.info(" update  service offered by vendors   error   -"+"method name - updateRegisteredServices  "+this.getClass().getSimpleName()+"   -"+ex.toString());
			WrapSuccessError.setSuceess(false);
			WrapSuccessError.setAction("Some Error Occured");
			model.addAttribute("wrapSuccessError", WrapSuccessError);

			return "editProfile";
		}
	}
	@RequestMapping(value="/saveNotification",method=RequestMethod.POST)
	public String saveNotification(@ModelAttribute("userSettings") User userSettings,@ModelAttribute("notification") Notification notification,Model model,HttpSession session){
		
		logger.info(" Notification preferences update   started   -"+"method name - saveNotification  "+this.getClass().getSimpleName());
		User user=null;
		if (session.getAttribute("user") != null)
		{
			 user =  (User) session.getAttribute("user");
			
			model.addAttribute("user",user);
		}
		notification.setUser(user);
		
	this.prosService.saveNotification(notification,user);
	
		model.addAttribute("userSettings", this.prosService.userSettings(user));

			
			WrapSuccessError.setSuceess(true);
			WrapSuccessError.setAction("Notifications updated Successfully");
		
			model.addAttribute("wrapSuccessErrorNotification", WrapSuccessError);
try{
				
				List<WrapRequestService> leads= this.prosService.fetchProsDashboard(user);
				model.addAttribute("LeadsNo", leads.size());
			}
			catch(Exception ex){
				
				logger.info(" Notification preferences update   error   -"+"method name - saveNotification  "+this.getClass().getSimpleName()+"    -"+ex.toString());
				//model.addAttribute("LeadsNo", 0);
				//System.out.println(ex.toString());
			}
		return "userSettings";
	}
	
	
	
	
	@RequestMapping(value="/writeFeedback/{prosId}/{serviceRequestId}" ,method=RequestMethod.GET)
	public String feedback(HttpSession session,Model model,@ModelAttribute("feedback") Feedback feedback, @PathVariable("prosId") int prosId,@PathVariable("serviceRequestId") int serviceRequestId){
		
		
		logger.info(" write feedback for vebdor by user started   -"+"method name - feedback  "+this.getClass().getSimpleName());
		model.addAttribute("prosId", prosId);
		
		User user=null;
		if (session.getAttribute("user") != null)
		{
			 user =  (User) session.getAttribute("user");
			
			
			 WrapRequestService wrapRequestService=new  WrapRequestService();
			 RequestService requestservice=new RequestService();
			 requestservice=this.customerService.getRequestServiceById(new Long(serviceRequestId));
			Product product=new Product();
			product=this.customerService.getProductById(requestservice.getProdcutId());
			 wrapRequestService.setRequestService(requestservice);
			 wrapRequestService.setProduct(product);
			 
			 model.addAttribute("wrapRequestService",wrapRequestService);
			model.addAttribute("vendorProfile", this.prosService.getVendorProfile(prosId));
			model.addAttribute("user",user);
			model.addAttribute("serviceRequestId",serviceRequestId);
			
		}
	
		try{
			
			List<WrapRequestService> leads= this.prosService.fetchProsDashboard(user);
			model.addAttribute("LeadsNo", leads.size());
		}
		catch(Exception ex){
			
			logger.info(" write feedback for vebdor by user error   -"+"method name - feedback  "+this.getClass().getSimpleName()+"   -"+ex.toString());
			//model.addAttribute("LeadsNo", 0);
			//System.out.println(ex.toString());
		}
		return "writeFeedback";
	}
	
	@RequestMapping(value= "/addFeedback", method = RequestMethod.POST)
	public String addProduct(Model model , @ModelAttribute("feedback") Feedback feedback,HttpSession session){
		
		
		logger.info(" add feedback for vendor by user started   -"+"method name - addProduct  "+this.getClass().getSimpleName());
		User user=new User();
		if (session.getAttribute("user") != null)
		{
			 user =  (User) session.getAttribute("user");
			 
			 model.addAttribute("user",user);
		}
		this.prosService.addFeedback(feedback);
		
		long proid=feedback.getProsId();
		return "redirect:/vendorProfile/"+proid+"/"+feedback.getRequestId();
		
	}
	

	public User getLoggedinUserDetails(HttpSession session){
		
		User user=(User) session.getAttribute("loggedUser");
		return user;
	}
	

	
	
	
/*
	@RequestMapping(value = "/pros", method = RequestMethod.GET)
	public String pros1(Model model,@ModelAttribute("userProsProfile") UserProsProfile userProsProfile) {
		return "prosRegistration";
	}
	*/
	
	
	
	
	
	
	
	
	
	
}
