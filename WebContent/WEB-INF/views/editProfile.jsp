	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>


<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"u> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<!-- HEAD SECTION--> 
<head>
    <meta charset="utf-8">
    <title>${user.name} Profile-Edit-NearGuru</title>
         
       
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">   
        <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
        <!-- MAIN STYLE SECTION-->
		<link rel="shortcut icon" href="<c:url value="/resources/assets/img/favicon.ico" />" />
        <link href="<c:url value="/resources/assets/plugins/isotope/isotope.css" />" rel="stylesheet" media="screen" />
        <link href="<c:url value="/resources/assets/plugins/fancybox/jquery.fancybox.css" />" rel="stylesheet" />
        <link href="<c:url value="/assets/plugins/IconHoverEffects-master/css/component.css" />" rel="stylesheet" />
        <link href="<c:url value="/resources/assets/plugins/bootstrap/bootstrap.css" />" rel="stylesheet" />
        <link href="<c:url value="/resources/assets/css/about-achivements.css" />" rel="stylesheet" />
        <link href="<c:url value="/resources/assets/plugins/font-awesome/font-awesome.css" />" rel="stylesheet">    
         <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
        <link id="mainStyle" href="<c:url value="/resources/assets/css/vendor.css" />" rel="stylesheet" />
                
        
                
                <!-- END MAIN STYLE SECTION-->
       
         <style type="text/css">

  
  input:required:valid {
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAepJREFUeNrEk79PFEEUx9/uDDd7v/AAQQnEQokmJCRGwc7/QeM/YGVxsZJQYI/EhCChICYmUJigNBSGzobQaI5SaYRw6imne0d2D/bYmZ3dGd+YQKEHYiyc5GUyb3Y+77vfeWNpreFfhvXfAWAAJtbKi7dff1rWK9vPHx3mThP2Iaipk5EzTg8Qmru38H7izmkFHAF4WH1R52654PR0Oamzj2dKxYt/Bbg1OPZuY3d9aU82VGem/5LtnJscLxWzfzRxaWNqWJP0XUadIbSzu5DuvUJpzq7sfYBKsP1GJeLB+PWpt8cCXm4+2+zLXx4guKiLXWA2Nc5ChOuacMEPv20FkT+dIawyenVi5VcAbcigWzXLeNiDRCdwId0LFm5IUMBIBgrp8wOEsFlfeCGm23/zoBZWn9a4C314A1nCoM1OAVccuGyCkPs/P+pIdVIOkG9pIh6YlyqCrwhRKD3GygK9PUBImIQQxRi4b2O+JcCLg8+e8NZiLVEygwCrWpYF0jQJziYU/ho2TUuCPTn8hHcQNuZy1/94sAMOzQHDeqaij7Cd8Dt8CatGhX3iWxgtFW/m29pnUjR7TSQcRCIAVW1FSr6KAVYdi+5Pj8yunviYHq7f72po3Y9dbi7CxzDO1+duzCXH9cEPAQYAhJELY/AqBtwAAAAASUVORK5CYII=);
    background-position: right top;
    background-repeat: no-repeat;
  }
input:focus:required:invalid {
  
  border-color:red ;
  color:black;
  }
</style>
        <style type="text/css">
            .btn-lg
            {
                width:100%;
            }
             input:required:valid {
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAepJREFUeNrEk79PFEEUx9/uDDd7v/AAQQnEQokmJCRGwc7/QeM/YGVxsZJQYI/EhCChICYmUJigNBSGzobQaI5SaYRw6imne0d2D/bYmZ3dGd+YQKEHYiyc5GUyb3Y+77vfeWNpreFfhvXfAWAAJtbKi7dff1rWK9vPHx3mThP2Iaipk5EzTg8Qmru38H7izmkFHAF4WH1R52654PR0Oamzj2dKxYt/Bbg1OPZuY3d9aU82VGem/5LtnJscLxWzfzRxaWNqWJP0XUadIbSzu5DuvUJpzq7sfYBKsP1GJeLB+PWpt8cCXm4+2+zLXx4guKiLXWA2Nc5ChOuacMEPv20FkT+dIawyenVi5VcAbcigWzXLeNiDRCdwId0LFm5IUMBIBgrp8wOEsFlfeCGm23/zoBZWn9a4C314A1nCoM1OAVccuGyCkPs/P+pIdVIOkG9pIh6YlyqCrwhRKD3GygK9PUBImIQQxRi4b2O+JcCLg8+e8NZiLVEygwCrWpYF0jQJziYU/ho2TUuCPTn8hHcQNuZy1/94sAMOzQHDeqaij7Cd8Dt8CatGhX3iWxgtFW/m29pnUjR7TSQcRCIAVW1FSr6KAVYdi+5Pj8yunviYHq7f72po3Y9dbi7CxzDO1+duzCXH9cEPAQYAhJELY/AqBtwAAAAASUVORK5CYII=);
    background-position: right top;
    background-repeat: no-repeat;
  }
