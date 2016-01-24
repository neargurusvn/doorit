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
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Create Normal Admin-NearGuru</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">   
    <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!-- MAIN STYLE SECTION-->
   
<script src="<c:url value="/resources/assets/js/jquery.js" />"></script>
  <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
        <script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
   		<script src="<c:url value="/resources/core/jquery.geocomplete.js" />"></script>
    	<link href="<c:url value="/resources/assets/plugins/isotope/isotope.css" />" rel="stylesheet" media="screen" />
        <link href="<c:url value="/resources/assets/plugins/fancybox/jquery.fancybox.css" />" rel="stylesheet" />
        
        <link href="<c:url value="/resources/assets/plugins/bootstrap/bootstrap.css" />" rel="stylesheet" />
        <link href="<c:url value="/resources/assets/css/about-achivements.css" />" rel="stylesheet" />
        <link href="<c:url value="/resources/assets/plugins/font-awesome/font-awesome.css" />" rel="stylesheet">    
         <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
        <link id="mainStyle" href="<c:url value="/resources/assets/css/vendor.css" />" rel="stylesheet" />
        <link rel="shortcut icon" href="<c:url value="/resources/assets/img/favicon.ico" />" />
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
    .login
        {
            margin-top:55px;
        }

        @media (max-width: 767px) {
            .login
            {
                margin-top:0px;
            }
        }
    
}
    </style>
    
  
     <script>
    
    function openFooterLinks(url)
    {  
    	   
    	 
    	 window.open("${pageContext.request.contextPath}/"+url);
    }
    
      /* function AllowSingleSpaceNotInFirstAndLast() {
        var obj = document.getElementById('username');
        obj.value = obj.value.replace(/^\s+|\s+$/g, "");
        var CharArray = obj.value.split(" ");
        if (CharArray.length > 3) {
            alert("User name NOT VALID");
            return false;
        }
        else {
            alert("User name VALID");
        }
        return true;
    }   */
   
    </script>
    <script>
    
    $(function(){
        var pp;
        $("#username").keydown(function(event){

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
     // alert("OK")
        $("#geocomplete").geocomplete({
          map: ".map_canvas",
          details: "form ul",
          detailsAttribute: "data-geo",
		  country: 'IN'
        });
                
      });
    //////////////////////////////////////////////////////////////////////////////////  
     
            // When the document is ready
         $(document).ready(function () {
        	 
        	 
        
        	 $( "#btnCreateAccount" ).click(function() {
        		 
        		 $('#userRes').attr('action', 'POST');
        		 $("#userRes").attr("action","/createUser");
        	 });
   
});
       
  //////////////////////////////////////////////oninvalid="InvalidMsg(this);///////////////////////////////////////     
    </script>
</head>
<body class="Site">

 <!-- HEADER SECTION -->
  <%@ include file="headerStatic.jsp" %>
    <div class="Site-content">

<section>
   
   
        <div class="row">
            <div class="col-xs-12 col-sm-4 col-sm-offset-4 col-md-5 col-md-offset-3 login" >
                <div class="panel panel-success">
                    <div class="panel-heading ">Create normal Administrator</div>
                    
                     <c:if test="${wrapSuccessError.suceess eq false }">

	
		<div id="SettingDiv" class="alert alert-danger  " role="alert">
		<center>${wrapSuccessError.action}</center>
		</div>
		

                          </c:if>
                    <div class="panel-body">
						<c:url var="addUser" value="/admin/createAdminUser" ></c:url>
 							<form:form action="${addUser}" id="userReg" commandName="user" >
                            <br>
                              <fieldset> 
                              <div class="form-group">   
                                <label for="name"> <b>Full Name </b></label> 
                                  	<form:input    required ="required" maxLength="30" id="username" name="username" type="text" path="name"  class="form-control glowing-border invalid"    oninvalid="this.setCustomValidity('Please enter  name')" oninput="setCustomValidity('')" />
                              </div>
                                <div id="mobile" class="form-group">
                                            <label> <b>Mobile</b> </label>  
                                            <form:input type="text" pattern="\d*"   required ="required"    id="mobileInput" maxlength="12" class="form-control invalid" path="mobile"  oninvalid="this.setCustomValidity('Please enter valid mobile number')" oninput="setCustomValidity('')"  />
                                          </div>    
                              <div class="form-group">   
                                 <label for="email"><b>Email</b></label>
                                 <form:input required ="required"  type="email" path="emailId"   class="form-control glowing-border invalid" maxlength="60"   oninvalid="this.setCustomValidity('Please enter valid email')" oninput="setCustomValidity('')" />
                              </div>
                                   
                           
                              <div class="form-group">
                                <label for="password"> <b>Create Password </b></label>
                                 	<form:input  required="required"  maxlength="15"  name="password" type="password" id="password" path="password"  class="form-control glowing-border invalid"  oninvalid="this.setCustomValidity('Please enter password')"   oninput="setCustomValidity('')" />
                              </div>
                            
                                 
                            
                              <br>
                              <button  id="btnCreateAccount"  class="btn btn-primary"  >Create</button>
                             <!-- <button  id="btnCreateAccount"  class="btn btn-primary" onclick="return AllowSingleSpaceNotInFirstAndLast();" >Create Account</button>   -->
                             </fieldset>  
                                
                          </form:form>
                    </div>
                    
                </div>
            </div>
        </div>
    
</section>

</div>
<!-- footer -->
<%@ include file="footer.jsp" %>
	<script src="<c:url value="/resources/assets/js/jquery.validate.js" />"></script>
		<script src="<c:url value="/resources/assets/js/jquery.easing.1.3.js" />"></script>
        <script src="<c:url value="/resources/assets/plugins/bootstrap/bootstrap.min.js" />"></script>
        <script src="<c:url value="/resources/assets/plugins/isotope/jquery.isotope.min.js" />"></script>
        <script src="<c:url value="/resources/assets/plugins/fancybox/jquery.fancybox.pack.js" />"></script>
        <script src="<c:url value="/resources/assets/js/jquery.localscroll-1.2.7-min.js" />"></script>
        <script src="<c:url value="/resources/assets/js/jquery.appear.js" />"></script>
        <script src="<c:url value="/resources/assets/scripts/main.js" />"></script>
        <script src="<c:url value="/resources/assets/scripts/login.js" />"></script>
</body>
</html>
