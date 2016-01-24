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
<title>Insert title here</title>
</head>
<body>
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
               <a href="/doorit/index" class="navbar-brand"><img src="<c:url value="/resources/assets/img/logo1.png" />" alt="Brand"></a>
           </div>
           <div class="collapse navbar-collapse">
           
            <ul class="nav navbar-nav">
			  <c:if test="not empty user">
               <!-- <li><a href="vendordashboard.html" >Requests</a></li> -->
               <li class="active"><a href="/doorit/manageRequest" >Dashboard</a></li>
              </c:if>
			<c:if test="!not empty user">
			   <li><a href="/doorit/howItWorksCust" title="">How it's work</a></li>
			  <li><a href="/doorit/login" title="">Sign In</a></li>
                 <li><a href="/doorit/signUp" title="">Sign Up</a></li>
			</c:if>
           </ul>
           <c:if test="not empty user">
           <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>
                   
                    ${user.name} 
                    <span class="fa fa-chevron-down"></span>
                </a>
                <ul class="dropdown-menu"> 
                <c:if test="${user.userType eq 'cust' or user.userType eq 'pros' }">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="/doorit/userSettings"><span class="fa fa-cog"></span>&nbspSettings</a></li>
                    <li class="divider"></li>
                 </c:if>
                  <c:if test="${user.userType eq 'pros' }">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="/ddorit/EditProfile.html"><span class="fa fa-edit"></span>&nbspEdit Profile</a></li>
                   </c:if> 
                   <li><a href="#" title="">Help</a></li>
                    <li class="divider"></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="/doorit/login"><span class="fa fa-power-off"></span>&nbspLog Out</a></li>


                </ul>
            </li>
        </ul>
        </c:if>
    </div>
</div>
 
</div>
  <c:if test="${requestType eq 'manageRequests.jsp'}"> 
<div class="navbar-default-tab" role="navigation">
      <!-- <div class="container"> -->
      <ul class="nav nav-tabs" id="myTabs">
        <li class="active"><a href="/doorit/manageRequest" data-url="/embed/62805/view">In Progress</a></li>
        <li><a href="/doorit/manageRequest" data-url="/embed/62806/view">Hire</a></li>
        <li><a href="/doorit/manageRequest" data-url="/embed/62807/view">Archive</a></li>
      </ul>
      <!-- </div> -->
    </div>
   </c:if>
</section>
</body>
</html>