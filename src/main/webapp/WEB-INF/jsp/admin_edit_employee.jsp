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
    $( "#inputBirthDate" ).datepicker({dateFormat: 'yy-mm-dd'});
  });
  </script>
</head>
<div class="reg_form">﻿
 <header>Update Employee</header>
<div id="formId">
<form  action="${pageContext.request.contextPath}/admin/updateEmployee" method="post" data-toggle="validator" role="form"  id="sky-form" class="sky-form" >
	<div class="form-group">
		<div class="panel-body">
        	<div class="row">
				<div class="col-lg-10 col-md-9 col-sm-8">
					<div class="row">
						
						<div class="col-md-6">
	            			<div class="form-group">
								<label class="col-sm-5 control-label">ID</label>
									<div class="col-sm-7">
	    								<input type="text" id="id" name="id" value="${employee.id}"   required="required"/>
	     									<div class="help-block with-errors"></div>
	     									<span id="err"> </span>
	     							</div>
	     					</div>
	  					</div>
					
					
						<div class="col-md-6">
            				<div class="form-group">
								<label class="col-sm-5 control-label">User Name</label>
									<div class="col-sm-7">
    									<input type="text" name="userName" id="userName" value="${employee.userName}"   required="required"/>
     										<div class="help-block with-errors"></div>
     										<span id="err"> </span>
     								</div>
     						</div>
  						</div>
  					</div>
  				</div>
		
				<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">Password</label>
							<div class="col-sm-7">
	    						<input type="text" name="password" id="password" value="${employee.password}"   required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
	  			
	  			<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">First Name</label>
							<div class="col-sm-7">
	    						<input type="text"  name="inputFirstName" id="inputFirstName" value="${employee.firstName}"  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
	  		
				<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">Last Name</label>
							<div class="col-sm-7">
	    						<input type="text" name="inputLastName" id="inputLastName" value="${employee.lastName}"  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>	  		
	  		
	  			<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">BirthDate</label>
							<div class="col-sm-7">
	    						<input type="text" name="inputBirthDate" id="inputBirthDate" value="${employee.birthDate}"  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
	  			
	  			<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">Email Id</label>
							<div class="col-sm-7">
	    						<input type="text" name="inputEmailId" id="inputEmailId" value="${employee.email}"  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
	  			
	  			 <div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">Address</label>
							<div class="col-sm-7">
	    						<input type="text" name="inputAddress" id="inputAddress" value="${employee.address}"  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
				
				<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">City</label>
							<div class="col-sm-7">
	    						<input type="text" name="inputCity" id="inputCity" value="${employee.city}"  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
				
				<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">State</label>
							<div class="col-sm-7">
	    						<input type="text" name="inputState" id="inputState" value="${employee.state}"  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>	  
					 
				<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">Zip</label>
							<div class="col-sm-7">
	    						<input type="text" name="inputZip" id="inputZip" value="${employee.zip}"  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>	 
					  			
				<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">Country</label>
							<div class="col-sm-7">
	    						<input type="text" name="inputCountry" id="inputCountry" value="${employee.country}"  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>	  			
				
				<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">Phone</label>
							<div class="col-sm-7">
	    						<input type="text" name="inputPhone" id="inputPhone" value="${employee.phone}"  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
				
				<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">Designation</label>
							<div class="col-sm-7">
	    						<input type="text" name="inputDesignation" id="inputDesignation" value="${employee.designation}"  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
				 
				
                <div class="col-md-6">
                	<div class="form-group">
                    	<label class="col-sm-5 control-label">Marital Status</label>
                        	<input type="radio"  id="married" name="maritalStatus" value="${employee.maritalStatus}" /> Married
                            <input type="radio" id="unmarried" name="maritalStatus" value="${employee.maritalStatus}" /> Unmarried						
      						<div class="help-block with-errors"></div>
      				</div>		
                 </div>
                                               
				 <div class="col-md-6">
                	<div class="form-group">
                    	<label class="col-sm-5 control-label">Gender</label>
                        	<input type="radio"  id="maleSex" name="sex" value="${employee.sex}" /> Male
                            <input type="radio" id="femaleSex" name="sex" value="${employee.sex}" /> Female						
      						<div class="help-block with-errors"></div>
      				</div>		
                 </div> 		
				  			
				 <div class="col-md-6">
                	<div class="form-group">
                    	<label class="col-sm-5 control-label">User Role</label>
                        	<input type="radio"  id="userRole" name="role" value="${employee.userRole.role}" /> ROLE USER
                            <input type="radio" id="adminRole" name="role" value="${employee.userRole.role}" /> ROLE ADMIN						
      						<div class="help-block with-errors"></div>
      				</div>		
                 </div> 	
				  	
	  			<div class="col-md-6">
	            	<div class="form-group">
						<!-- <label class="col-sm-5 control-label">Last Name</label> -->
							<div class="col-sm-7">
	    						<%-- <form:input path="lastName" class="form-control" id="inputLastName" value="${employee.lastName}"  required="required"/>
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

<script>
 $(function(){
	
	 var role = '${employee.userRole.role}'; 
	 var sex = '${employee.sex}'; 
	 var maritalStatus = '${employee.maritalStatus}'; 
	 
	    if(role == "ROLE_ADMIN"){
	    	$("#adminRole").attr("checked",true);  	 
	    }else{
	    	$("#userRole").attr("checked",true);
	    }
	    
	    if(sex == "male"){
	    	
	    	 $("#maleSex").attr("checked",true);
	    	 
	    }else{
	    	 $("#femaleSex").attr("checked",true);
	    }
	    
	    if(maritalStatus == "married"){
	    	 $("#married").attr("checked",true);
	    }else{
	    	 $("#unmarried").attr("checked",true);
	    }
 });
 
</script> 