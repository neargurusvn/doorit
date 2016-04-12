<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
         
         <c:set var="message" value="${product.productDesc}"/>
         <title>${product.productDesc} | Nearguru </title>
         <meta name="description" content="${product.productDesc}">
         <link rel="canonical" href="http://nearguru.com/popularServiceForm/${product.productId}/${fn:replace(message, ' ', '-')}" />
         
         
        <c:choose>  
       
        	        
        	<c:when test="${product.productId eq 13}"> 
        		  <title>Interior Designer | Nearguru </title>
        		  <meta name="description" content="Interior Decorators , Home Interior design ,interior design website ,home decorator ,Room Interior design ,home decor ideas ,Home Design ,living room design , bedroom interior designs,house designers ,house interior design , interior Interior in Pune">
        		<link rel="canonical" href=" http://nearguru.com/popularServiceForm/13/Interior-design" />
			</c:when> 
        	
        	<c:when test="${product.productId eq 14}">  
        		  <title>Modular Kitchen | Nearguru</title>
        		  <meta name="description" content="Modular kitchen price in pune ,Modular kitchen cabinets ,sleek modular kitchen,indian kitchen design,indian modular kitchen designs,Modular kitchen cost ,
					Modular kitchen ideas,kitchen cabinets ,modular kitchen designs for small kitchens ,modular kitchen online ,modular kitchen furniture ">
        			<link rel="canonical" href="http://nearguru.com/popularServiceForm/14/Modular-Kitchen" />
        	</c:when>
        	<c:when test="${product.productId eq 16}"> 
        		  <title>Home Painting services | Interior Designer Pune  </title>
        		  <meta name="description" content="painters,home painters ,wall paintings ,home painting ideas ,house painting ,Exterior painting ,Home painting ,Painting websites ,Cost of painting a house,
				   House Painters in Pune">
        			<link rel="canonical" href="http://nearguru.com/popularServiceForm/16/Interior-House-Painting" />
        	</c:when>  
        	 
        </c:choose> 
      	 
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
        
        <style type="text/css" media="screen">
        .checkboxclick{}
            .border{ 
        
        border:1px solid red ; 
        padding-top: 4px;
    padding-right: 4px; 
    padding-bottom: 4px;  
    padding-left: 4px;
         
        }      
            .fa-edit,.fa-info,.fa-clock-o,.fa-credit-card,.fa-list
            {
                color:#eeb111;
            }
            .panel 
            {
                border-radius:2px;
            }
            @media (max-width: 767px) {
            
            .test{
            
            color:green;
            }
            .footer {
    background:#1D4E64; /*#EDEFF1*/
    height: auto;
    padding-bottom: 30px;
    position: relative; !important
    width: 100%;
    border-bottom: 1px solid #0ab;
    border-top: 1px solid #0ab;
}
                .btn
                {
                    width:100%;
                }
                
}
            

        </style>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
	<script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
    <script src="<c:url value="/resources/core/jquery.geocomplete.js" />"></script>
	
	
	
	
		
	<script>
	
	
	$(function(){
        var pp;
        $(" #geocomplete, #username").keydown(function(event){

        if(($(this).val().length)==0 && event.keyCode==32)
        {
        return false;
        }
       })
        .keyup(function(event)
       {
        pp = $(this).val();
        if(pp.charAt(0)==' ')
       {
       var pbb = $.trim(pp);
       $(this).val(pbb);
       }
        });
        });
	
	
	
	
	
	$(function() {
		var txt = $("#password");
		var func = function() {
			txt.val(txt.val().replace(/\s/g, ''));
		}
		txt.keyup(func).blur(func);
	});
	
	
      $(function(){
  
        $("#geocomplete").geocomplete({
          map: ".map_canvas",
          details: "form ul",
          detailsAttribute: "data-geo",
		  country: 'IN'
        });
                
      });

      $(function(){
    	  
          $("#togeocomplete").geocomplete({
            map: ".map_canvas",
            details: "form ul",
            detailsAttribute: "data-geo",
  		  country: 'IN'
          });
                  
        });

