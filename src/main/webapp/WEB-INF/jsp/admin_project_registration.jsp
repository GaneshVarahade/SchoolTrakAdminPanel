<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<meta charset="utf-8">
  
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#projectStartDate" ).datepicker({dateFormat: 'yy-mm-dd'});
  });
  $(function() {
	    $( "#projectEndDate" ).datepicker({dateFormat: 'yy-mm-dd'});
	  });
  </script>
</head>
<div class="reg_form">﻿
 <header>Add New Project</header>
<div id="formId">
<form  action="${pageContext.request.contextPath}/admin/addProject" method="post" data-toggle="validator" role="form"  id="sky-form" class="sky-form" >
	<div class="form-group">
		<div class="panel-body">
        	<div class="row">
				<div class="col-lg-10 col-md-9 col-sm-8">
					<div class="row">
						
						<div class="col-md-6">
	            			<div class="form-group">
								<label class="col-sm-5 control-label">projectId</label>
									<div class="col-sm-7">
	    								<input type="text" id="projectId" name="projectId" value=""   required="required"/>
	     									<div class="help-block with-errors"></div>
	     									<span id="err"> </span>
	     							</div>
	     					</div>
	  					</div>
					
					
						<div class="col-md-6">
            				<div class="form-group">
								<label class="col-sm-5 control-label">projectName</label>
									<div class="col-sm-7">
    									<input type="text" name="projectName" id="projectName" value=""   required="required"/>
     										<div class="help-block with-errors"></div>
     										<span id="err"> </span>
     								</div>
     						</div>
  						</div>
  					</div>
  				</div>
		
				<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">projectDescription</label>
							<div class="col-sm-7">
	    						<input type="text" name="projectDescription" id="projectDescription" value=""   required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
	  			
	  			<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">projectTechnology</label>
							<div class="col-sm-7">
	    						<input type="text"  name="projectTechnology" id="projectTechnology" value=""  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
	  		
				<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">projectStartDate</label>
							<div class="col-sm-7">
	    						<input type="text" name="projectStartDate" id="projectStartDate" value=""  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>	  		
	  		
	  			<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">projectEndDate</label>
							<div class="col-sm-7">
	    						<input type="text" name="projectEndDate" id="projectEndDate" value=""  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
	  			
	  			<div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">projectStatus</label>
							<div class="col-sm-7">
	    						<input type="text" name="projectStatus" id="projectStatus" value=""  required="required"/>
	     							<div class="dropdown">
	     							<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">Status
	     							    <span class="caret"></span></button>
	     							    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
	     							    	<select onchange="selectStatus()">	 
	     							    	  <li role="presentation"><a role="menuitem" tabindex="-1" href="#">running</a></li>
										      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">hold</a></li>
										      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">end</a></li>
										 	 </select>    
		   							    </ul>
	     							</div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
	  			
	  			 <div class="col-md-6">
	            	<div class="form-group">
						<label class="col-sm-5 control-label">clientId</label>
							<div class="col-sm-7">
	    						<input type="text" name="clientId" id="clientId" value=""  required="required"/>
	     							<div class="help-block with-errors"></div>
	     							<span id="err"> </span>
	     					</div>
	     			</div>
	  			</div>
				
				<div class="form-group">
						<!-- <label class="col-sm-5 control-label">Last Name</label> -->
							<div class="col-sm-7">
	    					
	     						<input type="submit" class="btn btn-primary" value="Submit">
	     					</div>
	     			</div>
	  			  		
	  		</div>
	  	</div>
	</div>
</form>
</div>
</div>

