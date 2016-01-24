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
    <title>Edit Profile</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">   
    <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!-- MAIN STYLE SECTION-->

    	<link href="<c:url value="/resources/assets/plugins/isotope/isotope.css" />" rel="stylesheet" media="screen" />
        <link href="<c:url value="/resources/assets/plugins/fancybox/jquery.fancybox.css" />" rel="stylesheet" />
        <link href="<c:url value="/assets/plugins/IconHoverEffects-master/css/component.css" />" rel="stylesheet" />
        <link href="<c:url value="/resources/assets/plugins/bootstrap/bootstrap.css" />" rel="stylesheet" />
        <link href="<c:url value="/resources/assets/css/about-achivements.css" />" rel="stylesheet" />
        <link href="<c:url value="/resources/assets/plugins/font-awesome/font-awesome.css" />" rel="stylesheet">    
         <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
        <link id="mainStyle" href="<c:url value="/resources/assets/css/vendor.css" />" rel="stylesheet" />
            <!-- END MAIN STYLE SECTION-->

    

</head>
<!-- END HEAD SECTION-->

<!-- BODY SECTION-->
<body>
  <!-- HEADER SECTION -->
  <%@ include file="header.jsp" %>
<br/>
 <ul class="nav nav-tabs">
            <li class="active"><a href="/EditProfile">Edit</a></li>
            <li><a href="VendorDetails.html">Preview</a></li>
            
          </ul>
 <section>
        <div class="row" style="margin-bottom:25px">
            <div class="col-md-12 bg-color">
               <div class="container">
                   <h2 class=""> <a href="#" title=""></a> Edit Profile </h2>
               </div>
           </div>

       </div>
   </section>

<div class="container"> 
        <!-- END HEADER SECTION -->
        <!--PAGE CONTENT--> 
        <!-- HOMEPAGE SECTION-->  
        <section id="section-welcome"  class="section " style="margin-top:20px;">
          <div class="container">
          <c:url var="image" value="/saveImage" ></c:url>
                                    <form:form action="${image}" commandName="image">
            <div class="row">
              
              <h3>  ${user.name} </h3>
              
              
              <div class="col-xs-12 col-sm-3 col-md-3">
                <div class="profile text-center">
                  <img src="<c:url value="/resources/assets/img/anil.jpg" />" class="avatar img-circle" alt="avatar">
                  <h5>Upload photo...</h5>
                  
                  <input type="file" class="form-control">
                  <form:input path="imageName"/>
                    <button type="submit"  class="btn btn-success">Create Account</button>
                </div>
              </div>
              
              
            
         
         
    
         
       </div>
       </form:form>
     </div>
    
    </section>
    
    </div>
    
<!-- footer -->
<%@ include file="footer.jsp" %>


<!-- MAIN SCRIPTS SECTION-->
			<script src="<c:url value="/resources/assets/js/modernizr-2.6.2-respond-1.1.0.min.js" />"></script>
        	<script src="<c:url value="/resources/assets/js/jquery.js" />"></script>
        
      		 <script src="<c:url value="/resources/assets/js/scrollReveal.js" />"></script>
       
	        <script src="assets/js/scrollReveal.js"></script>
	        <script>
	            window.scrollReveal = new scrollReveal(); //please put this script here to show animation at the time of scroll
	        </script>
	        
	        <script src="<c:url value="/resources/assets/js/jquery.easing.1.3.js" />"></script>
	        <script src="<c:url value="/resources/assets/plugins/bootstrap/bootstrap.min.js" />"></script>
	        <script src="<c:url value="/resources/assets/plugins/isotope/jquery.isotope.min.js" />"></script>
	        <script src="<c:url value="/resources/assets/plugins/fancybox/jquery.fancybox.pack.js" />"></script>
	        <script src="<c:url value="/resources/assets/js/jquery.localscroll-1.2.7-min.js" />"></script>
	        <script src="<c:url value="/resources/assets/js/jquery.appear.js" />"></script>
	        <script src="<c:url value="/resources/assets/scripts/main.js" />"></script>
	        <script src="<c:url value="/resources/assets/scripts/login.js" />"></script>

        <!--END MAIN SCRIPTS SECTION-->

    </body>

    <!--END  BODY SECTION-->
    </html>