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
	<title>NearGuru administrator-Edit Question</title>
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
                    <h2><a href="${pageContext.request.contextPath}/admin/addQuestion/${product.productId}" title=""><i class="fa fa-arrow-circle-o-left"></i></a>Edit  Question </h2>
               </div>
       		 </div>
		</div>
		<div class="row" style="margin-top:30px"> 
			<div class="col-md-12">  
			 
				<c:url var="UpdateQuestion" value="/admin/updateQuestion/${question.queId}" ></c:url>
				<form:form action="${UpdateQuestion}" commandName="question">
					<div class="form-group"> 
                       <label for="name"> <b>Question Description  </b></label>
                       <form:input     type="text" path="queDesc"  class="form-control"  />
                	 </div>
                 <div class="form-group"> 
                    <label for="name"> <b>Question Type  </b></label>
                     <form:select id="queType"  class="form-control" path="queType">
							  <li class="list-group-item"> <form:option value="checkbox" /><b>Checkbox</b></li>
						      <li class="list-group-item"> <form:option value="dropdown" /><b>Drop Down</b></li>
						      <li class="list-group-item"> <form:option value="textarea" /><b>text Area</b></li>
						      <li class="list-group-item"> <form:option value="text" /><b>Text Box</b></li>
						      <li class="list-group-item"> <form:option value="location" /><b>Location</b></li>
						     		<li class="list-group-item"> <form:option value="tolocation" /><b>Location</b></li>
	                 </form:select>	
                 </div>
                 <div class="form-group">                  
                 <form:checkbox path="queReq" value="required" /> <b>Is this Question Mandatory(if yes click  the checkbox)?</b> 		
                 </div>                
                <div class="form-group">
					 <b>Enter Max Length for TextBox and Text area only(Mandatory)</b> 
					<form:input class="form-control" path="maxLen" />		
				</div>
								  
					<div class="form-group ">
					 <b>Enter Unique Id for check box Questions</b> 
					<form:input class="form-control" path="name_class" />  
					</div> 
					 
					<button   class="btn btn-danger btn-lg">Update Question</button>
				</form:form>
				</div>
                 </div>
                  
			</div>
			
			
		</div>
			
		
</div>


  


</body>
</html>
