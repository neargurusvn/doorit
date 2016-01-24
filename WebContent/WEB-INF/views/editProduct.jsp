<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
 <link rel="shortcut icon" href="<c:url value="/resources/assets/img/favicon.ico" />" />
  <link id="mainStyle" href="<c:url value="/resources/assets/css/vendor.css" />" rel="stylesheet" />
        <link rel="shortcut icon" href="<c:url value="/resources/assets/img/favicon.ico" />" />
          <link href="<c:url value="/resources/assets/plugins/font-awesome/font-awesome.css" />" rel="stylesheet">     
   <link href="<c:url value="/resources/assets/plugins/bootstrap/bootstrap.css" />" rel="stylesheet" />
	<title>NearGuru administrator-Edit Product </title>
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
                    <h2><a href="${pageContext.request.contextPath}/admin/addProduct/${productGroup.productGroupId}" title=""><i class="fa fa-arrow-circle-o-left"></i></a>Edit  Product -<b>${product.productName}</b>  (product Group-${productGroup.productGroupName})</h2>
               </div>
       		 </div>
		</div>
		<div class="row" style="margin-top:30px">
			<div class="col-md-12">  
			 
				<c:url var="UpdateProduct" value="/admin/UpdateProduct/${product.productId}" ></c:url>
				<form:form action="${UpdateProduct}" commandName="product">
				<div class="form-group"> 
                      <label for="name"> <b>Product  Name </b></label>
                      <form:input     type="text" path="productName"  class="form-control"  />
                 </div>
                 <div class="form-group">  
                      <label for="name"> <b>Product Description </b></label> 
                      <form:input     type="text" path="productDesc"  class="form-control"  />
                 </div>
                  <button  id="btnEditProductGroup"  class="btn btn-danger btn-lg">Update Product</button>
				</form:form>
			</div>
			
			
		</div>
			
		
</div>


  


</body>
</html>
