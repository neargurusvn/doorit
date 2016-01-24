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
    <title>Service Request-NearGuru</title>
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
        <link id="mainStyle" href="<c:url value="/resources/assets/css/main.css" />" rel="stylesheet" />
        <link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
	
        <style type="text/css">
        
          input:required:valid {
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAepJREFUeNrEk79PFEEUx9/uDDd7v/AAQQnEQokmJCRGwc7/QeM/YGVxsZJQYI/EhCChICYmUJigNBSGzobQaI5SaYRw6imne0d2D/bYmZ3dGd+YQKEHYiyc5GUyb3Y+77vfeWNpreFfhvXfAWAAJtbKi7dff1rWK9vPHx3mThP2Iaipk5EzTg8Qmru38H7izmkFHAF4WH1R52654PR0Oamzj2dKxYt/Bbg1OPZuY3d9aU82VGem/5LtnJscLxWzfzRxaWNqWJP0XUadIbSzu5DuvUJpzq7sfYBKsP1GJeLB+PWpt8cCXm4+2+zLXx4guKiLXWA2Nc5ChOuacMEPv20FkT+dIawyenVi5VcAbcigWzXLeNiDRCdwId0LFm5IUMBIBgrp8wOEsFlfeCGm23/zoBZWn9a4C314A1nCoM1OAVccuGyCkPs/P+pIdVIOkG9pIh6YlyqCrwhRKD3GygK9PUBImIQQxRi4b2O+JcCLg8+e8NZiLVEygwCrWpYF0jQJziYU/ho2TUuCPTn8hHcQNuZy1/94sAMOzQHDeqaij7Cd8Dt8CatGhX3iWxgtFW/m29pnUjR7TSQcRCIAVW1FSr6KAVYdi+5Pj8yunviYHq7f72po3Y9dbi7CxzDO1+duzCXH9cEPAQYAhJELY/AqBtwAAAAASUVORK5CYII=);
    background-position: right top;
    background-repeat: no-repeat;
  }
  input:focus:required:invalid {
  
  border-color:red ;
  color:black;
  }
        .login
        {
            margin-top:55px;
        }

        @media (max-width: 767px) {
            .login
            {
                margin-top:0px;
            }
        }
    </style>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
	
	<script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
    <script src="<c:url value="/resources/core/jquery.geocomplete.js" />"></script>
	
	<link rel="shortcut icon" href="/resources/favicon.ico" type="image/x-icon">

	
	
	
	
	
	<script>
      $(function(){
        $("#geocomplete").geocomplete({
          map: ".map_canvas",
          details: "form ul",
          detailsAttribute: "data-geo",
		  country: 'IN'
        });
                
      });
    
      $(document).ready(function() { 

    	
    	  $( "#btnContinue" ).click(function() {
 			 
    		
    		  
    		
    		  var productId=$("#product").val();
    		  var address=$("#geocomplete").val();
    		  
    	
    		  if(productId==0 || address=="" ){
    			  
    			  return false; 
    		  }
    		  else{ 
    			  
    			  $('#indexform').attr('action', 'POST'); 
 	    		 $("#indexform").attr("action",context+"/ServiceForm"); 
    		  }
			
    		 
    		
    	 });
     	
  		$('#w-input-search').autocomplete({
  			serviceUrl: '${pageContext.request.contextPath}/getTags',
  			paramName: "tagName",
  			delimiter: ",",
  		    transformResult: function(response) {
  		    	
  		        return {
  		        	
  		            suggestions: $.map($.parseJSON(response), function(item) {
  		            	
  		            	//document.getElementById("w-product").value = item.id;
  		                return { value: item.tagName, data: item.id };
  		            })
  		            
  		        };
  		        
  		    },
  		  onSelect: function (suggestion) {
  			document.getElementById("w-product").value = suggestion.data;
  	        //alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
  	    }
  		    
  		});

  		
  		  		
  	});

  		</script>
	
  <style type="text/css">
  input:required:valid {
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAepJREFUeNrEk79PFEEUx9/uDDd7v/AAQQnEQokmJCRGwc7/QeM/YGVxsZJQYI/EhCChICYmUJigNBSGzobQaI5SaYRw6imne0d2D/bYmZ3dGd+YQKEHYiyc5GUyb3Y+77vfeWNpreFfhvXfAWAAJtbKi7dff1rWK9vPHx3mThP2Iaipk5EzTg8Qmru38H7izmkFHAF4WH1R52654PR0Oamzj2dKxYt/Bbg1OPZuY3d9aU82VGem/5LtnJscLxWzfzRxaWNqWJP0XUadIbSzu5DuvUJpzq7sfYBKsP1GJeLB+PWpt8cCXm4+2+zLXx4guKiLXWA2Nc5ChOuacMEPv20FkT+dIawyenVi5VcAbcigWzXLeNiDRCdwId0LFm5IUMBIBgrp8wOEsFlfeCGm23/zoBZWn9a4C314A1nCoM1OAVccuGyCkPs/P+pIdVIOkG9pIh6YlyqCrwhRKD3GygK9PUBImIQQxRi4b2O+JcCLg8+e8NZiLVEygwCrWpYF0jQJziYU/ho2TUuCPTn8hHcQNuZy1/94sAMOzQHDeqaij7Cd8Dt8CatGhX3iWxgtFW/m29pnUjR7TSQcRCIAVW1FSr6KAVYdi+5Pj8yunviYHq7f72po3Y9dbi7CxzDO1+duzCXH9cEPAQYAhJELY/AqBtwAAAAASUVORK5CYII=);
    background-position: right top;
    background-repeat: no-repeat;
  }

