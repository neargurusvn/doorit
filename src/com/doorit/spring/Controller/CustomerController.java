package com.doorit.spring.Controller;

import java.io.DataOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.TimeZone;
import java.util.UUID;







import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sun.net.www.protocol.http.HttpURLConnection;

import com.doorit.spring.model.Option;
import com.doorit.spring.model.Product;
import com.doorit.spring.model.ProsProfile;
import com.doorit.spring.model.Question;
import com.doorit.spring.model.Quotes;
import com.doorit.spring.model.RequestService;
import com.doorit.spring.model.User;
import com.doorit.spring.model.UserProsProfile;
import com.doorit.spring.model.WrapRequestService;
import com.doorit.spring.model.WrapSuccessError;
import com.doorit.spring.service.AdminService;
import com.doorit.spring.service.CustomerService;
import com.doorit.spring.service.DocumentService;
import com.doorit.spring.service.EmailNotificationService;
import com.doorit.spring.service.MessageService;
import com.doorit.spring.service.ProsService;
import com.doorit.spring.util.UtilityClass;


@Controller
//@PreAuthorize("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
//@RequestMapping(value = "user")
public class CustomerController {
	
	private Logger logger = Logger.getLogger(CustomerController.class);
	
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private EmailNotificationService mainMailService;
	
	@Autowired
	private DocumentService documentService;
	
	@Autowired
	private ProsService prosService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private WrapSuccessError wrapSuccessError;
	private CustomerService customerService;
	
     
	@Autowired(required=true)
	@Qualifier(value="customerService")
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
	
	/**
	 * test method
	 * ***/
	@ResponseBody
	@RequestMapping( value="/test",method=RequestMethod.GET)
	public String test( @RequestParam("name") String name ,@RequestParam("email") String email,Model model,HttpSession session){
		
		try{
		User user=new User();
		user.setEmailId(email);
		user.setName(name);
		user.setUUIDNo(UUID.randomUUID());
		 user.setUserType("cust");
		 session.setAttribute("user", user);
		
			 this.customerService.addCustUser(user);
			
			
			return "redirect";
		}
catch(Exception ex){
			
			logger.info("create User>>"+this.getClass().getSimpleName()+ex.toString());
			 wrapSuccessError.setSuceess(false);
			 //wrapSuccessError.setAction(user.getEmailId()+" already exists");
			 session.invalidate();
			 model.addAttribute("wrapSuccessError", wrapSuccessError);
			return "UserRegistration";
		}
		
	} 
	
@RequestMapping(value="/forgotPassword",method=RequestMethod.GET)
	public String showforgotPassword(Model model,@ModelAttribute("usr") User user,@ModelAttribute("wrapSuccessError") WrapSuccessError wrapSuccessError){
	
	logger.info("forgot Password>>"+this.getClass().getSimpleName());
	wrapSuccessError.setSuceess(false);
	return "forgotPassword";
}
@RequestMapping(value="/forgotPassword",method=RequestMethod.POST)
public String forgotPassword(Model model,@ModelAttribute("usr") User user,@ModelAttribute("wrapSuccessError") WrapSuccessError wrapSuccessError){
	
	logger.info("forgot Password>>"+this.getClass().getSimpleName());
	
	User userObj=new User();
	userObj=	this.customerService.verifyUser(user);
	
	 if(userObj.getUserId()!=0) 
	 {
		 wrapSuccessError.setSuceess(true);
		 wrapSuccessError.setAction("No worries! We have already sent you mail to your registered mail id <b> "+user.getEmailId()+"</b>.Please check and you should find a message for new password for your account. ");
		 
		 model.addAttribute("wrapSuccessError", wrapSuccessError);
		 mainMailService.mailforForgotPassword(userObj);
		 
	 }
	 else{
		 
		 wrapSuccessError.setSuceess(false);
 wrapSuccessError.setAction("Email enetered by you is not registered with us,please enter valid email");
		 
		 model.addAttribute("wrapSuccessError", wrapSuccessError);
	 }
	 return "forgotPassword";
}
	@RequestMapping(value="/verifyuser",method=RequestMethod.POST)
	public String verifyUser(@ModelAttribute("user") User user,HttpSession session,Model model){
		
		logger.info("verify  user>>"+this.getClass().getSimpleName()+this.getClass());
		user=	this.customerService.verifyUser(user);
		session.setAttribute("user", user);
		if(user.getUserId()==0){
	
		 wrapSuccessError.setSuceess(false);
		 wrapSuccessError.setAction("Invalid Username/Password");
		 
		 model.addAttribute("wrapSuccessError", wrapSuccessError);
		 //System.out.println(wrapSuccessError.getAction()+wrapSuccessError.isSuceess());
	return "signIn";
	 }
	 else if((user.getUserType()).equals("pros"))
	 {
		 //System.out.println(">>>>>>>>>>>"+ user.getUserId());
		 session.setAttribute("user", user);
		 return "redirect:/prosDashboard";
	 }
	 else 
	 {
		 
		 session.setAttribute("user", user);
		 return "redirect:/manageRequest";
	 }
	}
	
	
	@RequestMapping(value="/user/loginUser",method=RequestMethod.GET)
	public String loginUser(@ModelAttribute("user") User user,HttpSession session,Model model){
	
		logger.info("user/loginUser>>"+this.getClass().getSimpleName()+this.getClass());
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	String username = auth.getName();
	
	 //System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>"+ username);	
	 user=	this.customerService.findByUserName(username);
	 session.setAttribute("user", user);
	 if(user.getUserType().equals("admin")){
		 session.setAttribute("user", user);
		
			return "redirect:/admin/productGroup"; 
		 
	 }
	 else if((user.getUserType()).equals("pros"))
	 {
		 //System.out.println(">>>>>>>>>>>"+ user.getUserId());
		 session.setAttribute("user", user);
		 return "redirect:/prosDashboard";
	 }
	 else 
	 {
		 
		 session.setAttribute("user", user);
		 return "redirect:/manageRequest";
	 }
	}
	
