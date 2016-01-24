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
    <title>NearGuru - Your personal project service book</title>
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
        <link href="<c:url value="/assets/plugins/IconHoverEffects-master/css/component.css" />" rel="stylesheet" />
        <link href="<c:url value="/resources/assets/plugins/bootstrap/bootstrap.css" />" rel="stylesheet" />
        <link href="<c:url value="/resources/assets/css/about-achivements.css" />" rel="stylesheet" />
        <link href="<c:url value="/resources/assets/plugins/font-awesome/font-awesome.css" />" rel="stylesheet">    
         <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
        <link id="mainStyle" href="<c:url value="/resources/assets/css/vendor.css" />" rel="stylesheet" />
        <link rel="shortcut icon" href="<c:url value="/resources/assets/img/favicon.ico" />" />
        <script>
       
        $(document).ready(function () {
        	
        
        	var wrapSuccessError = '${wrapSuccessError.action}';
        	
        	if(wrapSuccessError!=' ')
        		{
        		
        		 $("#error").append("<div class="+"text-left"+">Your username or password was incorrect. If you have forgotten your password or have not created one, we can <a href="+"${pageContext.request.contextPath}/forgotPassword"+">email you a new one</a></div><br/>If you don't have an account, please <a href="+"${pageContext.request.contextPath}/signUp"+">sign up</a>");
        		}
            var intputElements = document.getElementsByTagName("INPUT");
            for (var i = 0; i < intputElements.length; i++) {
                intputElements[i].oninvalid = function (e) {
                    e.target.setCustomValidity("");
                    if (!e.target.validity.valid) {
                        if (e.target.validity.patternmismatch) {
                            e.target.setCustomValidity("The field 'Username' cannot be left blank");
                        }
                        else {
                            e.target.setCustomValidity(" ");
                        }
                    }
                };
            }
        });
        </script>
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
    
</head>
<body class="Site">

 <!-- HEADER SECTION -->
  <%@ include file="headerStatic.jsp" %>
 <div class="Site-content">
<section>
    <div class="container">
    
    	  <c:if test="${wrapSuccessError.suceess eq false }">

	
		 <div class="row" >
		<div class="col-xs-12 col-sm-4 col-sm-offset-4 col-md-5 col-md-offset-3">
		<div id="error" class="alert alert-danger  error-width  " role="alert">
		
		
		 </div>
	</div>
	</div>
	


</c:if>
    	
        <div class="row">
        
                  <div class="col-xs-12 col-sm-4 col-sm-offset-4 col-md-5 col-md-offset-3 login" >
                <div class="panel panel-success">
                    <div class="panel-heading ">Login to NearGuru</div>
                    <div class="panel-body">

                     <c:url var="verifyuser" value="/verifyuser" ></c:url>

<form:form id="signInForm" action="${verifyuser}" commandName="user">
                            <fieldset>
                                <div class="form-group">
                                    <label for="name">Email</label>
                                    <form:input path="emailId" type="email"  maxlength="50" class="form-control glowing-border"  oninvalid="setCustomValidity(' ')"   required="required"  />
                                  
                                </div>
                                <div class="form-group">
                                    <label for="con_password">Password</label> &nbsp; &nbsp;<div style="float:right"><a href="${pageContext.request.contextPath}/forgotPassword" title="">Forgot password</a></div>
                                     <form:input path="password"  maxlength="15"  type="password" class="form-control glowing-border"  oninvalid="setCustomValidity(' ')"   required="required"     />
                                  
                                </div>
                                
                                
                                <button id="loginBtn" class="btn btn-success" type="submit">Login</button><div style="float:right" > No Account ? <a href="${pageContext.request.contextPath}/signUp" title="">Sign Up</a></div>
                            </fieldset>
                       </form:form>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</section>

</div>
<!-- footer -->
<%@ include file="footer.jsp" %>

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
