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
    <title>User Dashboard-NearGuru</title>
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
        <link id="mainStyle" href="<c:url value="/resources/assets/css/dashboard.css" />" rel="stylesheet" />
      <!-- END MAIN STYLE SECTION-->
 


    <style type="text/css">
        .list-group-item
        {
            border-radius:2px;
        }
.star{

font-size:25px;
}

    </style>


</head>
<!-- END HEAD SECTION-->

<!-- BODY SECTION-->
<body>

   <!-- HEADER SECTION -->

      <%@ include file="header.jsp" %>
<section class="bg-color"> 
 <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 ">
               <div class="container">
                   <h2 class=""> <a href="${pageContext.request.contextPath}/prosDashboard" title=""><i class="fa fa-arrow-circle-o-left"></i></a> Quotes for ${productName.product_name} request </h2>
               </div>
           </div>

       </div>
    </div>
   </section>
<div class="container">
    <!-- END HEADER SECTION -->
    <!--PAGE CONTENT--> 
    <!-- bidPAGE SECTION-->  
    <section id="section-welcome"  class="section ">
        <div class="container">
            <div class="row">
                <div class="col-md-12">




                  <div class="tab-content" style="margin-top:20px;">
                    <div class="tab-pane active" id="bid">

                       
                  <div class="row">
                     <div class="col-md-12">
                      <div class=" list-content">
                        <ul class="list-group">
                        
                         <c:if test="${ empty quotesRecived }"> 
        
        	
        			 <div class="text-center bg-info text-info" style="height:60px;">       
   						<h4 style="padding-top:20px;padding-bottom:15px">This request has not recieved any  active Quotes yet.</h4>   
  					 </div> 
        	
        	</c:if>
        	
                        <c:forEach  var="quotesRecived" items="${quotesRecived}">
                         <c:url var="awardProject" value="/awardProject" ></c:url>
	
					<form:form  action="${awardProject}" commandName="wrapRequestService">
					 <form:hidden  path="quote.quoteId" value="${quotesRecived.quote.quoteId}" ></form:hidden>
					 <form:hidden  path="quote.prosId" value="${quotesRecived.quote.prosId}" ></form:hidden> 
               <form:hidden  path="requestService.requestId" value="${quotesRecived.requestService.requestId}" ></form:hidden>
                          <li href="#" class="list-group-item text-left">
                            <article class="request row">
                                <div class="col-xs-6 col-sm-2 col-md-1">
                                
                                 <c:choose>
                 <c:when test="${quotesRecived.prosProfile.user.filename ne null}">
                 	 <img src="<c:url value="/download/${quotesRecived.prosProfile.user.userId}" />" class="img-responsive img-circle" alt="avatar" >
                 </c:when>
                 <c:otherwise>
                  <img src="<c:url value="/resources/assets/img/imgPlace.jpg" />" class="img-responsive img-circle" alt="avatar" >
                 </c:otherwise>
                 </c:choose>
                                  <%--  <img src="<c:url value="/download/${quotesRecived.quote.prosId}" />" class="avatar img-circle" alt="avatar" > --%>
                                </div>
                                <div class="col-xs-6 col-sm-2 col-md-3" style=" border-right: 1px dotted #ccc"> 
                                    <ul class="meta-search">
                                        <li><h3>${quotesRecived.prosProfile.companyName}</h3></li>
                                      
                                     
                                      
                                        <li><i class="fa fa-calendar"></i> <span>${quotesRecived.serviceRequestedDate}</span></li>
                                          <li><i class="fa fa-map-marker text-danger"></i><c:if test="${quotesRecived.prosProfile.user.sublocality ne ''}">${quotesRecived.prosProfile.user.sublocality},</c:if>${quotesRecived.prosProfile.user.locality}</li>
                                          <!-- 
                                          <li><i class="fa fa-th"></i> <span><a href="${pageContext.request.contextPath}/vendorProfile/${quotesRecived.quote.prosId}/${quotesRecived.requestService.requestId}" >Portfolio</a></span></li>
                                          
                                          <a href="${pageContext.request.contextPath}/prosReviews/${quotesRecived.quote.prosId}/${quotesRecived.requestService.requestId}">    
                                        <li>
                                        <c:choose> 
    										<c:when test="${quotesRecived.feedbackAvg eq 0}">
   													   
                                            <span class="fa fa-star-o star"></span>
                                            <span class="fa fa-star-o star"></span>
                                            <span class="fa fa-star-o star"></span>
                                            <span class="fa fa-star-o star "></span>
                                             <span class="fa fa-star-o star"></span>
   											 </c:when>
   											<c:when test="${quotesRecived.feedbackAvg eq 1}">
   													  <span class="fa fa-star star"></span>
                                            <span class="fa fa-star-empty"></span>
                                            <span class="fa fa-star-empty"></span>
                                            <span class="fa fa-star-empty"></span>
                                            <span class="fa fa-star-empty"></span>
                                           
   											 </c:when>
   											<c:when test="${quotesRecived.feedbackAvg eq 2}">
   													  <span class="fa fa-star star"></span>
                                            <span class="fa fa-star star"></span>
                                            <span class="fa fa-star-empty"></span>
                                            <span class="fa fa-star-empty"></span>
                                            <span class="fa fa-star-empty"></span>
                                           
   											 </c:when>
   											 <c:when test="${quotesRecived.feedbackAvg eq 3}">
   													  <span class="fa fa-star star"></span>
                                            <span class="fa fa-star star"></span>
                                            <span class="fa fa-star star"></span>
                                            <span class="fa fa-star-empty"></span>
                                            <span class="fa fa-star-empty"></span>
                                            
   											 </c:when>
   											 <c:when test="${quotesRecived.feedbackAvg eq 4}">
   													  <span class="fa fa-star star"></span>
                                            <span class="fa fa-star star"></span>
                                            <span class="fa fa-star star"></span>
                                            <span class="fa fa-star star"></span>
                                            <span class="fa fa-star-empty"></span>
                                           
   											 </c:when>
   											 <c:when test="${quotesRecived.feedbackAvg eq 5}">
   													  <span class="fa fa-star star"></span>
                                             <span class="fa fa-star star"></span>
                                            <span class="fa fa-star star"></span>
                                            <span class="fa fa-star star"></span>
                                            <span class="fa fa-star star"></span>
                                            <span class="fa fa-star star"></span>
   											 </c:when>
   												
  									    </c:choose>
                                       
                                       
                                            <label class="text-info"  ><a href="${pageContext.request.contextPath}/prosReviews/${quotesRecived.quote.prosId}/${quotesRecived.requestService.requestId}">  ${quotesRecived.feedbackCount} reviews </a></label>
                                            </li>
                                          </a>
                                           -->
                                        </ul>
                                    </div>
                                   
                                    <div class="col-xs-12 col-sm-7 col-md-6 excerpet">
                                        <h3><i class="fa fa-inr "></i>&nbsp;${quotesRecived.quote.amount}</h3>
                                        <p>${quotesRecived.quote.message}</p> 
                                        <!-- 
                                        	 <c:if test="${quotesRecived.document.filename  ne null}">                       
										Quote File 	<label><a href="${pageContext.request.contextPath}/downloadQuote/${quotesRecived.prosProfile.user.userId}/${quotesRecived.quote.requestId}/${quotesRecived.quote.quoteId}"/>Download</a></label>
                                   			</c:if>
                                   		 -->
                                    </div>
                                
                                    <!-- 
                                    <div class="col-xs-12 col-sm-2 col-md-2 text-center">

										<c:choose>
    										<c:when test="${quotesRecived.quote.status eq 'WIP'}">
   													   Project has been awarded to ${quotesRecived.prosProfile.companyName}
   													    										</c:when>
   											<c:when test="${quotesRecived.requestService.status eq 'OLD'} ">
   													  <button type="submit" disabled   class="btn btn-success"><span class="fa fa-ticket"></span>&nbspAward  asdasd Project</button>
   													   
   									</c:when>
   											 <c:when test="${quotesRecived.quote.status eq 'IP' and quotesRecived.requestService.status ne 'OLD' }">
   													  <button type="submit"   class="btn btn-success"><span class="fa fa-ticket"></span>&nbspAward Project</button>
   													   
   										</c:when>
   											  
   												<c:otherwise>
   												
   												 <button type="submit" disabled   class="btn btn-success"><span class="fa fa-ticket"></span>&nbspAward Project</button>
   													   
   												</c:otherwise>
  									  </c:choose>
                                      
                                    </div>
                                     -->
                                    <span class="clearfix borda"></span>
                                </article>
                            </li>
                            </form:form>
                            </c:forEach>
                            
                                    

                                          
                                                </ul>
                                            </div>
                                        </div>
             <!-- <div class="row">
            <div class="col-xs-12  col-md-4">
                <button class="btn btn-lg btn-danger" onclick="window.location = '${pageContext.request.contextPath}/bidService';" type="button" name="">View all Services </button>
            </div>
             -->
        	</div>
                                    </div>

                                </div>
                                
                                
                    </div>


                </div>
            </div>
        </div>

    </section>


</div>
</br>

<!-- footer   -->
<%@ include file="footer.jsp" %>



<!-- MAIN SCRIPTS SECTION-->

<!-- MAIN SCRIPTS SECTION-->
<script src="../assets/js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
<script src="../assets/js/jquery.js"></script>
<script src="../assets/js/scrollReveal.js"></script>
<script>
//if I put these script into a js file, those tabs will not work properly
  $('#myTabs a').click(function (e) {
      e.preventDefault();

      var url = $(this).attr("data-url");
      var href = this.hash;
      var pane = $(this);

  // ajax load from data-url
  $(href).load(url,function(result){      
      pane.tab('show');
  });
});

// load first tab content
$('#home').load($('.active a').attr("data-url"),function(result){
  $('.active a').tab('show');
});

</script>

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


</div>
</body>

<!--END  BODY SECTION-->
</html>


