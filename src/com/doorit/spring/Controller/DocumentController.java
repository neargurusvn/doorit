package com.doorit.spring.Controller;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import com.doorit.spring.dao.ProsDAOImpl;
import com.doorit.spring.model.Document;
import com.doorit.spring.model.User;
import com.doorit.spring.service.CustomerService;
import com.doorit.spring.service.DocumentService;

@Controller
public class DocumentController {
	
	private static final Logger logger = LoggerFactory.getLogger(DocumentController.class);
	
	@Autowired
	private DocumentService documentService;
	
	@Autowired
	
	private CustomerService customerService;
	
	@Autowired(required=true)
	@Qualifier(value="customerService")
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
	
	@RequestMapping("/docs")
	public String index(Map<String, Object> map) {
		try {
			map.put("document", new Document());
			map.put("documentList", documentService.list());
		}catch(Exception e) {
			e.printStackTrace();
		}

		return "documents";
	}
	
	@RequestMapping(value = "/UploadQuote/{requestId}", method = RequestMethod.POST)
	public String uploadQuote(Model model,
			@ModelAttribute("document") Document document,
			@RequestParam("file") MultipartFile file,HttpSession session,@PathVariable("requestId") String requestId) throws IOException {
		
		logger.info("upload quote for request started -"+"method name - uploadQuote  "+this.getClass().getSimpleName());
		
		User user=new User();
		if (session.getAttribute("user") != null)
		{
			user =  (User) session.getAttribute("user");
			model.addAttribute("user",user);
		}
		//System.out.println();
		////System.out.println("Name:" + document.getName());
		////System.out.println("Desc:" + document.getDescription());
		//System.out.println("File:" + file.getName());
		//System.out.println("ContentType:" + file.getContentType());
		//System.out.println("requestId"+requestId);
		////System.out.println(document.getRequestService().getRequestId());
		//try {
		document.setRequestId(new Long(requestId));
		document.setProsId(user.getUserId());
		documentService.save(file,document);
		
		//System.out.println("okay");
			//Session session = null;
			//Blob blob = Hibernate.getLobCreator(session).createBlob(file.getInputStream(), -1);

			//document.setFilename(file.getOriginalFilename());
			//document.setContent(blob);
			//document.setContentType(file.getContentType());
		/*} catch (IOException e) {
			e.printStackTrace();
		}
		*/
		
		
		return "redirect:/manageRequestsVendor";
	}
	
	
	@RequestMapping(value = "/saveUserImg/{requestId}", method = RequestMethod.POST)
	public String saveUserImg(Model model,
			@ModelAttribute("document") User document, 	@RequestParam("file") MultipartFile file,HttpSession session,@PathVariable("requestId") long requestId) throws IOException {
		
		logger.info("save image of user started -"+"method name - saveUserImg  "+this.getClass().getSimpleName());	
		
		//System.out.println("save a new user image "+requestId);
		 //document = customerDAO.getUserById(requestId);
			document.setUserId(requestId);
		 //System.out.println(">>>>>>>"+document.getEmailId());
		/*if (session.getAttribute("user") != null)
		{
			//System.out.println("KKKKKKKKKKKKKKKKKK");
			document =  (User) session.getAttribute("user");
			model.addAttribute("user",document);
		}
		*/
		////System.out.println();
		////System.out.println("Name:" + document.getName());
		////System.out.println("Desc:" + document.getDescription());
		//System.out.println("File:" + file.getName());
		//System.out.println("ContentType:" + file.getContentType());
		//System.out.println("requestId"+requestId);
		////System.out.println(document.getRequestService().getRequestId());
		//try {
		//document.setRequestId(new Long(requestId));
		//document.setProsId(user.getUserId());
		////System.out.println(">>>>>>>>>>>>>>>>>file size" + file.getSize());
		double bytes = file.getSize();
		double kilobytes = (bytes / 1024);
		double megabytes = (kilobytes / 1024);
		
		//System.out.println(bytes);
		//System.out.println(kilobytes);
		//System.out.println(megabytes);
		
		if(file.getSize()!=0){
		documentService.saveUser(file,document);
		}
		
		User user = this.customerService.getUserById(requestId);
		if (session.getAttribute("user") != null)
		{
			//System.out.println("KKKKKKKKKKKKKKKKKK"+user.getFilename());
			document =  (User) session.getAttribute("user");
			model.addAttribute("user",user);
		}
		
		
		return "redirect:/userSettings";
	}

	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(
			@ModelAttribute("document") Document document,
			@RequestParam("file") MultipartFile file) {
		
		logger.info("save document started -"+"method name - save  "+this.getClass().getSimpleName());		
		//System.out.println("Name:" + document.getName());
		//System.out.println("Desc:" + document.getDescription());
		//System.out.println("File:" + file.getName());
		//System.out.println("ContentType:" + file.getContentType());
		
		
		//try {
			
			//Session session = null;
			//Blob blob = Hibernate.getLobCreator(session).createBlob(file.getInputStream(), -1);

			//document.setFilename(file.getOriginalFilename());
			//document.setContent(blob);
			//document.setContentType(file.getContentType());
		/*} catch (IOException e) {
			e.printStackTrace();
		}
		*/
		try {
			documentService.save(file,document);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/editProfile";
	}
	@RequestMapping(value="/downloadQuote/{prosID}/{requestId}/{quoteId}",method=RequestMethod.GET)
	public String downloadQuote(@PathVariable("prosID")
			long  prosId,@PathVariable("requestId")
			long  requestId,@PathVariable("quoteId") long quoteId,  HttpServletResponse response) {
		
		logger.info("dowlaod quote file started -"+"method name - downloadQuote  "+this.getClass().getSimpleName());		
		Document doc = documentService.getQuoteFile(prosId,requestId);
		try {
			response.setHeader("Content-Disposition", "inline;filename=\"" +doc.getFilename()+ "\"");
			OutputStream out = response.getOutputStream();
			response.setContentType(doc.getContentType());
			IOUtils.copy(doc.getContent().getBinaryStream(), out);
			out.flush();
			out.close();
		
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

	
	@RequestMapping("/download/{documentId}")
	public String download(@PathVariable("documentId")
			long documentId, HttpServletResponse response) {
		//System.out.println(">>>>>>>>>>>>>>>>>>>>>>");
		logger.info("dowlaod document started -"+"method name - download  "+this.getClass().getSimpleName());		
		User doc = documentService.get(documentId);
		try {
			response.setHeader("Content-Disposition", "inline;filename=\"" +doc.getFilename()+ "\"");
		//System.out.println(doc.getFilename());
			OutputStream out = response.getOutputStream();
			response.setContentType(doc.getContentType());
			IOUtils.copy(doc.getContent().getBinaryStream(), out);
			out.flush();
			out.close();
		
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

	@RequestMapping("/remove/{documentId}")
	public String remove(@PathVariable("documentId")
			Integer documentId) {
		
		documentService.remove(documentId);
		
		return "redirect:/index.html";
	}
	
}