	@RequestMapping(value = "/requetAService", method = RequestMethod.GET)
	public String requetsAService(Model model,HttpSession session) {
		
		logger.info("request a Service called"+this.getClass().getSimpleName()+this.getClass());
		User user=null;
		if (session.getAttribute("user") != null)
		{
			 user =  (User) session.getAttribute("user");
			
			model.addAttribute("user",user);
		}
		
		//List<Product> productList = this.adminService.listProduct();
		
		//Map<Long,String> mapProduct = new HashMap<Long, String>();
		
		//for(Product prodcut : productList){
			
			//prodcut.getProductId();
			//prodcut.getProductDesc();
			
			//mapProduct.put(prodcut.getProductId(), prodcut.getProductName());
		//}
		
		////System.out.println("Map>>>>>>>"+mapProduct);
		//model.addAttribute("mapProduct", mapProduct);
		model.addAttribute("userProsProfile", new WrapRequestService());
		//model.addAttribute("userProsProfile" , new UserProsProfile());
	try{
			
			List<WrapRequestService> leads= this.prosService.fetchProsDashboard(user);
			model.addAttribute("LeadsNo", leads.size());
		}
		catch(Exception ex){
			
			logger.info("Exception in request a Service "+this.getClass().getSimpleName()+this.getClass()+">>>"+ex.toString());
					}
		return "RequestAService";
	}
	
	
	
	@RequestMapping(value = "/signIn", method = RequestMethod.GET)
	public String signIn(Model model,@ModelAttribute("user") User user,HttpSession session) {
	
		logger.info("sign In called "+this.getClass().getSimpleName()+this.getClass());
		//logs debug message
				if(logger.isDebugEnabled()){
					logger.debug("getWelcome is executed!>>>>>>>>>>>>>");
				}
		 
				//logs exception
				//logger.error("This is Error message >>>>>>>>>>>", new Exception("Testing"));
		 
		if(session!=null){
		session.invalidate();
		
		
		}
		
		return "signIn";
	}
	@RequestMapping(value = "/signOut", method = RequestMethod.GET)
	public String signOut(Model model,HttpSession session) {
		
		logger.info("sign out called "+this.getClass().getSimpleName()+this.getClass());
		session.removeAttribute("user");
		//System.out.println("session>>>"+session.getAttribute("user"));
		session.invalidate();
		return "redirect:/index";
	}
	//award project method
	@RequestMapping(value="/awardProject",method=RequestMethod.POST)
	public String awardProject(@ModelAttribute("wrapRequestService") WrapRequestService wrapRequestService,Model model,HttpSession session){
		
		logger.info("/awardProject >>project awarded to customer called "+this.getClass().getSimpleName()+this.getClass());
		User user=null;
		if (session.getAttribute("user") != null)
		{
			 user =  (User) session.getAttribute("user");
			
			model.addAttribute("user",user);
		}
		////System.out.println("wrapRequestService size++++++"+ wrapRequestService.si);
		//System.out.println("REquest id"+wrapRequestService.getRequestService().getRequestId());
		//System.out.println("pros id"+wrapRequestService.getQuote().getProsId());
		//System.out.println("Quote id"+wrapRequestService.getQuote().getQuoteId());
			this.customerService.changeAwardStatus(wrapRequestService);
			model.addAttribute("quotesRecived", this.customerService.getQuotesRecived(wrapRequestService.getRequestService().getRequestId()));
			
			//setting up wrapper for the mail when project is awarded to a vendor
			WrapRequestService wrapperRequestService=new WrapRequestService();
			RequestService requestService=this.customerService.getRequestServiceById(wrapRequestService.getRequestService().getRequestId());
			Quotes quote=this.prosService.getQuoteById(wrapRequestService.getQuote().getQuoteId());
			ProsProfile vendorObject=this.prosService.getVendorProfile((int)wrapRequestService.getQuote().getProsId());
			Product product=this.customerService.getProductById(requestService.getProdcutId());
			ProsProfile prosProfile=this.prosService.getVendorProfile((int)requestService.getProsId());
			User vendorUser=this.customerService.getUserById(wrapRequestService.getQuote().getProsId());
			user.setEmailId(vendorUser.getEmailId());
			wrapperRequestService.setRequestService(requestService);
			wrapperRequestService.setQuote(quote);
			wrapperRequestService.setUser(user);
			wrapperRequestService.setProsProfile(prosProfile);
			wrapperRequestService.setProduct(product);
			//set  pros  mail id in user obj to send a mail to the pro
			model.addAttribute("wrapRequestServiceWrapper", wrapperRequestService);
			mainMailService.mailToprosawarded(wrapperRequestService, vendorObject);
          return "AdminDashboard";
	}
	
