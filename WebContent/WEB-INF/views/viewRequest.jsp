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
    <title>${requestAnswer.product_name} | Nearguru.com</title>
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

    <style type="text/css" media="screen">
        .fa-edit,.fa-gavel,.fa-calendar,.fa-ellipsis-v,.fa-smile-o
        {
            color:#3c7088;
        }
        .badge
        {
            background-color:#EF0D49;
        }
    </style>

</head>
<!-- END HEAD SECTION-->

<!-- BODY SECTION-->
<body>
  <!-- HEADER SECTION -->
           <%@ include file="header.jsp" %>
        
          <section class=" bg-color" style="margin-bottom:20px">
          <div class="container">
     		 <div class="row" >
                       				 <div class="col-md-12" >
                       				
                       				 <c:if test=""></c:if>
                          				 <h2>
                          				  <c:if test="${user.userType eq 'cust'}">
                          				  <a href="${pageContext.request.contextPath}/manageRequest" title=""><i class="fa fa-arrow-circle-o-left"></i></a>
                          				  </c:if>
                          				   <c:if test="${user.userType eq 'pros'}">
                          				    <a href="${pageContext.request.contextPath}/prosDashboard" title=""><i class="fa fa-arrow-circle-o-left"></i></a>
                          				   </c:if>
                          				 ${requestAnswer.product_name} request </h3>
                     				  </div>  
                           		 </div>
                           </div>
               
   </section>
        
    <div class="container-fluid"> 

           
            <section>

                    <div class="col-xs-12 col-md-6">         
                        
                              
                              
                        <div class="panel panel-success" >
                            <div class="panel-heading">
                                Request Description
                            </div>     

                            <div class="panel-body" >
                                
                                <label><b>Request Number</b></label>
                                <p class="detail"> ${requestAnswer.requestId}</p>
                                <hr>
                                  <label><b>Requested Date</b></label>
                                <p class="detail">${requestWrapper.serviceRequestedDate}</p>
                                <hr>
                                <label><b>Service Name</b></label>
                                <p class="detail">${requestAnswer.product_name}</p>
                                <hr>
                                <label><b>Customer Name</b></label>
                                <p class="detail">${serviceUser.name}</p>
                                <hr>   
                               
                              
                                <label><b>Project Locality</b></label>
                                <p class="detail">${requestService.formatted_address}</p>
                                
                                <hr>
                                
                                <c:if test="${!empty requestAnswer.question1}">
                                <label><b>${requestAnswer.question1}</b></label>
                                <p class="detail wordWrap">${requestAnswer.answer1}</p>
                                <hr>
                                </c:if>
                                
                                <c:if test="${!empty requestAnswer.question2}">
                                <label><b>${requestAnswer.question2}</b></label>
                                <p class="detail wordWrap">${requestAnswer.answer2}</p>
                                 <hr>
                                </c:if>
                                
                                <c:if test="${!empty requestAnswer.question3}">
                                <label><b>${requestAnswer.question3}</b></label>
                                <p class="detail wordWrap">${requestAnswer.answer3}</p>
                                 <hr>
                                </c:if>
                               
                                <c:if test="${!empty requestAnswer.question4}">
                                <label><b>${requestAnswer.question4}</b></label>
                                <p class="detail wordWrap">${requestAnswer.answer4}</p>
                                 <hr>
                                </c:if>
                                
                                <c:if test="${!empty requestAnswer.question5}">
                                <label><b>${requestAnswer.question5}</b></label>
                                <p class="detail wordWrap">${requestAnswer.answer5}</p>
                                <hr>
                                </c:if>
                                
                                <c:if test="${!empty requestAnswer.question6}">
                                <label><b>${requestAnswer.question6}</b></label>
                                <p class="detail wordWrap">${requestAnswer.answer6}</p>
                                 <hr>
                                </c:if>
                               
                                <c:if test="${!empty requestAnswer.question7}">
                                <label><b>${requestAnswer.question7}</b></label>
                                <p class="detail wordWrap">${requestAnswer.answer7}</p>
                                 <hr>
                                </c:if>
                               
                                <c:if test="${!empty requestAnswer.question8}">
                                <label><b>${requestAnswer.question8}</b></label>
                                <p class="detail wordWrap">${requestAnswer.answer8}</p>
                                 <hr>
                                </c:if>
                                
                                <c:if test="${!empty requestAnswer.question9}">
                                <label><b>${requestAnswer.question9}</b></label>
                                <p class="detail wordWrap">${requestAnswer.answer9}</p>
                                 <hr>
                                </c:if>
                               
                                <c:if test="${!empty requestAnswer.question10}">
                                <label><b>${requestAnswer.question10}</b></label>
                                <p class="detail wordWrap">${requestAnswer.answer10}</p>
                                 <hr>
                                </c:if>
                               
                               <c:if test="${!empty requestAnswer.question11}">
                                <label><b>${requestAnswer.question11}</b></label>
                                <p class="detail wordWrap">${requestAnswer.answer11}</p>
                                <hr>
                                </c:if>
                                
                                <c:if test="${!empty requestAnswer.question12}">
                                <label><b>${requestAnswer.question12}</b></label>
                                <p class="detail wordWrap">${requestAnswer.answer12}</p>
                                 <hr>
                                </c:if>
                               
                                <c:if test="${!empty requestAnswer.question13}">
                                <label><b>${requestAnswer.question13}</b></label>
                                <p class="detail wordWrap">${requestAnswer.answer13}</p>
                                 <hr>
                                </c:if>
                               
                                <c:if test="${!empty requestAnswer.question14}">
                                <label><b>${requestAnswer.question14}</b></label>
                                <p class="detail wordWrap">${requestAnswer.answer14}</p>
                                 <hr>
                                </c:if>
                                
                                <c:if test="${!empty requestAnswer.question15}">
                                <label><b>${requestAnswer.question15}</b></label>
                                <p class="detail wordWrap">${requestAnswer.answer15}</p>
                                <hr>
                                </c:if>
                                
                                <c:if test="${!empty requestAnswer.question16}">
                                <label><b>${requestAnswer.question16}</b></label>
                                <p class="detail wordWrap">${requestAnswer.answer16}</p>
                                 <hr>
                                </c:if>
                               
                                <c:if test="${!empty requestAnswer.question17}">
                                <label><b>${requestAnswer.question17}</b></label>
                                <p class="detail wordWrap">${requestAnswer.answer17}</p>
                                 <hr>
                                </c:if>
                               
                                <c:if test="${!empty requestAnswer.question18}">
                                <label><b>${requestAnswer.question18}</b></label>
                                <p class="detail wordWrap">${requestAnswer.answer18}</p>
                                 <hr>
                                </c:if>
                                
                                <c:if test="${!empty requestAnswer.question19}">
                                <label><b>${requestAnswer.question19}</b></label>
                                <p class="detail wordWrap">${requestAnswer.answer19}</p>
                                 <hr>
                                </c:if>  
                               
                                <c:if test="${!empty requestAnswer.question20}">
                                <label><b>${requestAnswer.question20}</b></label>
                                <p class="detail wordWrap">${requestAnswer.answer20}</p>
                                 <hr>
                                </c:if>
                               
                              
                                
                                
                                                                                           
                            </div>                     
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

    </body>

    <!--END  BODY SECTION-->
    </html>