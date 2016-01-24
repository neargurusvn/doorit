<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
 <link rel="shortcut icon" href="<c:url value="/resources/assets/img/favicon.ico" />" />
  <link id="mainStyle" href="<c:url value="/resources/assets/css/vendor.css" />" rel="stylesheet" />
        <link rel="shortcut icon" href="<c:url value="/resources/assets/img/favicon.ico" />" />
          <link href="<c:url value="/resources/assets/plugins/font-awesome/font-awesome.css" />" rel="stylesheet">     
   <link href="<c:url value="/resources/assets/plugins/bootstrap/bootstrap.css" />" rel="stylesheet" />
	<title>Option Page-NearGuru</title>
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
                  <h2> <a href="${pageContext.request.contextPath}/admin/addQuestion/${question.product.productId}"  title=""><i class="fa fa-arrow-circle-o-left"></i></a> Add options for Question-<b>"${question.queDesc}" for product-${question.product.productName}</b></h2> 
               </div>
       		 </div>
		</div>
		 
		
			
		<c:url var="addAction" value="/admin/addOption/${question1}" ></c:url>
		<form:form action="${addAction}" commandName="option">
				<div class="row" style="margin-top:10px;margin-bottom:50px">
					 <div class="col-md-4">
					 	<form:label path="optId">
							<spring:message text="optId"/> 
						</form:label>
						<form:input path="optId" readonly="true" size="8"  disabled="true" />
						<form:hidden path="optId" />  
					 </div>
					 <div class="col-md-4">
					 	  <form:label path="optDesc">
							<spring:message text="optDesc"/>
						</form:label>
						<form:input path="optDesc" />  
					 </div>
					  <div class="col-md-4">
					 	  <input type="submit" class="btn btn-primary" value="<spring:message text="Add Option"/>" /> 							
					 </div> 
			</div>
			<hr/>   
			<c:if test="${!empty listOption}">
			    
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
						<div class="col-md-3" >	${option.optDesc}</div>  
						<div class="col-md-2">${option.optId}</div>
						<div class="col-md-1"><a href="${pageContext.request.contextPath}/admin/editOption/${option.optId}" class="btn btn-primary">Edit Option</a></div>
						<div class="col-md-1"><a href="${pageContext.request.contextPath}/admin/deleteOption/${option.optId}" class="btn btn-primary">Delete Option</a></div>
					</div>
				</c:forEach>
			
			</c:if>  
		</form:form>  
</div>


  


</body>
</html>
