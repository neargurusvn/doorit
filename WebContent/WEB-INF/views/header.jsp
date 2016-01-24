
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

		<section id="headerHeight">
		<div id="fb-root"></div>
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
		<c:set var="seperator" value="views/"/>
		
		<c:set var="url" value="<%=request.getRequestURL()%>"/>
	
		<c:set var="index" value=" ${fn:indexOf(url,seperator)}" />
 
   <c:set var="url" value="${fn:substring(url, fn:indexOf(url,seperator)+6, 100)}" />

    <div class="navbar navbar-default navbar-static-top" role="navigation">

        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                   Menu 
               </button>
               <a href="${pageContext.request.contextPath}/index" class="navbar-brand"><img src="<c:url value="/resources/assets/img/logo.png" />" alt="Nearguru - Hire an service expert"></a>
           </div>
           <div class="collapse navbar-collapse">
           
           <c:choose>
           		<c:when test="${user.userType eq 'cust'}">
  						 <ul class="nav navbar-nav">
 
           
               <c:if test="${url eq 'RequestAService.jsp' }">
                <li ><a href="${pageContext.request.contextPath}/manageRequest" >My Projects</a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/requetAService" >Raise new Request</a></li>
               </c:if>
                <c:if test="${url ne 'RequestAService.jsp' }">
                <li class="active"><a href="${pageContext.request.contextPath}/manageRequest" >My Projects</a></li>
                <li ><a href="${pageContext.request.contextPath}/requetAService" >Raise new request</a></li>
                
                </c:if> 
               
			<!--   <li style="padding-top:22px;padding-left:20px" > <div class="fb-like" data-href="http://www.nearguru.com/" data-layout="button_count" data-action="like" data-show-faces="false" data-share="true"></div></li> -->
           </ul>         		 
           	 
           		</c:when>
   
           		<c:when test="${user.userType eq 'pros'}">
           		
           			 <ul class="nav navbar-nav">
                 <c:if test="${proActionLead eq 'Leads'}">
               <li class="active"><a href="${pageContext.request.contextPath}/prosDashboard" >Leads&nbsp;<span style="background-color:#EF0D49" class="badge">${LeadsNo}</span></a></li>
               </c:if>
                <c:if test="${proActionLead ne 'Leads'}">
               <li><a href="${pageContext.request.contextPath}/prosDashboard" >Leads&nbsp;<span style="background-color:#EF0D49" class="badge">${LeadsNo}</span></a></li>
               </c:if>
                <c:if test="${proActionQuote eq 'Quotes'}">
                 <li class="active" ><a   href="${pageContext.request.contextPath}/manageRequestsVendor" >Quotes</a></li>
                </c:if>
                 <c:if test="${proActionQuote ne 'Quotes'}"> 
                  <li><a href="${pageContext.request.contextPath}/manageRequestsVendor" >Quotes</a></li>
                 </c:if>
                  <c:if test="${proAction eq 'manageRequest'or url eq 'manageRequests.jsp'}"> 
                  	 <li class="active"><a   href="${pageContext.request.contextPath}/manageRequest" >My Projects</a></li>
                  </c:if>
                   <c:if test="${proAction ne 'manageRequest'}">
                     <c:if test="${url ne 'manageRequests.jsp'}">
                   	 <li><a  href="${pageContext.request.contextPath}/manageRequest" >My Projects</a></li>
                   	 </c:if>
                   	                   </c:if> 
                
                 	  <!-- <li style="padding-top:22px;padding-left:20px" > <div class="fb-like" data-href="http://www.nearguru.com/" data-layout="button_count" data-action="like" data-show-faces="false" data-share="true"></div></li> -->
              
             </ul>
           		</c:when>
           </c:choose>    
            
          <c:if test="${user eq null}"> 
          <ul class="nav navbar-nav">
          <!--   <li style="padding-top:22px;padding-left:20px" > <div class="fb-like" data-href="http://www.nearguru.com/" data-layout="button_count" data-action="like" data-show-faces="false" data-share="true"></div></li> -->
          
          </ul>
           <ul class="nav navbar-nav navbar-right"> 

               <!-- <li><a href="vendordashboard.html" >Requests</a></li> -->
            
                <li><a href="${pageContext.request.contextPath}/howItWorksCust" >How it Works</a></li>
             
                  <li><a href="${pageContext.request.contextPath}/listBussiness" >List Your Business</a></li>
   				<li><a href="${pageContext.request.contextPath}/SignUp" title="">Sign Up</a></li>
   				   <li><a href="${pageContext.request.contextPath}/login" >Sign In</a></li>
           </ul>         		
           	
         
          </c:if>  
         
          <c:if test="${user ne null}">
         
          
           
           <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="margin-top:12px">
               		  <ul class="nav nav-tabs" style="border-bottom-width:0px">   
                	 <%--  <c:choose>
                 <c:when test="${user.filename ne null}"> 
                 	 <img width="30" height="10" src="<c:url value="/download/${user.userId}" />" class="img-responsive img-circle" alt="avatar" >
                 </c:when> 
                 <c:otherwise>
                  <img width="30" height="10" src="<c:url value="/resources/assets/img/imgPlace.jpg" />" class="img-responsive img-circle" alt="avatar" >
                 </c:otherwise>
                 </c:choose> --%>   
                	<li>  ${user.name}</li>  
                	<li>  <span class="fa fa-chevron-down"></span></li>
                </ul> 
                
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
        </ul>
        </c:if> 
      
    </div>
