package com.doorit.spring.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.doorit.spring.model.Option;
import com.doorit.spring.model.Product;
import com.doorit.spring.model.ProductGroup;
import com.doorit.spring.model.ProsProfile;
import com.doorit.spring.model.Question;
import com.doorit.spring.model.Reports;
import com.doorit.spring.model.Tag;
import com.doorit.spring.model.User;
import com.doorit.spring.model.WrapRequestService;
import com.doorit.spring.model.WrapSuccessError;
import com.doorit.spring.service.AdminService;
import com.doorit.spring.service.CustomerService;
import com.doorit.spring.service.ProsService;

///////////////
@Controller
//@PreAuthorize("hasRole('ROLE_ADMIN')")
public class AdminController {
	
	private AdminService adminService;
	
	@Autowired
	private WrapSuccessError wrapSuccessError;
	
	@Autowired
	private CustomerService customerService;
	@Autowired
	private ProsService prosService;
	
	@Autowired(required=true)
	@Qualifier(value="adminService")
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	private Logger logger = Logger.getLogger(AdminController.class);
	
	@RequestMapping(value="/howItWorksPros",method=RequestMethod.GET)
	public String howItWorksPros(Model model,HttpSession session){
		
		User user = new User();
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
		return "howItWorksPro";
	}
	@RequestMapping(value="/howItWorksCust",method=RequestMethod.GET)
	public String howItWorksCust(Model model,HttpSession session){
		
		User user = new User();
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
		return "howItWorksCust";
	}
	
	
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String userSignUp(Model model) {
		//model.addAttribute("product", new Product());
		//model.addAttribute("listProduct", this.adminService.listProduct());
		//System.out.println(" ################ User Sign up");
		return "UserRegistration";
	}
	
	

	@RequestMapping(value = "/admin/viewReports", method = RequestMethod.GET)
	public String viewReports(Model model) {
		
		
		return "reports";
	}
	
	@RequestMapping(value = "/admin/product", method = RequestMethod.GET)
	public String listProduct(Model model) {
		model.addAttribute("product", new Product());
		model.addAttribute("listProduct", this.adminService.listProduct());
		//System.out.println(" ################ Admin Controller");
		return "product";
	}
	
	
	@RequestMapping(value = "/admin/deleteProductGroup/{productGroupId}", method = RequestMethod.GET)
	public String deleteProductGroup(Model model,@PathVariable("productGroupId") long productGroupId , HttpSession session) {
		this.adminService.deleteProductGroup(productGroupId);

		model.addAttribute("productGroup", new ProductGroup());
		model.addAttribute("listProductGroup", this.adminService.listProductGroup());
		User user=null;
		if (session.getAttribute("user") != null)
		{
			 user =  (User) session.getAttribute("user");
			model.addAttribute("user",user);
		}
		
				return "productGroup";
	}
	
	
	@RequestMapping(value = "/admin/adminUser", method = RequestMethod.GET)
	public String adminUser(Model model,@ModelAttribute("user") User user , @ModelAttribute("adminUser") User adminUser,HttpSession session) throws Exception {
		
		logger.info("create Admin User>>"+this.getClass().getSimpleName());
		
		try{
			if (session.getAttribute("user") != null)
			{
				 user =  (User) session.getAttribute("user");
				
				 
				model.addAttribute("user",user);
			}
		return "createAdmin";
		}
		catch(Exception ex){
			
			logger.info("create Admin User>>"+this.getClass().getSimpleName()+ex.toString());
			return "createAdmin";
			
		}
	}
	
