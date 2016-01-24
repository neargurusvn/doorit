<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Request a Service-NearGuru</title>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
</head>
<body>
<h1>
	Request a service form
</h1>


<c:forEach var="fromdata" items="${fromdata}">
    <c:set var="que"  value="${fromdata.key}"/>
    <c:set var="opt"  value="${fromdata.value}"/>
     <table>
		<tr>
		<td>
     
     <label>${que.queId}</label>
     <label>${que.queDesc}</label>
     
     <c:forEach items="${fromdata.value}" var="option">
		<tr>
			<!-- 
			<td><input type="checkbox" value=""/>${option.question.queId}</td>
			<td><input type="checkbox" value=""/>${option.optId}</td>
			 -->
			<td><input type="checkbox" value=""/>${option.optDesc}</td>
			
		</tr>
	</c:forEach>
	
     
     <br>
    
   </td>
   </tr>
   </table>
</c:forEach>


</body>
</html>