$(function(){
    	  
          $("#fromgeocomplete").geocomplete({
            map: ".map_canvas",
            details: "form ul",
            detailsAttribute: "data-geo",
  		  country: 'IN' 
          });
                  
        });
      
      
      $( document ).ready(function() {
    	 
    	
    	  
  $('.checkboxclick').click(function(){ 
    		  
    		  $(this).trigger('click');    
    		  
    	  });  
  
    	  $(".clickablediv").click(function(){   		       
    		  $(':checkbox', this).trigger('click');
    		});
  	     
    	 
    		   
    	  
    	
    /* 	$('#fullName').show();
    	$('#email').show();
    	$('#mobile').hide();
    	//$('#mobileVisible').hide();
    	  $('#textEmail').click(function(){
  	    	  $('#fullName').show();  
  	    	 $('#email').show();
  	    	 $('#mobile').show();
  	    //	$('#mobileVisible').show();
  	    	$("#mobileInput").attr("required", true);
  	    	  });
    	  $('#emailOnly').click(function(){
    		  $('#fullName').show();
   	    	 $('#email').show();
   	    	 $('#mobile').hide(); */
   	    	//$('#mobileVisible').hide();
   	    /* 	$("#mobileInput").attr("required", false);
  	    	  });
    	      */  
    	  	 $( "#btnCreateRequest" ).click(function() { 
    	  		   
    	  		  var flag=true;
    	  		
    	   		var check=[];
    	   		var x=null;
    	  
    	   		 //add this class from admin console
    	   		var invalidCheckboxes=$('.invalidcheckbox:checkbox:checked'); 
    	   		 var invalidCheckboxes1=$('.invalidcheckbox1:checkbox:checked');
    	   		 var invalidCheckboxes2=$('.invalidcheckbox2:checkbox:checked');
    	   		 var invalidCheckboxes3=$('.invalidcheckbox3:checkbox:checked');
    	   		 var invalidCheckboxes4=$('.invalidcheckbox4:checkbox:checked');
    	   		
    	   		
    	   		
    	   	 x=$( "#invalidcheckbox" ).hasClass( "invalidcheckbox" );  
    	   		check.push({
    	             exists: x ,
    	              length:invalidCheckboxes.length , 
    	              id:'invalidcheckbox'
    	         }); 
    	   		 x=$( "#invalidcheckbox1" ).hasClass( "invalidcheckbox1" );  
    	   		check.push({
    	             exists: x ,  
    	             length:invalidCheckboxes1.length,
    	             id:'invalidcheckbox1'
    	         });
    	   		 x=$( "#invalidcheckbox2" ).hasClass( "invalidcheckbox2" );  
    	   		check.push({
    	             exists: x ,
    	             length:invalidCheckboxes2.length,
    	             id:'invalidcheckbox2'
    	         }); 
    	   	 x=$( "#invalidcheckbox3" ).hasClass( "invalidcheckbox3" );  
 	   		check.push({
 	             exists: x ,
 	             length:invalidCheckboxes3.length,
 	             id:'invalidcheckbox3'
 	         }); 
 	   	 x=$( "#invalidcheckbox4" ).hasClass( "invalidcheckbox4" );  
	   		check.push({
	             exists: x ,
	             length:invalidCheckboxes4.length,
	             id:'invalidcheckbox4'
	         }); 
	   	
    	   		$.each(check, function (index, value) { 
    	   		   
    	   		  
    	   		    if(value.exists){ 
    	   		    	 
    	   		    	
    	   		     if(value.length<1){   
    	   		    
    	   		    	flag=false;
    	   		    	 var tempId="border"+value.id;
    	   		    	 
    	   		   
    	   		   	$("#"+value.id+"").addClass( "border");  
    	   		 	if ( $("#"+tempId+"").length == 0) {
    	   		 		$("#"+value.id+"").append("<label id="+tempId+" style="+"color:red"+">Please select answer</label>");
    	   		 		$("#"+value.id+"").focus(); 
    	 		    	}  
    	   		     } 
    	   		     else if(value.length>=1){ 
    	   		    	 var tempId="border"+value.id;
    	   		      	$("#"+value.id+"").removeClass( "border");
    	   		      $("#"+tempId+"").remove();  
    	   		      
    	   		     }
    	   		    	  
    	   		    } 
    	   		  
    	   		});     
    	   	if(!flag){
    	   		
    	   		return false;
    	   	}
    	   		  
    	   		     
    	   		
    	   	
    	   		  
    	   	
    	   	  	
    	 });
    	      
    	  	  $('form').submit(function() {
        		  $(this).find("button[type='submit']").prop('disabled',true);
        		});
    	
      });
    </script>
   
  <style>  
  input:required:valid {
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAepJREFUeNrEk79PFEEUx9/uDDd7v/AAQQnEQokmJCRGwc7/QeM/YGVxsZJQYI/EhCChICYmUJigNBSGzobQaI5SaYRw6imne0d2D/bYmZ3dGd+YQKEHYiyc5GUyb3Y+77vfeWNpreFfhvXfAWAAJtbKi7dff1rWK9vPHx3mThP2Iaipk5EzTg8Qmru38H7izmkFHAF4WH1R52654PR0Oamzj2dKxYt/Bbg1OPZuY3d9aU82VGem/5LtnJscLxWzfzRxaWNqWJP0XUadIbSzu5DuvUJpzq7sfYBKsP1GJeLB+PWpt8cCXm4+2+zLXx4guKiLXWA2Nc5ChOuacMEPv20FkT+dIawyenVi5VcAbcigWzXLeNiDRCdwId0LFm5IUMBIBgrp8wOEsFlfeCGm23/zoBZWn9a4C314A1nCoM1OAVccuGyCkPs/P+pIdVIOkG9pIh6YlyqCrwhRKD3GygK9PUBImIQQxRi4b2O+JcCLg8+e8NZiLVEygwCrWpYF0jQJziYU/ho2TUuCPTn8hHcQNuZy1/94sAMOzQHDeqaij7Cd8Dt8CatGhX3iWxgtFW/m29pnUjR7TSQcRCIAVW1FSr6KAVYdi+5Pj8yunviYHq7f72po3Y9dbi7CxzDO1+duzCXH9cEPAQYAhJELY/AqBtwAAAAASUVORK5CYII=);
    background-position: right top;
    background-repeat: no-repeat;
  }
   input:focus:required:invalid {
  
  border-color:red ;
  color:black;
  }
  textarea:focus:required:invalid {
  
  border-color:red ;
  color:black;
  }
   select:focus:required:invalid {
  
  border-color:red ;
  color:black;
  }
  </style>

