
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
    <title>NearGuru- How It Works </title>
    <meta name="description" content="Brief your requirement and fill up the simple questionnaire to understand your need. We connect you to the relevant service providers.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">   
    <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!-- MAIN STYLE SECTION-->

    <link href="resources/assets/plugins/IconHoverEffects-master/css/component.css" rel="stylesheet" />
    <link href="resources/assets/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="resources/assets/css/about-achivements.css" rel="stylesheet" /> 
    <link rel="shortcut icon" href="<c:url value="/resources/assets/img/favicon.ico" />" />  
    <!--    <link id="mainStyle" href="../assets/css/fh.css" rel="stylesheet" /> -->
    <link id="mainStyle" href="resources/assets/css/vendor.css" rel="stylesheet" />

    <link href="resources/assets/plugins/font-awesome/font-awesome.css" rel="stylesheet"> 
    <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
    <link rel="shortcut icon" href="<c:url value="/resources/assets/img/favicon.ico" />" />  
    <!-- END MAIN STYLE SECTION-->
  <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
  <script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
	
	<script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
    <script src="<c:url value="/resources/core/jquery.geocomplete.js" />"></script>
	
	<link rel="shortcut icon" href="/resources/favicon.ico" type="image/x-icon"> 
	<style type="text/css">
	.h4{
	font-size:45px;
	font-style:normal;
	color:#3c7088;
	font-family:'Roboto', sans-serif;
	font-weight:500;
	line-height:1.1;  
	}
	.index-heading {  
    text-align: center;
    color:#1D4E64; 
    font-size:50px;
    text-transform:uppercase;   
}
 .index-content_li{
 
 font-size:20.8px;
 line-height:30.2px;
 padding-bottom:15px; 
 }  
	</style>
  <script>  
  
  $(document).ready(function() {
	  
	  $(function(){
	        $("#geocomplete").geocomplete({
	          map: ".map_canvas",
	          details: "form ul",
	          detailsAttribute: "data-geo",
			  country: 'IN'
	        });
	                
	      });
	  
  });
  </script>
</head>
<body style="line-height:1.8;">
 
<%@ include file="header.jsp" %>   
   <!-- HEADER SECTION -->  
   <section>
 <div class="container-fluid">
        <div class="row" style="margin-bottom:30px;"> 
            <div class="col-md-12 bg-color">
               <div class="container">
                   <h2 class="text-center">  HOW IT WORKS </h2>
               </div>
           </div>
</div>
       </div>
   </section>

<div>   

 <div class="container">
           
       
        <div class="row">
                  <div class="col-md-12">
                <article>
                    <div class="row" id="design">
                        <div class="col-md-4 col-md-offset-1">        
                            <div class="home-design-info text-center">       
                                <figure>
                                    <img alt="Post your need" style="width:70%;height:60%" src="<c:url value="/resources/assets/img/Post_your_need.PNG" />"  >
                                </figure>
                            </div>      
                        </div> <!-- 4 -->            
                         <div class="col-md-6">     
                            <div class="deets">      
                                <h2 class="text-primary"> <span style="background-color:#EF0D49;font-size:38px" class="badge">1</span> Post your need</h2> 
                                <p class="text-cont">
                                   Brief your requirement and fill up the simple questionnaire to understand your need. We connect you to the relevant service providers.

                                   
                                </p>  
                            </div>     
                        </div>     
                    </div> <!-- /row -->
                    <div class="row" id="develop">    
                        <div class="col-md-4 col-md-push-7">    
                            <div class="home-dev-info text-center">          
                                <figure>  
                                    <img alt="Compare and select service providers" style="margin-top:15%;width:70%;height:60%" src="<c:url value="/resources/assets/img/compareProsFrame.png" />">
                                </figure>
                            </div>  
                        </div> <!-- col -->    
                        <div class="col-md-6 col-md-pull-3">  
                            <div class="deets">
                                <h2 class="text-primary"><span style="background-color:#EF0D49;font-size:38px" class="badge">2</span>&nbsp;Compare and select service providers</h2>  
                                <p class="text-cont">
                                Relevant expert service providers will respond within couple of hours with their quotations. You have the list to select the best by comparing the quotes and the service providers. To help you select effectively we have special features:  
                             </p> 
                            <br/>       
                                <ul class="fa-ul">     
								<li><i class="fa-li fa fa-inr fa-2x text-info" ></i><p> Online quotation price  </p><br/></li>
								<li><i class="fa-li fa fa-pencil-square fa-2x text-info" ></i><p>Professional personal message </p><br/></li>
								<li><i class="fa-li fa fa-file fa-2x  text-info"></i> <p>Quotation as a attachment file </p><br/></li>
								<li><i class="fa-li fa fa-user fa-2x  text-info"></i> <p>Professional profile </p><br/></li>
								<li><i class="fa-li fa fa-comments-o fa-2x  text-info"></i> <p>Customers reviews </p><br/></li>
								</ul>
                             
                         </div>                          
                     </div> <!-- col -->      
                 </div> <!-- /row -->         
                 <div class="row" id="design" style="padding-bottom:30px">  
                    <div class="col-md-4 col-md-offset-1">
                        <div class="home-design-info text-center">    
                            <figure>   
                                <img alt="Hire the best" style="width:70%;height:60%" src="<c:url value="/resources/assets/img/hirebestFrame.PNG" />">
                            </figure>
                        </div>     
                    </div> <!-- 4 -->   
                    <div class="col-md-6">                     
                        <div class="deets">
                            <h2 class="text-primary"> <span  style="background-color:#EF0D49;font-size:38px" class="badge">3</span> Hire the best</h2> 
                            <p class="text-cont">
                             Decide by comparing the prices, reading reviews and asking questions to the provider. You get to hire the best for your service need.
                            </p>
                        </div>
                    </div>    
                </div> <!-- /row -->
            </article>
        </div>    
    </div>  
</div>  
        


<section>
    <div class="container" style="margin-bottom:50px;margin-top:20px">
        <div class="row">
        <div class="col-md-12"> 
            <center> 
                <label class="h4">Ready to give it a try?</label> &nbsp;&nbsp;   <a href="${pageContext.request.contextPath}/requetAService" class="btn btn-lg btn-danger ">Request a Service</a> 
            </center>
           
          </div> 
        </div>
    </div> 
</section>

 
</div>  
<!-- footer -->

<%@ include file="footer.jsp" %>


<script src="resources/assets/js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
<script src="resources/assets/js/jquery.js"></script>
<script src="resources/assets/js/scrollReveal.js"></script>

<script src="resources/assets/js/jquery.easing.1.3.js"></script>
<script src="resources/assets/plugins/bootstrap/bootstrap.min.js"></script>
<script src="resources/assets/plugins/isotope/jquery.isotope.min.js"></script>
<script src="resources/assets/plugins/fancybox/jquery.fancybox.pack.js"></script>
<script src="resources/assets/js/jquery.localscroll-1.2.7-min.js"></script>
<script src="resources/assets/js/jquery.appear.js"></script>
<script src="resources/assets/scripts/main.js"></script>
<script src="resources/assets/scripts/login.js"></script>


</body>
</html>