	//quotes pages displayed to user
	@RequestMapping(value="/quotesDescription/{serviceRequestId}",method=RequestMethod.GET)
	public String adminDashboard(@PathVariable("serviceRequestId") long serviceRequestId,Model model,HttpSession session,@ModelAttribute("wrapRequestService") WrapRequestService wrapRequestService)
	{
		logger.info("/quotesDescription >>Quotes  description by customers called "+this.getClass().getSimpleName()+this.getClass());
		model.addAttribute("wrapRequestService",new WrapRequestService());
		User user=null;
		if (session.getAttribute("user") != null)
		{
			 user =  (User) session.getAttribute("user");
			
			 
			model.addAttribute("user",user);
		}
		
		WrapRequestService wrapRequestServiceWrapper=new WrapRequestService();
		//Display project awarded success message to user
		RequestService requestService=this.customerService.getRequestServiceById(serviceRequestId);
		if(requestService.getProsId()!=0){
		ProsProfile prosProfile=this.prosService.getVendorProfile((int)requestService.getProsId());
		wrapRequestServiceWrapper.setRequestService(requestService);
		wrapRequestServiceWrapper.setProsProfile(prosProfile);
		}
		
	model.addAttribute("quotesRecived", this.customerService.getQuotesRecived(serviceRequestId));
	model.addAttribute("productName", this.prosService.getAnswerById(serviceRequestId));
	model.addAttribute("wrapRequestServiceWrapper", wrapRequestServiceWrapper);
	
		return "AdminDashboard";
	}
	
	//quotes pages displayed to user
		@RequestMapping(value="/quotesDescriptionPros/{serviceRequestId}",method=RequestMethod.GET)
		public String quotesDescriptionPros(@PathVariable("serviceRequestId") long serviceRequestId,Model model,HttpSession session,@ModelAttribute("wrapRequestService") WrapRequestService wrapRequestService)
		{
			logger.info("/quotesDescriptionPros >>details for  No of quotes recieved by customer called "+this.getClass().getSimpleName()+this.getClass());
			model.addAttribute("wrapRequestService",new WrapRequestService());
			User user=null;
			if (session.getAttribute("user") != null)
			{
				 user =  (User) session.getAttribute("user");
				
				 
				model.addAttribute("user",user);
			}
			////System.out.println("test this>>>>>"+wrapRequestService.getQuote().getProsId());
	//Document doc = documentService.getQuoteFile(quotes.getProsId(),serviceRequestId);
			
			//model.addAttribute("doc", doc);
		model.addAttribute("quotesRecived", this.customerService.getQuotesRecived(serviceRequestId));
		model.addAttribute("productName", this.prosService.getAnswerById(serviceRequestId));
		
try{
			
			List<WrapRequestService> leads= this.prosService.fetchProsDashboard(user);
			model.addAttribute("LeadsNo", leads.size());
		}
		catch(Exception ex){
			
			logger.info("/quotesDescriptionPros >>details for  No of quotes recieved by customer called "+this.getClass().getSimpleName()+this.getClass()+">>>"+ex.toString());
			//System.out.println(ex.toString());
		}
			return "quotesDescriptionPros";
		}
	
