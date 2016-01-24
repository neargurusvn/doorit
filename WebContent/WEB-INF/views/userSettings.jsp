<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<!-- HEAD SECTION-->
<head>
    <meta charset="utf-8">
    <title>${user.name} Settings-NearGuru</title>
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
        .list-group-item
        {
            border-radius:2px;
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
   		   
          <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
        <script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
   		<script src="<c:url value="/resources/core/jquery.geocomplete.js" />"></script>
   		   
	<script src="<c:url value="http://bassistance.de/jquery-plugins/jquery-plugin-validation/" />"></script>
	<script src="<c:url value="http://docs.jquery.com/Plugins/Validation/" />"></script>
	<script src="<c:url value="http://docs.jquery.com/Plugins/Validation/validate#toptions" />"></script>    
<script>

$(function(){
    var pp;
    $(" #address, #geocomplete, #username").keydown(function(event){

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



$(function() {
	var txt = $("#password");
	var func = function() {
		txt.val(txt.val().replace(/\s/g, ''));
	}
	txt.keyup(func).blur(func);
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
});
</script>
</head>
<!-- END HEAD SECTION-->

<!-- BODY SECTION-->
<body>

    <!-- HEADER SECTION -->

    <%@ include file="header.jsp" %>
      <section>
 <div class="container-fluid ">
        <div class="row" style="padding-bottom:30px">
            <div class="col-md-12  bg-color">
               <div class="container">
                   <h2 class=""> <a href="#" title=""></a> Settings </h2>
               </div>
           </div>
</div>
       </div>
   </section>
    <div class="container">   
        <!-- END HEADER SECTION -->
        <!--PAGE CONTENT--> 
        <!-- HOMEPAGE SECTION-->  
    
       

        <section class="section " >
            <div class="container">
                <div class="row ">
                <div class="col-xs-12 col-sm-6 col-md-6">
                 <c:url var="docs" value="/saveUserImg/${userSettings.userId}" />
				<form:form action="${docs}" commandName="userSettings" enctype="multipart/form-data" >
                
                 <div class="profile text-center">
                 
                
                 <c:choose>
                 <c:when test="${user.filename ne null}">
                 	 <img src="<c:url value="/download/${user.userId}" />" class="img-responsive img-circle" alt="avatar" >
                 </c:when>
                 <c:otherwise>
                  <img src="<c:url value="/resources/assets/img/imgPlace.jpg" />" class="img-responsive img-circle" alt="avatar" >
                 </c:otherwise>
                 </c:choose>
                 
                 
                 
                 
                  </br>
                
                 <input type="file" name="file" id="file"></input><br/>
                
                </div>
                 <button type="submit" class="btn btn-success "><i class="fa fa-save"></i>&nbspSave Changes</button> 
                </form:form>
                </div>  
                <br/>   
                    <div class="col-xs-12 col-sm-6 col-md-6" style="padding-top:20px">
                        <div class="panel panel-success">
                            <div class="panel-heading ">Edit personal info</div>
                            
                             <c:if test="${wrapSuccessError.suceess eq true }">

	 
		<div id="SettingDiv" class="alert alert-success  " role="alert">
		<center>${wrapSuccessError.action}</center>
		</div>
		


</c:if>

                            <div class="panel-body">
	
                                
                               <c:url var="userSettings" value="/saveUserSettings" ></c:url>

<form:form action="${userSettings}" commandName="userSettings">
                                    
                                    <fieldset>
                                        
                                        
                                            
                                            <form:hidden path="userId" class="form-control" value="${user.userId}"/>
										 
                                          
                                        
                                        
                                        <div class="form-group">
                                            <label for="name"><b>Full name</b></label>
                                            <form:input path="name"    maxlength="40"  required="required" class="form-control invalid" id="username"  oninvalid="this.setCustomValidity('Please enter name')" oninput="setCustomValidity('')"  />
										 
                                          
                                        </div>
                                        <div class="form-group">
                                            <label for="email"><b>Email</b></label>
									<form:input path="emailId"  type="email" maxlength="50" class="form-control invalid" required="required" oninvalid="this.setCustomValidity('Please enter valid email')" oninput="setCustomValidity('')"  />
                                          
                                        </div> 
                                        
                                        <div class="form-group">
                                            <label for="email"><b>Mobile</b></label>
										<form:input path="mobile" type="text" pattern="\d*"  class="form-control"  maxlength="12"  oninvalid="this.setCustomValidity('Please enter  valid mobile number')" oninput="setCustomValidity('')"   />
                                          
                                        </div>
                                          
                                         <div class="form-group"> 
                                            <label for="email"><b>Address</b></label>

                                            <form:input path="address" id="address"   maxlength="150" class="form-control"  />
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="email"><b>Locality</b></label> 

                                             <div class="map_canvas"></div> 
                                                <form:input id="geocomplete"   maxlength="60" class="form-control invalid" path="formatted_address"   placeholder="e.g Wakad,Kalyani Nagar,Aundh"  />
                                     		    
                                     		    <ul>
												 <form:hidden data-geo="lat"  path="lat" /> 
												 <form:hidden data-geo="lng" path="lng" />
										         <form:hidden data-geo="postal_code" path="postal_code" />
										         <form:hidden data-geo="locality" path="locality" />
												 <form:hidden data-geo="sublocality"  path="sublocality"/>
										         <form:hidden data-geo="country_short"  path="country" />
										         <form:hidden data-geo="administrative_area_level_1" path="State" />
										         </ul>
                                        </div>
                                        
                                         
                                        <button id="btnSettingDiv" class="btn btn-success" type="submit">Save Settings</button>
                                    </fieldset>
                               </form:form>
                            </div>

                        </div>
                    </div>
                                                         
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <div class="panel panel-success">
                            <div class="panel-heading ">Change password</div>
                            
                              <c:if test="${wrapSuccessErrorPassword.suceess eq true }">


		<div id="passwordDiv" class="alert alert-success  " role="alert">
		<center>${wrapSuccessErrorPassword.action}</center>
		</div>
		


</c:if> 

                            <div class="panel-body">
                            	<c:url var="password" value="/changePassword" ></c:url>
                                <form:form action="${password}" commandName="userSettings">
                                    <fieldset>                           
                                        <div class="form-group"> 
                                            <label for="name"><b>New Password</b></label> 
                                            <form:input  maxlength="15"   type="password" class="form-control invalid" path="password" id="password" required="required"  oninvalid="this.setCustomValidity('Please enter passowrd')"  oninput="setCustomValidity('')"/>
                                        </div>
                                        
                                        <button id="btnpasswordDiv" class="btn btn-success" type="submit"><i class="fa fa-save"></i>&nbspSave Password</button>
                                    </fieldset>
                                </form:form>
                            </div> 

                        </div> 
                    </div>
                    
                    
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <div class="panel panel-success">
                            <div class="panel-heading ">Communication</div>
                            
                             
                              <c:if test="${wrapSuccessErrorNotification.suceess eq true }">

	
		<div id="passwordDiv"class="alert alert-success  " role="alert">
		<center>${wrapSuccessErrorNotification.action}</center>
		</div>
		


</c:if>
                            <c:url var="notification" value="/saveNotification" ></c:url>
							<form:form action="${notification}" commandName="notification">
                            <div class="panel-body">
                               
                                    <fieldset>                      
                                        <ul class="list-group"> 
                                            <p> <b>Select if   you would like to hear from us by</b></p>
                                          
                                            <li class="list-group-item"><form:checkbox path="email" /> Job Related Emails </li>
                                             <li class="list-group-item"><form:checkbox path="sms"/> Job Related SMS</li> 
                                               <li class="list-group-item"><form:checkbox path="newsLetter" /> News Letter</li>
                                            <li class="list-group-item"><form:checkbox path="dailySummary" /> A daily summery of all job alerts</li>
                                            <li class="list-group-item"><form:checkbox path="jobMails" />  An alert for every new job</li>
                                        </ul>
                                        <button class="btn btn-success" type="submit"><i class="fa fa-save"></i>&nbspSave Settings</button>
                                    </fieldset>
                                
                            </div>
                            </form:form>
                        </div> 
                    </div>
                   
                </div>

            </div>


        </section>
        <section style="margin-bottom:20px;">
            <div class="row">
                <hr>
                <p>Want to close your account?
                    Call us 86000 23817 or email info@nearguru.com and we'll cancel your account.
                </p>
            </div>
        </section>

    </div>
    
    
<%@ include file="footer.jsp" %>




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


</div>
</body>

<!--END  BODY SECTION-->
</html>