</div>
 
</div>

  <c:if test="${url eq 'manageRequests.jsp'}"> 
<div class="navbar-default-tab" role="navigation">
      <!-- <div class="container"> --> 
      <ul class="nav nav-tabs" id="myTabs"> 
      <c:choose>   
      	<c:when test="${requestType eq 'IP' }"> 
      		 <li class="active"><a href="${pageContext.request.contextPath}/manageRequestCustomers/IP" data-url="/embed/62805/view">In Progress&nbsp;<span style="background-color:#EF0D49"  class="badge">${INProgressNo}</span></a></li>
        <li><a href="${pageContext.request.contextPath}/manageRequestCustomers/WIP" data-url="/embed/62806/view">Hire <span style="background-color:#EF0D49"  class="badge">${HiredNo}</span> </a></li>  
        <li><a href="${pageContext.request.contextPath}/manageRequestCustomers/OLD" data-url="/embed/62807/view">Archive</a></li>
      </c:when> 
      <c:when test="${requestType eq 'WIP' }">
      		 <li ><a href="${pageContext.request.contextPath}/manageRequestCustomers/IP" data-url="/embed/62805/view">In Progress&nbsp;<span style="background-color:#EF0D49" class="badge">${INProgressNo}</span></a></li>
        <li class="active"><a href="${pageContext.request.contextPath}/manageRequestCustomers/WIP" data-url="/embed/62806/view">Hire <span style="background-color:#EF0D49"  class="badge">${HiredNo}</span> </a></li>
        <li><a href="${pageContext.request.contextPath}/manageRequestCustomers/OLD" data-url="/embed/62807/view">Archive</a></li>
      </c:when>
      <c:when test="${requestType eq 'OLD' }"> 
      		 <li ><a href="${pageContext.request.contextPath}/manageRequestCustomers/IP" data-url="/embed/62805/view">In Progress&nbsp;<span style="background-color:#EF0D49" class="badge">${INProgressNo}</span></a></li>
        <li><a href="${pageContext.request.contextPath}/manageRequestCustomers/WIP" data-url="/embed/62806/view">Hire&nbsp; <span style="background-color:#EF0D49" class="badge">${HiredNo}</span> </a></li>
        <li class="active"><a href="${pageContext.request.contextPath}/manageRequestCustomers/OLD" data-url="/embed/62807/view">Archive</a></li>
      </c:when>   
      </c:choose>   
        <c:if test="${user.userType eq 'pros' and url eq 'manageRequests.jsp'}"> 
      <li class="pull-right"> <div style="margin-bottom:10px;margin-right:50px"> <a href="${pageContext.request.contextPath}/requetAService"  class="btn  btn-primary btn-default" >Raise new request</a>	</div></li>
      </c:if>
      </ul>
     
    
       	
      
      <!-- </div> -->
    </div>
   </c:if> 
    <c:if test="${url eq 'ManageRequestsVendor.jsp'}">
    
<div class="navbar-default-tab" role="navigation">
      <!-- <div class="container"> -->
      <ul class="nav nav-tabs" id="myTabs"> 
         <c:choose>
      	<c:when test="${requestType eq 'IP' }">
      		 <li class="active"><a href="${pageContext.request.contextPath}/manageRequestsVendors/IP" data-url="/embed/62805/view">In Progress&nbsp;<span style="background-color:#EF0D49" class="badge">${QuoteInProgressNo}</span></a></li>
        <li><a href="${pageContext.request.contextPath}/manageRequestsVendors/WIP" data-url="/embed/62806/view">Hire&nbsp;<span style="background-color:#EF0D49"  class="badge">${QuoteWIPNo}</span></a></li>
        <li><a href="${pageContext.request.contextPath}/manageRequestsVendors/OLD" data-url="/embed/62807/view">Archive</a></li>
      </c:when>
      <c:when test="${requestType eq 'WIP' }">
      		 <li ><a href="${pageContext.request.contextPath}/manageRequestsVendors/IP" data-url="/embed/62805/view">In Progress&nbsp;<span style="background-color:#EF0D49" class="badge">${QuoteInProgressNo}</span></a></li>
        <li class="active"><a href="${pageContext.request.contextPath}/manageRequestsVendors/WIP" data-url="/embed/62806/view">Hire&nbsp;<span style="background-color:#EF0D49"  class="badge">${QuoteWIPNo}</span></a></li>
        <li><a href="${pageContext.request.contextPath}/manageRequestsVendors/OLD" data-url="/embed/62807/view">Archive</a></li>
      </c:when>
      <c:when test="${requestType eq 'OLD' }">
      		 <li><a href="${pageContext.request.contextPath}/manageRequestsVendors/IP" data-url="/embed/62805/view">In Progress&nbsp;<span style="background-color:#EF0D49" class="badge">${QuoteInProgressNo}</span></a></li>
        <li><a href="${pageContext.request.contextPath}/manageRequestsVendors/WIP" data-url="/embed/62806/view">Hire&nbsp;<span style="background-color:#EF0D49"  class="badge">${QuoteWIPNo}</span></a></li>
        <li class="active"><a href="${pageContext.request.contextPath}/manageRequestsVendors/OLD" data-url="/embed/62807/view">Archive</a></li>
      </c:when>
       
      </c:choose> 
        
      </ul>
      
      <!-- </div> --> 
    </div> 
   </c:if>
   
</section>