</style>
   
</head>
<body class="Site">

 <!-- HEADER SECTION -->
     <%@ include file="header.jsp" %>
<div class="Site-content">
<section>
    <div class="container"> 
        <div class="row">
            <div class="col-xs-12 col-sm-4 col-sm-offset-4 col-md-6 col-md-offset-3 login" >
                <div class="panel panel-success">
                    <div class="panel-heading ">Compare quotes & prices from local business</div>
                    
                    	  
                    <div class="panel-body"> 

                     <c:url var="requestService" value="/ServiceForm" ></c:url>

<form:form action="${requestService}" id="requestServiceform" commandName="userProsProfile">
                            <fieldset>
                                 
                                <div class="form-group">
                                    <label><b>What service do you need?</b></label>
                                    <form:input id="w-input-search" placeholder="e.g. plumbing , cleaning , photography , catering" value="" maxlength="30" required="required" path="product.productName" class="form-control input-lg col-md-4 invalid"    />
                                  
                                </div>
                                 
								     <div class="form-group">
                                     <label><b>Where do you need it?</b></label>
                                     <div class="map_canvas"></div>
                                     <form:input id="geocomplete" maxlength="60"   path="requestService.formatted_address" type="text"  class="form-control input-lg col-md-4 invalid" oninvalid="this.setCustomValidity('Please enter your location')"
   									 oninput="setCustomValidity('')"   />
                                    
                                     <form:hidden  id="w-product" value="" path="product.productId"></form:hidden>
                                    
									 <ul>
									  
									 <form:hidden data-geo="lat"  path="requestService.lat" /> 
									 <form:hidden data-geo="lng" path="requestService.lng" />
							         <form:hidden data-geo="postal_code" path="requestService.postal_code" />
							         <form:hidden id="locality" data-geo="locality" path="requestService.locality" />
									 <form:hidden data-geo="sublocality"  path="requestService.sublocality"/>
							         <form:hidden data-geo="country_short"  path="requestService.country" />
							         <form:hidden data-geo="administrative_area_level_1" path="requestService.State" />
							        </ul>
							                                      
                                </div> 
         
                                <input class="btn btn-success btn-lg" id="btnContinue" type="submit" value="Get FREE Quotes" />
                            </fieldset>
                       </form:form>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</section>

</div>
<!-- footer -->
<%@ include file="footer.jsp" %>

		<script src="<c:url value="/resources/assets/js/jquery.easing.1.3.js" />"></script>
        <script src="<c:url value="/resources/assets/plugins/bootstrap/bootstrap.min.js" />"></script>
        <script src="<c:url value="/resources/assets/plugins/isotope/jquery.isotope.min.js" />"></script>
        <script src="<c:url value="/resources/assets/plugins/fancybox/jquery.fancybox.pack.js" />"></script>
        <script src="<c:url value="/resources/assets/js/jquery.localscroll-1.2.7-min.js" />"></script>
        <script src="<c:url value="/resources/assets/js/jquery.appear.js" />"></script>
        <script src="<c:url value="/resources/assets/scripts/main.js" />"></script>
        <script src="<c:url value="/resources/assets/scripts/login.js" />"></script>
</body>
</html>
