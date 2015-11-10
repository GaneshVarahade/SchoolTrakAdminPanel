<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#holidayDate" ).datepicker({dateFormat: 'yy-mm-dd'});
  });
  </script>
</head>

<div class="reg_form">﻿
 <header>Update Holiday</header>
<div id="formId">
<form  action="${pageContext.request.contextPath}/admin/updateHoliday" method="post" data-toggle="validator" role="form"  id="sky-form" class="sky-form" >
	<div class="form-group">
		<div class="panel-body">
        	<div class="row">
				<div class="col-lg-10 col-md-9 col-sm-8">
					<div class="row">
						
						<div class="col-md-6">
	            			<div class="form-group">
								<label class="col-sm-5 control-label">ID</label>
									<div class="col-sm-7">
	    								<input type="text" id="holidayId" name="holidayId" value="${holiday.holidayId}"   required="required"/>
	     									<div class="help-block with-errors"></div>
	     									<span id="err"> </span>
	     							</div>
	     					</div>
	  					</div>
					
					
						<div class="col-md-6">
            				<div class="form-group">
								<label class="col-sm-5 control-label">Holiday Title</label>
									<div class="col-sm-7">
    									<input type="text" name="holidayTitle" id="holidayTitle" value="${holiday.holidayTitle}"   required="required"/>
     										<div class="help-block with-errors"></div>
     										<span id="err"> </span>
     								</div>
     						</div>
  						</div>
  					</div>
  				</div>
		
				<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">Holiday Date</label>
							<div class="col-sm-7">
	    						<input type="text" name="holidayDate" id="holidayDate" value="${holiday.holidayDate}"   required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
	  			
	  			<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">Holiday Description</label>
							<div class="col-sm-7">
	    						<input type="text"  name="holidayDescription" id="holidayDescription" value="${holiday.holidayDescription}"  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
	  		
				  	
	  			<div class="col-md-6">
	            	<div class="form-group">
						<!-- <label class="col-sm-5 control-label">Last Name</label> -->
							<div class="col-sm-7">
	    						<%-- <form:input path="lastName" class="form-control" id="inputLastName" value="${employee.lastName}" s required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span> --%>
	     						<input type="submit" class="btn btn-primary" value="Update">
	     					</div>
	     			</div>
	  			</div>	
	  		
	  			  		
	  		</div>
	  	</div>
	</div>
</form>
</div>
</div>

 