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
        <title>${user.name} Dashboard-NearGuru</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">   
        <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
        <!-- MAIN STYLE SECTION-->
		<link rel="shortcut icon" href="<c:url value="/resources/assets/img/favicon.ico" />" />
        <link href="<c:url value="/resources/assets/plugins/bootstrap/bootstrap.css" />" rel="stylesheet" />
        <link id="mainStyle" href="<c:url value="/resources/assets/css/vendor.css" />" rel="stylesheet" />
        <link href="<c:url value="/resources/assets/plugins/font-awesome/font-awesome.css" />" rel="stylesheet">    
         <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
        
             <!-- END MAIN STYLE SECTION-->



        <style type="text/css">
		
        </style>


    </head>
    <!-- END HEAD SECTION-->

    <!-- BODY SECTION-->
    <body class="Site">
            
            <!-- HEADER SECTION -->

             <%@ include file="header.jsp" %>
        <div class="Site-content">
       <section>  
 <div class="container-fluid">
        <div class="row" style="padding-top:30px;margin-bottom:2%">
            <div class="col-md-12 bg-color">
               <div class="container">
                   <h2 class=""> <a href="#" title=""></a> Manage quotes </h2>
               </div>
           </div>
</div>  
       </div>
   </section>
<div class="container" >
    <!-- END HEADER SECTION -->

    <!--  MANAGE FEATURES -->


        <section class="" >
            <div class="container"   >

                <div class="row"> 
				  <c:if test="${not empty vendorRequests}">
				   <c:if test="${requestType eq 'IP' }">
				   		
				   			<div class="alert alert-success"> 
				  				<label class="text-info">
				  				You are in progress with below service requests. The customer is reviewing and will hire you once he is satisfied with your profile and price. 
				  				</label>
				  		</div>  
				   </c:if> 
				   
				    <c:if test="${requestType eq 'WIP' }"> 
				    			<div class="alert alert-success">  
				  				<label class="text-info">
				  				Congratulations!!! You win the bid for below service requests.
				  				</label>
				  		</div> 
				    </c:if>
				  	
				  </c:if>
                    <c:if test="${empty vendorRequests}">
                    <c:if test="${requestType eq 'IP' }">
                    			 <div class="text-center bg-info text-info" style="height:60px;margin-bottom:25px">       
   		<h4 style="padding-top:20px;padding-bottom:15px">You don't have any active quotes.</h4>   
   </div> 
                    	</c:if>
                    	<c:if test="${requestType eq 'WIP' }">
                    		 <div class="text-center bg-info text-info" style="height:60px;margin-bottom:25px">       
   		<h4 style="padding-top:20px;padding-bottom:15px">You don't have any  Quotes for which you have been hired...yet!</h4>   
   </div>
                    	</c:if> 
                    	<c:if test="${requestType eq 'OLD' }">
                    			 <div class="text-center bg-info text-info" style="height:60px;">       
   		<h4 style="padding-top:20px;padding-bottom:15px">You don't have any archived quotes.</h4>   
   </div>
                    	</c:if>
  
    </c:if>
                    <c:forEach var="vendorRequests" items="${vendorRequests}">
                    
                    <div class="col-xs-12 col-sm-4 col-md-4" >
                        <div class="panel panel-default" style="height:442px">
                            <div class="panel-body">
                                <form accept-charset="UTF-8" role="form">
                                   <fieldset>                      
                                    <ul class="list-group">
                                        <p><i class="fa fa-cog text-success"></i><a href="${pageContext.request.contextPath}/viewRequest/${vendorRequests.requestService.requestId}" title=""> &nbsp ${vendorRequests.requestService.requestId}-&nbsp${vendorRequests.requestAnswer.product_name}</a></p>
                                        <br>
                                        <li class="list-group-item"><i class="fa fa-smile-o text-info"></i>&nbsp;${vendorRequests.user.name}	</li>
                                        <li class="list-group-item"><i class="fa fa-calendar text-info"></i>&nbsp;${vendorRequests.serviceRequestedDate}	</li>
                                        <li class="list-group-item"><i class="fa fa-map-marker text-danger"></i>&nbsp;<c:if test="${vendorRequests.requestService.sublocality ne ''}"> ${vendorRequests.requestService.sublocality},</c:if>${vendorRequests.requestService.locality} </li>
                                       
                                     <%--   <c:if test="${not empty vendorRequests.user.mobile}"> 
                                        
                                         <li class="list-group-item"><i class="fa fa-phone text-success"></i>&nbsp;${vendorRequests.user.mobile}</li>  
                                       			
                                       </c:if> --%>
                                      
                                        <li class="list-group-item"><i class="fa fa-th text-success"></i>&nbsp; <a href="${pageContext.request.contextPath}/viewBidService/${vendorRequests.quote.quoteId}">My Quotes </a></li>
                                      
                                      
                                        <br> 
                                        <c:choose>
                                        	<c:when test="${vendorRequests.quote.status eq 'IP'}">
                                        	 <p><i class="fa fa-quote-left text-info"></i>&nbsp Quote has been Submitted! .Needs Approval of Customer before you start the work!! .                                    
                                            <i class="fa fa-quote-right text-info"></i>
                                        	
                                        	</c:when>
                                        	<c:when test="${vendorRequests.quote.status eq 'WIP'}">
                                        	 <p><i class="fa fa-quote-left text-info"></i>&nbsp Congratulations! .Work has been awarded to you by ${vendorRequests.user.name}!! .                                    
                                            <i class="fa fa-quote-right text-info"></i>
                                        	
                                        	</c:when>  
                                        	 <c:when test="${vendorRequests.requestService.prosId ne 0 and   vendorRequests.quote.status eq 'OLD' and vendorRequests.requestService.prosId ne user.userId }">
                                        	 <i class="fa fa-quote-left text-info"></i>&nbsp;Project has been awarded to Other Professional .    <i class="fa fa-quote-right text-info"></i>
                                        	</c:when>
                                        	<c:when test="${vendorRequests.quote.status eq 'OLD'}">
                                        	 <i class="fa fa-quote-left text-info"></i>&nbsp ${vendorRequests.requestService.statusReason} .                                    
                                            <i class="fa fa-quote-right text-info"></i>
                                        	
                                        	</c:when>
                                        </c:choose>
                                       
                                        
                                    </ul>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
                
                
            </c:forEach>
            


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


