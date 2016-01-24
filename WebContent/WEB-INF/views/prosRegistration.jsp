<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
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
<title>Nearguru.com | List your business for FREE</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<!-- MAIN STYLE SECTION-->
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



<!-- END MAIN STYLE SECTION-->

<style type="text/css">
input:required:valid {
	background-image:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAepJREFUeNrEk79PFEEUx9/uDDd7v/AAQQnEQokmJCRGwc7/QeM/YGVxsZJQYI/EhCChICYmUJigNBSGzobQaI5SaYRw6imne0d2D/bYmZ3dGd+YQKEHYiyc5GUyb3Y+77vfeWNpreFfhvXfAWAAJtbKi7dff1rWK9vPHx3mThP2Iaipk5EzTg8Qmru38H7izmkFHAF4WH1R52654PR0Oamzj2dKxYt/Bbg1OPZuY3d9aU82VGem/5LtnJscLxWzfzRxaWNqWJP0XUadIbSzu5DuvUJpzq7sfYBKsP1GJeLB+PWpt8cCXm4+2+zLXx4guKiLXWA2Nc5ChOuacMEPv20FkT+dIawyenVi5VcAbcigWzXLeNiDRCdwId0LFm5IUMBIBgrp8wOEsFlfeCGm23/zoBZWn9a4C314A1nCoM1OAVccuGyCkPs/P+pIdVIOkG9pIh6YlyqCrwhRKD3GygK9PUBImIQQxRi4b2O+JcCLg8+e8NZiLVEygwCrWpYF0jQJziYU/ho2TUuCPTn8hHcQNuZy1/94sAMOzQHDeqaij7Cd8Dt8CatGhX3iWxgtFW/m29pnUjR7TSQcRCIAVW1FSr6KAVYdi+5Pj8yunviYHq7f72po3Y9dbi7CxzDO1+duzCXH9cEPAQYAhJELY/AqBtwAAAAASUVORK5CYII=);
	background-position: right top;
	background-repeat: no-repeat;
}

input:focus:required:invalid {
	border-color: red;
	color: black;
}
</style>
<style type="text/css">
.btn-lg {
	width: 100%;
}

.test {
	border: 3px solid red;
}
</style>
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script
	src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
<script src="<c:url value="/resources/core/jquery.geocomplete.js" />"></script>

<script
	src="<c:url value="http://bassistance.de/jquery-plugins/jquery-plugin-validation/" />"></script>
<script
	src="<c:url value="http://docs.jquery.com/Plugins/Validation/" />"></script>