input:focus:required:invalid {
  
  border-color:red ;
  color:black;
  }
            
        </style>
        <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
        <script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
   		<script src="<c:url value="/resources/core/jquery.geocomplete.js" />"></script>
   		   
	<script src="<c:url value="http://bassistance.de/jquery-plugins/jquery-plugin-validation/" />"></script>
	<script src="<c:url value="http://docs.jquery.com/Plugins/Validation/" />"></script>
	<script src="<c:url value="http://docs.jquery.com/Plugins/Validation/validate#toptions" />"></script>
        
  <script>
  
  $(function(){
      var pp;
      $("#companyName, #companyWebsite, #companyProfile, #address, #geocomplete, #yearofEstablish").keydown(function(event){

      if(($(this).val().length)==0 && event.keyCode==32)
      {
      return false;
      }
     })
      .keyup(function(event)
     {
      pp = $(this).val();
      if(pp.charAt(0)==' ')
     {
     var pbb = $.trim(pp);
     $(this).val(pbb);
     }
      });
      });
  
  
  
  $(function(){
      $("#geocomplete").geocomplete({
        map: ".map_canvas",
        details: "form ul",
        detailsAttribute: "data-geo",
		  country: 'IN'
      });
              
    });
      $( document ).ready(function() {
    	  
    	  
    	  
    	 
    	   
    	  $( "#btnUpdateServices").click(function() {
    			
    		  
    		 
    	  		 var invalidCheckboxes=document.getElementsByClassName("invalidchecbox");
    	  	  
    	  	  	var ln = 0;
    	  	  	for(var i=0; i< invalidCheckboxes.length; i++) {
    	  	  		
    	  	  		
    	  	  	    if(invalidCheckboxes[i].checked)
    	  	  	        ln++;
    	  	  	   
    	  	  	}
    	  	  if(ln<1){ 
	  	  	    	
	  	  	    	$("#SettingDiv").hide(); 
	  	  	    alert("Please select atleast one service you provide");
	  	  	    	return false;
	  	  	    }
    	  	  	
    	});   
    	 
     
    	 /*  var intputElements = document.getElementsByClassName("invalid");
  	    for (var i = 0; i < intputElements.length; i++) {
  	        intputElements[i].oninvalid = function (e) {
  	            e.target.setCustomValidity("");
  	            if (!e.target.validity.valid) {
  	                if (e.target.name == "username") {
  	                    e.target.setCustomValidity("The field 'Username' cannot be left blank");
  	                }
  	                else {
  	                    e.target.setCustomValidity(" ");
  	                }
  	            }
  	        };
  	    } */ 
    	  var bussinessType = '${prosProfile.bussinessType}';
    	var bussinessDistance= '${prosProfile.bussinessDistance}';
  	
  	  if(bussinessType== 'TTOC') {
  		
  		 $('#bussinessDistance').show();
  		
  	}
  	  if(bussinessType== 'NEITHER') {
  		 
   		 $('#bussinessDistance').hide();
   		
    	}
 if( bussinessType== 'CTOM') {
  		 
   		 $('#bussinessDistance').hide();
   		
    	}
  	    $('#TTOC').click(function(){
  	    	  $('#bussinessDistance').show();
  	    	  });
  	    $('#CTOM').click(function(){
	    	  $('#bussinessDistance').hide();
	    	  });
  	    $('#NEITHER').click(function(){
	    	  $('#bussinessDistance').hide();
	    	  });
  	});
     
     
   
    </script>
	
	
		
		
		
	
	      
          <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
        <script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
   		<script src="<c:url value="/resources/core/jquery.geocomplete.js" />"></script>
   		   
	<script src="<c:url value="http://bassistance.de/jquery-plugins/jquery-plugin-validation/" />"></script>
	<script src="<c:url value="http://docs.jquery.com/Plugins/Validation/" />"></script>
	<script src="<c:url value="http://docs.jquery.com/Plugins/Validation/validate#toptions" />"></script> 
    <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!-- MAIN STYLE SECTION-->

    	
