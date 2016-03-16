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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="robots" content="index, follow" />
	<meta name="YahooSeeker" content="INDEX, FOLLOW" />
	<meta name="msnbot" content="INDEX, FOLLOW" />
	<meta name="googlebot" content="INDEX, FOLLOW" />
	<meta name="application-name" content="nearguru" />
	<meta name="allow-search" content="yes" />
	<meta name="robots" content="index, follow" />
	<meta name="service" content=" Business,Sell, " />
	<meta name="document-type" content="Public" />
	<meta name="distribution" content="India" />
	<meta name="category" content=" Business " />
	<meta name="doc-type" content="web page" />
	<meta name="doc-class" content="Published" />
    <title> Nearguru | Hire an Expert Near You</title>
    
       
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
		
		
            div.desc{
                background-color: #000;
                bottom:20px;
                color: #fff;
                left: 15px;
                opacity: 0.5;
                position: absolute;
                width: 90%;
                height:50px;
                padding:20px;
                font-size:25px;
            }

            .fix{
                width: 100%;
                padding: 0px;
            }
           
            
            .list-group-item
            {
                border-radius:2px;
            }
        </style>


    </head>
    <!-- END HEAD SECTION-->

    <!-- BODY SECTION-->
    <body>
            
            <!-- HEADER SECTION -->
  <%@ include file="header.jsp" %>
          
         <section>
 <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 bg-color">
               <div class="container">
                   <h2 class=""> <a href="#" title=""></a> Service requests </h2>
               </div>
           </div>
</div>
       </div>   
   </section>
           
   
  
        <div class="container-fluid"> 
            <!-- END HEADER SECTION -->  
            <!--PAGE CONTENT--> 
            <!-- HOMEPAGE SECTION-->  
          
           
            <section class="section " >  
                <div class="container-fluid" style="margin-top:30px">
                    <div class="row ">
                        <div class=" col-md-12">
                            
                             <c:if test="${not empty userRequests }">
   
					   
						<div class="alert alert-success">
							<label class="text-info">Congratulations! You have received a service request. If interested, please bid quoting your price. However, this price need not be the final one and you can change after knowing more details about the service.  </label>
						</div>
					
						</c:if>

                            <div class=" list-content">
    <ul class="list-group">
    <c:set var="index"  value="${0}"/>
    <c:if test="${empty userRequests}">
   <div class="text-center bg-info text-info" style="height:60px;">       
   		<h4 style="padding-top:20px;padding-bottom:15px">You have not received any service request Or You are not verified yet or your account is temporarily suspended . 
   		                            Please call +91-86000 23817 Or Email info@nearguru.com for more information  </h4>   
   </div>
    </c:if>
    <c:forEach var="requests" items="${userRequests}">
   <c:url var="bidService" value="/bidService" ></c:url> 
	 <c:set var="index"  value="${index}+1"/>
<form:form  action="${bidService}" commandName="wrapRequestService">
      <li href="#" class="list-group-item text-left">
        <article class="request row">
            <div class="col-xs-6 col-sm-2 col-md-1">
             <c:choose>
                 <c:when test="${requests.user.filename ne null}">
                 	 <img src="<c:url value="/download/${requests.user.userId}" />" class="img-responsive img-circle" alt="avatar" >
                 </c:when>
                 <c:otherwise> 
                  <img src="<c:url value="/resources/assets/img/imgPlace.jpg" />" class="img-responsive img-circle" alt="avatar" >
                 </c:otherwise>
                 </c:choose>
               <%--  <img src="<c:url value="/download/${requests.user.userId}" />" class="avatar img-circle" alt="avatar" > --%>
               
            </div>
            <div class="col-xs-6 col-sm-3 col-md-3">
                <ul class="meta-search">
                    <li><h3>${requests.user.name} </h3></li>
                    <li><i class="fa fa-calendar"></i> <span> ${requests.serviceRequestedDate} </span></li>
                    <li><i class="fa fa-map-marker"></i> <span><c:if test="${requests.requestService.sublocality ne ''}"> ${requests.requestService.sublocality},</c:if> ${requests.requestService.locality} </span></li>
                    <li ><i class="fa fa-th text-success"></i></i>&nbsp <a>Quotes Submitted&nbsp <span class="badge"> ${requests.quoteNumber}</span></a></li>
                </ul>
            </div>      
                
               <form:hidden  path="user.name" value="${requests.user.name}" ></form:hidden>
               <form:hidden  path="requestAnswer.requestId" value="${requests.requestAnswer.requestId}" ></form:hidden>
              
               
               
            <div class="col-xs-12 col-sm-6 col-md-6 excerpet">
                <h3><a href="${pageContext.request.contextPath}/viewRequest/${requests.requestService.requestId}" title=""> ${requests.requestAnswer.product_name}</a></h3>
                <p class="wordWrap">
                <c:if test="${requests.requestAnswer.answer1 ne null}">
                ${requests.requestAnswer.answer1}
                </c:if>
                  <c:if test="${requests.requestAnswer.answer2 ne null}">
               - ${requests.requestAnswer.answer2}
                </c:if>
                  <c:if test="${requests.requestAnswer.answer3 ne null}">
                - ${requests.requestAnswer.answer3}
                </c:if>
                 <c:if test="${requests.requestAnswer.answer4 ne null}">
                - ${requests.requestAnswer.answer4}
                </c:if>
                 <c:if test="${requests.requestAnswer.answer5 ne null}">
                - ${requests.requestAnswer.answer5}
                </c:if>
                 <c:if test="${requests.requestAnswer.answer6 ne null}">
                - ${requests.requestAnswer.answer6}
                </c:if>
                   <c:if test="${requests.requestAnswer.answer6 ne null}">
              .... <a href="${pageContext.request.contextPath}/viewRequest/${requests.requestService.requestId}">more</a>
                </c:if>
                
                </p>                        
                
            </div>
            <div class="class="col-xs-6 col-sm-2 col-md-2"">
                <button type="submit" class="btn btn-success">Send Quote</button>
                
            </div>  
            <span class="clearfix borda"></span>
        </article>
      </li>
      </form:form>
     </c:forEach>
    
    </ul>
  </div>
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


    </div>
</body>

<!--END  BODY SECTION-->
</html>  