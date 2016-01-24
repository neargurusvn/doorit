package com.doorit.spring.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.doorit.spring.dao.DocumentDAO;
import com.doorit.spring.dao.ProsDAOImpl;
import com.doorit.spring.model.Document;
import com.doorit.spring.model.User;

@Service
public class DocumentServiceImpl implements DocumentService  {
	
	
	private static final Logger logger = LoggerFactory.getLogger(DocumentServiceImpl.class);

	@Autowired
	private DocumentDAO documentDAO;

	public void setDocumentDAO(DocumentDAO documentDAO) {
		this.documentDAO = documentDAO;
	}

	@Override
	@Transactional
	public List<Document> list() {
	
		logger.info(" retieve list of documents   -"+"method name - list  "+this.getClass().getSimpleName());
		
		return documentDAO.list();
	}

	@Override
	@Transactional
	public void save(MultipartFile file, Document document) {
		
		logger.info("save document   -"+"method name - save  "+this.getClass().getSimpleName());
		documentDAO.save(file, document);
		
	}

	@Override
	@Transactional
	public void saveUser(MultipartFile file, User document) {
	
		logger.info("save document   -"+"method name - saveUser  "+this.getClass().getSimpleName());
		documentDAO.saveUser(file, document);
	}

	@Override
	@Transactional
	public void saveQuote(MultipartFile file, Document document) {
		
		logger.info("save quote   -"+"method name - saveQuote  "+this.getClass().getSimpleName());
		documentDAO.saveQuote(file, document);
	}

	@Override
	@Transactional
	public User get(long id) {
		
		logger.info("get User by id    -"+"method name - get  "+this.getClass().getSimpleName());
		return documentDAO.get(id);
	}

	@Override
	@Transactional
	public void remove(Integer id) {
		
		logger.info("remove    -"+"method name - remove  "+this.getClass().getSimpleName());
		documentDAO.remove(id);
		
	}

	@Override
	@Transactional
	public Document getQuoteFile(long prosId, long requestId) {
		
		logger.info("get quote file    -"+"method name - getQuoteFile  "+this.getClass().getSimpleName());
		return documentDAO.getQuoteFile(prosId, requestId);
	}
	
	
	
	
}
