<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
  <link id="mainStyle" href="<c:url value="/resources/assets/css/vendor.css" />" rel="stylesheet" />
        <link rel="shortcut icon" href="<c:url value="/resources/assets/img/favicon.ico" />" />
          <link href="<c:url value="/resources/assets/plugins/font-awesome/font-awesome.css" />" rel="stylesheet">     
   <link href="<c:url value="/resources/assets/plugins/bootstrap/bootstrap.css" />" rel="stylesheet" />
	<title>NearGuru administrator-Product Group</title>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
</head>
<body>

<div class="container"> 
		<div class="row">
			<div class="col-md-12">
				 <a href="${pageContext.request.contextPath}/index" class="navbar-brand"><img src="<c:url value="/resources/assets/img/logo.png" />" alt="Brand"></a>
				  <ul class="nav navbar-nav navbar-right"> 
				  	<li>
				  		<a href="${pageContext.request.contextPath}/signOut"><span class="fa fa-power-off"></span>Log Out</a>
				  		
				  	</li>
				  </ul>
			</div>		
		</div>
		<div class="row" style="margin-top:30px">
            <div class="col-md-12 bg-color">
               <div class="container"> 
           
               <c:if test="${user.emailId eq 'info@nearguru.com'}"> 
                    <h2> Add Product Group</h2>
                 </c:if> 
               </div>
       		 </div>
		</div>
		
			
		<c:url var="addAction" value="/admin/productGroup/add" ></c:url>
		<form:form action="${addAction}" commandName="productGroup">
		<c:if test="${user.emailId eq 'info@nearguru.com'}">
				<div class="row bg-color" style="margin-top:50px;margin-bottom:50px">
				 
				  
					 <div class="col-md-5">
					 	<b> Enter Product Group Name :</b>
						<form:input required="required" path="productGroupName" /> 
					</div>
					 <div class="col-md-5">
					 	<b> Enter Description about Product Group : </b>
							<form:input required="required" path="productGroupDesc"  />
					</div>
					 <div class="col-md-2"> 
					 		<input type="submit" class="btn btn-primary" value="<spring:message text="Add Product Group"/>" />
					</div>
					
				</div>
				<hr/>  
				</c:if> 
				<div class="row" style="margin-top:20px;margin-bottom:50px"> 
					<div class="col-md-6">
						<label style="color: #1D4E64;font-size:40">Product Group Details</label> 
					</div>	
					   
						<div class="col-md-3">  
							 <a href="${pageContext.request.contextPath}/admin/fetchRequests" class="btn btn-lg btn-danger ">View Reports</a>
						</div> 
						<c:if test="${user.emailId eq 'info@nearguru.com'}">
						<div class="col-md-3">  
							 <a href="${pageContext.request.contextPath}/admin/adminUser" class="btn btn-lg btn-danger ">Create Admin</a>
						</div> 
						</c:if>
						<%-- <div class="col-md-3">   
							 <a href="${pageContext.request.contextPath}/admin/marketingPanel" class="btn btn-lg btn-danger ">Marketing Panel</a>
						</div>		 --%>		
				</div> 
				<c:if test="${user.emailId eq 'info@nearguru.com'}">
			 <c:if test="${!empty listProductGroup}">
			 		<div class="row" style="margin-top:10px">  
						<div class="col-md-1" ><b><label style="color: #1D4E64;font-size:15 ">Product Grp Id</label></b></div>
						<div class="col-md-1" ><b><label style="color: #1D4E64;font-size:15 ">Product Grp Name</label></b></div>
						<div class="col-md-2"><b><label style="color: #1D4E64;font-size:15 ">Product Grp Description</label></b></div> 
						<div class="col-md-2"><b><label style="color: #1D4E64;font-size:15 ">Add sub Product</label></b></div> 
						<div class="col-md-2"><b><label style="color: #1D4E64;font-size:15 ">Edit Product Group</label></b></div> 
						<div class="col-md-2" ><b><label style="color: #1D4E64;font-size:15 ">Delete Product Group</label></b></div>
						<div class="col-md-2" ><b><label style="color: #1D4E64;font-size:15 ">Visible</label></b></div>  
					</div> 
					<hr/>
					<c:forEach items="${listProductGroup}" var="productGroup">
						<div class="row" style="margin-top:10px;margin-bottom:10px"> 
								<div class="col-md-1" ><b>${productGroup.productGroupId}</b></div>
								<div class="col-md-1" ><b>${productGroup.productGroupName}</b></div> 
								<div class="col-md-2" ><b>${productGroup.productGroupDesc}</b></div> 
								<div class="col-md-2" ><a class="btn btn-primary" href="<c:url value='/admin/addProduct/${productGroup.productGroupId}' />" >Add Sub Product </a></div>
								<div class="col-md-2" ><a class="btn btn-primary" href="<c:url value='/admin/editProductGroup/${productGroup.productGroupId}' />" >Edit Product Group </a></div>
								<div class="col-md-2" ><a class="btn btn-primary"  href="<c:url value='/admin/deleteProductGroup/${productGroup.productGroupId}' />" >Delete Product Group </a></div>
								<div class="col-md-2">   
								       
				 <c:if test="${productGroup.isActive eq ISNULL || productGroup.isActive eq 'Y'  }">  
								<a  href="${pageContext.request.contextPath}/admin/visibleProductGroup/${productGroup.productGroupId}/Y"  style="width:80%" class="btn btn-success">NO</a>
                </c:if>  <br/>
							
							<%--  <c:if test="${productGroup.isActive eq 'N'  }"> 
								<a  href="${pageContext.request.contextPath}/admin/visibleProductGroup/${productGroup.productGroupId}/N"  style="width:80%" class="btn btn-success">YES</a>
							 </c:if> --%>
							</div>   
						</div>
					</c:forEach>  
			 </c:if>    
			 </c:if>
			  <c:if test="${empty listProductGroup}"> 
			  		<div class="row" style="margin-top:10px;margin-bottom:10px"> 
						<div class="col-md-12">
							<label class="text-error" style="color: #1D4E64;font-size:10">No Data Exists</label>
						</div>				
				</div> 
			  </c:if>
			<%-- <c:if test="${!empty productGroup.productGroupName}">
			    
				<div class="row" style="margin-top:10px">  
					<div class="col-md-4" ><b><label style="color: #1D4E64;font-size:25 ">Question</label></b></div>
					<div class="col-md-3" ><b><label style="color: #1D4E64;font-size:25 ">Option</label></b></div>
					<div class="col-md-2"><b><label style="color: #1D4E64;font-size:25 ">Option Id</label></b></div> 
					<div class="col-md-1"><b><label style="color: #1D4E64;font-size:25 ">Edit</label></b></div> 
					<div class="col-md-1" ><b><label style="color: #1D4E64;font-size:25 ">Delete</label></b></div>  
				</div>
				<c:forEach items="${listOption}" var="option">    
					<div class="row" style="margin-top:10px"> 
						<div class="col-md-4" >${question.queDesc}</div>
						<div class="col-md-3" >	${option.optDesc}</div>   /admin/deleteOption/${option.optId}
						<div class="col-md-2">${option.optId}</div>
						<div class="col-md-1"><a href="#" class="btn btn-success">Edit</a></div>
						<div class="col-md-1"><a href="${pageContext.request.contextPath}/admin/deleteOption/${option.optId}" class="btn btn-success">Delete</a></div>
					</div>
				</c:forEach>
			
			</c:if>   --%>
		</form:form>   
</div>


  


</body>
</html>
