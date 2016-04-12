<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html class="no-js">
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
<meta name="google-site-verification" content="zDQzN8fpB-A0NgCrU9BskeJUMZMMNV4AuOzeL6Sp-aU" />
<title>Nearguru | Hire an expert pay fair price </title>
<meta name="description" content="Strat Home Renovation - Architects Engineers , Bathroom Renovation ,Building Contractors ,Building Material ,Carpenter ,Doors and Windows ,Electrical ,Exterior House Painting
False Ceiling ,Fencing ,Flooring ,Furniture Making ,Home Cleaning ,Interior Design ,Interior House Painting ,Landscaping ,Modular Kitchen ,Pest Control
Plumbing ,Roofings ,Safety Doors,Swimming Pools,Wallpapers,Water Proofing">

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<!-- Fonts -->
<!-- CSS -->

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


<!-- Js -->
<script src="<c:url value="/resources/assets/js/jquery.easing.1.3.js" />"></script>
<script src="<c:url value="/resources/assets/plugins/bootstrap/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/assets/plugins/isotope/jquery.isotope.min.js" />"></script>
<script src="<c:url value="/resources/assets/plugins/fancybox/jquery.fancybox.pack.js" />"></script>
<script src="<c:url value="/resources/assets/js/jquery.localscroll-1.2.7-min.js" />"></script>
<script src="<c:url value="/resources/assets/js/jquery.appear.js" />"></script>
<script src="<c:url value="/resources/assets/scripts/main.js" />"></script>
<script src="<c:url value="/resources/assets/scripts/login.js" />"></script>
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
<script src="<c:url value="/resources/core/jquery.geocomplete.js" />"></script>
<style type="text/css">
.jumbotron{
background-color: #428BCA;
/*background-color:none !important;*/
}

.icon-background {
    color: #DDD;
}
.footer {
    background:#656060; 
}
</style>

<script>

	/* function myfunction(variables) {

		alert(variables.checked);

		if (variables.checked) {

			window.location.href = "http://www.google.com";
		}
		// var checkboxvalue=document.getElementById(variables); 
		// alert(checkboxvalue);    
	} */
	/*  (function( $ ){
		   $.fn.myfunction = function() {
		      alert('hello world');
		      return this;
		   }; 
		})( jQuery ); */
	$(function() {
		$("#geocomplete").geocomplete({
			map : ".map_canvas",
			details : "form ul",
			detailsAttribute : "data-geo",
			country : 'IN'
		});

	});

	$(document).ready(function() {

		$("#btnContinue").click(function() {

			var context = "${pageContext.request.contextPath}";
			var productId = $("#product").val();
			var address = $("#geocomplete").val();

			if (productId == 0 || address == "") {

				return false;
			} else {

				$('#indexform').attr('action', 'POST');
				$("#indexform").attr("action", context + "/ServiceForm");
			}

		});

		$('#w-input-search').autocomplete({
			serviceUrl : '${pageContext.request.contextPath}/getTags',
			paramName : "tagName",
			delimiter : ",",
			transformResult : function(response) {

				return {

					suggestions : $.map($.parseJSON(response), function(item) {

						//document.getElementById("w-product").value = item.id;
						return {
							value : item.tagName,
							data : item.id
						};
					})

				};

			},
			onSelect : function(suggestion) {
				document.getElementById("w-product").value = suggestion.data;
				//alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
			}
		});

	});
</script>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-61550071-1', 'auto');
  ga('send', 'pageview');

</script>

<meta name="google-site-verification"
	content="zDQzN8fpB-A0NgCrU9BskeJUMZMMNV4AuOzeL6Sp-aU" />
