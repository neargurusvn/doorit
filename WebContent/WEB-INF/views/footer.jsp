
		
		
		   <!-- FOOTER SECTION-->


  
   
        <div class="container-fluid footer"  id="footer" style="margin-top:2%">
         
         <div class="row">     
                <div class="col-xs-12 col-sm-12 col-md-offset-1 col-lg-11 text" >
                    <div class="col-lg-3  col-md-3 col-sm-3 col-xs-12" style="padding-top:30px">   
                     <ul>   
                     			
                                  
                                <p> Nearguru helps you to contact, compare and hire the best Home renovation service provider near you at a price that is right for you 
                                </p>
                                <li style="padding-top:10px">  
                                   
                                 <ul class="social">  
                                
                             <li> <a  style="cursor:pointer"  onclick="openFooterLinks('https://www.facebook.com/neargurucom')" > <i class=" fa fa-facebook">   </i> </a> </li>
                           	 <li> <a  style="cursor:pointer"  onclick="openFooterLinks('https://twitter.com/Nearguru')"> <i class="fa fa-twitter">   </i> </a> </li>
                             <li> <a  style="cursor:pointer"  onclick="openFooterLinks('https://plus.google.com/+Nearguru')"  > <i class="fa fa-google-plus">   </i> </a> </li>
                         <!--   <li> <a  style="cursor:pointer"  onclick="openFooterLinks('https://www.pinterest.com/neargurucom/')"  >  <i class="fa fa-pinterest"></i></a> </li>
                             
 	-->                             <!-- <li> <a  style="cursor:pointer"  onclick="openFooterLinks('https://www.linkedin.com/in/neargurucom')"  >  <i class="fa fa-linkedin"></i></a> </li> 
                               
                                  <li> <a  style="cursor:pointer"  onclick="openFooterLinks('  https://instagram.com/neargurucom/')"  >  <i class="fa fa-instagram"></i></a> </li>
                         -->       
                            </ul>     
                                </li>     
                                   
                     </ul>            
                           
                       
                    </div>  
                    <div class="col-lg-2  col-md-2 col-sm-2 col-xs-12"> 
                            <h3> Nearguru </h3>
                            <ul>
                                <li> <a  href="${pageContext.request.contextPath}/AboutUs"  >About Us </a> </li> 
                            <%--  <li> <a   href="${pageContext.request.contextPath}/location"   >Locations </a> </li> --%>   
                             <li> <a   href="${pageContext.request.contextPath}/trustandsaftey"   >Trust and Safety </a> </li>
                              <li> <a   href="${pageContext.request.contextPath}/termsOfUsage"   >Terms of Usage </a> </li>
                               <li> <a   href="${pageContext.request.contextPath}/privacyPolicy"   >Privacy  </a> </li> 
                                 <!-- 
                                 <li> <a   style="cursor:pointer"  onclick="openFooterLinks(' http://nearguru.blogspot.in/')"  >Blog  </a> </li>   
                                   -->
                            </ul> 
                        </div>
                    <div class="col-lg-2  col-md-2 col-sm-2 col-xs-12"> 
                        <h3> Customers </h3>
                                <ul>
                                    <li> <a   href="${pageContext.request.contextPath}/howItWorksCust"> How It Works </a> </li>
                                    <li> <a  href="${pageContext.request.contextPath}/popularServices"  > Popular Services </a> </li>
                                  <c:if test="${user eq null}">
                                    <li> <a  href="${pageContext.request.contextPath}/SignUp">Sign Up </a> </li>
                                  </c:if>
                                </ul>  
                    </div>
                    <div class="col-lg-2  col-md-2 col-sm-2 col-xs-12">
                        <h3> Professionals</h3>
                                <ul>
                                    <li> <a  href="${pageContext.request.contextPath}/howItWorksPros" > How it Works </a> </li> 
                                        <c:if test="${user eq null}">
                                    <li> <a href="${pageContext.request.contextPath}/pros"> List Your Business </a> </li>
                                    
                                 
                                  </c:if> 
                                </ul>
                    </div>
                    <div class="col-lg-2  col-md-2 col-sm-3 col-xs-12">
                        <h3> Contact us </h3> 
                                <ul>
                                    <li> <i class="fa fa-envelope-o"></i> &nbsp; info@nearguru.com</li>
                                    <li> <i class="fa fa-phone"></i> &nbsp; 86000 23817 </li>
                                  
                                </ul>
                </div>
                </div>
            </div> 
            
             <div class="row">  
              <div class="col-md-4 col-md-offset-5 col-xs-12">
              		<h5 style="margin:30px 0 0 0;color:#B0C5D1">Copyright © Nearguru 2015-2016 </h5>
              </div>
              
              </div>         <!--/.row--> 
      
         </div>                     
              
            
               
            
             
                
    <script>
    
    function openFooterLinks(url)
    {  
    	     
    	 
    	 window.open(url);
    }
    </script>
    <!--/.footer-->
