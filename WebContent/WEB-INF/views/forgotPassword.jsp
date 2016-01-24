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
    <title>Forgot Password-NearGuru</title>
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
          <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>  
        <style type="text/css">
        .login
        {
            margin-top:55px;
        }
 input:focus:required:invalid { 
  
  border-color:red ;
  color:black;
  }
        @media (max-width: 767px) {
            .login
            {
                margin-top:0px;
            }
        }
    </style>
    <script>
    $(document).ready(function() {
    	
    	  $( "#btnsuccess" ).click(function() {  
  			
			  $("#success").hide();    
			
		});
    	  
    	  $( "#btnerror" ).click(function() {  
  			
			  $("#error").hide();    
			 
		});
    	
    });
    
    </script>
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
                    <div class="panel-heading ">Forgot password</div>
                    
                      <c:if test="${wrapSuccessError.suceess eq true }">
                      <c:if test="${usr.emailId ne null}"> 
						<div id="success" class="alert alert-success  " role="alert">
						    <a href="#" id="btnsuccess" class="close" data-dismiss="alert">&times;</a>	<center>${wrapSuccessError.action}</center>
						</div>
						</c:if> 	
						</c:if> 
						  <c:if test="${wrapSuccessError.suceess eq false }">
                     <c:if test="${usr.emailId ne null}"> 
						<div id="error" class="alert alert-danger" role="alert">
						    <a href="#" id="btnerror" class="close" data-dismiss="alert">&times;</a>	<center>${wrapSuccessError.action}</center>
						</div>
						</c:if> 
						</c:if> 	
						
                    <div class="panel-body">

                     <c:url var="forgotPassword" value="/forgotPassword" ></c:url>

<form:form action="${forgotPassword}" commandName="usr">
                            <fieldset> 
                                <div class="form-group">
                                    <label for="name"><b>Email</b></label> 
                                    <form:input path="emailId" type="email" required="required" class="form-control" oninvalid="this.setCustomValidity('Please enter valid email')" oninput="setCustomValidity('')"    />
                                  
                                </div>
                                
                                 
                                <button class="btn btn-success" type="submit">Submit</button> 
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
