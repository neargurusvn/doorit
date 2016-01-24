package com.doorit.spring.service;

import java.util.List;

import com.doorit.spring.model.Reports;

public interface ReportService {

	public List<Reports> fetchRequests();

	public List<Reports> fetchUsers();

	public List<Reports> fetchVendors();

}
