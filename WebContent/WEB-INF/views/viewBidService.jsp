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
    <title>NearGuru-Quote Details</title>
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
           <!-- END MAIN STYLE SECTION-->
    <style type="text/css">
        .btn-lg
        {
            width:100%;
        }
        label
        {
            color:rgb(29, 78, 100);
        }
    </style>

</head>
<!-- END HEAD SECTION-->

<!-- BODY SECTION-->
<body>

    <!-- HEADER SECTION -->
      <%@ include file="header.jsp" %>
      <br/>
     

      <section class=" bg-color" style="margin-bottom:20px">
          <div class="container">
     		 <div class="row" >
                       				 <div class="col-md-12" >
                       				
                       				 <c:if test=""></c:if>
                          				 <h2>
                          				 
                          				    <a href="${pageContext.request.contextPath}/manageRequestsVendor" title=""><i class="fa fa-arrow-circle-o-left"></i></a>
                          				 
                          			   Service Request Details </h2>
                     				  </div>  
                           		 </div>
                           </div>
               
   </section>
        
<div class="container">
    <!-- END HEADER SECTION -->
    <!--PAGE CONTENT--> 

    <!-- HOMEPAGE SECTION-->  

    <section class="section" style="margin-bottom:20px;" >
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                  <div class="panel panel-success">
                    <div class="panel-heading">
                       Quote Details
                   </div>
                    
                   <div class="panel-body">
                                    

                       <div class="form-group">
                        <label><b>Quote Amount <b></b></label>
                        <br>
                        <label><i class="fa fa-inr"></i>&nbsp;${quotes.amount}</label>
                        
                    </div>
                 <hr>
                <div class="form-group">
                    <label><b>Quote Description<b></b></label>
                    <br>     
					<p  style="word-wrap:break-word;word-break:break-all">${quotes.message}</p>
                    
                </div>   
				 <c:if test="${not empty doc.filename}">
				 <div class="form-group">
                    <label><b>Quote File<b></b></label>
          
					<label><a href="${pageContext.request.contextPath}/downloadQuote/${user.userId}/${requestService.requestId}/${quotes.quoteId}"/>Dowloand</a></label>
                    
                </div>
         </c:if>
      </div>







  </div>

</div> 


				



