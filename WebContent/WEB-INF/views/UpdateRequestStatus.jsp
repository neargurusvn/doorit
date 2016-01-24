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
    <title>Update Request Status-NearGuru</title>
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
          <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
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
	<script>
	  $( document ).ready(function() {
			
		 
		  $( "#updateProjectStatus" ).click(function() { 
	  			
		  		
			  if($('input:radio:checked').length < 1){
				
				  
				  alert("Please select atleast one reason");  
				  return false;
				 }
		  	  	
		}); 
		  
		  $(".list-group-item").click(function(){
	    		 //    window.location=$(this).find("a").attr("href"); 
	    		  //   return false;
	    		       
	    		  $(':radio', this).prop("checked", true) 
	    		});  
	  });
	</script>
</head>
<!-- END HEAD SECTION-->  

<!-- BODY SECTION-->
<body>

    <!-- HEADER SECTION -->
    <%@ include file="header.jsp" %>

      <section>
        <div class="row" style="margin-bottom:30px">
            <div class="col-md-12 bg-color">
               <div class="container">
                   <h2 class=""> <a href="${pageContext.request.contextPath}/manageRequest" title=""><i class="fa fa-arrow-circle-o-left"></i></a>   Update Request Status </h2>
               </div>
           </div>

       </div>
   </section>
        <section class="section ">


                <div class="container">

                    <div class="row">


                        <div class="col-md-offset-1 col-md-5 " >
                            <div class="panel panel-success">
                            <div class="panel-body">
                                  <c:url var="saveRequestStatus" value="/saveRequestStatus" ></c:url>
                                    <form:form action="${saveRequestStatus}" commandName="serviceRequest">

                                    <fieldset>                      
                                        <ul class="list-group">
                                         <p align="justify">Update Status of<strong> ${product.productName} </strong> Project</p>
                                    <br>
                       
                          
                          					 <c:choose>
                          							<c:when test="${requestType eq 'WIP'}">
                          										 <li class="list-group-item"><form:radiobutton path="statusReason" value="Completed Successfully"/>&nbsp;Completed Successfully </li>
                                           				<li class="list-group-item"><form:radiobutton path="statusReason" value=" Dispute"/> Dispute</li>
                          							</c:when>
                          							<c:otherwise>
                          								
                                           				<li class="list-group-item"><form:radiobutton path="statusReason" value=" Hired a professional not on NearGuru"/> I hired a professional not on NearGuru</li>
                                         			   <li class="list-group-item"><form:radiobutton path="statusReason" value="Hired a friend or did it myself"/> I hired a friend or did it myself</li>
                                          			   <li class="list-group-item"><form:radiobutton path="statusReason" value="Had a change of plans"/> I had a change of plans</li>
                                           			    <li class="list-group-item"><form:radiobutton path="statusReason" value="Did not liked the Quotes i got"/> I did not liked the Quotes i got</li>
                                   	
                          							
                          							</c:otherwise>
                          					</c:choose>
                                   
                                   			
                                  
                                
                                  
                                          
                                        </ul>
                                    </fieldset>
                              
                              
                          <form:hidden  path="requestId" value="${requestId}" ></form:hidden>
  <form:hidden  path="status" value="OLD" ></form:hidden>
                            <p style="margin-top:20px;" align="justify">Note: Within hours we'll introduce you to several interested and available ${product.productName} professionals</p>
                        
                    
                   

                            <button style="margin-top:20px;margin-bottom:20px;" id="updateProjectStatus" type="submit" class="btn btn-primary">&nbsp Update request Status</button>
                        
                        </form:form>
                            </div>
                        </div>
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


</div>
</body>

<!--END  BODY SECTION-->
</html>