	@RequestMapping(value = "/admin/createAdminUser", method = RequestMethod.POST)
	public String createAdminUser(Model model,@ModelAttribute("user") User user , @ModelAttribute("adminUser") User adminUser,HttpSession session) throws Exception {
		
		logger.info("create Admin User>>"+this.getClass().getSimpleName());
		
		try{
		 session.setAttribute("user", user);
		 
		 adminUser.setUserType("admin");
		 adminUser.setUUIDNo(UUID.randomUUID());
		
		 this.customerService.addCustUser(adminUser);
		 session.setAttribute("user", adminUser);
		
		return "redirect:/admin/productGroup";
		}
		catch(Exception ex){
			
			logger.info("create Admin User>>"+this.getClass().getSimpleName()+ex.toString());
			 wrapSuccessError.setSuceess(false);
			 wrapSuccessError.setAction(adminUser.getEmailId()+" already exists");
			 session.invalidate();
			 model.addAttribute("wrapSuccessError", wrapSuccessError);
			return "UserRegistration";
		}
	}
	
	
	@RequestMapping(value = "/admin/productGroup", method = RequestMethod.GET)
	public String listProductGroup(Model model,HttpSession session) {
		
		User user=null;
		if (session.getAttribute("user") != null)
		{
			 user =  (User) session.getAttribute("user");
			model.addAttribute("user",user);
		}
		model.addAttribute("productGroup", new ProductGroup());
		model.addAttribute("listProductGroup", this.adminService.listProductGroup());
		model.addAttribute("listUser", this.customerService.listUser());
		
		//System.out.println(" ################ Admin Controller");
		return "productGroup";
	}
	@RequestMapping(value = "/admin/editProductGroup/{productGroupId}", method = RequestMethod.GET)
	public String editProductGroup(Model model,@PathVariable("productGroupId") long productGroupId) {
		
	
		model.addAttribute("productGroup", this.adminService.getProductGroupById(productGroupId));
		//System.out.println(" ################ Admin Controller");
		
		
		return "editproductGroup";
	}
	@RequestMapping(value = "/admin/saveProductGroup/{productGroupId}", method = RequestMethod.POST)
	public String saveProductGroup(Model model,@PathVariable("productGroupId") long productGroupId,@ModelAttribute("productGroup") ProductGroup productGroup) {
		
		
		this.adminService.saveProductGroup(productGroup);
		
		model.addAttribute("productGroup", this.adminService.getProductGroupById(productGroupId));
		//System.out.println(" ################ Admin Controller");
		return "redirect:/admin/productGroup";  
	}
	
	/*
	@RequestMapping(value = "/question/{id}",  method = RequestMethod.GET)
	public String listQuestion(@PathVariable("id") long id ,Model model) {
		//Product p = this.adminService.getProductById(id);
		//model.addAttribute("product",p);
		model.addAttribute("question", new Question());
		model.addAttribute("listQuestion", this.adminService.listQuestion());
		//System.out.println(" ################ Admin Controller");
		return "question";
	}
	*/
	/*
	@Autowired(required=true)
	@Qualifier(value="personService")
	public void setPersonService(AdminService ps){
		this.adminService = ps;
	}
	
	@RequestMapping(value = "/persons", method = RequestMethod.GET)
	public String listPersons(Model model) {
		model.addAttribute("person", new Person());
		model.addAttribute("listPersons", this.adminService.listPersons());
		return "person";
	}
	*/
	//For add and update person both
	@RequestMapping(value= "/admin/product/add", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product p){
		
		//System.out.println("OK");
		
			//this.adminService.addProduct(p);
		
		
		return "redirect:/admin/product";
		
	}
	
	@RequestMapping(value= "/admin/productGroup/add", method = RequestMethod.POST)
	public String addProductGroup(@ModelAttribute("productGroup") ProductGroup p){
		
		//System.out.println("OK");
		
			this.adminService.addProductGroup(p);
		
		
		return "redirect:/admin/productGroup";
		
	}
	
	@RequestMapping("admin/removeProductGroup/{id}")
    public String removeProductGroup(@PathVariable("id") long id){
		
        this.adminService.removeProductGroup(id);
        return "redirect:/admin/productGroup";
    }
 
