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
    <title>${wrapRequestService.prosProfile.companyName} Reviews -NearGuru</title>
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
           <link id="mainStyle" href="<c:url value="/resources/assets/css/dashboard.css" />" rel="stylesheet" />
        <style type="text/css"> 
        .login
        {
            margin-top:55px;
        }
.star{

font-size:30px;
}
        @media (max-width: 767px) {
            .login
            {
                margin-top:0px;
            }
        }
    </style>
</head>
<body>

 <!-- HEADER SECTION -->
 <%@ include file="header.jsp" %>
 <section class=" bg-color">
          <div class="container">
     		 <div class="row">
                       				 <div class="col-md-12">
                       				
                       				
                          				 <h2>
                          				  
                          				    <a href="${pageContext.request.contextPath}/quotesDescription/${requestId}" title=""><i class="fa fa-arrow-circle-o-left"></i></a>
                          				   
                          				      Reviews</h3>
                     				  </div>  
                           		 </div>
                           </div>
                </div>
   </section>
<section>     
    <div class="container-fluid" style="margin-left:3%">  
    <div class="row" style="margin-top:30px;">
                        <div class="col-xs-12 col-md-2">
                     <c:choose>
              			   <c:when test="${wrapRequestService.user.filename ne null}">
                 				 <img src="<c:url value="/download/${wrapRequestService.user.userId}" />" class="img-responsive img-circle" alt="avatar" >
              			   </c:when>
              			   <c:otherwise>
              			  	  <img src="<c:url value="/resources/assets/img/imgPlace.jpg" />" class="img-responsive img-circle" alt="avatar" >
               			  </c:otherwise>
              		  	 </c:choose>
                        </div> 
                        <div class="col-xs- 12 col-md-5">
                            <h3>${wrapRequestService.prosProfile.companyName}</h3>

                            <table class="table table-striped">
                                <tbody>
                                  <tr>
                                        <td ><b>Mobile</b></td>
                                        <td><i class="fa fa-phone text-success"></i>&nbsp;${wrapRequestService.user.mobile}</td>
                                    </tr>
                                   
                                    <c:if test="${not empty  wrapRequestService.user.address}">
                                    <tr>
                                        <td><b>Address</b></td>
                                        <td><i class="fa fa-home text-info"></i>&nbsp;${wrapRequestService.user.address}</td>
                                    </tr>
                                    </c:if>
                                    <tr>
                                        <td><b>Locality</b></td>
                                        <td><i class="fa fa-map-marker text-danger"></i>&nbsp;${wrapRequestService.user.formatted_address}</td>
                                    </tr>
                                       <c:if test="${not empty  wrapRequestService.prosProfile.website}">  
                                    <tr>
                                        <td><b>Web site</b></td>
                                        <td><a href="" title="">${wrapRequestService.prosProfile.website}</a></td>
                                    </tr>
                                    </c:if>
                                    <c:if test="${not empty  wrapRequestService.prosProfile.yearOfEstablishment}">
                                    <tr>
                                        <td><b>Year Established</b></td> 
                                        <td>&nbsp;${wrapRequestService.prosProfile.yearOfEstablishment}</td>
                                    </tr>
                                    </c:if>
                                     <c:if test="${not empty  wrapRequestService.prosProfile.companyProfile}">
                                    <tr>
                                        <td><b>Profile</b></td>
                                        <td>&nbsp;${wrapRequestService.prosProfile.companyProfile}</td>  
                                    </tr>
                                    </c:if>
                                </tbody>
                            </table>

                        </div>


                        <div class="col-xs-12 col-md-5">
                           &nbsp;
                        </div>

                    </div> 
       <div class="row ">
                        <div >
                           
                           <c:choose> 
    										<c:when test="${feedbackAvg eq 0}">
   													   
                                            <span class="fa fa-star-o star"></span>
                                            <span class="fa fa-star-o star"></span>
                                            <span class="fa fa-star-o star"></span>
                                            <span class="fa fa-star-o star"></span>
                                             <span class="fa fa-star-o star"></span>
   											 </c:when>
   											<c:when test="${feedbackAvg eq 1}">
   													  <span class="fa fa-star star"></span>
                                            <span class="fa fa-star-empty"></span>
                                            <span class="fa fa-star-empty"></span>
                                            <span class="fa fa-star-empty"></span>
                                            <span class="fa fa-star-empty"></span>
                                            
   											 </c:when>
   											<c:when test="${feedbackAvg eq 2}">
   													  <span class="fa fa-star star"></span>
                                            <span class="fa fa-star star"></span>
                                            <span class="fa fa-star-empty"></span>
                                            <span class="fa fa-star-empty"></span>
                                            <span class="fa fa-star-empty"></span>
                                           
   											 </c:when>
   											 <c:when test="${feedbackAvg eq 3}">
   													  <span class="fa fa-star star"></span>
                                            <span class="fa fa-star star"></span>
                                            <span class="fa fa-star star"></span>
                                            <span class="fa fa-star-empty"></span>
                                            <span class="fa fa-star-empty"></span>
                                           
   											 </c:when>
   											 <c:when test="${feedbackAvg eq 4}">
   													  <span class="fa fa-star star"></span>
                                            <span class="fa fa-star star"></span>
                                            <span class="fa fa-star star"></span>
                                            <span class="fa fa-star star"></span>
                                           
                                             <span class="fa fa-star-empty"></span>
   											 </c:when>
   											 <c:when test="${feedbackAvg eq 5}">
   													  <span class="fa fa-star star"></span>
                                             <span class="fa fa-star star"></span>
                                            <span class="fa fa-star star"></span>
                                            <span class="fa fa-star star"></span>
                                            <span class="fa fa-star star"></span>
                                            <span class="fa fa-star star"></span>
   											 </c:when>
   												
  									    </c:choose> 
                           
                          
                            ${feedbackNumber} Reviews 
                            <hr>

                        </div>

                    </div>
					
        <div class="row">
               <div class="row" style="margin-bottom:30px">
                        <c:forEach  var="feedbackList" items="${feedbackList}">
                       
                        <div class="col-md-6 "> 
 
                            <div class="review">
                                 <i class="fa fa-thumbs-up text-success" ></i> <p class="wordWrap">${feedbackList.feedback.review}</p><br/>

                                <a > ${feedbackList.user.name}, ${feedbackList.user.city}</a>
                                ${feedbackList.fedbackWrittenDate} <br/>
									 <c:choose> 
    										<c:when test="${feedbackList.feedback.rating eq 0}">
   													    
                                            <span class="fa fa-star-o  text-info"></span>
                                            <span class="fa fa-star-o  text-info"></span>
                                            <span class="fa fa-star-o  text-info"></span>
                                            <span class="fa fa-star-o text-info"></span>
                                             <span class="fa fa-star-o  text-info"></span>
   											 </c:when>
   											<c:when test="${feedbackList.feedback.rating eq 1}">
   													  <span class="fa fa-star "></span>
                                            <span class="fa fa-star-empty"></span>
                                            <span class="fa fa-star-empty"></span>
                                            <span class="fa fa-star-empty"></span>
                                            <span class="fa fa-star-empty"></span>
                                           
   											 </c:when>
   											<c:when test="${feedbackList.feedback.rating eq 2}">
   													  <span class="fa fa-star "></span>
                                            <span class="fa fa-star "></span>
                                            <span class="fa fa-star-empty"></span>
                                            <span class="fa fa-star-empty"></span>
                                            <span class="fa fa-star-empty"></span>
                                            
   											 </c:when>
   											 <c:when test="${feedbackList.feedback.rating eq 3}">
   													  <span class="fa fa-star "></span>
                                            <span class="fa fa-star "></span>
                                            <span class="fa fa-star "></span>
                                            <span class="fa fa-star-empty "></span>
                                            <span class="fa fa-star-empty"></span>
                                            
   											 </c:when>
   											 <c:when test="${feedbackList.feedback.rating eq 4}">
   													  <span class="fa fa-star "></span>
                                            <span class="fa fa-star "></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star "></span>
                                            <span class="fa fa-star-empty"></span> 
                                             
   											 </c:when>
   											 <c:when test="${feedbackList.feedback.rating eq 5}">
   													  <span class="fa fa-star "></span>
                                             <span class="fa fa-star "></span>
                                            <span class="fa fa-star "></span>
                                            <span class="fa fa-star "></span>
                                            <span class="fa fa-star "></span>
                                           
   											 </c:when>
   												
  									    </c:choose>   
                            </div>
                        </div>
                         
						</c:forEach>
                         
                     </div>     
                         
                  
        </div>
    </div>
</section>


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
</html>