</head>
<body>
	<div id="fb-root"></div>
	<!-- <script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=1551978688388574&version=v2.3";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script> -->
	<header>
		<div class="container ">
			<div class="row">
				<div class="col-md-3 col-xs-6 col-sm-3">

					<a href="${pageContext.request.contextPath}/index" class="logo">
						<img src="<c:url value="/resources/assets/img/logo.png" />"
						alt="Nearguru - Hire an service expert">
					</a>

				</div>
				<div class="fb-like col-md-3 col-xs-6 col-sm-3"
					data-href="https://www.facebook.com/pages/Nearguru/1591687554433559"
					data-layout="button" data-action="like" data-show-faces="false"
					data-share="true"></div>

				<div class="col-md-6 col-xs-12 col-sm-3">

					<c:if test="${user eq null}">
						<ul class="social-info">

							<li><a style="color: black"
								href="${pageContext.request.contextPath}/pros"><b>List
										Your Business</b></a></li>
							<li><a style="color: black"
								href="${pageContext.request.contextPath}/SignUp">Sign Up</a></li>
							<li><a style="color: black"
								href="${pageContext.request.contextPath}/login">Sign In</a></li>
						</ul>
					</c:if>
					<c:if test="${user ne null}">
						<%-- <ul class="social-info">
                    <c:if test="${user.userType eq 'pros'}">
                    	  <li><a  style="color:black" href="${pageContext.request.contextPath}/prosDashboard" >Dashboard</a></li>
                    </c:if>
                      <c:if test="${user.userType eq 'cust'}">
                    	  <li><a style="color:black"  href="${pageContext.request.contextPath}/manageRequest" >Dashboard</a></li>
                    </c:if>
                     <li><a style="color:black"  href="${pageContext.request.contextPath}/logout">Log Out</a></li>
                    
                 </ul>   --%>
						<ul class="social-info">
							<c:if test="${user.userType eq 'pros'}">
								<li><a style="color: black"
									href="${pageContext.request.contextPath}/prosDashboard">Dashboard</a></li>
							</c:if>
							<c:if test="${user.userType eq 'cust'}">
								<li><a style="color: black"
									href="${pageContext.request.contextPath}/manageRequest">Dashboard</a></li>
							</c:if>
							<li><a style="color: black"
								href="${pageContext.request.contextPath}/logout"">Log out</a></li>
						</ul>
					</c:if>
					<%--  <c:if test="${user ne null and user.userType eq 'pros'}">  
                   		<ul class="nav navbar-nav  navbar-right"> 
                   			 
                   		   <li class="active"><a  class="btn btn-primary" href="${pageContext.request.contextPath}/prosDashboard" >Dashboard</a></li>
                   		    
                   		      <li ><a  href="${pageContext.request.contextPath}/logout">Log Out</a></li>
                   		 </ul> 
                   </c:if> 
                    <c:if test="${user ne null and user.userType eq 'cust'}"> 
                   		<ul class="nav navbar-nav  navbar-right">
                   			 
                   		   <li class="active"><a class="btn btn-primary" href="${pageContext.request.contextPath}/manageRequest" >Dashboard</a></li>
                   		      <li ><a  href="${pageContext.request.contextPath}/logout">Log Out</a></li>
                   		 </ul>
                   </c:if> --%>
				</div>
			</div>
		</div>
	</header>



	<div class="jumbotron" style="padding-top: 55px">
		<section id="banner">

			<div class="container">
				<div class="row">

					<div class="col-xs-12 col-md-7 col-sm-6 ">
						
						<h1 style="color:white">
									 <b class="hidden-xs hidden-sm">START YOUR HOME RENOVATION </b>
									 <br>
									 <p> <b>Get free quotes and price from best pre-screened architects , civil engineers , interior designers and general contractors near you</b></b></p>
						</h1>
						
						
						
						
					</div>
					<div class="col-xs-12 col-md-5 col-sm-5">
						<div class="row">
							<div class="panel panel-success ">
								

								<div class="panel-body">
									<c:url var="requestService" value="/ServiceForm"></c:url>
									<form:form action="${requestService}" id="indexform"
										commandName="userProsProfile">

										<div class="form-group">
											<label><b>What project do you need help with?</b></label>
											<form:input id="w-input-search" value="" maxlength="100"
												required="required" path="product.productName"
												class="form-control input-lg col-md-4"
												placeholder="interior design , modular kitchen , House Painting" />
										</div>

										<!--
                                     <div class="form-group">
					            
						            <label><b>What service do you need?</b></label>
						            <form:select id="product" class="form-control input-lg col-md-2" path="product.productId" required="required">
	               					<form:option value="0" label=" Please select a service"/> 
	                				<form:options items="${mapProduct}" />
	                				</form:select>

			 						</div>					                                
									 -->
										<div class="form-group">
											<label><b>Where do you need it?</b></label>

											<div class="map_canvas"></div>
											<form:input id="geocomplete"
												class="form-control input-lg col-md-2" maxlength="200"
												path="requestService.formatted_address" type="text" />

											<form:hidden id="w-product" value="" path="product.productId"></form:hidden>

											<ul>
												<form:hidden data-geo="lat" path="requestService.lat" />
												<form:hidden data-geo="lng" path="requestService.lng" />
												<form:hidden data-geo="postal_code"
													path="requestService.postal_code" />
												<form:hidden id="locality" data-geo="locality"
													path="requestService.locality" />
												<form:hidden data-geo="sublocality"
													path="requestService.sublocality" />
												<form:hidden data-geo="country_short"
													path="requestService.country" />
												<form:hidden data-geo="administrative_area_level_1"
													path="requestService.State" />
											</ul>

										</div>
										<div class="form-group">
											<input type="submit" class="btn btn-warning btn-lg"
												id="btnContinue" value="Get FREE Quotes" />
										</div>
									</form:form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


		</section>
	</div>


		<section >
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<article>
					<div class='row'>
						<div class='col-xs-12 col-md-offset-1 col-md-10'
							style="margin-bottom: 2%">
							<h1 class="text-center" style="font-size:32px;color:black;"><b>HOW WE WORK</b></h1>
							<div class="row" style="margin-bottom: 3%">

								<div class="col-md-4" style="text-align: center">
								<span class="fa-stack fa-4x">
  								<i class="fa fa-circle fa-stack-2x icon-background"></i>
  								<i class="fa fa-pencil-square-o fa-stack-1x" style="color:#4BAD57;"></i>
								</span>
									<p class="text-cont"><b>Post your need</b></p>
								</div>
								<div class="col-md-4" style="text-align: center">
								<span class="fa-stack fa-4x">
  								<i class="fa fa-circle fa-stack-2x icon-background"></i>
  								<i class="fa fa-users fa-stack-1x" style="color:#4BAD57;"></i>
								</span>
									<p class="text-cont"><b>Get free quotes</b> </p>
								</div>

								<div class="col-md-4" style="text-align: center">
								<span class="fa-stack fa-4x">
  								<i class="fa fa-circle fa-stack-2x icon-background"></i>
  								<i class="fa fa-check-square-o fa-stack-1x" style="color:#4BAD57;"></i>
								</span>
									<p class="text-center"><b>Hire smartly</b></p>
								</div>
								</div>
							
						</div>
					</div>

				</article>
			</div>
		</div>
	</div>
	</section>


	<div class="container-fluid" style="background-color: #dedede">
		<div class='row'>
			<div class='col-xs-12 col-md-offset-1 col-md-10'>
				<h1 class="text-center" style="font-size:32px;color:black;"><b>POPULAR SERVICES</b></h1></div>
		</div>

		<div class="row" style="margin-left:4%; margin-right:4%;">
			<div class="col-xs-12 col-sm-6 col-md-3">
				<div class="project">
					<figure class="img-responsive">
						<img
							src="<c:url value="/resources/assets/img/Architects-Engineers.jpg" />"
							alt="Architects Engineers">
						<figcaption>
							<span class="project-details"><p class="text-center">Architects Engineers</p></span>
						</figcaption>
						<span class="actions"> <a href="${pageContext.request.contextPath}/popularServiceForm/43/architects-engineers"
							class="btn btn-warning bnt-action">START PROJECT</a>
						</span>
					</figure>
				</div>
			</div>
			

			<div class="col-xs-12 col-sm-6 col-md-3">
				<div class="project">
					<figure class="img-responsive">
						<img
							src="<c:url value="/resources/assets/img/interior-design.jpg" />"
							alt="Interior Design">
						<figcaption>
							<span class="project-details"><p class="text-center">Interior Design</p></span>

						</figcaption>
						<span class="actions"> <a
							href="${pageContext.request.contextPath}/popularServiceForm/13/interior-design"
							class="btn btn-warning bnt-action">START PROJECT</a>
						</span>
					</figure>
				</div>
			</div>


			<div class="col-xs-12 col-sm-6 col-md-3">
				<div class="project">
					<figure class="img-responsive">
						<img
							src="<c:url value="/resources/assets/img/modular-kitchen.jpg" />"
							alt="Modular Kitchen">
						<figcaption>
							<span class="project-details"> <p class="text-center">Modular Kitchen</p></span>

						</figcaption>
						<span class="actions"> <a
							class="btn btn-warning bnt-action"
							href="${pageContext.request.contextPath}/popularServiceForm/14/modular-kitchen">START PROJECT </a>
						</span>
					</figure>
				</div>
			</div>
			
			<div class="col-xs-12 col-sm-6 col-md-3">
				<div class="project">
					<figure class="img-responsive">
						<img
							src="<c:url value="/resources/assets/img/Furniture Making.jpg" />"
							alt="Furniture Making">
						<figcaption>
							<span class="project-details"><p class="text-center">Furniture Making</p></span>

						</figcaption>
						<span class="actions"> <a
							class="btn btn-warning bnt-action"
							href="${pageContext.request.contextPath}/popularServiceForm/44/furniture-making">START PROJECT </a>
						</span>
					</figure>
				</div>
			</div>
			
		</div>
		<div class="row" style="margin-left:4%;margin-right:4%;">
			<div class="col-xs-12 col-sm-6 col-md-3">
				<div class="project">
					<figure class="img-responsive">
						<img
							src="<c:url value="/resources/assets/img/home_painting.jpg" />"
							alt="House painting Service">
						<figcaption>
							<span class="project-details"><p class="text-center">Painting</p></span>

						</figcaption>
						<span class="actions"> <a
							class="btn btn-warning bnt-action"
							href="${pageContext.request.contextPath}/popularServiceForm/16/interior-house-painting">START PROJECT</a>
						</span>
					</figure>
				</div>
			</div>

			<div class="col-xs-12 col-sm-6 col-md-3">
				<div class="project">
					<figure class="img-responsive">
						<img src="<c:url value="/resources/assets/img/bathroom-renovation.jpg" />"
							alt="bathroom renovation">
						<figcaption>
							<span class="project-details"><p class="text-center">Bathroom Renovation </p></span>

						</figcaption>
						<span class="actions"> <a
							class="btn btn-warning bnt-action"
							href="${pageContext.request.contextPath}/popularServiceForm/41/bathroom-renovation">START PROJECT</a>
						</span>
					</figure>
				</div>
			</div>

			<div class="col-xs-12 col-sm-6 col-md-3">
				<div class="project">
					<figure class="img-responsive">
						<img src="<c:url value="/resources/assets/img/flooring-tiles.jpg" />"
							alt="flooring tiles">
						<figcaption>
							<span class="project-details"><p class="text-center">Floorings Tiles</p></span>

						</figcaption>
						<span class="actions"> <a
							class="btn btn-warning bnt-action"
							href="${pageContext.request.contextPath}/popularServiceForm/42/Flooring-Services">START PROJECT</a>
						</span>
					</figure>
				</div>
			</div>
			
			<div class="col-xs-12 col-sm-6 col-md-3">
				<div class="project">
					<figure class="img-responsive">
						<img src="<c:url value="/resources/assets/img/ceiling-lighting.jpg" />"
							alt="ceiling lighting">
						<figcaption>
							<span class="project-details"><p class="text-center">Ceiling Lighting</p></span>

						</figcaption>
						<span class="actions"> <a class="btn btn-warning bnt-action"
							href="${pageContext.request.contextPath}/popularServiceForm/21/ceiling-lighting">START PROJECT</a>
						</span>
					</figure>
				</div>
			</div>
			
			
		</div>

		<div class="row">
		<div class='col-xs-12 col-sm-offset-3 col-sm-6 col-md-offset-5 col-md-2' style="margin-bottom: 2%">
		<button class="btn btn-lg btn-danger"
					onclick="window.location = '${pageContext.request.contextPath}/popularServices';"
					type="button" name="">View all Services</button>
			
		</div>	
		</div>		
		
		
	</div>


	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<article>
					<div class='row'>
						<div class='col-xs-12 col-md-offset-1 col-md-10'
							style="margin-bottom: 2%">
							<h1 class="text-center" style="font-size:32px;color:black"><b>WHY USE NEARGURU</b></h1>
							
							<div class="row" style="margin-bottom: 3%">

								<div class="col-sm-6 col-md-3" style="text-align: center">
									<i class="fa fa-money fa-3x" style="color:#4BAD57;"></i>
									<p class="text-cont">Free to use</p>
								</div>
								<div class="col-sm-6 col-md-3" style="text-align: center">
									<i class="fa fa-dropbox fa-3x  text-danger" style="color:#4BAD57;"></i>
									<p class="text-cont">No obligation to hire</p>
								</div>

								<div class="col-sm-6 col-md-3" style="text-align: center">
									<i class="fa fa-tachometer fa-3x  text-danger" style="color:#4BAD57;"></i>
									<p class="text-cont">Personal Dashboard</p>
								</div>


								<div class="col-sm-6 col-md-3" style="text-align:center">
									<i class="fa fa-inr fa-3x  text-danger" style="color:#4BAD57;"></i>
									<p class="text-cont">Online Quotes </p>
								</div>

							</div>
							<div class="row">
								<div class="col-sm-6 col-md-3" style="text-align: center">
									<i class="fa fa-user fa-3x  text-danger" style="color:#4BAD57;"></i>
									<p class="text-cont">Trusted Professional</p>
								</div>
								<div class="col-sm-6 col-md-3" style="text-align: center">
									<i class="fa fa-certificate fa-3x  text-danger" style="color:#4BAD57;"></i>
									<p class="text-cont">Guaranteed Services</p>
								</div>

								<div class="col-sm-6 col-md-3" style="text-align: center">
									<i class="fa fa-clock-o fa-3x  text-danger" style="color:#4BAD57;"></i>
									<p class="text-cont">Saves your time</p>
								</div>
								<div class="col-sm-6 col-md-3" style="text-align: center">
									<i class="fa fa-check-square fa-3x  text-danger" style="color:#4BAD57;"></i>
									<p class="text-cont">Best Quality</p>
								</div>



							</div>




						</div>
					</div>

				</article>
			</div>
		</div>
	</div>





	<%@ include file="footer.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {
			//Set the carousel options
			$('#quote-carousel').carousel({
				pauseOnHover : true,
				interval : 1000
			});
		});
	</script>

</body>
</html>