	@RequestMapping("admin/removeProduct/{id}")
    public String removeProduct(@PathVariable("id") long id){
		
        this.adminService.removeProduct(id);
        return "redirect:/admin/productGroup";
    }
    
	@RequestMapping("/admin/editOption/{optionId}")
	public String editOption(Model model,@PathVariable("optionId") long optionId){
		
		Option option=this.adminService.getOptionById(optionId);
		model.addAttribute("option",option);
		model.addAttribute("question", this.adminService.getQuestionById(option.getQuestion().getQueId()));
		return "editOption";
	}
	@RequestMapping("/admin/updateOption/{optionId}")
	public String updateOption(Model model,@PathVariable("optionId") long optionId,@ModelAttribute("option") Option option){
		
		option.setOptId(optionId);
		this.adminService.updateOption(option);
		Option optionObj=this.adminService.getOptionById(optionId);
		model.addAttribute("option",optionObj);
		model.addAttribute("question", this.adminService.getQuestionById(optionObj.getQuestion().getQueId()));
		
		 return "redirect:/admin/addOption/"+optionObj.getQuestion().getQueId();
	}
	  
	
	@RequestMapping("/admin/deleteOption/{optionId}")
    public String deleteOption(Model model ,@PathVariable("optionId") long optionId,@ModelAttribute("option") Option option){
		
		Option optionObj=this.adminService.getOptionById(optionId);
		this.adminService.deleteOption(optionId);
		
		model.addAttribute("question", this.adminService.getQuestionById(optionObj.getQuestion().getQueId()));
		model.addAttribute("listOption",this.adminService.getOptionByQueId(optionObj.getQuestion().getQueId()));
		model.addAttribute("question1",optionObj.getQuestion().getQueId());
		return "option";
    }
	@RequestMapping("/admin/addOption/{id}")
    public String addOption(Model model ,@PathVariable("id") long id, @ModelAttribute("option") Option o , @ModelAttribute("question") Question q){
        q = this.adminService.getQuestionById(id);
        //System.out.println("#########"+ q.getQueId());
       // model.addAttribute("listOption", this.adminService.getOptionByQueId(id));
		//System.out.println(" Inside addOption ########" + id);
		if(!(o.getOptDesc()==null)){
		this.adminService.addOption(o,q);
		}
		model.addAttribute("question", this.adminService.getQuestionById(q.getQueId()));
		model.addAttribute("listOption",this.adminService.getOptionByQueId(id));
		model.addAttribute("question1",q.getQueId());
		//model.addAttribute("listQuestion", this.adminService.listQuestion());
		o.setOptId(0);
		o.setOptDesc("");
		return "option";
    }
	
	
	@RequestMapping("/admin/deleteProduct/{productGroupId}/{productId}")
	 public String deleteProduct(Model model ,@PathVariable("productGroupId") long productGroupId,@PathVariable("productId") long productId, @ModelAttribute("question") Question q ,@ModelAttribute("product") Product p){
    
		ProductGroup productGroup = this.adminService.getProductGroupById(productGroupId);
	       // //System.out.println("#########"+ pg.getProductGroupId());
	        model.addAttribute("pg1", productGroup);
	        
	        
	        this.adminService.deleteProduct(productId);
			//System.out.println(" ################ Admin Controller Product");
			
			model.addAttribute("productGroup",productGroup );
			
			 model.addAttribute("listProduct", this.adminService.listProductByProductGroup(productGroupId));
			
			
			//q.setQueId(0);
			//q.setQueDesc("");
			//q.setQueType("");
			return "product";
		
	}
	@RequestMapping("/admin/deleteQuestion/{QuestionId}")
	
