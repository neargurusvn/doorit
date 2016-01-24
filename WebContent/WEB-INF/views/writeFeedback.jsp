<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
    <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Write Feedback for ${vendorProfile.companyName} -NearGuru</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">   
        <!--[if lt IE 9]><script src="//Fhtml5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
        <!-- MAIN STYLE SECTION-->
          <link rel="shortcut icon" href="<c:url value="/resources/assets/img/favicon.ico" />" />   
        <link href="<c:url value="/resources/assets/css/dashboard.css" />" rel="stylesheet" media="screen" />
        <link href="<c:url value="/resources/assets/css/fh.css" />" rel="stylesheet" />
        
        <link href="<c:url value="/resources/assets/plugins/IconHoverEffects-master/css/component.css" />" rel="stylesheet" />
        <link href="<c:url value="/resources/assets/plugins/bootstrap/bootstrap.css" />" rel="stylesheet" />
        <link href="<c:url value="/resources/assets/css/about-achivements.css" />" rel="stylesheet" />
        
        <link href="<c:url value="/resources/assets/plugins/font-awesome/font-awesome.css" />" rel="stylesheet">    
        <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
        <link id="mainStyle" href="<c:url value="/resources/assets/css/vendor.css" />" rel="stylesheet" />
        <script src="<c:url value="/resources/assets/js/jquery.js" />"></script>
  <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
     <script >
     
     $(document).ready(function () {
    	 
    	 
    	  var intputElements = document.getElementsByClassName("invalid");
  	    for (var i = 0; i < intputElements.length; i++) {
  	        intputElements[i].oninvalid = function (e) {
  	            e.target.setCustomValidity("");
  	            if (!e.target.validity.valid) {
  	                if (e.target.name == "username") {
  	                    e.target.setCustomValidity("The field 'Username' cannot be left blank");
  	                }
  	                else {
  	                    e.target.setCustomValidity(" ");
  	                }
  	            }
  	        };
  	    }
     });
     
     </script>    
               <!-- END MAIN STYLE SECTION-->


        <style type="text/css" >
        textarea:focus:required:invalid {
  
  border-color:red ;
  color:black;
  }
            .fa-star{
                color: #DBA901;
            }
            p label
            {
                color:rgb(29, 78, 100);
            }
        </style>
    </head>
    <body>
               
            <!-- HEADER SECTION -->
                   <%@ include file="header.jsp" %>
        <section>
       
        <div class="row" style="margin-bottom:30px">
            <div class="col-md-12 bg-color">
               <div class="container">
                   <h2 class="">  <a href="${pageContext.request.contextPath}/vendorProfile/${prosId}/${serviceRequestId}" title=""><i class="fa fa-arrow-circle-o-left"></i></a>   Leave a feedback </h2>
               </div>
           </div>

       </div>
   </section>
  

          
				
				                    
                <div class="container">
                   
				<c:url var="addFeedback" value="/addFeedback" ></c:url>
                
                <form:form action="${addFeedback}" commandName="feedback">
                <form:hidden value="${user.userId}" path="userId"></form:hidden>  
                  <form:hidden value="${prosId}" path="prosId"></form:hidden>
                       
                            <form:hidden value="${serviceRequestId}" path="requestId"></form:hidden>
                                <div class="row">
                                <div class="col-md-6">
                                  <div class="panel panel-success">
                                    <div class="panel-heading ">Feedback for -${vendorProfile.companyName}</div>
                                    	   <div class="panel-body">
                                    	   		 <br>
                             					 <fieldset>
                            						  <div class="form-group">
                              							  <label for="name"> <b>For Request: </b>&nbsp;${wrapRequestService.product.productName} </label>
                                  						</div>
                                  						 <div class="form-group">
                              							  <label for="name"> <b>Your Ratings: </b></label>
                              							  
                              							     <div id="stars" class="starrr" style="font-size:35px"></div>
                                      						 You gave a rating of <span id="count" >0</span> star(s) 
                                       							 <form:hidden id="starRating" path="rating"></form:hidden>
                              							  
                              					  			
                              							  
                              							  
                                  						</div>
                                  						<div class="form-group">
                                  							
                                  							  <p><label>Comment:</label></p>
                                  							   <form:textarea required="required" maxlength="400" class="glowing-border invalid" path="review" rows="4" cols="38" oninvalid="this.setCustomValidity('Please enter feedback')"   oninput="setCustomValidity('')"/>
                                  						</div>	
                                  						<div class="form-group">
                                  								  <button type="submit" class="btn btn-primary">Leave Feedback</button>
                                  						</div>
                                  				</fieldset>
                            			  </div>			
                                   </div>
                                  </div>
                                  <div class="col-md-6 hidden-sm hidden-xs">
                                  			  <div >
                                			<div class="">
                                  			  <h3>Let people know how your experience went</h3>
                                   			 <h3 class="list-group-item-heading"><i class="fa fa-check-square text-info"></i>&nbsp;Describe the job</h3><br/>
                                 			
                                    			<h3 class="list-group-item-heading"><i class="fa fa-check-square text-info"></i>&nbsp;Say what went well</h3><br/>
                                
                                   				 <h3 class="list-group-item-heading"><i class="fa fa-check-square text-info"></i>&nbsp;Point out what could have been better</h3><br/>
                                 
                              				  </div>
                          				  </div>
                                  </div> 
                               
                                
                             
                            </div>
                            </form:form>
                          
                       
                    </div>
               
         
            
   
     