</head>
<!-- END HEAD SECTION-->

<!-- BODY SECTION-->
<body>
  <!-- HEADER SECTION -->
  <%@ include file="header.jsp" %>
<br/>
<div class="container-fluid" style="margin-bottom:20px">
 <ul class="nav nav-tabs">
 	<c:choose>
 			<c:when test="${navigationWrapper.editProfile eq 'EP' }">
 			 <li class="active"><a href="${pageContext.request.contextPath}/editProfile">Edit</a></li>
 			</c:when>
 			<c:otherwise>
 			 <li><a href="${pageContext.request.contextPath}/editProfile">Edit</a></li>
 			</c:otherwise>
 		</c:choose>
 		<c:choose>
 			<c:when test="${navigationWrapper.editProfile eq 'VP' }">
 			   <li><a class="active" href="${pageContext.request.contextPath}/viewProfile/${prosProfile.user.userId}">Preview</a></li>
 			</c:when>
 			<c:otherwise>
 			   <li><a href="${pageContext.request.contextPath}/viewProfile/${prosProfile.user.userId}">Preview</a></li>
 			</c:otherwise>
 		</c:choose>
           
            
          </ul>
  </div>
   <section>
         <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 bg-color">
               <div class="container">
                   <h2 class="">  Edit profile</h2>
               </div>
           </div>

       </div>
       </div>
       </section>