	 public String deleteQuestion(Model model ,@PathVariable("QuestionId") long QuestionId, @ModelAttribute("question") Question q ){
     
     
	
		Question questionObj=this.adminService.getQuestionById(QuestionId);
		this.adminService.deleteQuestion(QuestionId);
		model.addAttribute("listQuestion",this.adminService.getQuesByProductId(questionObj.getProduct().getProductId())); 
		model.addAttribute("product1",questionObj.getProduct().getProductId());
		Product product=this.adminService.getProductById(questionObj.getProduct().getProductId());
		model.addAttribute("product",product );
		model.addAttribute("productGroup", this.adminService.getProductGroupById(product.getProductGroup().getProductGroupId()));
		
		
		//model.addAttribute("listQuestion", this.adminService.listQuestion());
		
		return "question";
   }
	
	@RequestMapping("/admin/addQuestion/{id}")
    public String addQuestion(Model model ,@PathVariable("id") long id, @ModelAttribute("question") Question q , @ModelAttribute("product") Product p){
        p = this.adminService.getProductById(id);
       // //System.out.println("#########"+ p.getProductId());
        //model.addAttribute("listPersons", this.adminService.listPersons());
		//System.out.println(" Inside addQuestion ########" + id);
		if(!(q.getQueDesc()==null)){
		this.adminService.addQuestion(p,q);
		}
		model.addAttribute("listQuestion",this.adminService.getQuesByProductId(id)); 
		model.addAttribute("product1",p.getProductId());
		model.addAttribute("product", p);
		model.addAttribute("productGroup", this.adminService.getProductGroupById(p.getProductGroup().getProductGroupId()));
		//model.addAttribute("listQuestion", this.adminService.listQuestion());
		q.setQueId(0);
		q.setQueDesc("");
		q.setQueType("");
		return "question";
    }
	
	
	@RequestMapping("/admin/UpdateProduct/{productId}")
	public String updateProduct(Model model,@ModelAttribute("product") Product product,@PathVariable("productId") long productId){
		
		Product productObj=this.adminService.getProductById(productId);
		this.adminService.updateProduct(product);
		model.addAttribute("productGroup", this.adminService.getProductGroupById(productObj.getProductGroup().getProductGroupId()));
		
		
		 return "redirect:/admin/addProduct/"+productObj.getProductGroup().getProductGroupId();
		
	}
	
	@RequestMapping("/admin/updateQuestion/{questionId}")
	public String updateQuestion(Model model,@PathVariable("questionId") long questionId,@ModelAttribute("question") Question question){
		
		
		Question questionObj=this.adminService.getQuestionById(questionId);
		question.setQueId(questionObj.getQueId());
		model.addAttribute("product", this.adminService.getProductById(questionObj.getProduct().getProductId()));
		this.adminService.updateQuestion(question);
		model.addAttribute("question", question);
		  
	
		 return "redirect:/admin/addQuestion/"+questionObj.getProduct().getProductId();
	}
	
	@RequestMapping("/admin/editProduct/{productGroupId}/{productId}")
	public String editProduct(Model model,@PathVariable("productGroupId") long productGroupId,@PathVariable("productId") long productId){
		
		Product product=this.adminService.getProductById(productId);
		model.addAttribute("product", product);
		model.addAttribute("productGroup", this.adminService.getProductGroupById(product.getProductGroup().getProductGroupId()));
		return "editProduct";
	}
	
	@RequestMapping("/admin/editQuestion/{QuestionId}")
	public String editQuestion(Model model,@PathVariable("QuestionId") long QuestionId){
		
		Question question=this.adminService.getQuestionById(QuestionId);
		model.addAttribute("product", this.adminService.getProductById(question.getProduct().getProductId()));
		model.addAttribute("question", question);
		
		return "editQuestion";
	}
	