	@RequestMapping(value = "/manageRequestCustomers/{requestType}", method = RequestMethod.GET)
	public String userManageRequestsz(Model model , HttpSession session,@PathVariable("requestType") String requestType) {
		
		logger.info("/manageRequestCustomers>>>Customer Dashboard"+this.getClass().getSimpleName()+this.getClass());
		User user = new User();
		if (session.getAttribute("user") != null)
		{
			user =  (User) session.getAttribute("user");
			
			
			model.addAttribute("proAction", "manageRequest");
			model.addAttribute("requestType",requestType);
			model.addAttribute("user", user);
			model.addAttribute("INProgressNo", this.customerService.getInProgressNo("IP",user));
			model.addAttribute("HiredNo", this.customerService.getWIPNo("WIP",user));
			model.addAttribute("manageRequests", this.customerService.getUserManageRequests(user,requestType));
			try{
				
				List<WrapRequestService> leads= this.prosService.fetchProsDashboard(user);
				model.addAttribute("LeadsNo", leads.size());
			}
			catch(Exception ex){
				
				logger.info("/manageRequestCustomers>>>Customer Dashboard"+this.getClass().getSimpleName()+this.getClass()+ex.toString());
				//System.out.println(ex.toString());
			}
		}

		return "manageRequests";
		
	}
	@RequestMapping(value = "/manageRequest", method = RequestMethod.GET)
	public String userManageRequests(Model model , HttpSession session) {
		
		logger.info("/manageRequest>>>Customer Dashboard"+this.getClass().getSimpleName());
		String requestType="IP";
		User user = new User();
		if (session.getAttribute("user") != null)
		{
			user =  (User) session.getAttribute("user");
			model.addAttribute("requestType","IP");
			model.addAttribute("user", user);
			model.addAttribute("proAction", "manageRequest");
			model.addAttribute("proActionLead", "");  
			model.addAttribute("proActionQuote", "");
			
			model.addAttribute("proActionManageRequest", "MyProject");
			model.addAttribute("INProgressNo", this.customerService.getInProgressNo("IP",user));
			model.addAttribute("HiredNo", this.customerService.getWIPNo("WIP",user));
			
			model.addAttribute("manageRequests", this.customerService.getUserManageRequests(user,requestType));
			try{
				
				List<WrapRequestService> leads= this.prosService.fetchProsDashboard(user);
				model.addAttribute("LeadsNo", leads.size());
			}
			catch(Exception ex){
				
				logger.info("/manageRequest>>>Customer Dashboard"+this.getClass().getSimpleName()+this.getClass()+">>>>"+ex.toString());
				//System.out.println(ex.toString());
			}
		}

		
		return "manageRequests";
	}
	
 
	@RequestMapping(value = "/SignUp", method = RequestMethod.GET)
	public String userTypeReg(Model model,HttpSession session) {
		
		logger.info("/SignUp>>>userTypeReg  called"+this.getClass().getSimpleName());
		//model.addAttribute("user",new  User());
		
	//	model.addAttribute("listProduct", this.adminService.listProduct());
	//	//System.out.println(" ################ Admin Controller");
		return "SignUp";   
	}
	@RequestMapping(value = "/userRegistration", method = RequestMethod.GET)
	public String userRegistration(Model model,HttpSession session) {
		
		logger.info("/userRegistratio>>>user registration  called"+this.getClass().getSimpleName());
		model.addAttribute("user",new  User());
		
	//	model.addAttribute("listProduct", this.adminService.listProduct());
	//	//System.out.println(" ################ Admin Controller");
		return "UserRegistration";
	}
	@RequestMapping(value = "/createUser", method = RequestMethod.POST)
	public String createuser(Model model,@ModelAttribute("user") User user , HttpSession session) throws Exception {
		
		logger.info("create User>>"+this.getClass().getSimpleName());
		
		try{
		 session.setAttribute("user", user);
		 if(user.getEmailId().equals("adminSB007@gmail.com")){
					user.setUserType("admin");
		  }else{
			 user.setUUIDNo(UUID.randomUUID());
			 user.setUserType("cust");
		 }
		 this.customerService.addCustUser(user);
		 session.setAttribute("user", user);
		 this.messageService.messagetoUserSignUp(user);
		 mainMailService.mailToUser(user);
		return "redirect:/manageRequest";
		}
		catch(Exception ex){
			
			logger.info("create User>>"+this.getClass().getSimpleName()+ex.toString());
			 wrapSuccessError.setSuceess(false);
			 wrapSuccessError.setAction(user.getEmailId()+" already exists");
			 session.invalidate();
			 model.addAttribute("wrapSuccessError", wrapSuccessError);
			return "UserRegistration";
		}
	}
	
