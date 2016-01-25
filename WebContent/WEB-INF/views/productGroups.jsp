<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<!--[if lt IE 7]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class='no-js' lang='en'>
<!--<![endif]-->
<head>
<meta charset='utf-8' />
<meta content='IE=edge,chrome=1' http-equiv='X-UA-Compatible' />
<title>NearGuru- List Your Business - Meet new customers</title>
<meta name="description"
	content="Nearguru sends service experts like you requests from customers. You decide who to respond to and send a quote. ">



<meta content='width=device-width, initial-scale=1.0' name='viewport' />

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

<style type="text/css" media="screen">
#maximage {
	/*				position:fixed !important;*/
	
}

select:focus:required:invalid {
	border-color: red;
	color: black;
}

/*Set my logo in bottom left*/
#logo {
	bottom: 30px;
	height: auto;
	left: 30px;
	position: absolute;
	width: 34%;
	z-index: 1000;
}

#logo img {
	width: 100%;
}

.homeimg {
	background-image: url("./resources/assets/img/wall_portrait1.jpg");
}
</style>

<!--[if IE 6]>
                <style type="text/css" media="screen">
                        /*I don't feel like messing with pngs for this browser... sorry*/
                        #gradient {display:none;}
                </style>
        <![endif]-->
</head>
<body class="Site  homeimg">
	<header style="position: relative">
		<div class="container ">
			<div class="row">
				<div class="col-md-3 col-xs-6 col-sm-3">
					<a href="${pageContext.request.contextPath}/index" class="logo">
						<img src="<c:url value="/resources/assets/img/logo.png" />"
						alt="Interior Design">
					</a>

				</div>
				<div class="fb-like col-md-3 col-xs-6 col-sm-3"
					data-href="https://www.facebook.com/pages/Nearguru/1591687554433559"
					data-layout="button" data-action="like" data-show-faces="false"
					data-share="true"></div>

				<div class="col-md-6 col-xs-12 col-sm-3">

					<c:if test="${user eq null}">
						<ul class="social-info">

							<li><a style="color: #428bca; border: 0px"
								href="${pageContext.request.contextPath}/howItWorksPros"><b>Why
										join Nearguru ?</b></a></li>

						</ul>
					</c:if>


				</div>
			</div>
		</div>
	</header>


	<div class="Site-content">
		<div>
			<section id="banner">

				<div class="container">
					<div class="row">
						<div class=" col-md-offset-2 col-md-8">
							<div class="block">



								<label
									style="font-size: 56px; font-weight: bold; color: white; line-height: 56px">
									<b> Meet new customers</b>
								</label> <label style="color: white; font-size: 18.2px">
									Nearguru sends service experts like you requests from
									customers. You decide who to respond to and send a quote. </label>

							</div>
						</div>
					</div>
					<div class="row">


						<div class="col-md-offset-2 col-md-5">
							<div class="row">
								<div class="panel panel-success"
									style="background-color: transparent; border: 0px">

									<div class="panel-body">
										<c:url var="pros" value="/pros"></c:url>
										<form:form action="${pros}" commandName="userProsProfile">
											<div class="form-group">
												<div class="row">
													<div class="col-md-12">
														<div>
															<label style="color: white; font-size: 19.2px"><b>What
																	do you do?</b></label>
															<form:select placeholder="Please Select category"
																path="productGroupId" required="required" id="docNo"
																oninvalid="this.setCustomValidity(' ')"
																oninput="setCustomValidity('')"
																class="form-control invalid cursor"
																style="font-size:22.4px;color:#8e8e8e;height:51.8px">
																<form:option value="" label="Please select category" />
																</li>

																<c:forEach items="${productGroupList}"
																	var="productGroup">

										< <c:if test="${productGroup.isActive eq ISNULL || productGroup.isActive eq 'Y'  }">

																		<form:option label="${productGroup.productGroupName}"
																			value="${productGroup.productGroupId}" />
													</c:if>

																</c:forEach>
															</form:select>

														</div>
														<div style="margin-top: -9px">
															<input type="submit"
																style="background: -webkit-linear-gradient(top, #4092f1, #1a7cee); border-color: #1a7cee"
																class="btn btn-success btn-lg" id="btnContinue"
																value="Continue" />
														</div>
													</div>

												</div>
											</div>
										</form:form>
										<div class="form-group">
											<a href="${pageContext.request.contextPath}/howItWorksPros"
												style="color: white; text-decoration: none; font-size: 18.2px; line-height: 46.2px">How
												Nearguru works</a>
										</div>



										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


			</section>
		</div>
	</div>
</body>
<script
	src="<c:url value="/resources/assets/js/modernizr-2.6.2-respond-1.1.0.min.js" />"></script>
<script src="<c:url value="/resources/assets/js/jquery.js" />"></script>

<script src="<c:url value="/resources/assets/js/scrollReveal.js" />"></script>

<script src="assets/js/scrollReveal.js"></script>
<script>
	window.scrollReveal = new scrollReveal(); //please put this script here to show animation at the time of scroll
</script>

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
</html>