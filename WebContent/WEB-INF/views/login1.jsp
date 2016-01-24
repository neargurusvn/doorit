<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <title>NearGuru - Hire a guru near you</title>
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
    <!-- <script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1037547222932116',
      xfbml      : true,
      version    : 'v2.5'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script> -->
<body >
<script>
/* 

  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
    	
    	//var accessToken = response.authResponse.accessToken;
      // Logged into your app and Facebook.
      testAPI();
    } else if (response.status === 'not_authorized') {
      // The person is logged into Facebook, but not your app.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    } else {
      // The person is not logged into Facebook, so we're not sure if
      // they are logged into this app or not.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into Facebook.';
    }
  }
//This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function checkLoginState() {
	
	  FB.getLoginStatus(function(response) {
		  if (response.status === 'connected') {
		    var accessToken = response.authResponse.accessToken;
		  } 
		} );
	
	
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
  FB.init({
    appId      : '1037547222932116',
    cookie     : true,  // enable cookies to allow the server to access 
                        // the session
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.2' // use version 2.2
  });

  // Now that we've initialized the JavaScript SDK, we call 
  // FB.getLoginStatus().  This function gets the state of the
  // person visiting this page and can return one of three states to
  // the callback you provide.  They can be:
  //
  // 1. Logged into your app ('connected')
  // 2. Logged into Facebook, but not your app ('not_authorized')
  // 3. Not logged into Facebook and can't tell if they are logged into
  //    your app or not.
  //
  // These three cases are handled in the callback function.

  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0]; 
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
   
    FB.api('/me', {fields: 'name,email'}, function(response) {
    	console.log(response);
    	 console.log('Successful login for: ' + response.name+"  " + response.email);
        console.log(JSON.stringify(response));
          
       
       // window.location.href="${pageContext.request.contextPath}/index";
       debugger;
        var loginData = { 
			      email : response.email,
			       name : response.name
			} 
        debugger;
         document.getElementById('status').innerHTML =
            'Your name and Email id : '+response.name +"    " + response.email +  '!'; 
        $.ajax({
	        type: "GET",
	        url: "${pageContext.request.contextPath}/test",
	        data: loginData,
	        success: function (result) {
	        	if (result=="redirect") {
	        	    window.location.replace("${pageContext.request.contextPath}/manageRequest");
	        	}
	        },
	        error: function (result) {
	            
	        	alert("errorrrrr"); 
	        	
	        }
	    });  
        
         
    });
    debugger;
    return response;
  }
    
    */
  

  
</script>
<!--
  Below we include the Login Button social plugin. This button uses
  the JavaScript SDK to present a graphical Login button that triggers
  the FB.login() function when clicked.
-->

<!-- <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
</fb:login-button> -->

<!--<div class="fb-login-button" data-max-rows="2" data-size="medium" data-show-faces="false" data-auto-logout-link="true"></div>

 <div id="status">
</div>
 -->
</body>
</head>
<body class="Site">

 <!-- HEADER SECTION -->
  <%@ include file="headerStatic.jsp" %>
    <div class="Site-content">
 
<section>
   
   <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-4 col-sm-offset-4 col-md-5 col-md-offset-3 login" >
                <div class="panel panel-success">
                    <div class="panel-heading ">Login to NearGuru </div>
                    
                    <div class="panel-body">
 
  <c:if test="${fn:contains(error, 'email')}">
  
  <div  class="alert alert-danger text-center">The email or password you entered is incorrect.</div>
  </c:if>
   
  <c:if test="${msg} "> 
  <div class="alert alert-success">${msg}</div> 
  </c:if>
<form method="post" id="login" action="<c:url value='j_spring_security_check' />">
                            <fieldset>
                            <div class="form-group "> 
                                   
                                  <!--  <div class="fb-login-button btn-lg" data-max-rows="2" data-size="medium" data-show-faces="false" data-auto-logout-link="true"></div>
                                   <div id="status"></div> -->
                                    
                                  
                             </div> 
                                <div class="form-group "> 
                                    <label for="name"><b>Email</b></label>
                                    <input type="text" name="username" class="form-control glowing-border"   required="required"  oninvalid="this.setCustomValidity('Please enter valid email')"  oninput="setCustomValidity('')"/> 
                                    
                                  
                                </div> 
                                <div class="form-group">
                                    <label for="con_password"><b>Password</b></label> &nbsp; &nbsp;<div style="float:right"><a  href="${pageContext.request.contextPath}/forgotPassword" title=""><b>Forgot password</b></a></div>
                                     <td><input type="password" name="password" class="form-control glowing-border"   required="required"  oninvalid="this.setCustomValidity('Please enter password')"  oninput="setCustomValidity('')"/>
                                  
                                </div>
                                 
                                
                                <button id="loginBtn" class="btn btn-success" type="submit">Login</button><div style="float:right" > No Account ? <a href="${pageContext.request.contextPath}/userRegistration" title=""><b>Sign Up</b></a></div> 
                            </fieldset>
                       </form>
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
