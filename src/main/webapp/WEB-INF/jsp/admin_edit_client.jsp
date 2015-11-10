<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
</head>

<div class="reg_form">﻿
 <header>Update Client</header>
<div id="formId">
<form  action="${pageContext.request.contextPath}/admin/updateClient" method="post" data-toggle="validator" role="form"  id="sky-form" class="sky-form" >
	<div class="form-group">
		<div class="panel-body">
        	<div class="row">
				<div class="col-lg-10 col-md-9 col-sm-8">
					<div class="row">
						
						<div class="col-md-6">
	            			<div class="form-group">
								<label class="col-sm-5 control-label">ID</label>
									<div class="col-sm-7">
	    								<input type="text" id="id" name="id" value="${client.clientId}"   required="required"/>
	     									<div class="help-block with-errors"></div>
	     									<span id="err"> </span>
	     							</div>
	     					</div>
	  					</div>
					
					
						<div class="col-md-6">
            				<div class="form-group">
								<label class="col-sm-5 control-label">Client Name</label>
									<div class="col-sm-7">
    									<input type="text" name="clientName" id="clientName" value="${client.clientName}"   required="required"/>
     										<div class="help-block with-errors"></div>
     										<span id="err"> </span>
     								</div>
     						</div>
  						</div>
  					</div>
  				</div>
		
				<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">Email Id</label>
							<div class="col-sm-7">
	    						<input type="text" name="clientEmail" id="clientEmail" value="${client.clientEmail}"   required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
	  			
	  			<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">Mobile</label>
							<div class="col-sm-7">
	    						<input type="text"  name="clientMobile" id="clientMobile" value="${client.clientMobile}"  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
	  		
				<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">Address</label>
							<div class="col-sm-7">
	    						<input type="text" name="clientAddress" id="clientAddress" value="${client.clientAddress}"  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>	  		
	  		
	  			<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">Country</label>
							<div class="col-sm-7">
	    						<input type="text" name="clientCountry" id="clientCountry" value="${client.clientCountry}"  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
	  			
	  			<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">TimeZone</label>
							<div class="col-sm-7">
	    						<input type="text" name="clientTimeZone" id="clientTimeZone" value="${client.clientTimeZone}"  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
	  			
	  			 <div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">SkypeId</label>
							<div class="col-sm-7">
	    						<input type="text" name="skypeId" id="skypeId" value="${client.skypeId}"  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
				
				<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">Username</label>
							<div class="col-sm-7">
	    						<input type="text" name="clientUsername" id="clientUsername" value="${client.clientUsername}"  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
				
				<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">Password</label>
							<div class="col-sm-7">
	    						<input type="text" name="clientPassword" id="clientPassword" value="${client.clientPassword}"  required="required"/>
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

 