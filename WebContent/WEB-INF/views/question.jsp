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
	<title>NearGuru administrator-Question Dashboard</title>
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
                    <h2><a href="${pageContext.request.contextPath}/admin/addProduct/${productGroup.productGroupId}" title=""><i class="fa fa-arrow-circle-o-left"></i></a> Add Questions for <b>${product.productName}</b>  Product  </h2>
               </div> 
       		 </div>
		</div> 
			<c:url var="addAction" value="/admin/addQuestion/${product1}" ></c:url>
			<form:form action="${addAction}" commandName="question">
				 
				<hr/> 
				<div class="row" style="margin-top:20px;margin-bottom:50px"> 
					<div class="col-md-12">
						<label style="color: #1D4E64;font-size:40">Questions  List</label>
					</div>				
				</div> 
				<div class="row">
					<div class="form-group col-md-6">
					<b>Enter Question Description</b>
					<form:input class="form-control" path="queDesc" />
					</div>
					 
				</div>
				<div class="row">
					
					<div class="form-group col-md-6">
					<b>Enter Question Type</b>
						<form:select id="queType"  class="form-control" path="queType">
							  
						     		<li class="list-group-item"> <form:option value="checkbox" /><b>Checkbox</b></li>
						     		<li class="list-group-item"> <form:option value="dropdown" /><b>Drop Down</b></li>
						     		<li class="list-group-item"> <form:option value="textarea" /><b>text Area</b></li>
						     		<li class="list-group-item"> <form:option value="text" /><b>Text Box</b></li>
						     		<li class="list-group-item"> <form:option value="location" /><b>Location</b></li>
						     		<li class="list-group-item"> <form:option value="tolocation" /><b>Location</b></li>
	                           
					  </form:select>					
					</div>
				</div>
				<div class="row">					 
					<div class="form-group col-md-6">
					<form:checkbox path="queReq" value="required" /> <b>Is this Question Mandatory(if yes click  the checkbox)?</b> 		
					</div>
				</div>
				<div class="row"> 					 
					<div class="form-group col-md-6">
					 <b>Enter Max Length for TextBox and Text area only(Mandatory)</b> 
					<form:input class="form-control" path="maxLen" />		
					</div>
				</div>
				<div class="row"> 					 
					<div class="form-group col-md-6">
					 <b>Enter Unique Id for check box Questionries</b> 
					<form:input class="form-control" path="name_class" />  
					</div>
				</div>
				<div class="row"> 					 
					<div class="form-group col-md-6">
					 	<input type="submit" class="btn btn-primary" value="<spring:message text="Add Question"/>" />
					</div>
				</div>
				</form:form>   
			<hr/> 
			<div class="row" style="margin-top:20px;margin-bottom:50px"> 
					<div class="col-md-12">
						<label style="color: #1D4E64;font-size:40">Question  List for ${product.productName}  </label>
					</div>				
			</div>
			<c:if test="${!empty listQuestion}"> 
			 		<div class="row" style="margin-top:10px">  
						<div class="col-md-1" ><b><label style="color: #1D4E64;font-size:15 ">Question  Id</label></b></div>
						<div class="col-md-2" ><b><label style="color: #1D4E64;font-size:15 ">Question </label></b></div>
						<div class="col-md-1"><b><label style="color: #1D4E64;font-size:15 ">Question Type </label></b></div> 
						<div class="col-md-1"><b><label style="color: #1D4E64;font-size:15 ">Max Length </label></b></div>
						<div class="col-md-2"><b><label style="color: #1D4E64;font-size:15 ">Class Name </label></b></div> 
						<div class="col-md-1"><b><label style="color: #1D4E64;font-size:15 ">Add Option</label></b></div> 
						<div class="col-md-2"><b><label style="color: #1D4E64;font-size:15 ">Edit Question</label></b></div> 
						<div class="col-md-2" ><b><label style="color: #1D4E64;font-size:15 ">Delete Product </label></b></div>  
					</div> 
					<hr/> 
						 <c:forEach items="${listQuestion}" var="question">
						<div class="row" style="margin-top:10px;margin-bottom:10px"> 
								<div class="col-md-1" ><b>${question.queId}</b></div> 
								<div class="col-md-2" ><b>${question.queDesc}</b></div>
								<div class="col-md-1"><b>${question.queType} </b></div> 
								<div class="col-md-1"><b>${question.maxLen}</b></div> 
								 <div class="col-md-2"><b>${question.name_class}</b></div>
								<div class="col-md-1"><b><a href="${pageContext.request.contextPath}/admin/addOption/${question.queId}" class="btn btn-primary">Add Option</a></b></div> 
								<div class="col-md-2"><b><a href="${pageContext.request.contextPath}/admin/editQuestion/${question.queId}" class="btn btn-primary">Edit Question</a></b></div>  
								<div class="col-md-2" ><b><a href="${pageContext.request.contextPath}/admin/deleteQuestion/${question.queId}" class="btn btn-primary">Delete Question </a></b></div> 
						</div>
					</c:forEach>  
			 </c:if>  
		   
</div>


  


</body>
</html>