<!-- </style> -->
   
 <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-61550071-1', 'auto');
  ga('send', 'pageview');

</script>  
    
     
    </head>
    <body>
         
            <!-- HEADER SECTION -->
          <%@ include file="header.jsp" %>
          
          <section>
              <div class="container-fluid">
        <div class="row" style="margin-bottom:30px">
            <div class="col-md-12 bg-color">
           <div class="container">
                   <h2 class=""> <a href="${pageContext.request.contextPath}/popularServices" title=""><i class="fa fa-arrow-circle-o-left"></i></a>   ${product.productName} </h2>
             </div> 
           </div>

       </div>
         </div>
   </section>
       
    <div class="container"> 

         <!--  <p class=" col-md-offset-2 heading-text">
                               					 We help you hire experienced professionals at a price that's right for you
                           				 	</p>-->  
        
        
        <!-- -----------------------------------------starts here------------------------------------------------------------- -->
        
        
        <section class="section ">


            <div class="container">
                
                <div class="row">


                
                    <div class="col-md-offset-1 col-md-5">
                   
                      <c:url var="answers" value="/answers" ></c:url>
								<form:form action="${answers}" commandName="wrapRequestService">   
                    
                    <div class="panel panel-success">
                            <div class="panel-body">
                                
								<form:hidden value="${product.productId}" path="requestService.prodcutId"></form:hidden>
					<form:hidden value="${product.productName}" path="requestAnswer.product_name"></form:hidden>
                                    <fieldset>
                                    <c:set var="count" value="0" scope="page" />
                                    
                                    <c:forEach var="fromdata" items="${fromdata}">
					   					 <c:set var="que"  value="${fromdata.key}"/>
					   					 <c:set var="opt"  value="${fromdata.value}"/>
					   					 <c:set var="count" value="${count + 1}" scope="page"/>
					   					  
					   					 <form:hidden value="${que.queDesc}" path="requestAnswer.question${count}"></form:hidden>
					   					   
					   					<c:if test="${que.queType eq 'checkbox'}"> 	 		    		    
					    		 			
                                            <label><b>  ${que.queDesc}</b></label>
                                              <ul id="${que.name_class}" class="list-group ${que.name_class}">           
                          					<c:forEach items="${fromdata.value}" var="option">
					     						<li class="list-group-item clickablediv cursor"> <form:checkbox  class="${que.name_class} checkboxclick" path="requestAnswer.answer${count}" value="${option.optDesc}"></form:checkbox>&nbsp;${option.optDesc}</li>
                         	 				</c:forEach>
									        
											 </ul> 
                                          
                                         </c:if>
                                         
                                         
                                   <c:if test="${que.queType eq 'dropdown'}">  
                                      <ul class="list-group"> 
                                            <label><b> ${que.queDesc}</b></label>
                                           
                               			<form:select id="docNo" required="${que.queReq}"  class="form-control invalid cursor" path="requestAnswer.answer${count}" oninvalid="this.setCustomValidity('Please select an answer')" oninput="setCustomValidity('')">
							    				<li class="list-group-item">   <form:option value="" label="--- Select ---"/></li>
						     				<c:forEach items="${fromdata.value}" var="option">
						     				 	<li class="list-group-item"> <form:option value="${option.optDesc}"  /></li>
	                         	 	            
											</c:forEach>
							  			</form:select>
						                </ul>
                                     
                                    </c:if>
                                    
                                    
                                    
                                <c:if test="${que.queType eq 'text'}">
                                		<ul class="list-group">
                                            <label><b>  ${que.queDesc} </b></label>
                                            <form:input maxlength="${que.maxLen}" required="${que.queReq}" class="form-control invalid" path="requestAnswer.answer${count}" oninvalid="this.setCustomValidity('Please enter description')" oninput="setCustomValidity('')" />
						                </ul>      
                                    
                                   </c:if>  
                                   
                                      
                                  <c:if test="${que.queType eq 'textarea'}">
                                  		<ul class="list-group">
                                            <label><b> ${que.queDesc}</b> </label>
                                           <form:textarea class="form-control invalid" required="${que.queReq}"  maxlength="${que.maxLen}" path="requestAnswer.answer${count}" rows="4" cols="38"  oninvalid="this.setCustomValidity('Please enter description')" oninput="setCustomValidity('')"  />	  
						                </ul>
                                   
                                  </c:if>
                                  
                                  <c:if test="${que.queType eq 'location'}">
                                        
                                        <div class="form-group">
                                                <label><b>From Location </b></label> 
                                                <div class="map_canvas"></div>
                                               <form:input id="fromgeocomplete" required="required" path="requestAnswer.answer${count}" type="text"  class="form-control invalid" placeholder="Choose Location"    />
                                               
                                               <!-- 
                                               <ul>
												 <form:hidden data-geo="lat"  path="requestService.lat" /> 
												 <form:hidden data-geo="lng" path="requestService.lng" />
										         <form:hidden data-geo="postal_code" path="requestService.postal_code" />
										         <form:hidden data-geo="locality" path="requestService.locality" />  
												 <form:hidden data-geo="sublocality"  path="requestService.sublocality"/>
										         <form:hidden data-geo="country_short"  path="requestService.country" />
										         <form:hidden data-geo="administrative_area_level_1" path="requestService.State" />
										        </ul>
                                    			 -->    
                                          </div>
                                          </c:if>
                                          
                                          <c:if test="${que.queType eq 'tolocation'}">
                                        
                                        <div class="form-group">
                                                <label><b>To Location </b></label>
                                                <div class="map_canvas"></div>
                                               <form:input id="togeocomplete" required="required" path="requestAnswer.answer${count}" type="text"  class="form-control" placeholder="Choose Location"  />
                                               
                                               <!-- 
                                               <ul>
												 <form:hidden data-geo="lat"  path="requestService.lat" /> 
												 <form:hidden data-geo="lng" path="requestService.lng" />
										         <form:hidden data-geo="postal_code" path="requestService.postal_code" />
										         <form:hidden data-geo="locality" path="requestService.locality" />
												 <form:hidden data-geo="sublocality"  path="requestService.sublocality"/>
										         <form:hidden data-geo="country_short"  path="requestService.country" />
										         <form:hidden data-geo="administrative_area_level_1" path="requestService.State" />
										        </ul>
                                    			 -->    
                                          </div>
                                          </c:if>
                                    
                                          
                                       <hr> 
                                        </c:forEach>
                                        <!-- 
                                        <div class="form-group">
                                                <label><b>Address </b></label>
                                                <form:input  required="required" class="form-control"  path="requestService.address" placeholder="Address" />
                                          </div>
                                         -->
                                        <div class="form-group">
                                                <label><b>Location </b></label>  
                                                <div class="map_canvas"></div>
                                               <form:input id="geocomplete" required="required" path="requestService.formatted_address" type="text"  class="form-control invalid" placeholder="Enter a location"  oninvalid="this.setCustomValidity('Please choose  location')" oninput="setCustomValidity('')" />
                                               
                                               
                                               <ul>
												 <form:hidden data-geo="lat"  path="requestService.lat" /> 
												 <form:hidden data-geo="lng" path="requestService.lng" />
										         <form:hidden data-geo="postal_code" path="requestService.postal_code" />
										         <form:hidden data-geo="locality" path="requestService.locality" />
												 <form:hidden data-geo="sublocality"  path="requestService.sublocality"/>
										         <form:hidden data-geo="country_short"  path="requestService.country" />
										         <form:hidden data-geo="administrative_area_level_1" path="requestService.State" />
										        </ul>
                                    			    
                                          </div>
                                          <!-- 
                                          <div class="form-group">
                                                <label><b>Location </b></label>
                                                <form:input required="required" class="form-control" oninvalid="InvalidLocation(this);" path="requestService.locality" placeholder="Location"/>
                                          </div>  
                                         -->
                                         
                                        <c:if test="${not empty user}"> 
                                         <p> By clicking Submit form, you indicate that you have read and agree to the <a style="cursor:pointer" onclick="openFooterLinks('termsOfUsage')">Terms of Use </a>and <a style="cursor:pointer" onclick="openFooterLinks('privacyPolicy')">Privacy Policy</a>.</p>  
                                          <button id="btnCreateRequest"   class="btn btn-primary " type="submit">Submit</button>
                                          </c:if>
                                    </fieldset> 
                                    
                                    
                                   
                               
                                               
                    <c:if test="${empty user}">
						
                          
							
                           			 <fieldset>
                                        
                                          
                                <!--   <div class="radio clickableradio ">
      <label><input type="radio" id="textEmail" name="optradio">I want quotes by email and text message</label>
    </div>
                                   
                                    <div class="radio clickableradio "> 
      <label><input type="radio" checked id="emailOnly" name="optradio">I want quotes by email only</label>
    </div> --> 
                                         <div id="fullName" class="form-group">
                                            <label><b>Full name </b> </label>
                                            <form:input   maxLength="30"  class="form-control invalid" path="user.name" id="username" required="required" oninvalid="this.setCustomValidity('Please enter  name')" oninput="setCustomValidity('')"  />                                           
                                        </div>
                                        <div id="email" class="form-group">
                                            <label><b>Email </b></label>
                                            <form:input class="form-control invalid" type="email" path="user.emailId" required="required" maxlength="60"   oninvalid="this.setCustomValidity('Please enter valid email')" oninput="setCustomValidity('')" /> 
                                                                                     
                                        </div>
          				                  <div id="mobile" class="form-group"> 
                                            <label> <b>Mobile</b> </label>
                                            <form:input type="text" pattern="\d*" required="required" id="mobileInput" minlength="10" maxlength="12" class="form-control invalid" path="user.mobile"  oninvalid="this.setCustomValidity('Please enter valid mobile number')" oninput="setCustomValidity('')"  />
                                          </div>   
                                        <%--    <div id="mobileVisible" >   
                                           		<form:checkbox path="requestService.isNumberVisible" value="true"/>&nbsp;&nbsp;My  Number should be visible to Professionals<br/>
                                           </div> --%>
                                           	<c:if test="${wrapSuccessError.suceess eq false }">
											<div class="alert alert-danger  " role="alert">  
											<a class="close" data-dismiss="alert">×</a>  
											${wrapSuccessError.action} ?</br> <a herf="#">Reset Password <a/>
											</div> 
											</c:if>
                                             
                                            <div class="form-group">
                                            	<label><b> Password </b></label>
                                            	<form:input  maxlength="15"   type="password" id="password" class="form-control invalid" path="user.password" required="required"  oninvalid="this.setCustomValidity('Please enter passowrd')"  oninput="setCustomValidity('')"/>
                                       		</div>
                                        
                                        <p> By clicking Submit form, you indicate that you have read and agree to the <a style="cursor:pointer" onclick="openFooterLinks('termsOfUsage')">Terms of Use </a>and <a style="cursor:pointer" onclick="openFooterLinks('privacyPolicy')">Privacy Policy</a>.</p>  
                                        <button id="btnCreateRequest" class="btn btn-primary " type="submit">Submit</button>
                                        
                                        
                                        
                                    </fieldset>
								</c:if>
                           </div>
                       


                    
                    
    </div>
 </form:form>
                        </div>
                
				
 <div class="col-xs-12 col-sm-12 col-md-offset-1 col-md-5" >  
                        <p style="font-size:24px;
	color:#3c7088">How we work?</p>
                        <p align="justify">In a couple of hours we will send you interested service provider's quotation, profile, their expertise and reviews. You can compare and select as per your specific need very easily. You get to hire the best!</p>
                </div>
               
                </div>
            </div>  
 
        </section>
        
        
        
        
        
        
        <!-- ------------------------------------------ends here------------------------------------------------------------- -->
     
      
        
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
        
        <script type="text/javascript">     $(document).ready(function() {

                $('#with').hide();
                $('#without').hide();

                $('#withtext').click(function() {
                    if ($('#withtext').is(':checked'))
                    {
                        $('#with').show(500);
                        $('#with').focus();
                        $('#without').hide(500);
                    }
                });
                $('#withouttext').click(function() {
                    if ($('#withouttext').is(':checked'))
                    {
                        $('#without').show(500);
                        $('#without').focus();
                        $('#with').hide(500);
                    }
                });
            });
        </script>

    </body>
</html>