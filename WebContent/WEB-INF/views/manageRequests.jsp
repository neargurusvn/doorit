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
<head >
    <meta charset="utf-8">
    <title>${user.name} Requests Dashboard-NearGuru</title>
    <meta name="description" content="">
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
            <!-- END MAIN STYLE SECTION-->

    <style type="text/css" media="screen">
        .fa-edit,.fa-gavel,.fa-calendar,.fa-ellipsis-v,.fa-smile-o
        {
            color:#3c7088;
        }
        .badge
        {
            background-color:#EF0D49;
        }
        .fixed-height{
        	height:360px;
        }
    </style>

</head>
<!-- END HEAD SECTION-->

<!-- BODY SECTION-->
 <body class="Site">
  <!-- HEADER SECTION -->
  
  <%@ include file="header.jsp" %>
<br/>
 <div class="Site-content">
 <section>
 <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 bg-color">
               <div class="container">
                   <h2 class=""> <a href="#" title=""></a> Manage Requests </h2>
               </div>
           </div>
</div>
       </div>
   </section>
<div class="container">
    <!-- END HEADER SECTION -->

    <!--  MANAGE FEATURES -->
  <c:if test="${not empty manageRequests  }">
   <c:if test="${requestType eq 'IP' }">
   <div class="row" style="margin-top:10px">
					<div class="col-md-12">
					  
						<div class="alert alert-success">
							<label class="text-info">In a couple of hours we will send you interested service provider's quotation, profile, their expertise and reviews. You can compare and select as per your specific need very easily. You get to hire the best!</label>
						</div>
					</div>
			</div>
</c:if>
   <c:if test="${requestType eq 'WIP' }"> 
   <div class="row" style="margin-top:10px">
					<div class="col-md-12">
					  
						<div class="alert alert-success">
							<label class="text-info">Congratulations! You have hired a service provider for below requirements.</label>
						</div>
					</div>
			</div>
</c:if>

