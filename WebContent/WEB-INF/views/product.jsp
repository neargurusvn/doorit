<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
  <link id="mainStyle" href="<c:url value="/resources/assets/css/vendor.css" />" rel="stylesheet" />
        <link rel="shortcut icon" href="<c:url value="/resources/assets/img/favicon.ico" />" />
          <link href="<c:url value="/resources/assets/plugins/font-awesome/font-awesome.css" />" rel="stylesheet">     
   <link href="<c:url value="/resources/assets/plugins/bootstrap/bootstrap.css" />" rel="stylesheet" />
	<title>NearGuru administrator-Product Dashboard</title>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
</head>
<body>

<div class="container"> 
		<div class="row">
			<div class="col-md-12">
				 <a href="${pageContext.request.contextPath}/index" class="navbar-brand"><img src="<c:url value="/resources/assets/img/logo.png" />" alt="Brand"></a>
				  <ul class="nav navbar-nav navbar-right"> 
				  	<li>
				  		<a href="${pageContext.request.contextPath}/signOut"><span class="fa fa-power-off"></span>Log Out</a>
				  	</li>
				  </ul>
			</div>		
		</div> 
		<div class="row" style="margin-top:30px">
            <div class="col-md-12 bg-color">
               <div class="container"> 
                    <h2><a href="${pageContext.request.contextPath}/admin/productGroup" title=""><i class="fa fa-arrow-circle-o-left"></i></a> Add Products  for <b>${productGroup.productGroupName}</b> product group</h2>
               </div> 
       		 </div>
		</div>
		
			<c:url var="addAction" value="/admin/addProduct/${pg1.productGroupId}" ></c:url>
				<form:form action="${addAction}" commandName="product">
					<div class="row bg-color" style="margin-top:50px;margin-bottom:50px">
				 	 <div class="col-md-5">
					 		<b>Enter Product Name :</b> 
							<form:input path="productName" />
					 </div>
					 <div class="col-md-5"> 
					 	<b>Enter Product Description :</b>
						<form:input  path="productDesc" />
					</div>
					 <div class="col-md-2"> 
					 		<input type="submit" class="btn btn-primary" value="<spring:message text="Add Product "/>" />
					</div>
				</div>
				<hr/> 
				<div class="row" style="margin-top:20px;margin-bottom:50px"> 
					<div class="col-md-12">
						<label style="color: #1D4E64;font-size:40">Product  Details</label>
					</div>				
				</div> 
				 <c:if test="${!empty listProduct}"> 
			 		<div class="row" style="margin-top:10px">  
						<div class="col-md-1" ><b><label style="color: #1D4E64;font-size:15 ">Product  Id</label></b></div>
						<div class="col-md-1" ><b><label style="color: #1D4E64;font-size:15 ">Product  Name</label></b></div>
						<div class="col-md-2"><b><label style="color: #1D4E64;font-size:15 ">Product  Description</label></b></div> 
						<div class="col-md-2"><b><label style="color: #1D4E64;font-size:15 ">Add Question</label></b></div> 
						<div class="col-md-2"><b><label style="color: #1D4E64;font-size:15 ">Edit Product</label></b></div> 
						<div class="col-md-2" ><b><label style="color: #1D4E64;font-size:15 ">Delete Product </label></b></div>  
					    <div class="col-md-2"><b><label style="color: #1D4E64;font-size:15 ">Visible</label></b></div> 
						
					</div> 
					<hr/>
						<c:forEach items="${listProduct}" var="product">
						<div class="row" style="margin-top:10px;margin-bottom:10px">  
								<div class="col-md-1" ><b>${product.productId}</b></div>
								<div class="col-md-1" ><b>${product.productName}</b></div> 
								<div class="col-md-2" ><b>${product.productDesc}</b></div> 
								<div class="col-md-2" ><a class="btn btn-primary" href="<c:url value='/admin/addQuestion/${product.productId}' />">Add Question </a></div>
								<div class="col-md-2" ><a class="btn btn-primary" href="<c:url value='/admin/editProduct/${productGroup.productGroupId}/${product.productId}' />" >Edit Product </a></div>
								<div class="col-md-2" ><a class="btn btn-primary" href="<c:url value='/admin/deleteProduct/${productGroup.productGroupId}/${product.productId}' />" >Delete Product  </a></div>
								
								<div class="col-md-2">          
							
							<c:if test="${product.isActive eq 'Y'  }"> 
								<a  href="${pageContext.request.contextPath}/admin/visibleProduct/${product.productId}/Y"  style="width:80%" class="btn btn-success">NO</a>
							</c:if> <br/>
							
							 <c:if test="${product.isActive eq 'N'  }"> 
								<a  href="${pageContext.request.contextPath}/admin/visibleProduct/${product.productId}/N"  style="width:80%" class="btn btn-success">YES</a>
							 </c:if>
						</div>    
						</div>
					</c:forEach> 
			 </c:if>  
				</form:form>   
		   
</div>


  


</body>
</html>
