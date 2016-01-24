<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<link id="mainStyle"
	href="<c:url value="/resources/assets/css/vendor.css" />"
	rel="stylesheet" />
<link rel="shortcut icon"
	href="<c:url value="/resources/assets/img/favicon.ico" />" />
<link
	href="<c:url value="/resources/assets/plugins/font-awesome/font-awesome.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/resources/assets/plugins/bootstrap/bootstrap.css" />"
	rel="stylesheet" />
	
	
  <script>
  
  
	</script> 
	
	
<title>NearGuru administrator-View Reports</title>
<style type="text/css">   
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #fff;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #f0f0f0;
}

.tg .tg-4eph {
	background-color: #f9f9f9
}


</style>
</head>
<body>

	<section>
		<div class="container">

			<div class="row">
				<div class="col-md-12">
					<a href="${pageContext.request.contextPath}/index"
						class="navbar-brand"><img
						src="<c:url value="/resources/assets/img/logo.png" />" alt="Brand"></a>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="${pageContext.request.contextPath}/signOut"><span
								class="fa fa-power-off"></span>Log Out</a></li>
					</ul>
				</div>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-12 bg-color">
					<div class="container">
						<h2>
							<a href="${pageContext.request.contextPath}/admin/productGroup"
								title=""><i class="fa fa-arrow-circle-o-left"></i></a>Admin Home
						</h2>
					</div>
				</div>
			</div>
			<div class="row" style="margin-top: 3%; margin-bottom: 3%">
				<div class="col-md-4">
					<a href="${pageContext.request.contextPath}/admin/fetchUsers"
						class="btn  btn-danger ">User Reports</a>
				</div>
				<div class="col-md-4">
					<a href="${pageContext.request.contextPath}/admin/fetchVendors"
						class="btn  btn-danger ">Vendor Reports</a>
				</div>
				<div class="col-md-4">
					<a href="${pageContext.request.contextPath}/admin/fetchRequests"
						class="btn  btn-danger ">Service Requests Reports</a>
				</div>
			</div>
			
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12 bg-color">
						<div class="container">
							<h3 class="">
								<a href="#" title=""></a><b> List of Vendors </b>
							</h3>
						</div>
					</div>
				</div>
				<div class="row"
					style="padding-top: 30px; margin-bottom: 3%; background: #1D4E64; color: white">

					<div class="col-md-2">
						<b>vendor Name</b>
					</div>

					<div class="col-md-2">
						<b>vendor mobile</b>
					</div>
					<div class="col-md-1">
						<b>Listed in</b>
					</div>
					<div class="col-md-3">
						<b>Email-Id</b>
					</div>
					<div class="col-md-2">
						<b> vendor Address</b>
					</div>
					<div class="col-md-2">
						<b>Password</b>
					</div>
					
					</div>
					
				<c:forEach var="reportObj" items="${reportList}">
					<div class="row">

						<div class="col-md-2">
							<b>${reportObj.prosProfile.companyName}</b>
						</div>

						<div class="col-md-2">
							<b>${reportObj.user.mobile}</b>
						</div>

						<div class="col-md-1"
							style="word-wrap: break-word; word-break: break-all">
							<b>${reportObj.listedin}</b>
						</div>  
						<div class="col-md-3">
							<b>${reportObj.user.emailId}</b>
							
							<c:if test="${reportObj.prosProfile.verification eq 'N' }">  
								<a  href="${pageContext.request.contextPath}/admin/VendorVerify/${reportObj.user.userId}/Y"  style="width:80%" class="btn btn-success">Enable Vendor</a>
							</c:if> <br/>
							<c:if test="${reportObj.prosProfile.verification eq 'Y' }">   
								<a  href="${pageContext.request.contextPath}/admin/VendorVerify/${reportObj.user.userId}/N"  style="width:80%" class="btn btn-success">Disable Vendor</a>
							</c:if>
						</div>
						<div class="col-md-2">
							<b>${reportObj.user.formatted_address}</b>
						</div>
						<div class="col-md-2">
							<b>${reportObj.user.password}</b>
						</div>

					</div>
					<hr />
				</c:forEach>
			</div>
	</section>








	<%@ include file="footer.jsp"%>

</body>
</html>