</c:if>  
  <section class="" style="margin-bottom:20px;margin-top:10px">
    <div class="container">

			
        <div class="row">
        <c:if test="${ empty manageRequests }"> 
        <c:choose>
        	<c:when test="${requestType eq 'IP' }">
        			 <div class="text-center bg-info text-info" style="height:60px;">       
   						<h4 style="padding-top:20px;padding-bottom:15px">You don't have any active requests.</h4>   
  					 </div> 
        	</c:when>
        	<c:when test="${requestType eq 'WIP' }">
        			<div class="text-center bg-info text-info" style="height:60px;">       
   						<h4 style="padding-top:20px;padding-bottom:15px">You are not yet hired. Keep going!</h4>   
  					 </div> 
        	</c:when>
        	<c:when test="${requestType eq 'OLD' }">
        			<div class="text-center bg-info text-info" style="height:60px;">       
   						<h4 style="padding-top:20px;padding-bottom:15px">You don't have any archived requests.</h4>   
  					 </div> 
        	</c:when>
        	<c:otherwise>
        			 <div class="text-center bg-info text-info" style="height:60px;">       
   						<h4 style="padding-top:20px;padding-bottom:15px">You don't have any active requests.</h4>   
  					 </div>  
        	</c:otherwise>
        	
        </c:choose>
        </c:if>
	  <c:forEach var="requests" items="${manageRequests}">  
            <div class="col-xs-12 col-sm-3 col-md-4" >
                <div class="panel panel-default fixed-height">
                    <div class="panel-body">
                        <form accept-charset="UTF-8" role="form">
                            <fieldset>  
                               
                                <ul class="list-group">
                                    <p><i class="fa fa-cog"></i><a href="${pageContext.request.contextPath}/viewRequest/${requests.requestService.requestId}" title=""> &nbsp ${requests.requestService.requestId}-&nbsp${requests.requestAnswer.product_name}</a></p>
                                    <br>
                                    <li class="list-group-item"><i class="fa fa-calendar"></i>&nbsp ${requests.serviceRequestedDate}	</li>
                                    <li class="list-group-item"><i class="fa fa-th text-success"></i></i>&nbsp <a href="${pageContext.request.contextPath}/quotesDescription/${requests.requestService.requestId}">Quotes&nbsp <span class="badge">${requests.quoteNumber}</span></a></li>
                                   <c:choose>
                                    <c:when test="${requests.requestService.status eq 'OLD' }">
                                   	 <li class="list-group-item"><i class="fa fa-edit"></i>&nbsp CLOSED</li>
                                   	</c:when>
                                   <c:when test="${requests.quoteNumber gt 0 and requests.requestService.status ne 'WIP' }">
                                   	 <li class="list-group-item"><i class="fa fa-info text-info"></i>&nbsp Select the Professional</li>
                                   	</c:when>
                                   	<c:when test="${requests.requestService.status eq 'IP'}">
                                   	 <li class="list-group-item"><i class="fa fa-edit"></i>&nbsp Open for Bid</li>
                                   	</c:when>
                                   	<c:when test="${requests.requestService.status eq 'WIP'}">
                                   	 <li class="list-group-item"><i class="fa fa-edit"></i>&nbsp Work in Progress</li>
                                   	</c:when>
                                   	
                                   		<c:when test="${requests.requestService.status eq 'WIP'}">
                                   	 <li class="list-group-item"><i class="fa fa-edit"></i>&nbsp ${requests.requestService.status}</li>
                                   	</c:when>
                                   </c:choose>
                                   <c:if  test="${requests.requestService.status ne 'OLD'}">
                                    <li class="list-group-item"> <a href="${pageContext.request.contextPath}/UpdateRequestStatus/${requests.requestService.requestId}/${requests.requestService.status}"><i class="fa fa-plus-square text-info"></i>&nbsp;Update request status</a></li>
                                   </c:if>
                                    <br> 
                                    <c:choose>
                                    	<c:when test="${requests.quoteNumber <1  and requests.requestService.status ne 'OLD'}">
                                    		 <li style=" list-style-type: none;"> 
                                    <p><i class="fa fa-quote-left text-info"></i> &nbsp No Bids recieved yet .                                    
                                       <i class="fa fa-quote-right text-info"></i>
                                   </p>
                                   </li> 
                                    	</c:when>
                                    	<c:when test="${requests.requestService.status eq 'OLD'}">
                                    		 <li style=" list-style-type: none;">
                                    <p><i class="fa fa-quote-left text-info"></i> &nbsp&nbsp  ${requests.requestService.statusReason}                              
                                       <i class="fa fa-quote-right text-info"></i>
                                   </p>
                                   
                                   	</c:when>
                                    	<c:when test="${requests.requestService.status eq 'WIP'}">
                                    		 <li  style="list-style-type: none;"> 
                                    <p><i class="fa fa-quote-left text-info"></i> &nbspThis project has been awarded to  ${requests.prosProfile.companyName}                                   
                                       <i class="fa fa-quote-right text-info"></i>
                                   </p>
                                   </li>
                                    	</c:when> 
                                    	<c:when test="${requests.quoteNumber >0 and requests.requestService.status eq 'IP'}">
                                    		 <li  style="list-style-type: none;">
                                    <p><i class="fa fa-quote-left text-info"></i> &nbsp${requests.quoteNumber} Quotes recived.Please select the professional                                 
                                       <i class="fa fa-quote-right text-info"></i>
                                   </p>
                                   </li>
                                    	</c:when>
                                    </c:choose>
                                    <c:if test="${requests.quoteNumber <1}">
                                   
                                    </c:if>
                               </ul>
                           </fieldset>
                       </form>
                   </div>
               </div>
           </div>
     </c:forEach> 
   



</div>
<div class="row">

   




</div>





</div>



</section>

<!-- END MANAGE FEATURES -->

</div>
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