	@RequestMapping(value= "/toggleEmailSend/{userId}/{enabledVal}" , method=RequestMethod.GET)
	public String  toggleEmail(@PathVariable("userId") long userId,@PathVariable("enabledVal") boolean enabledVal){
		
			this.customerService.toogleEmailSend(userId,enabledVal);
		
		return "redirect:/admin/fetchUsers";
		
	}
	@RequestMapping("/admin/addProduct/{id}")
    public String addProduct(Model model ,@PathVariable("id") long id, @ModelAttribute("product") Product p , @ModelAttribute("productGroup") ProductGroup pg){
		
		pg = this.adminService.getProductGroupById(id);
       // //System.out.println("#########"+ pg.getProductGroupId());
        model.addAttribute("pg1", this.adminService.getProductGroupById(id));
        
		//System.out.println(" ################ Admin Controller Product");
		
		model.addAttribute("productGroup",this.adminService.getProductGroupById(id) );
		if(!(p.getProductName()==null)){
		this.adminService.addProduct(pg,p);
		}
		 model.addAttribute("listProduct", this.adminService.listProductByProductGroup(id));
		
		 p.setProductId(0);
		 p.setProductName("");
		 p.setProductDesc("");
		//q.setQueId(0);
		//q.setQueDesc("");
		//q.setQueType("");
		return "product";
    }
	
	
	/* for dynamic form 
	 * @ product id 
	 * @city  
	 * 
	 *
	 * */
	
	@RequestMapping(value = "/requestservicetest", method = RequestMethod.GET)
	public String getIndex(Model model) {
		model.addAttribute("product", new Product());
		model.addAttribute("listProduct", this.adminService.listProduct());
		//System.out.println(" ################  index page ");
		return "requestservicetest";
	}
	
	//, headers = "Accept: application/json','Content-Type: application/json"
	
	@RequestMapping(value = "/getTags", method = RequestMethod.GET  )
	public @ResponseBody 
	List<Tag> getTags(@RequestParam String tagName) {
		//System.out.println(">>>>>>>>>>>>>>"+tagName);
		//System.out.println(">>>>>>>>>>>>>>"+tagName);

		return simulateSearchResult(tagName);

	}

	private List<Tag> simulateSearchResult(String tagName) {

		List<Tag> result = new ArrayList<Tag>();
		List<Tag> data = new ArrayList<Tag>();
		List<Product> productList =this.adminService.listProductByTag(tagName);
		
		for (Product l : productList){
  			if(l.getIsActive().equals("Y"))
		{
			Tag  t = new Tag();
			//System.out.println();
			t.setId(l.getProductId());
			t.setTagName(l.getProductName());
			result.add(t);
			//System.out.println("---------------"+t.getId());
			//System.out.println("-------------"+t.getTagName());
			}
		}
		
		
		return result;
	}

	@RequestMapping(value = "/PopularServices", method = RequestMethod.GET)
	public String PopularServices(Model model) {
		//model.addAttribute("product", new Product());
		//model.addAttribute("listProduct", this.adminService.listProduct());
		//System.out.println(" ################  PopularServices.html ");
		return "PopularServices";
	}
	
	
	
	@RequestMapping(value = "/admin/VendorVerify/{pros_id}/{verification}", method = RequestMethod.GET)
	public String VendorVerify(@PathVariable("pros_id") long pros_id,@PathVariable("verification") String verification)  {
		
		
		this.adminService.saveVendorVerify(pros_id,verification);
		
		
		return "redirect:/admin/fetchVendors";
	}
		
	
		
	@RequestMapping(value= "/admin/visibleProductGroup/{productGroupId}/{isActive}" , method=RequestMethod.GET)
	public String  visibleProductGroup(@PathVariable("productGroupId") long productGroupId,@PathVariable("isActive") String isActive){
		
			this.adminService.visibleProductGroup(productGroupId,isActive);
		
		return "redirect:/admin/productGroup";
		
	}
	
	@RequestMapping(value= "/admin/visibleProduct/{productId}/{isActive}" , method=RequestMethod.GET)
	public String  visibleProduct(@PathVariable("productId") long productId,@PathVariable("isActive") String isActive){
		
		Product productObj=this.adminService.getProductById(productId);
			this.adminService.visibleProduct(productId,isActive);
		
	
	    return "redirect:/admin/addProduct/"+productObj.getProductGroup().getProductGroupId();
		
	}
	
	
}
