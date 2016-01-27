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
<title>Nearguru | Hire an expert pay fair price </title>
<meta name="description"
	content="nearguru Pune - Find local business service providers, pest control, packers and movers, cleaning service / water tank cleaning, interior design, modular kitchen, House painter, Water proofing, plumbing & Catering service.">

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<!-- Fonts -->
<!-- CSS -->

<link rel="shortcut icon"
	href="<c:url value="/resources/assets/img/favicon.ico" />" />
<link
	href="<c:url value="/resources/assets/plugins/isotope/isotope.css" />"
	rel="stylesheet" media="screen" />
<link
	href="<c:url value="/resources/assets/plugins/fancybox/jquery.fancybox.css" />"
	rel="stylesheet" />
<link
	href="<c:url value="/assets/plugins/IconHoverEffects-master/css/component.css" />"
	rel="stylesheet" />
<link
	href="<c:url value="/resources/assets/plugins/bootstrap/bootstrap.css" />"
	rel="stylesheet" />
<link
	href="<c:url value="/resources/assets/css/about-achivements.css" />"
	rel="stylesheet" />
<link
	href="<c:url value="/resources/assets/plugins/font-awesome/font-awesome.css" />"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto'
	rel='stylesheet' type='text/css'>
<link id="mainStyle"
	href="<c:url value="/resources/assets/css/vendor.css" />"
	rel="stylesheet" />
<link id="mainStyle"
	href="<c:url value="/resources/assets/css/main.css" />"
	rel="stylesheet" />
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">


<!-- Js -->
<script
	src="<c:url value="/resources/assets/js/jquery.easing.1.3.js" />"></script>
<script
	src="<c:url value="/resources/assets/plugins/bootstrap/bootstrap.min.js" />"></script>
<script
	src="<c:url value="/resources/assets/plugins/isotope/jquery.isotope.min.js" />"></script>
<script
	src="<c:url value="/resources/assets/plugins/fancybox/jquery.fancybox.pack.js" />"></script>
<script
	src="<c:url value="/resources/assets/js/jquery.localscroll-1.2.7-min.js" />"></script>
<script src="<c:url value="/resources/assets/js/jquery.appear.js" />"></script>
<script src="<c:url value="/resources/assets/scripts/main.js" />"></script>
<script src="<c:url value="/resources/assets/scripts/login.js" />"></script>
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script
	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<script
	src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