<!-- footer -->
<%@ include file="footer.jsp" %>


        
        <script src="<c:url value="/resources/assets/js/modernizr-2.6.2-respond-1.1.0.min.js" />"></script>
        <script src="<c:url value="/resources/assets/js/jquery.js" />"></script>
        <script src="<c:url value="/resources/assets/js/scrollReveal.js" />"></script>
        
        
        <script>
            window.scrollReveal = new scrollReveal(); //please put this script here to show animation at the time of scroll
        </script>
        
        
        <script src="<c:url value="/resources/assets/js/jquery.easing.1.3.js" />"></script>
        <script src="<c:url value="/resources/assets/plugins/bootstrap/bootstrap.min.js" />"></script>
        <script src="<c:url value="/resources/assets/plugins/isotope/jquery.isotope.min.js" />"></script>
        <script src="<c:url value="/resources/assets/plugins/fancybox/jquery.fancybox.pack.js" />"></script>
        <script src="<c:url value="/resources/assets/js/jquery.localscroll-1.2.7-min.js" />"></script>
        <script src="<c:url value="/resources/assets/js/jquery.appear.js" />"></script>
        <script src="<c:url value="/resources/assets/scripts/main.js" />"></script>
        <script src="<c:url value="/resources/assets/scripts/login.js" />"></script>
        
        
        
        <!-- star plugin -->

        <script>

            var __slice = [].slice;

            (function($, window) {
                var Starrr;

                Starrr = (function() {
                    Starrr.prototype.defaults = {
                        rating: void 0,
                        numStars: 5,
                        change: function(e, value) {
                        }
                    };

                    function Starrr($el, options) {
                        var i, _, _ref,
                                _this = this;

                        this.options = $.extend({}, this.defaults, options);
                        this.$el = $el;
                        _ref = this.defaults;
                        for (i in _ref) {
                            _ = _ref[i];
                            if (this.$el.data(i) != null) {
                                this.options[i] = this.$el.data(i);
                            }
                        }
                        this.createStars();
                        this.syncRating();
                        this.$el.on('mouseover.starrr', 'i', function(e) {
                            return _this.syncRating(_this.$el.find('i').index(e.currentTarget) + 1);
                        });
                        this.$el.on('mouseout.starrr', function() {
                            return _this.syncRating();
                        });
                        this.$el.on('click.starrr', 'i', function(e) {
                            return _this.setRating(_this.$el.find('i').index(e.currentTarget) + 1);
                        });
                        this.$el.on('starrr:change', this.options.change);
                    }

                    Starrr.prototype.createStars = function() {
                        var _i, _ref, _results;

                        _results = [];
                        for (_i = 1, _ref = this.options.numStars; 1 <= _ref ? _i <= _ref : _i >= _ref; 1 <= _ref ? _i++ : _i--) {
                            _results.push(this.$el.append("<i class='fa fa-star-o'></i>"));
                        }
                        return _results;
                    };

                    Starrr.prototype.setRating = function(rating) {
                        if (this.options.rating === rating) {
                            rating = void 0;
                        }
                        this.options.rating = rating;
                        this.syncRating();
                        return this.$el.trigger('starrr:change', rating);
                    };

                    Starrr.prototype.syncRating = function(rating) {
                        var i, _i, _j, _ref;

                        rating || (rating = this.options.rating);
                        if (rating) {
                            for (i = _i = 0, _ref = rating - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
                                this.$el.find('i').eq(i).removeClass('fa-star-o').addClass('fa-star');
                            }
                        }
                        if (rating && rating < 5) {
                            for (i = _j = rating; rating <= 4 ? _j <= 4 : _j >= 4; i = rating <= 4 ? ++_j : --_j) {
                                this.$el.find('i').eq(i).removeClass('fa-star').addClass('fa-star-o');
                            }
                        }
                        if (!rating) {
                            return this.$el.find('i').removeClass('fa-star').addClass('fa-star-o').addClass('text-info');
                        }
                    };

                    return Starrr;

                })();
                return $.fn.extend({
                    starrr: function() {
                        var args, option;

                        option = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
                        return this.each(function() {
                            var data;

                            data = $(this).data('star-rating');
                            if (!data) {
                                $(this).data('star-rating', (data = new Starrr($(this), option)));
                            }
                            if (typeof option === 'string') {
                                return data[option].apply(data, args);
                            }
                        });
                    }
                });
            })(window.jQuery, window);

            $(function() {
                return $(".starrr").starrr();
            });

            $(document).ready(function() {

            	
                $('#stars').on('starrr:change', function(e, value) {
                    $('#count').html(value);
                    var ratingValue=  $('#count').html(value);
                  
                  
                    var ratedValue=ratingValue.text();
                    $("#starRating").val(ratedValue);
                });

                $('#stars-existing').on('starrr:change', function(e, value) {
                    $('#count-existing').html(value);
                });
            });
        </script>
        <!-- end star plugin -->

    </body>
</html>