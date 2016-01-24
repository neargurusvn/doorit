<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<title>Technical Problem-NearGuru</title>
 <link rel="shortcut icon" href="<c:url value="/resources/assets/img/favicon.ico" />" />
<body>
	<h1> www.nearguru.com Access is denied</h1>

	<c:choose>
		<c:when test="${empty username}">
			<h2>You do not have permission to access this page!</h2>
		</c:when>
		
	</c:choose>

</body>
</html>