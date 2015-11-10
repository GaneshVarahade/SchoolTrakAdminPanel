<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
</head>
<div class="reg_form">﻿
 <header>Add Employee Project</header>

<script type="text/javascript">
function empSelect(){
	 $.ajax({
		    type : "POST",
		    url : "${pageContext.request.contextPath}/admin/empSelect",
		   // data : formData,
		   contentType: "application/json",
		   dataType: "text",
		    success : function(response) {	       
		       
		    	console.log(response);
		    	var menuList = response.split(';');
		    	var newDD = $("<select id='empSelectId' onchange="+"ChooseContact("+'this'+");"+"/>"); 
		    	for (var i = 0; i < menuList.length; i++) {
		    	
		    		$(newDD).append("<option>"+menuList[i]+"</option>");	
		    	
				}
		    	$("#empId").append(newDD);

		    	
		    },
		    error : function(e) {		    	
		       alert('Error: ' + e);
		    }
		}); 	
}

 function ChooseContact(data)
 {
    
    //alert($("#empSelectId option:selected" ).text());
    var divide = $("#empSelectId option:selected" ).text();
    var seperate = divide.split(",");
    $("#employeeId").val(seperate[0]);
    //alert(seperate[0]);
    $("#empName").val(seperate[1]);
 }
  
 function projectSelect(){
	 $.ajax({
		    type : "POST",
		    url : "${pageContext.request.contextPath}/admin/projectSelect",
		   // data : formData,
		   contentType: "application/json",
		   dataType: "text",
		    success : function(response) {	       
		    	var menuList = response.split(';');
		    	var newDD = $("<select id='projectSelectId' onchange="+"ChooseProject("+'this'+");"+"/>"); 
		    	for (var i = 0; i < menuList.length; i++) {
		    		$(newDD).append("<option>"+menuList[i]+"</option>");	
				}
		    	$("#projectId").append(newDD);		    	
		    },
		    error : function(e) {
		    	
		       alert('Error: ' + e);
		    }
		}); 	
}
 function ChooseProject(data)
 {
    //alert($("#projectSelectId option:selected" ).text());
    var divide  = $("#projectSelectId option:selected" ).text();
    var seperate = divide.split(",");
    $("#projectIDD").val(seperate[0]);
    $("#projectName").val(seperate[1]);
    //$("#projectName").val($("#projectSelectId option:selected" ).text());
 }

 
 
</script>
<div id="formId">
<form  action="${pageContext.request.contextPath}/admin/addEmployeeProject" method="post" data-toggle="validator" role="form"  id="sky-form" class="sky-form" >
	<div class="form-group">
		<div class="panel-body">
        	<div class="row">
				<div class="col-lg-10 col-md-9 col-sm-8">
					<div class="row">
						
						<div class="col-md-6">
	            			<div class="form-group">
								<label class="col-sm-5 control-label">Employee Name</label>
									<div class="col-sm-7">
	    								<input type="text" id="empName" name="empName" value=""   required="required" onclick="return empSelect();"/>
	     									<div id="empId"></div>
	     									<div class="help-block with-errors"></div>
	     									<span id="err"> </span>
	     							</div>
	     					</div>
	  					</div>
					
					
						<div class="col-md-6">
            				<div class="form-group">
								<label class="col-sm-5 control-label">Employee ID</label>
									<div class="col-sm-7">
    									<input type="text" name="employeeId" id="employeeId" value=""   required="required"  readonly/>
     										<!-- <div id="projectId"></div> -->
     										<div class="help-block with-errors"></div>
     										<span id="err"> </span>
     								</div>
     						</div>
  						</div>
  						
					
						<div class="col-md-6">
            				<div class="form-group">
								<label class="col-sm-5 control-label">Project Name</label>
									<div class="col-sm-7">
    									<input type="text" name="projectName" id="projectName" value=""   required="required" onclick="return projectSelect();"/>
     										<div id="projectId"></div>
     										<div class="help-block with-errors"></div>
     										<span id="err"> </span>
     								</div>
     						</div>
  						</div>
  						
  						<div class="col-md-6">
            				<div class="form-group">
								<label class="col-sm-5 control-label">Project ID</label>
									<div class="col-sm-7">
    									<input type="text" name="projectIDD" id="projectIDD" value=""   required="required" readonly />
     										<!-- <div id="projectId"></div> -->
     										<div class="help-block with-errors"></div>
     										<span id="err"> </span>
     								</div>
     						</div>
  						</div>
  						
  						
  					</div>
  				</div>
		
				
				<div class="form-group">
						
							<div class="col-sm-7">
	    						
	     							<div class="help-block with-errors"></div>
	     						
	     						<input type="submit" class="btn btn-primary" value="Register">
	     					</div>
	     			</div>
	  			  		
	  		</div>
	  	</div>
	</div>
</form>
</div>
</div>