	/*@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("product", new Product());
		model.addAttribute("listProduct", this.adminService.listProduct());
		//System.out.println(" ################ index 111 page");
		return "index";
	}
*/	
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Model model,HttpSession session) throws IOException {
		
		logger.info("index page>>"+this.getClass().getSimpleName());
		User user=null;
		if (session.getAttribute("user") != null)
		{
			 user =  (User) session.getAttribute("user");
			
			model.addAttribute("user",user);
		}
		
/////////////////////////////////////////////////////////
		
		
		////////////////////////////////
		model.addAttribute("userProsProfile", new WrapRequestService());
		//model.addAttribute("userProsProfile" , new UserProsProfile());
		return "index";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String welcome(Model model) {
		//model.addAttribute("product", new Product());
		//model.addAttribute("listProduct", this.adminService.listProduct());
		////System.out.println(" ################ index 111 page");
		return "redirect:index";
	}
	
	@RequestMapping(value = "/servicerequest1", method = RequestMethod.GET)
	public String servicerequest(Model model) {
		//model.addAttribute("product", new Product());
		//model.addAttribute("listProduct", this.adminService.listProduct());
		//System.out.println(" ################ index page");
		return "servicerequest";
	}
	
	@RequestMapping(value="/UpdateRequestStatus/{requestId}/{requestType}",method=RequestMethod.GET)
	public String UpdateRequestStatus(Model model,HttpSession session,@PathVariable("requestId") long requestId,@PathVariable("requestType") String requestType ){
		
		logger.info("/UpdateRequestStatus>>update request status called"+this.getClass().getSimpleName());
		if (session.getAttribute("user") != null)
		{
			User user =  (User) session.getAttribute("user");
		
			model.addAttribute("user",user);
		}
		RequestService requestService=this.customerService.getRequestServiceById(requestId);
		model.addAttribute("serviceRequest", requestService);
		model.addAttribute("product", this.customerService.getProductById(requestService.getProdcutId()));
		model.addAttribute("requestType",requestType);
		return "UpdateRequestStatus";
	}
	
	@RequestMapping(value="/saveRequestStatus",method=RequestMethod.POST)
	public String saveRequestStatus(Model model,HttpSession session,@ModelAttribute("serviceRequest") RequestService serviceReuqest){
		
		logger.info("/saveRequestStatus>>save request status called"+this.getClass().getSimpleName());
		User user=null;
		if (session.getAttribute("user") != null)
		{
			 user =  (User) session.getAttribute("user");
			
			model.addAttribute("user",user);
		}
		this.customerService.saveRequestStatus(serviceReuqest);
		RequestService requestService=this.customerService.getRequestServiceById(serviceReuqest.getRequestId());
		model.addAttribute("serviceRequest", requestService);
		
		if(requestService.getStatus()!="WIP"){
		//send mail to professionals for canceling of project status
		Product product=this.customerService.getProductById(requestService.getProdcutId());
		WrapRequestService wrapRequestService=new WrapRequestService();
		wrapRequestService.setProduct(product);
		wrapRequestService.setRequestService(requestService);
		wrapRequestService.setUser(user);
		List<User> user1 = this.prosService.getProsEmailIds(wrapRequestService.getRequestService().getProdcutId());
		////System.out.println("List pros :::::::::"+user1.size());
		wrapRequestService.setListProsForMail(user1);
		mainMailService.mailToProsForUpdateRequestStatus(wrapRequestService);
		}
		return "redirect: /manageRequestCustomers/"+"OLD";
	}
	@RequestMapping(value="/viewRequest/{requestId}",method=RequestMethod.GET)
	public String viewRequest(Model model,HttpSession session,@PathVariable("requestId") long requestId, @ModelAttribute("wrapRequestService") WrapRequestService wrapRequestService){
		
		logger.info("/viewRequest>>view  request  called"+this.getClass().getSimpleName());
		User user=null;
		if (session.getAttribute("user") != null)
		{
			 user =  (User) session.getAttribute("user");
			 
			 
			//wrapRequestService.setUser(user);
			model.addAttribute("user",user);
		}
		boolean  requestQuotedbyVendor=false;
		if (user.getUserType().equals("pros")){
			
			String RequestID=String.valueOf(requestId);
			requestQuotedbyVendor=this.prosService.isRequestQuoted(RequestID, user);
			model.addAttribute("requestQuotedbyVendor",requestQuotedbyVendor);
		}
		
		
		RequestService requestService=this.customerService.getRequestServiceById(requestId);
		model.addAttribute("serviceUser",this.customerService.getServiceUser(requestId));
		model.addAttribute("requestAnswer", this.prosService.getAnswerById(requestId));
		model.addAttribute("requestService", this.customerService.getRequestServiceById(requestId));
		
		DateFormat formatter=new SimpleDateFormat("MMM dd,yyyy HH:mm");
		formatter.setTimeZone(TimeZone.getTimeZone("IST"));

		
		String date=formatter.format(requestService.getVersion());
		
		wrapRequestService.setServiceRequestedDate(date.toString());
		model.addAttribute("requestWrapper", wrapRequestService);
		try{
			
			List<WrapRequestService> leads= this.prosService.fetchProsDashboard(user);
			model.addAttribute("LeadsNo", leads.size());
		}
		catch(Exception ex){
			
			logger.info("/viewRequest>>view  request  called"+this.getClass().getSimpleName()+ex.toString());
			//model.addAttribute("LeadsNo", 0);
			//System.out.println(ex.toString());
		}
		return "viewRequest";
	}
	
	
	
	@RequestMapping(value="answers" , method=RequestMethod.POST)
	public String saveAnswers(@ModelAttribute("wrapRequestService") WrapRequestService wrapRequestService, @ModelAttribute("product") Product p,Model model , HttpSession session){
		
		logger.info("/answers>>service form submission by user called"+this.getClass().getSimpleName());
		
		UtilityClass utilityClass=new UtilityClass();
		Product product=this.customerService.getProductById(wrapRequestService.getRequestService().getProdcutId());
		wrapRequestService.setProduct(product);
		
		if (session.getAttribute("user") == null){
			
			
			User usercheck = this.customerService.getUserByEmail(wrapRequestService.getUser().getEmailId());
			if(usercheck.getUserId()!=0){
			usercheck.setEmailId(wrapRequestService.getUser().getEmailId());
			usercheck.setPassword(wrapRequestService.getUser().getPassword());
			usercheck = this.customerService.verifyUser(usercheck);
			if(usercheck.getUserId()==0){
				//System.out.println("error  message !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11");
				wrapSuccessError.setSuceess(false);
				wrapSuccessError.setAction("Password for " + wrapRequestService.getUser().getEmailId()+ " is incorrect.");
				model.addAttribute("wrapSuccessError", wrapSuccessError);
				////System.out.println(wrapSuccessError.getAction()+wrapSuccessError.isSuceess());
				
				//model.addAttribute("wrapRequestService",wrapRequestService);
				//model.addAttribute("product",p);
				
				model.addAttribute("getFormatted_address",this.customerService.getProductById(wrapRequestService.getRequestService().getProdcutId()));

				//p = this.customerService.getProductById(p.getProductId());
				model.addAttribute("product",this.customerService.getProductById(wrapRequestService.getRequestService().getProdcutId()));
				List<Question> questionList =this.customerService.getQuesByProductId(wrapRequestService.getRequestService().getProdcutId());
				
				////System.out.println("yes we are OK till now .........");
			   
				LinkedHashMap<Question,List<Option>> fromdata = new LinkedHashMap<Question, List<Option>>();
		        for (Question q1 : questionList){
		    	  List<Option> optionList =this.customerService.getOptionByQueId(q1.getQueId());
		    	  fromdata.put(q1, optionList);
		    	 
		      }
		       
		       model.addAttribute("fromdata",fromdata);

				
				return "servicerequest";
			}else
			{
				//System.out.println(" forward to User Dashboard");
				 session.setAttribute("user", usercheck);
				  wrapRequestService.getRequestService().setUserId(usercheck.getUserId());
				   wrapRequestService.getRequestService().setProdcutId(wrapRequestService.getRequestService().getProdcutId());
				   wrapRequestService.getRequestService().setStatus("IP");
				
					////System.out.println(">>>>>>>>>"+wrapRequestService.getRequestAnswer().getAnswer1());
					
					this.customerService.addRequest(wrapRequestService);
					//this.customerService.saveAnswer(wrapRequestService.getRequestAnswer());
					//System.out.println("Login :::::::::::: User");
					wrapRequestService.setUser(usercheck);
					/* send email to user and pros for this request */
					
					List<User> user1 = this.prosService.getProsEmailIds(wrapRequestService.getRequestService().getProdcutId());
					wrapRequestService.setListProsForMail(user1);
					
					mainMailService.mailToUserRequest(wrapRequestService);
					return "redirect:/manageRequest";
			}
			}else{
		wrapRequestService.getUser().setUserType("cust");
		wrapRequestService.getUser().setUUIDNo(UUID.randomUUID());
		
	   User user=this.customerService.addCustUser(wrapRequestService.getUser());
		//System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>"+wrapRequestService.getUser().getUserId());
		if(wrapRequestService.getUser().getUserId()!=0){
		
		  // RequestService requestService = new RequestService();
		   wrapRequestService.getRequestService().setUserId(wrapRequestService.getUser().getUserId());
		   wrapRequestService.getRequestService().setProdcutId(wrapRequestService.getRequestService().getProdcutId());
		   wrapRequestService.getRequestService().setStatus("IP");
		
			////System.out.println(">>>>>>>>>"+wrapRequestService.getRequestAnswer().getAnswer1());
			
			this.customerService.addRequest(wrapRequestService);
			//wrapRequestService.getRequestAnswer().setProduct_name(requestService.g)
			//this.customerService.saveAnswer(wrapRequestService.getRequestAnswer());
			
			//System.out.println(">>>>>>>>> success");
			//mainMailService.sendMail("dooritin.com", wrapRequestService.getUser().getEmailId(), "Welcome !!! doorit , to hire a local service  ", "Hi You have successfully enroled with us . Regards doorit");
			////System.out.println(">>>>>>>>>>."+user.getEmailId());
			List<User> user1 = this.prosService.getProsEmailIds(wrapRequestService.getRequestService().getProdcutId());
			wrapRequestService.setListProsForMail(user1);
			mainMailService.mailToUserRequest(wrapRequestService);
			session.setAttribute("user", user);
			
			/********************************************************
			 * 
			 * logic to send messages to new users for theier request and cosrrsponding vendors -new user
			 * 
			 ***********************************************************/
			
			messageService.messagetoUserRequest(wrapRequestService, user);
			
			
		}
		
		}
			
		}else
		{
			
			
			   User user =  (User) session.getAttribute("user");
			  // RequestService requestService = new RequestService();
			  
			   //System.out.println(">>>>>>>>>>>>>>"+ user.getEmailId());
			   wrapRequestService.setUser(user);
			   wrapRequestService.getRequestService().setUserId(user.getUserId());
			   wrapRequestService.getRequestService().setProdcutId(wrapRequestService.getRequestService().getProdcutId());
			   wrapRequestService.getRequestService().setStatus("IP");
			   wrapRequestService.setProduct(this.customerService.getProductById(wrapRequestService.getRequestService().getProdcutId()));
				////System.out.println(">>>>>>>>>"+wrapRequestService.getRequestAnswer().getAnswer1());
			   this.customerService.addRequest(wrapRequestService);
				//this.customerService.addRequest(wrapRequestService.getRequestService());
				//this.customerService.saveAnswer(wrapRequestService.getRequestAnswer());
				//System.out.println("Login :::::::::::: User");
				List<User> user1 = this.prosService.getProsEmailIds(wrapRequestService.getRequestService().getProdcutId());
				////System.out.println("List pros :::::::::"+user1.size());
				wrapRequestService.setListProsForMail(user1);
				
				/*String numberofPros=",";
				//code here to send message to user request and vendors for that category
				for(User vendor:user1){
					
					numberofPros+=vendor.getMobile()+",";
				}
				String message="You+have+raised+"+wrapRequestService.getProduct().getProductName()+"+request.Relevant+expert+service+providers+will+respond+with+their+quotations.";
				message=utilityClass.encodeCharacters(message);
				String url="http://sms99.co.in/pushsms.php?username=trnrguru&password=TY639F&sender=NRGURU&message="+message+"&numbers="+user.getMobile();
				int responseCode=utilityClass.sendMessage(url);
				
				String messageVendors="Request+number+%2D+"+"+"+wrapRequestService.getRequestService().getRequestId()+"+"+user.getName()+"+is looking for+"
						+wrapRequestService.getProduct().getProductName()+"+professional+like+you+,To+send+quote+log+in+to+http://nearguru.com/ ";
				messageVendors=utilityClass.encodeCharacters(messageVendors);
				String Prourl="http://sms99.co.in/pushsms.php?username=trnrguru&password=TY639F&sender=NRGURU&message="+messageVendors+"&numbers="+numberofPros;
				int responseCode1=utilityClass.sendMessage(Prourl);*/
				messageService.messagetoUserRequest(wrapRequestService, user);
				mainMailService.mailToUserRequest(wrapRequestService);
				
				
				
		}
		
		
		return "redirect:/manageRequest";
		
	}
	@RequestMapping(value="/AboutUs",method=RequestMethod.GET)
	public String aboutUs(HttpSession session,Model model){
		
		logger.info("/AboutUs>>about us  called"+this.getClass().getSimpleName());
		User user=null;
		if (session.getAttribute("user") != null)
		{
			user =  (User) session.getAttribute("user");
			model.addAttribute("user",user);
		}
		
		try{
			
			List<WrapRequestService> leads= this.prosService.fetchProsDashboard(user);
			model.addAttribute("LeadsNo", leads.size());
		}
		catch(Exception ex){
			
			//model.addAttribute("LeadsNo", 0);
			//System.out.println(ex.toString());
		}
		return "AboutUs";
		
		
	}
	@RequestMapping(value="/termsOfUsage",method=RequestMethod.GET)
	public String termsOfUsage(HttpSession session,Model model){
		
		logger.info("/termsOfUsage>>terms of usage  called"+this.getClass().getSimpleName());
		User user=null;
		if (session.getAttribute("user") != null)
		{
			 user =  (User) session.getAttribute("user");
			model.addAttribute("user",user);
		}
		try{
			
			List<WrapRequestService> leads= this.prosService.fetchProsDashboard(user);
			model.addAttribute("LeadsNo", leads.size());
		}
		catch(Exception ex){
			
			//model.addAttribute("LeadsNo", 0);
			//System.out.println(ex.toString());
		}
		return "termsofusage";
		
		
	}
	@RequestMapping(value="/popularServices",method=RequestMethod.GET)
	public String popularServices(HttpSession session,Model model){
		
		logger.info("/popularServices>>popular services  called"+this.getClass().getSimpleName());
		User user=null;
		if (session.getAttribute("user") != null)
		{
			 user =  (User) session.getAttribute("user");
			model.addAttribute("user",user);
		}
		try{
			
			List<WrapRequestService> leads= this.prosService.fetchProsDashboard(user);
			model.addAttribute("LeadsNo", leads.size());
		}
		catch(Exception ex){
			
			//model.addAttribute("LeadsNo", 0);
			//System.out.println(ex.toString());
		}
		
		
		List<Product> listProduct= this.adminService.listProduct();
		List<Product> listActiveProduct = new ArrayList<Product>();
		for(Product p : listProduct){
			if(p.getIsActive().equals("Y"))
			{
	            		listActiveProduct.add(p);
			}   		
		}
		model.addAttribute("product", new Product());
		model.addAttribute("listProduct", listActiveProduct);
		//model.addAttribute("listProduct", this.adminService.listProduct());
		//System.out.println(" ################ Admin Controller");
				
		return "popularServices";
		
		
	}
	
	@RequestMapping(value="/trustandsafety",method=RequestMethod.GET)
	public String termsandsaftey(HttpSession session,Model model){
		
		logger.info("/termsandsaftey>>termsandsaftey  called"+this.getClass().getSimpleName());
		User user =null;
		if (session.getAttribute("user") != null)
		{
		user	=  (User) session.getAttribute("user");
			model.addAttribute("user",user);
		}
		
		return "termsandsaftey";
		
		
	}
	@RequestMapping(value="/location",method=RequestMethod.GET)
	public String location(HttpSession session,Model model){
		
		logger.info("/location>>location  called"+this.getClass().getSimpleName());
		User user =null;
		if (session.getAttribute("user") != null)
		{
		user	=  (User) session.getAttribute("user");
			model.addAttribute("user",user);
		}
		try{
			
			List<WrapRequestService> leads= this.prosService.fetchProsDashboard(user);
			model.addAttribute("LeadsNo", leads.size());
		}
		catch(Exception ex){
			
			logger.info("/location>>location  called"+this.getClass().getSimpleName()+ex.toString());
			//System.out.println(ex.toString());
		}
		return "location";
		
		
	}
	@RequestMapping(value="/privacyPolicy",method=RequestMethod.GET)
	public String privacyPolicy(HttpSession session,Model model){
		
		logger.info("/privacyPolicy>>privacy policy  called"+this.getClass().getSimpleName());
		User user=null;
		if (session.getAttribute("user") != null)
		{
		user	 =  (User) session.getAttribute("user");
			model.addAttribute("user",user);
		}
try{
			
			List<WrapRequestService> leads= this.prosService.fetchProsDashboard(user);
			model.addAttribute("LeadsNo", leads.size());
		}
		catch(Exception ex){
			
			//model.addAttribute("LeadsNo", 0);
			//System.out.println(ex.toString());
		}
		return "privacyPolicy";
		
		
	}
	
	
	@RequestMapping(value= "/popularServiceForm/{id}/{pname}" , method=RequestMethod.GET)
	public String buildForm(Model model , @ModelAttribute("question") Question q , @PathVariable("id") long id,@PathVariable("pname") String pname,
			@ModelAttribute("product") Product p , @ModelAttribute("userProsProfile") UserProsProfile userProsProfile ,
			@ModelAttribute("wrapRequestService") WrapRequestService  wrapRequestService , HttpSession session,HttpServletRequest request){
		
		
		logger.info("/ServiceForm>>request service form  called"+this.getClass().getSimpleName());
		if (session.getAttribute("user") != null)
		{
			User user =  (User) session.getAttribute("user");
			model.addAttribute("user",user);
		}
			model.addAttribute("getFormatted_address",this.customerService.getProductById(id));
			model.addAttribute("product",this.customerService.getProductById(id));
			
			List<Question> questionList =this.customerService.getQuesByProductId(id);
			
			LinkedHashMap<Question,List<Option>> fromdata = new LinkedHashMap<Question, List<Option>>();
	        for (Question q1 : questionList){
	    	  List<Option> optionList =this.customerService.getOptionByQueId(q1.getQueId());
	    	  fromdata.put(q1, optionList);
	    	  
	      }
	       
	       model.addAttribute("fromdata",fromdata);
	       return "servicerequest";
	   }
	
	
	@RequestMapping(value= "/ServiceForm" , method=RequestMethod.POST)
	public String buildFormGet(Model model , @ModelAttribute("question") Question q , 
			@ModelAttribute("product") Product p , @ModelAttribute("userProsProfile") UserProsProfile userProsProfile ,
			@ModelAttribute("wrapRequestService") WrapRequestService  wrapRequestService , HttpSession session,HttpServletRequest request){
		
		
		logger.info("/ServiceForm>>request service form  called"+this.getClass().getSimpleName());
		if (session.getAttribute("user") != null)
		{
			User user =  (User) session.getAttribute("user");
			model.addAttribute("user",user);
		}
			
			if(userProsProfile.getProduct().getProductId()==0)
			{
				 return "redirect:/popularServices";
			}
			model.addAttribute("getFormatted_address",this.customerService.getProductById(new Long(userProsProfile.getProduct().getProductId())));
			model.addAttribute("product",this.customerService.getProductById(new Long(userProsProfile.getProduct().getProductId())));
			
			List<Question> questionList =this.customerService.getQuesByProductId(new Long(userProsProfile.getProduct().getProductId()));
			
			LinkedHashMap<Question,List<Option>> fromdata = new LinkedHashMap<Question, List<Option>>();
	        for (Question q1 : questionList){
	    	  List<Option> optionList =this.customerService.getOptionByQueId(q1.getQueId());
	    	  fromdata.put(q1, optionList);
	    	 
	      }
	       
	       model.addAttribute("fromdata",fromdata);
	       return "servicerequest";
	   }
		
	
}
