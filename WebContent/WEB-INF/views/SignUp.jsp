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
    <title>NearGuru- Sign Up </title>
    <meta name="description" content="I am a Professional & I want to hire professionals.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">   
    <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!-- MAIN STYLE SECTION-->
		<link rel="shortcut icon" href="<c:url value="/resources/assets/img/favicon.ico" />" />
		<link rel="shortcut icon" href="<c:url value="/resources/assets/img/favicon.ico" />" />
    	<link href="<c:url value="/resources/assets/plugins/isotope/isotope.css" />" rel="stylesheet" media="screen" />
        <link href="<c:url value="/resources/assets/plugins/fancybox/jquery.fancybox.css" />" rel="stylesheet" />
        <link href="<c:url value="/assets/plugins/IconHoverEffects-master/css/component.css" />" rel="stylesheet" />
        <link href="<c:url value="/resources/assets/plugins/bootstrap/bootstrap.css" />" rel="stylesheet" />
        <link href="<c:url value="/resources/assets/css/about-achivements.css" />" rel="stylesheet" />
        <link href="<c:url value="/resources/assets/plugins/font-awesome/font-awesome.css" />" rel="stylesheet">    
         <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
        <link id="mainStyle" href="<c:url value="/resources/assets/css/vendor.css" />" rel="stylesheet" />
       <style type="text/css">
       
        .btn-lg
        {
            padding-left:40px;
            padding-right:40px;
        }
    </style>
</head>
<body class="Site">

 <!-- HEADER SECTION -->
  <%@ include file="headerStatic.jsp" %>
 <div class="Site-content">
<section>
    <div class="container" style="margin-bottom:40px">
        <div class="row signup" >
            <div class="col-xs-12 col-sm-5 col-md-5 text-center" >
                <div class="sign">
                    <h3>I am a Professional</h3>
                    <p>Respond to customers request and get hired</p>
                    <a href="${pageContext.request.contextPath}/pros" class="btn btn-primary btn-lg">Sign Up</a>
                </div>
            </div>
            <div class="col-xs-12 col-sm-5 col-md-offset-2 col-md-5 text-center" >
                <div class="sign">
                    <h3>I want to hire professionals</h3>
                    <p>Get introduce to right professionals for your service need</p> 
                    <a href="${pageContext.request.contextPath}/userRegistration"  class="btn btn-primary btn-lg">Sign Up</a>
                </div>
            </div>
        </div>
    </div>
</section>



<!-- FOOTER SECTION-->
</div>
<%@ include file="footer.jsp" %>
<!-- END FOOTER SECTION-->




<script src="assets/js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
<script src="assets/js/jquery.js"></script>
<script src="assets/js/scrollReveal.js"></script>
    
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

    </body>
</html>