<script src="<c:url value="/resources/core/jquery.geocomplete.js" />"></script>



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
								href="${pageContext.request.contextPath}/listBussiness"><b>List
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

					<div class="col-xs-12 col-md-7 col-sm-7">
						<div class="block">


							<div>
								<h1 style="font-size: 89px; line-height: 80px">
									<b> Hire an expert </b> <b> Pay fair price </b>
								</h1>

							</div>

						</div>

						<!-- 
                    <div class="panel panel-success indexmargin" style="border:0px">
                            <div class="panel-heading" style="background-color:#EF0D49;padding:3px 15px;border:0px"> <h1 style="font-size:60px" >  
                          <b> Hire an expert near you  </b>
                          <b> Pay fair price </b> 
                          
                        </h1>            
                            </div>     
                                  
                           
                                 
                              
                        </div>   
   -->
					</div>
					<div class="col-xs-12 col-md-5 col-sm-5">
						<div class="row">
							<div class="panel panel-success ">
								<div class="panel-heading">Compare quotes & prices from
									local business</div>



								<div class="panel-body">
									<c:url var="requestService" value="/ServiceForm"></c:url>
									<form:form action="${requestService}" id="indexform"
										commandName="userProsProfile">

										<div class="form-group">
											<label><b>What service do you need?</b></label>
											<form:input id="w-input-search" value="" maxlength="100"
												required="required" path="product.productName"
												class="form-control input-lg col-md-4"
												placeholder=" interior design , modular kitchen , packers and movers" />
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
											<input type="submit" class="btn btn-success btn-lg"
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


	<div class="container">
		<div class='row'>
			<div class='col-xs-12 col-md-offset-1 col-md-10'></div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<article>
					<div class="row" id="design">
						<div class="col-md-4 col-md-offset-1">
							<div class="home-design-info text-center">
								<figure>
									<img alt="Post your need" style="width: 70%; height: 60%"
										src="<c:url value="/resources/assets/img/Post_your_need.PNG" />">
								</figure>
							</div>
						</div>
						<!-- 4 -->
						<div class="col-md-6">
							<div class="deets">
								<h2 class="text-primary">
									<span style="background-color: #EF0D49; font-size: 38px"
										class="badge">1</span> Post your need
								</h2>
								<p class="text-cont">Brief your requirement and fill up the
									simple questionnaire to understand your need. We connect you to
									the relevant service providers.</p>
							</div>
						</div>
					</div>
					<!-- /row -->
					<div class="row" id="develop">
						<div class="col-md-4 col-md-push-7">
							<div class="home-dev-info text-center">
								<figure>
									<img alt="Compare and select service providers"
										style="margin-top: 15%; width: 70%; height: 60%"
										src="<c:url value="/resources/assets/img/compareProsFrame.png" />">
								</figure>
							</div>
						</div>
						<!-- col -->
						<div class="col-md-6 col-md-pull-3">
							<div class="deets">
								<h2 class="text-primary">
									<span style="background-color: #EF0D49; font-size: 38px"
										class="badge">2</span>&nbsp;Compare and select service
									providers
								</h2>
								<p class="text-cont">Relevant expert service providers will
									respond within couple of hours with their quotations. You have
									the list to select the best by comparing the quotes and the
									service providers. To help you select effectively we have
									special features:</p>
								<br />
								<ul class="fa-ul">
									<li><i class="fa-li fa fa-inr fa-2x text-info"></i>
									<p>Online quotation price</p>
										<br /></li>
									<li><i class="fa-li fa fa-pencil-square fa-2x text-info"></i>
									<p>Professional personal message</p>
										<br /></li>
									<li><i class="fa-li fa fa-file fa-2x  text-info"></i>
										<p>Quotation as an attachment file</p>
										<br /></li>
									<li><i class="fa-li fa fa-user fa-2x  text-info"></i>
										<p>Professional profile</p>
										<br /></li>
									<li><i class="fa-li fa fa-comments-o fa-2x  text-info"></i>
										<p>Customers reviews</p>
										<br /></li>
								</ul>

							</div>
						</div>
						<!-- col -->
					</div>
					<!-- /row -->
					<div class="row" id="design" style="padding-bottom: 30px">
						<div class="col-md-4 col-md-offset-1">
							<div class="home-design-info text-center">
								<figure>
									<img alt="Hire the best" style="width: 70%; height: 60%"
										src="<c:url value="/resources/assets/img/hirebestFrame.PNG" />">
								</figure>
							</div>
						</div>
						<!-- 4 -->
						<div class="col-md-6">
							<div class="deets">
								<h2 class="text-primary">
									<span style="background-color: #EF0D49; font-size: 38px"
										class="badge">3</span> Hire the best
								</h2>
								<p class="text-cont">Decide by comparing the prices, reading
									reviews and asking questions to the provider. You get to hire
									the best for your service need.</p>
							</div>
						</div>
					</div>
					<!-- /row -->
				</article>
			</div>
		</div>
	</div>







	<div class="container-fluid" style="background-color: #dedede">
		<div class='row'>
			<div class='col-xs-12 col-md-offset-1 col-md-10'>
				<h1 class="title text-center" style="padding-top: 30px">Popular
					Services</h1>
			</div>
		</div>

		<div class="row" style="margin-left: 4%">
			<div class="col-ms-10 col-md-4">
				<div class="project">
					<figure class="img-responsive">
						<img
							src="<c:url value="/resources/assets/img/packers_and_movers.jpg" />"
							alt="Packers and Movers Service">
						<figcaption>
							
							<span class="project-details">Packers and Movers</span>
					

						</figcaption>
						<span class="actions"> <a
							href="${pageContext.request.contextPath}/popularServiceForm/2/packers-and-movers-in-pune"
							class="btn btn-warning bnt-action">Request Service </a>
						</span>
					</figure>
				</div>
			</div>

			<div class="col-ms-10 col-md-4">
				<div class="project">
					<figure class="img-responsive">
						<img
							src="<c:url value="/resources/assets/img/interior_design_service.jpg" />"
							alt="Interior Design Service">
						<figcaption>
							<span class="project-details">Interior Design</span>

						</figcaption>
						<span class="actions"> <a
							href="${pageContext.request.contextPath}/popularServiceForm/13/interior-design-in-pune"
							class="btn btn-warning bnt-action">Request Service </a>
						</span>
					</figure>
				</div>
			</div>


			<div class="col-ms-10 col-md-4">
				<div class="project">
					<figure class="img-responsive">
						<img
							src="<c:url value="/resources/assets/img/modular_kithcen.jpg" />"
							alt="Modular Kitchen Service">
						<figcaption>
							<span class="project-details">Modular Kitchen</span>

						</figcaption>
						<span class="actions"> <a
							class="btn btn-warning bnt-action"
							href="${pageContext.request.contextPath}/popularServiceForm/14/modular-kitchen-in-pune">Request
								Service </a>
						</span>
					</figure>
				</div>
			</div>
		</div>
		<div class="row" style="margin-left: 4%">
			<div class="col-ms-10 col-md-4">
				<div class="project">
					<figure class="img-responsive">
						<img
							src="<c:url value="/resources/assets/img/home_painting.jpg" />"
							alt="House painting Service">
						<figcaption>
							<span class="project-details">Interior House Painting</span>

						</figcaption>
						<span class="actions"> <a
							class="btn btn-warning bnt-action"
							href="${pageContext.request.contextPath}/popularServiceForm/16/interior-house-painting-in-pune">Request
								Service </a>
						</span>
					</figure>
				</div>
			</div>

			<div class="col-ms-10 col-md-4">
				<div class="project">
					<figure class="img-responsive">
						<img src="<c:url value="/resources/assets/img/pestcontrol.jpg" />"
							alt="Pest Control service">
						<figcaption>
							<span class="project-details">Pest Control</span>

						</figcaption>
						<span class="actions"> <a
							class="btn btn-warning bnt-action"
							href="${pageContext.request.contextPath}/popularServiceForm/1/pest-control-in-pune">Request
								Service </a>
						</span>
					</figure>
				</div>
			</div>


			<div class="col-ms-10 col-md-4">
				<div class="project">
					<figure class="img-responsive">
						<img src="<c:url value="/resources/assets/img/cleaning.jpg" />"
							alt="Home Cleaning service  ">
						<figcaption>
							<span class="project-details">Home Cleaning</span>

						</figcaption>
						<span class="actions"> <a
							class="btn btn-warning bnt-action"
							href="${pageContext.request.contextPath}/popularServiceForm/5/cleaning-services">Request
								Service </a>
						</span>
					</figure>
				</div>
			</div>
		</div>


		<div class="row" style="padding-bottom: 25px; margin-left: 4%">
			<div class="col-xs-12  col-md-4">
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
							<h1 class="title text-center">Why use NearGuru</h1>
							<div class="row" style="margin-bottom: 3%">

								<div class="col-md-3" style="text-align: center">
									<i class="fa fa-money fa-4x text-danger"></i>
									<p class="text-cont">Free to use</p>
								</div>
								<div class="col-md-3" style="text-align: center">
									<i class="fa fa-dropbox fa-4x  text-danger"></i>
									<p class="text-cont">No obligation to hire</p>
								</div>

								<div class="col-md-3" style="text-align: center">
									<i class="fa fa-tachometer fa-4x  text-danger"></i>
									<p class="text-cont">Personal Dashboard</p>
								</div>


								<div class="col-md-3" style="text-align: center">
									<i class="fa fa-inr fa-4x  text-danger"></i>
									<p class="text-cont">Online Quotes and Best Price</p>
								</div>

							</div>
							<div class="row">
								<div class="col-md-3" style="text-align: center">
									<i class="fa fa-users fa-4x  text-danger"></i>
									<p class="text-cont">100% verified and trusted professional</p>
								</div>
								<div class="col-md-3" style="text-align: center">
									<i class="fa fa-globe fa-4x  text-danger"></i>
									<p class="text-cont">One stop destination</p>
								</div>

								<div class="col-md-3" style="text-align: center">
									<i class="fa fa-clock-o fa-4x  text-danger"></i>
									<p class="text-cont">Saves your time</p>
								</div>
								<div class="col-md-3" style="text-align: center">
									<i class="fa fa-check-square fa-4x  text-danger"></i>
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
				interval : 1000,
			});
		});
	</script>

</body>
</html>
