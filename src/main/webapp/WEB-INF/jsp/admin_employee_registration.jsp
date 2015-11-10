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
    $( "#birthDate" ).datepicker({dateFormat: 'yy-mm-dd'});
  });
  </script>
</head>
<div class="reg_form">﻿
 <header>Add New Project</header>
<div id="formId">
<form  action="${pageContext.request.contextPath}/admin/addEmployee" method="post" data-toggle="validator" role="form"  id="sky-form" class="sky-form" >
	<div class="form-group">
		<div class="panel-body">
        	<div class="row">
				<div class="col-lg-10 col-md-9 col-sm-8">
					<div class="row">
						
						<div class="col-md-6">
	            			<div class="form-group">
								<label class="col-sm-5 control-label">Employee Id</label>
									<div class="col-sm-7">
	    								<input type="text" id="id" name="id" value=""   required="required"/>
	     									<div class="help-block with-errors"></div>
	     									<span id="err"> </span>
	     							</div>
	     					</div>
	  					</div>
					
					
						<div class="col-md-6">
            				<div class="form-group">
								<label class="col-sm-5 control-label">userName</label>
									<div class="col-sm-7">
    									<input type="text" name="userName" id="userName" value=""   required="required"/>
     										<div class="help-block with-errors"></div>
     										<span id="err"> </span>
     								</div>
     						</div>
  						</div>
  					</div>
  				</div>
		
				<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">password</label>
							<div class="col-sm-7">
	    						<input type="text" name="password" id="password" value=""   required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
	  			
	  			<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">passwordConfirm</label>
							<div class="col-sm-7">
	    						<input type="text"  name="passwordConfirm" id="passwordConfirm" value=""  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
	  		
				<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">firstName</label>
							<div class="col-sm-7">
	    						<input type="text" name="firstName" id="firstName" value=""  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>	  		
	  		
	  			<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">lastName</label>
							<div class="col-sm-7">
	    						<input type="text" name="lastName" id="lastName" value=""  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
	  			
	  			<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">birthDate</label>
							<div class="col-sm-7">
	    						<input type="text" name="birthDate" id="birthDate" value=""  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
	  			
	  			<div class="col-md-6">
	  				<div class="form-group">
	  					<label class="col-sm-5 control-label">Sex</label>
	  						<div class="col-sm-7">
     							<input type="radio"  name="sex" id="sex" value="male" required="required"/> Male
					    		<input type="radio"  name="sex" id="sex"  value="female" required="required"/> Female
      							<div class="help-block with-errors"></div>
      						</div>
    				</div>
    			</div>
	  			
	  			<div class="col-md-6">
	  				<div class="form-group">
	  					<label class="col-sm-5 control-label">maritalStatus</label>
	  						<div class="col-sm-7">
     							<input type="radio"  name="maritalStatus" id="maritalStatus" value="married" required="required"/> Married
					    		<input type="radio"  name="maritalStatus" id="maritalStatus"  value="unmarried" required="required"/> Unmarried
      							<div class="help-block with-errors"></div>
      						</div>
    				</div>
    			</div>
	  			
	  			
	  			<div class="col-md-6">
	  				<div class="form-group">
	  					<label class="col-sm-5 control-label">userRole</label>
	  						<div class="col-sm-7">
     							<input type="radio"  name="userRole" id="userRole" value="ROLE_USER" required="required"/> User
					    		<input type="radio"  name="userRole" id="userRole"  value="ROLE_ADMIN" required="required"/> Admin
      							<div class="help-block with-errors"></div>
      						</div>
    				</div>
    			</div>
	  			
	  			
	  			 <div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">email</label>
							<div class="col-sm-7">
	    						<input type="text" name="email" id="email" value=""  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
	  			
	  			
	  			<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">address</label>
							<div class="col-sm-7">
	    						<input type="text" name="address" id="address" value=""  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
				
				<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">city</label>
							<div class="col-sm-7">
	    						<input type="text" name="city" id="city" value=""  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
				
				<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">state</label>
							<div class="col-sm-7">
	    						<input type="text" name="state" id="state" value=""  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
				
				<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">zip</label>
							<div class="col-sm-7">
	    						<input type="text" name="zip" id="zip" value=""  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
				
				<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">country</label>
							<div class="col-sm-7">
	    						<input type="text" name="country" id="country" value=""  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
				
				<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">phone</label>
							<div class="col-sm-7">
	    						<input type="text" name="phone" id="phone" value=""  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
				
				<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">designation</label>
							<div class="col-sm-7">
	    						<input type="text" name="designation" id="designation" value=""  required="required"/>
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

