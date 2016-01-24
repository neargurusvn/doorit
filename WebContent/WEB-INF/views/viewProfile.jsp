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
    <title>${vendorProfile.companyName} profile-NearGuru</title>
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
    
    .star{
    
    font-size:30px;
    }
    .heading{
			
			font-size:24px;
			font-style:normal;
			color:#3c7088;
			font-family:'Roboto', sans-serif;
			font-weight:500;
			line-height:1.1; 
			}
    </style>
<script >

$( document ).ready(function() {
	    $('#bussinessDistance').hide();
	    
	    $('#TTOC').click(function(){
	    	  $('#bussinessDistance').show();
	    	  });
	    $('#CTOM').click(function(){
    	  $('#bussinessDistance').hide();
    	  });
	    $('#NEITHER').click(function(){
    	  $('#bussinessDistance').hide(); 
    	  });
	});
</script>
</head>
<!-- END HEAD SECTION-->

<!-- BODY SECTION-->
<body>
  <!-- HEADER SECTION -->
  <%@ include file="header.jsp" %>
<br/>
 <ul class="nav nav-tabs" style="margin-bottom:20px">
 		<c:choose>
 			<c:when test="${navigationWrapper.editProfile eq 'EP' }">
 			 <li class="active"><a href="${pageContext.request.contextPath}/editProfile">Edit</a></li>
 			</c:when>
 			<c:otherwise>
 			 <li><a href="${pageContext.request.contextPath}/editProfile">Edit</a></li>
 			</c:otherwise>
 		</c:choose>
 		<c:choose>
 			<c:when test="${navigationWrapper.viewProfile eq 'VP' }">
 			   <li class="active"><a  href="${pageContext.request.contextPath}/viewProfile/${user.userId}">Preview</a></li>
 			</c:when>
 			<c:otherwise>
 			   <li><a href="${pageContext.request.contextPath}/viewProfile/${user.userId}">Preview</a></li>
 			</c:otherwise>
 		</c:choose>
           
         
            
          </ul>
 <section>
        <div class="row" style="margin-bottom:25px">
            <div class="col-md-12 bg-color">
               <div class="container">
                   <h2 class=""> <a href="#" title=""></a> ${vendorProfile.companyName} profile </h2>
               </div> 
           </div> 

       </div> 
   </section>
  <section class="section " style="margin-bottom:20px" > 

                <div class="container-fluid" style="margin-left:3%">



                    <div class="row">
                        <div class="col-xs-12 col-md-2">
                   				 <c:choose>
                 <c:when test="${user.filename ne null}">
                 	 <img src="<c:url value="/download/${user.userId}" />" class="img-responsive img-circle" alt="avatar" >
                 </c:when>
                 <c:otherwise>
                  <img src="<c:url value="/resources/assets/img/imgPlace.jpg" />" class="img-responsive img-circle" alt="avatar" >
                 </c:otherwise>
                 </c:choose>
                        </div> 
                        <div class="col-xs- 12 col-md-5">
                            <h3>${vendorProfile.companyName}</h3>

                            <table class="table table-striped">
                                <tbody>
                                    <tr>
                                        <td ><b>Mobile</b></td>
                                        <td><i class="fa fa-phone text-success"></i>&nbsp;${vendorProfile.user.mobile}</td>
                                    </tr>
                                   
                                    <c:if test="${not empty  vendorProfile.user.address}">
                                    <tr>
                                        <td><b>Address</b></td>
                                        <td><i class="fa fa-home text-info"></i>&nbsp;${vendorProfile.user.address}</td>
                                    </tr>
                                    </c:if> 
                                    <tr>
                                        <td><b>Locality</b></td>
                                        <td><i class="fa fa-map-marker text-danger"></i>&nbsp;${vendorProfile.user.formatted_address}</td>
                                    </tr>
                                    <c:if test="${not empty  vendorProfile.website}">
                                    <tr>
                                        <td><b>Web site</b></td>
                                        <td><a href="" title="">${vendorProfile.website}</a></td>
                                    </tr>
                                    </c:if>
                                      
                                      <c:if test="${ vendorProfile.yearOfEstablishment gt 0  }">
                                    <tr>
                                        <td><b>Year Established</b></td>
                                        <td>&nbsp;${vendorProfile.yearOfEstablishment}</td>
                                    </tr>
                                    </c:if>
                                     <c:if test="${not empty  vendorProfile.companyProfile}">
                                    <tr>
                                        <td><b>Profile</b></td>
                                        <td>&nbsp;${vendorProfile.companyProfile}</td> 
                                    </tr>
                                    </c:if> 
                                </tbody>
                            </table>

                        </div>


                        <div class="col-xs-12 col-md-5">
                           &nbsp;
                        </div>

                    </div> 
                     <div class="row">
                      
                         	<label class="heading">Reviews</label>
                           

                      

                    </div>
                  
                    <div class="row ">
                        <div >
                           
                           <c:choose> 
    										<c:when test="${feedbackAvg eq 0}">
   													    
                                            <span class="fa fa-star-o star text-info"></span>
                                            <span class="fa fa-star-o star text-info"></span>
                                            <span class="fa fa-star-o star text-info"></span>
                                            <span class="fa fa-star-o star text-info"></span>
                                             <span class="fa fa-star-o star text-info"></span>
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
                                           
   											 </c:when>
   												
  									    </c:choose> 
                           
                          
                            ${feedbackNumber} Reviews
                          

                        </div> 

                    </div>
					<br/> 
                    <div class="row">
                     
                       <c:forEach  var="feedbackList" items="${feedbackList}">
                        <div class="col-md-6 "  style="padding-left:0px">
	 
                            <div class="review">
                               <i class="fa fa-thumbs-up text-success"></i> <p style="word-wrap:break-word">${feedbackList.feedback.review}</p><br/>


      

                                <a> ${feedbackList.user.name},</a> 
                                ${feedbackList.fedbackWrittenDate}<br/>
                                
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
                     
					<hr/>

                 <div class="row" style="padding-left:20px"> 
            <label class="heading"> Listed in  </label>    <br/>   <br/>  
</div>
                    <div class="row text-left" > 
                    		
                     <c:forEach  var="productsListed" items="${products}">
                        <div class="col-md-3" style="padding-left:20px" > 

                           
                             
                             <i class="fa fa-check-square text-info"></i>&nbsp;&nbsp;<label>${productsListed.productName}</label> 
                              
                          
                           
                        </div>
                        </c:forEach>
                     
                       
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

    <!--END  BODY SECTION-->
    </html>