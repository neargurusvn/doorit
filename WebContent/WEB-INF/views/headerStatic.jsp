<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body> 
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-61550071-1', 'auto');
  ga('send', 'pageview');

</script>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.0";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
		<section>
	
		<c:set var="seperator" value="views/"/> 
		
		<c:set var="url" value="<%=request.getRequestURL()%>"/> 
	
		<c:set var="index" value=" ${fn:indexOf(url,seperator)}" />
 
   <c:set var="requestType" value="${fn:substring(url, fn:indexOf(url,seperator)+6, 100)}" />
 
            <div class="navbar navbar-default navbar-static-top" role="navigation">
     	
        <div class="container">
            <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                Menu 
            </button>
            <a href="${pageContext.request.contextPath}/index" class="navbar-brand"><img src="<c:url value="/resources/assets/img/logo.png" />" alt="Nearguru - Hire an service expert"></a>
        </div>
        <div class="collapse navbar-collapse">
           <c:if test="${not empty user}">
            <ul class="nav navbar-nav">

               <c:if test="${requestType eq 'howItWorksCust.jsp' or requestType eq 'howItWorksPros.jsp' }"> 
               <li class="active"><a href="${pageContext.request.contextPath}/manageRequest" >My Projects</a></li>
               </c:if>

           </ul>  
           </c:if> 
           
              
       			<ul style="padding-top:22px;padding-left:20px"  class="nav navbar-nav">
         <!--    <li> <div class="fb-like" data-href="http://www.nearguru.com/" data-layout="button_count" data-action="like" data-show-faces="false" data-share="true"></div></li> -->
            	 </ul>
            <ul class="nav navbar-nav navbar-right">
             <c:if test="${requestType eq 'UserRegistration.jsp' }">   
             
             	  <li><a href="${pageContext.request.contextPath}/howItWorksCust" >How it Works</a></li>
                <li><a href="${pageContext.request.contextPath}/login" >Sign In</a></li>
             </c:if>
           <c:if test="${ empty user}">
          
               <c:choose> 
                <c:when test="${requestType eq 'prosRegistration.jsp'}">
                 <li><a href="${pageContext.request.contextPath}/howItWorksPros" >How it Works</a></li>
                <li><a href="${pageContext.request.contextPath}/login" >Sign In</a></li>
                
                </c:when>
               
              
               
               
                 <c:when test="${requestType eq 'howItWorksPro.jsp' }">
               
              
                <li><a href="${pageContext.request.contextPath}/pros" title="">List Your Business</a></li>
                
                 <li><a href="${pageContext.request.contextPath}/userRegistration" title="">Sign Up</a></li>
                   <li><a href="${pageContext.request.contextPath}/login" title="">Sign In</a></li>
                </c:when>
                <c:when test="${requestType eq 'login.jsp' }">
                <li><a href="${pageContext.request.contextPath}/pros" title="">List Your Business</a></li>
                 <li><a href="${pageContext.request.contextPath}/SignUp" title="">Sign Up</a></li>
                </c:when>
                 
                 <c:when test="${requestType eq 'howItWorksCust.jsp'}">
              
                 <li><a href="${pageContext.request.contextPath}/SignUp" title="">Sign Up</a></li>
                   <li><a href="${pageContext.request.contextPath}/login" title="">Sign In</a></li>
                </c:when>
                <c:otherwise>
                		  <li><a href="${pageContext.request.contextPath}/login" title="">Sign In</a></li>
                		 <li><a href="${pageContext.request.contextPath}/howItWorksCust" >How it Works</a></li>
              
                </c:otherwise>
             
              </c:choose>
         </c:if>  
                
           <c:if test="${requestType ne 'UserRegistration.jsp'}">
            <c:if test="${not empty user}">
              <li class="dropdown">  
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>
                   
                    ${user.name} 
                    <span class="fa fa-chevron-down"></span>
                </a>
                <ul class="dropdown-menu"> 
                <c:if test="${user.userType eq 'cust' or user.userType eq 'pros' }">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/userSettings"><span class="fa fa-cog"></span>&nbspSettings</a></li>
                   <li class="divider"></li>
                 </c:if>
                   <c:if test="${user.userType eq 'pros' }">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/editProfile"><span class="fa fa-edit"></span>&nbspEdit Profile</a></li>
                     <li class="divider"></li>
                   </c:if> 
                  
                  
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/logout"><span class="fa fa-power-off"></span>&nbspLog Out</a></li>


                </ul>
            </li>
            </c:if>
            </c:if>
            </ul>
        </div>
        </div>
       
         
</div>
    
        </section>
</body>
</html>