<script
	src="<c:url value="http://docs.jquery.com/Plugins/Validation/validate#toptions" />"></script>
	
	
	<script>
	
	$(function(){
        var pp;
        $("#companyName, #companyWebsite, #companyProfile, #address, #geocomplete, #username").keydown(function(event){

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
		$("#geocomplete").geocomplete({
			map : ".map_canvas",
			details : "form ul",
			detailsAttribute : "data-geo",
			country : 'IN'
		});
		$(function() {
			var txt = $("#password");
			var func = function() {
				txt.val(txt.val().replace(/\s/g, ''));
			}
			txt.keyup(func).blur(func);
		});

	});
	$(document)
			.ready(
					function() {

						$('.invalidchecbox').click(function() {

							$(this).trigger('click');

						});

						$(".list-group-item").click(function() {
							//    window.location=$(this).find("a").attr("href"); 
							//   return false;

							$(':checkbox', this).trigger('click');
						});

						$(".clickablediv").click(function() {

							$(this).find('input:radio').prop('checked', true);
							$(this).find('input:radio').trigger("click");
						});

						$('#TTOC').click(function() {
							$('#bussinessDistance').show();
						});
						$('#CTOM').click(function() {
							$('#bussinessDistance').hide();
						});
						$('#NEITHER').click(function() {
							$('#bussinessDistance').hide();
						});

						$("#btnCreateAccount")
								.click(
										function() {

											var invalidCheckboxes = document
													.getElementsByClassName("invalidchecbox");

											var ln = 0;
											for (var i = 0; i < invalidCheckboxes.length; i++) {

												if (invalidCheckboxes[i].checked)
													ln++;

											}

											if (ln < 1) {

												alert("Please select atleast one service you provide");
												return false;
											}

										});

					});
</script>
<script>
	
</script>


<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script
	src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
<script src="<c:url value="/resources/core/jquery.geocomplete.js" />"></script>

<script
	src="<c:url value="http://bassistance.de/jquery-plugins/jquery-plugin-validation/" />"></script>
<script
	src="<c:url value="http://docs.jquery.com/Plugins/Validation/" />"></script>
<script
	src="<c:url value="http://docs.jquery.com/Plugins/Validation/validate#toptions" />"></script>

</head>
<!-- END HEAD SECTION-->

<!-- BODY SECTION-->
<body>
	<!-- HEADER SECTION -->
	<%@ include file="headerStatic.jsp"%>
	<section>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 bg-color">
					<div class="container">
						<h2 class="">
							<a href="${pageContext.request.contextPath}/listBussiness"
								title=""><i class="fa fa-arrow-circle-o-left"></i></a> Sign up
							your business
						</h2>
					</div>
				</div>

			</div>
		</div>
	</section>

	<div class="container">
		<!-- END HEADER SECTION -->
		<!--PAGE CONTENT-->

		<!-- HOMEPAGE SECTION-->

		<section class="section" style="margin-bottom: 20px; margin-top: 20px">
			<div class="container">
				<div class="row">
					<div class="col-md-offset-1 col-md-5">



						<div class="panel panel-success">
							<div class="panel-heading">Find customers in your area</div>
							<c:if test="${wrapSuccessError.suceess eq true }">


								<div class="alert alert-success  " role="alert">
									<center>${wrapSuccessError.action}</center>
								</div>



							</c:if>
							<c:if test="${wrapSuccessError.suceess eq false }">


								<div class="alert alert-danger  " role="alert">
									<center>${wrapSuccessError.action}</center>
								</div>

							</c:if>
							<div class="panel-body">

								<c:url var="addUser" value="/addPros"></c:url>
								<form:form id="proRegistration" action="${addUser}"
									name="proReg" commandName="userProsProfile">

									<fieldset>
										<div class="form-group">
											<label><b>1.Please select services ?</b></label>
										</div>
										<ul id="${que.name_class}"
											class="list-group ${que.name_class}">
											<c:forEach items="${listProductGroup}" var="product">
												<c:if test="${product.isActive eq 'Y'  }">
													<li class="list-group-item cursor"><form:checkbox
															class="invalidchecbox" path="profile.ListedIn"
															value="${product.productId}"
															title="Select Atleast one service" />&nbsp;
														${product.productName}</li>
												</c:if>
											</c:forEach>
											<li class="list-group-item"><form:input
													class="form-control" width="100%"
													path="profile.ListedInOthers" placeholder="others" /></li>

										</ul>






									</fieldset>

									<div class="form-group">
										<label><b>2. Enter your company details</b></label>
									</div>
									<hr />
									<div class="form-group">
										<label><b>Company Name </b> </label>
										<form:input required="required" type="text" maxlength="50"
											class="form-control invalid" path="profile.companyName"
											oninvalid="this.setCustomValidity('Please enter  company name')"
											oninput="setCustomValidity('')" id="companyName" />
									</div>
									<div class="form-group">
										<label><b>Company website</b> </label>
										<form:input class="form-control" maxlength="100"
											path="profile.website" id="companyWebsite" />
									</div>


									<div class="form-group">
										<label><b>Company profile</b></label>
										<form:textarea class="col-xs-12 form-control" maxlength="500"
											path="profile.companyProfile" rows="4" cols="38" id="companyProfile"/>

									</div>

									<div class="form-group">
										<label><b>Address</b></label>
										<form:input type="text" maxLength="150" class="form-control"
											path="user.address" id="address" />
									</div>

									<div class="form-group">
										<label><b>Locality</b></label>
										<div class="map_canvas"></div>
										<form:input id="geocomplete" maxLength="60"
											required="required" type="text" class="form-control invalid "
											path="user.formatted_address"
											oninvalid="this.setCustomValidity('Please enter  locality')"
											oninput="setCustomValidity('')"
											placeholder="e.g Wakad,Kalyani Nagar,Aundh"
											 />

										<ul>
											<form:hidden data-geo="lat" path="user.lat" />
											<form:hidden data-geo="lng" path="user.lng" />
											<form:hidden data-geo="postal_code" path="user.postal_code" />
											<form:hidden data-geo="locality" path="user.locality" />
											<form:hidden data-geo="sublocality" path="user.sublocality" />
											<form:hidden data-geo="country_short" path="user.country" />
											<form:hidden data-geo="administrative_area_level_1"
												path="user.State" />
										</ul>


									</div>


									<%-- <div class="form-group">
										<label><b>3. Where do you do business</b></b></label>
									</div>
									<hr />
									<div class="form-group clickablediv cursor">
										<span> <form:radiobutton checked="checked" id="TTOC"
												path="profile.bussinessType" value="TTOC" />

										</span> <span> I travel to my customers </span>
									</div>

									<div class="form-group clickablediv cursor">
										<span> <form:radiobutton id="CTOM"
												path="profile.bussinessType" value="CTOM" />

										</span> <span> My customers travel to me </span>
									</div>

									<div class="form-group clickablediv cursor">
										<span> <form:radiobutton id="NEITHER"
												path="profile.bussinessType" value="NEITHER" />

										</span> <span> Neither (phone or Internet only) </span>
									</div>

									<div id="bussinessDistance" class="form-group">
										<p>how far you willing to travel</p>
										<form:select class="form-control cursor"
											path="profile.bussinessDistance">
											<form:option value="10" label="10 Km" />
											<form:option value="20" label="20 Km" />
											<form:option value="50" label="50 Km" />
											<form:option value="greater than 50" label=">50 Km" />
										</form:select>

									</div> 
 --%>
									<hr>
									<div class="form-group">
										<label><b>3. Set-up your account details</b></b></label>
									</div>
									<hr />
									<div class="form-group">
										<label><b>Full name </b> </label>
										<form:input required="required" maxlength="40"
											class="form-control invalid" path="user.name"
											oninvalid="this.setCustomValidity('Please enter name')"
											oninput="setCustomValidity('')" id="username" />
									</div>
									<div class="form-group">
										<label><b>Email </b> </label>
										<form:input required="required" maxlength="60" type="email"
											class="form-control invalid" path="user.emailId"
											oninvalid="this.setCustomValidity('Please enter valid email')"
											oninput="setCustomValidity('')" />
									</div>
									<div class="form-group">
										<label><b> Mobile </b></label>
										<form:input type="text" pattern="\d*" required="required"
											id="mobileInput" class="form-control" maxlength="10"
											oninvalid="this.setCustomValidity('Please enter mobile  number')"
											oninput="setCustomValidity('')" path="user.mobile" />

										<div class="form-group">
											<label><b>Create Password</b></label>
											<form:input required="required" type="password" id="password"
												maxlength="15" class="form-control invalid"
												oninvalid="this.setCustomValidity('Please enter passowrd')"
												oninput="setCustomValidity('')" path="user.password" />
										</div>
										<!--  
                                        	<div class="form-group"> 
                                            	<label>Re-enter Password</label>
                                            	<input class="form-control" type="text" />
                                        	</div>
                                            
                                            -->
									</div>


									<hr>
									<div class="col-md-4" style="width: 100%;">
										<p>
											By clicking Create Account, you indicate that you have read
											and agree to the <a style="cursor: pointer"
												onclick="openFooterLinks('termsOfUsage')">Terms of Use </a>and
											<a style="cursor: pointer"
												onclick="openFooterLinks('privacyPolicy')">Privacy
												Policy</a>.
										</p>
										<button id="btnCreateAccount" type="submit" onClick="check()"
											class="btn btn-success">Create Account</button>
									</div>
								</form:form>
							</div>







						</div>
					</div>

					<div class="col-md-offset-1 col-md-5">
						<p style="font-size: 24px; color: #3c7088">Why wait for a
							Customer to come in</p>

						<p>
							<span style="background-color: #EF0D49; font-size: 20px"
								class="badge">1</span> Create your FREE profile
						</p>
						<p>
							<span style="background-color: #EF0D49; font-size: 20px"
								class="badge">2</span> Get verified and genuine leads
						</p>
						<p>
							<span style="background-color: #EF0D49; font-size: 20px"
								class="badge">3</span> Send best quotations
						</p>
						<p>
							<span style="background-color: #EF0D49; font-size: 20px"
								class="badge">4</span> Get hired and get paid
						</p>




					</div>

				</div>
			</div>
		</section>
	</div>

	<!-- footer -->
	<%@ include file="footer.jsp"%>


	<!-- MAIN SCRIPTS SECTION-->
	<script
		src="<c:url value="/resources/assets/js/modernizr-2.6.2-respond-1.1.0.min.js" />"></script>

	<script src="<c:url value="/resources/assets/js/scrollReveal.js" />"></script>

	<script src="assets/js/scrollReveal.js"></script>
	<script>
		//  window.scrollReveal = new scrollReveal(); //please put this script here to show animation at the time of scroll
	</script>


	<script
		src="<c:url value="/resources/assets/plugins/bootstrap/bootstrap.min.js" />"></script>

	<script
		src="<c:url value="/resources/assets/plugins/fancybox/jquery.fancybox.pack.js" />"></script>


	<script src="<c:url value="/resources/assets/scripts/main.js" />"></script>
	<script src="<c:url value="/resources/assets/scripts/login.js" />"></script>



	<!--END MAIN SCRIPTS SECTION-->


	</div>
</body>

<!--END  BODY SECTION-->
</html>