<c:if test="${!empty requestAnswer}">			 
<div class="col-md-6">
    <div class="panel panel-success">
        <div class="panel-heading">
            Request Description
        </div>
        <div class="panel-body">
           <form role="form">

            <fieldset>
            
            	
            	<label><b>Customer Name</b></label>
                                <p class="detail">${serviceUser.name}</p>
                                <hr>
                                
                                <label><b>Project Location</b></label>
                                <p class="detail">${requestService.formatted_address}</p>
                                
                                <hr>
                                  <c:if test="${not empty serviceUser.mobile}">
                                 <label><b>Contact Number</b></label>
                                <p class="detail">${serviceUser.mobile}</p>  
                                
                                <hr>
                                </c:if>
                                 <label><b>Email</b></label>  
                                <p class="detail">${serviceUser.emailId}</p>  
                                
                                <hr>
                                <c:if test="${!empty requestAnswer.question1}">
                                <label><b>${requestAnswer.question1}</b></label>
                                <p class="detail">${requestAnswer.answer1}</p>
                                <hr>
                                </c:if>
                                
                                <c:if test="${!empty requestAnswer.question2}">
                                <label><b>${requestAnswer.question2}</b></label>
                                <p class="detail">${requestAnswer.answer2}</p>
                                 <hr>
                                </c:if>
                               
                                <c:if test="${!empty requestAnswer.question3}">
                                <label><b>${requestAnswer.question3}</b></label>
                                <p class="detail">${requestAnswer.answer3}</p>
                                 <hr>
                                </c:if>
                               
                                <c:if test="${!empty requestAnswer.question4}">
                                <label><b>${requestAnswer.question4}</b></label>
                                <p class="detail">${requestAnswer.answer4}</p>
                                 <hr>
                                </c:if>
                                
                                <c:if test="${!empty requestAnswer.question5}">
                                <label><b>${requestAnswer.question5}</b></label>
                                <p class="detail">${requestAnswer.answer5}</p>
                                <hr>
                                </c:if>
                                
                                <c:if test="${!empty requestAnswer.question6}">
                                <label><b>${requestAnswer.question6}</b></label>
                                <p class="detail">${requestAnswer.answer6}</p>
                                 <hr>
                                </c:if>
                               
                                <c:if test="${!empty requestAnswer.question7}">
                                <label><b>${requestAnswer.question7}</b></label>
                                <p class="detail">${requestAnswer.answer7}</p>
                                 <hr>
                                </c:if>
                               
                                <c:if test="${!empty requestAnswer.question8}">
                                <label><b>${requestAnswer.question8}</b></label>
                                <p class="detail">${requestAnswer.answer8}</p>
                                 <hr>
                                </c:if>
                                
                                <c:if test="${!empty requestAnswer.question9}">
                                <label><b>${requestAnswer.question9}</b></label>
                                <p class="detail">${requestAnswer.answer9}</p>
                                 <hr>
                                </c:if>
                               
                                <c:if test="${!empty requestAnswer.question10}">
                                <label><b>${requestAnswer.question10}</b></label>
                                <p class="detail">${requestAnswer.answer10}</p>
                                 <hr>
                                </c:if>
                               
                               <c:if test="${!empty requestAnswer.question11}">
                                <label><b>${requestAnswer.question11}</b></label>
                                <p class="detail">${requestAnswer.answer11}</p>
                                <hr>
                                </c:if>
                                
                                <c:if test="${!empty requestAnswer.question12}">
                                <label><b>${requestAnswer.question12}</b></label>
                                <p class="detail">${requestAnswer.answer12}</p>
                                 <hr>
                                </c:if>
                               
                                <c:if test="${!empty requestAnswer.question13}">
                                <label><b>${requestAnswer.question13}</b></label>
                                <p class="detail">${requestAnswer.answer13}</p>
                                 <hr>
                                </c:if>
                               
                                <c:if test="${!empty requestAnswer.question14}">
                                <label><b>${requestAnswer.question14}</b></label>
                                <p class="detail">${requestAnswer.answer14}</p>
                                 <hr>
                                </c:if>
                                
                                <c:if test="${!empty requestAnswer.question15}">
                                <label><b>${requestAnswer.question15}</b></label>
                                <p class="detail">${requestAnswer.answer15}</p>
                                <hr>
                                </c:if>
                                
                                <c:if test="${!empty requestAnswer.question16}">
                                <label><b>${requestAnswer.question16}</b></label>
                                <p class="detail">${requestAnswer.answer16}</p>
                                 <hr>
                                </c:if>
                               
                                <c:if test="${!empty requestAnswer.question17}">
                                <label><b>${requestAnswer.question17}</b></label>
                                <p class="detail">${requestAnswer.answer17}</p>
                                 <hr>
                                </c:if>
                               
                                <c:if test="${!empty requestAnswer.question18}">
                                <label><b>${requestAnswer.question18}</b></label>
                                <p class="detail">${requestAnswer.answer18}</p>
                                 <hr>
                                </c:if>
                                
                                <c:if test="${!empty requestAnswer.question19}">
                                <label><b>${requestAnswer.question19}</b></label>
                                <p class="detail">${requestAnswer.answer19}</p>
                                 <hr>
                                </c:if>
                               
                                <c:if test="${!empty requestAnswer.question20}">
                                <label><b>${requestAnswer.question20}</b></label>
                                <p class="detail">${requestAnswer.answer20}</p>
                                 <hr>
                                </c:if>
				
             </fieldset>
        </form>  
    </div>







</div>
</div>  
</c:if>


</div>
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



</div>
</body>

<!--END  BODY SECTION-->
</html>