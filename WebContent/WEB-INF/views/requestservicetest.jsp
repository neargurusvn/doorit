<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Request a Service</title>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
</head>
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
<script>

	$(document).ready(function() {

		$('#w-input-search').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/getTags',
			paramName: "tagName",
			delimiter: ",",
		    transformResult: function(response) {
		    	
		        return {
		        	
		            suggestions: $.map($.parseJSON(response), function(item) {
		            	document.getElementById("w-product").value = item.id;
		            	
		                return { value: item.tagName, data: item.id };
		            })
		            
		        };
		        
		    }
		    
		});
		
		
	});
	</script>

<body>
<h1>
	Request a service 
</h1>


<c:url var="addAction" value="/from/questions/1" ></c:url>

<form:form action="${addAction}" commandName="product">
<table>
	<tr>
		<td>
			<form:label path="productName">
				<spring:message text="service type"/>
			</form:label>
		</td>
		<td>
			<form:input id="w-input-search" path="productName" />
		</td> 
	</tr>
	
	<tr>
		<td>
			<form:label path="productDesc">
				<spring:message text="city"/>
			</form:label>
		</td>
		<td>
			<form:input id="w-product" path="productDesc" />
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<c:if test="${!empty product.productName}">
				<input type="submit"
					value="<spring:message text="Edit Product"/>" />
			</c:if>
			</br>
			<c:if test="${empty product.productName}">
				<input type="submit"
					value="<spring:message text="Get free Quotes"/>" />
			</c:if>
		</td>
	</tr>
	
</table>	

<h3>Product List</h3>
<c:if test="${!empty listProduct}">
	<table class="tg">
	<tr>
	    <th width="80">productGroupId </th>
		<th width="80">Product ID</th>
		<th width="120">Product Name</th>
		<th width="120">Product Desc</th>
		
	</tr>
	<c:forEach items="${listProduct}" var="product">
		<tr>
		    <td>${product.productGroup.productGroupName}</td>
			<td>${product.productId}</td>
			<td>${product.productName}</td>
			<td>${product.productDesc}</td>
			
		</tr>
	</c:forEach>
	</table>
</c:if>

</form:form>



</body>
</html>