<section>
	<div class="container">
			<div class="row">
				<div class="col-md-12">
						  <h3>  ${user.name} </h3>
				</div>
			
			</div>
			<div class="row">
				<div class="col-md-6">
						   <div class="panel panel-success">
						   		  <div class="panel-heading ">Edit your profile</div>
						   		  	  <c:if test="${wrapSuccessError.suceess eq true }">
						   		  	  	<div id="SettingDiv" class="alert alert-success  " role="alert">
											<center>${wrapSuccessError.action}</center>
										</div>	
									</c:if>
									 <div class="panel-body text-left">
									 	   <c:url var="saveEditProfile" value="/saveEditProfile" ></c:url>
									 	   <form:form action="${saveEditProfile}" commandName="prosProfile">
											<form:hidden value="${userId}" path="user.userId"></form:hidden>
 										         <div class="form-group"> 
                                           			 <label><b>Company Name </b> </label>
                                           			 <form:input  type="text" required="required"  maxlength="50" class="form-control invalid" path="companyName" id="companyName" oninvalid="this.setCustomValidity('Please enter  company name')" oninput="setCustomValidity('')" />                                          
                                       			 </div>
                                       		 	<div class="form-group">
                                            		<label><b>Company website </b> </label>
                                            		<form:input  maxlength="100" class="form-control " path="website" id="companyWebsite"/>                                          
                                       		 	</div>
                                        		<div class="form-group">
                                               		 <label><b>Company profile</b></label>
                                                	<form:textarea class="col-xs-12"   maxlength="500"    path="companyProfile" id="companyProfile" rows="4" cols="62" />
                                               </div>
                                            	<div class="form-group">
                                               		 <label><b> Address</b></label>
                                                	<form:input  maxlength="150"   path="user.address" class="form-control" id="address" />
                                           	   </div>
                                              <div class="form-group">
                                                 <label><b>Locality</b></label>
                                             	 <div class="map_canvas"></div>
                                                   <form:input id="geocomplete"  maxlength="60"  required ="required" type="text" class="form-control invalid" path="user.formatted_address" oninvalid="this.setCustomValidity('Please enter  locality')" oninput="setCustomValidity('')" />
                                     		   	  <ul>
												 	<form:hidden data-geo="lat"  path="user.lat" /> 
													 <form:hidden data-geo="lng" path="user.lng" />
										        	 <form:hidden data-geo="postal_code" path="user.postal_code" />
										       		  <form:hidden data-geo="locality" path="user.locality" />
													 <form:hidden data-geo="sublocality"  path="user.sublocality"/>
										      		   <form:hidden data-geo="country_short"  path="user.country" />
										      		   <form:hidden data-geo="administrative_area_level_1" path="user.State" />
										        </ul>
                                     		</div>
                                           
                                            
                                       <%--  <div class="form-group">
                                            <label><b>3. Where do you do business</b></b></label>                                   
                                        </div>
                                        <hr/>
                                        <div class="form-group">
                                                <span >
                                                 <form:radiobutton id="TTOC" path="bussinessType" value="TTOC"/>
                                                </span>
                                                <span >
                                                I travel to my customers
                                                </span>
                                         </div>
                                        
                                        <div class="form-group">
                                                <span >
                                                     <form:radiobutton id="CTOM" path="bussinessType" value="CTOM"/>
                                                </span>
                                                <span >
                                                My customers travel to me
                                                </span>
                                         </div>
                                        
                                        <div class="form-group">
                                                <span >
                                                    <form:radiobutton id="NEITHER" path="bussinessType" value="NEITHER"/>
                                                </span>
                                                <span >
                                                Neither (phone or Internet only)
                                                </span>
                                         </div>
                                         <div id="bussinessDistance">
                                         <p>how far you willing to travel</p>
                                         <div class="form-group">
                                            <form:select  class="form-control" path="bussinessDistance">
							    			<form:option value="10" label="10 Km"/>
						     				<form:option value="20" label="20 Km"/>
						     				<form:option value="50" label="50 Km"/>
						     				<form:option value="greater than 50" label=">50 Km"/>
							  			</form:select>
                                        </div>
                                        </div> --%>
                                         <div class="form-group">
                                           			 <label><b>Year of establishment </b> </label>
                                           			 <form:input id="yearofEstablish"   maxlength="4" class="form-control" path="yearOfEstablishment" />                                          
                                       	</div>
                                       	  
                                       	  
                                       	  
                                   			 <div class="form-group" > 
                     							 <div class="col-lg-8">
                      							  <button type="submit"  id="btnUpdateProfile" class="btn btn-success "><i class="fa fa-save"></i>&nbspSave Changes</button>
                     						 </div>
                  						  </div>                 
                 				 </form:form>
									 </div>
						   </div> 
				</div>
			<div class="col-md-6">
						  <div class="panel panel-success">
						  		  <div class="panel-heading " id="services-h">Services <i style="font-size:14px;" class="fa fa-chevron-down pull-right"></i></div>
						  		  
						  		   <c:if test="${wrapSuccessServices.suceess eq true }">
						   		  	  	<div id="SettingDiv" class="alert alert-success  " role="alert">
											<center>${wrapSuccessServices.action}</center>
										</div>	
									</c:if>
						  		      <div class="panel-body " id="services-b">
                 							  <c:url var="updateServices" value="/updateServices" ></c:url>
											  <form:form action="${updateServices}" commandName="prosProfile"> 
											  	 <ul class="list-group"> 
 													 <c:forEach var="map" items="${listProductGroup}"> 
  														 <c:if test="${map.value.isActive eq 'Y'  }">
  														 <c:if test="${map.value.listed eq true}">  
     														 <li class="list-group-item"><form:checkbox class="invalidchecbox"  checked="checked" path="ListedIn" value="${map.key}"/>&nbsp;${map.value.productGroupName}
      													 </c:if>
    													 <c:if test="${map.value.listed eq false}">
     													 <li class="list-group-item">     <form:checkbox   class="invalidchecbox"  path="ListedIn" value="${map.key}"/>&nbsp;${map.value.productGroupName}</li> 
    													 </c:if>
    													</c:if>
	    											</c:forEach>
												</ul> 
                 								<button type="submit" id="btnUpdateServices" class="btn btn-success "><i class="fa fa-save"></i>&nbspSave Services</button> 
            								 </form:form>
             						</div>
						  </div>
				</div>
			</div>
	</div>
</section>
<!-- footer -->

<%@ include file="footer.jsp" %>
    <!-- MAIN SCRIPTS SECTION-->
            <script src="<c:url value="/resources/assets/js/modernizr-2.6.2-respond-1.1.0.min.js" />"></script>
        	
      		 <script src="<c:url value="/resources/assets/js/scrollReveal.js" />"></script>
       
	        <script src="assets/js/scrollReveal.js"></script>
	        <script>
	          //  window.scrollReveal = new scrollReveal(); //please put this script here to show animation at the time of scroll
	        </script>
	        
	       
	        <script src="<c:url value="/resources/assets/plugins/bootstrap/bootstrap.min.js" />"></script>
	        
	        <script src="<c:url value="/resources/assets/plugins/fancybox/jquery.fancybox.pack.js" />"></script>
	        
	       
	        <script src="<c:url value="/resources/assets/scripts/main.js" />"></script>
	        <script src="<c:url value="/resources/assets/scripts/login.js" />"></script>
	        
	       

            <!--END MAIN SCRIPTS SECTION-->

    </body>

    <!--END  BODY SECTION-->
    </html>