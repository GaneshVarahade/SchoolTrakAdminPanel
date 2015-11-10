<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>


</head>
<div class="reg_form">﻿
 <header>Client form</header>
<div id="formId">
<form:form action="${pageContext.request.contextPath}/admin/addClient" method="post" data-toggle="validator" role="form"  id="sky-form" class="sky-form" commandName="clientForm">
  <div class="form-group">
    <form:input path="clientName" class="form-control" id="clientName" placeholder="Client Name" required="required"/>
     <div class="help-block with-errors"></div>
     <span id="err"> </span>
  </div>
   <div class="form-group">
     <form:input  path="clientEmail" data-minlength="6" class="form-control" id="inputClientEmail" placeholder="Client Email"  required="required" onblur = "return ValidateEmail();"/>
  </div>
  <div class="form-group">
    <form:input path="clientMobile" class="form-control" id="inputClientMobile"  placeholder="Client Mobile" required="required" onkeypress="return phoneValid(event);" />
      <div class="help-block with-errors"></div>
  </div>
  <div class="form-group">
    <form:input  path="clientAddress" class="form-control" id="inputClientAddress" placeholder="Client Address" required="required" />
     <div class="help-block with-errors"></div>
  </div>
  <div class="form-group">
    <form:input  path="clientCountry" class="form-control" id="inputClientCountry" placeholder="Client Country" required="required" />
  </div> 
  <div class="form-group">
      <form:input path="clientTimeZone" class="form-control" id="inputClientTimeZone" placeholder="Client Time Zone"  required="required" />
      <div class="help-block with-errors"></div>
  </div>
  <div class="form-group">
      <form:input path="skypeId" class="form-control" id="inputSkypeId" placeholder="Skype Id"  required="required" />
      <div class="help-block with-errors"></div>
  </div>
  <div class="form-group">
      <form:input path="clientUsername" class="form-control" id="inputClientUsername" placeholder="User name" required="required" />
      <div class="help-block with-errors"></div>
  </div>
  <div class="form-group">
      <form:password path="clientPassword" class="form-control" id="inputClientPassword" placeholder="Password" required="required" onblur="password_length()"/>
      <span class="help-block">Minimum of 6 characters</span>
      <div class="help-block with-errors"></div>
  </div>
  <div class="form-group col-sm-6">
      <form:password path="clientPasswordConfirm" class="form-control" id="inputPasswordConfirm" data-match="#inputClientPassword" data-match-error="Whoops, these don't match" placeholder="Confirm" required="required" onblur="password_match()"/>
      <div class="help-block with-errors"></div>
  </div> 
   <div class="form-group">
    <input type="submit" class="btn btn-primary" value="Register">
  </div>
</form:form>
</div>
</div>


<script type="text/javascript">
$("#inputClientUsername").blur(function(event){
	var userName = $("#inputClientUsername").val();
    $.ajax({url: "checkClientUsername?clientUserame="+userName, 
    	dataType: "text",
    	
    	success: function(result){
        
        	if(result == "true"){
        		//alert("This username "+ userName + " is not allowed.")
        		$("#inputClientUsername").text("");
        		$("#err").text("This username "+ userName + " is not allowed.");
        		
        	}
        	else{
        		$("#err").text("");
        	}
    			
    }});
});
</script>

<script >
function password_length()
{  	
   var userInput = $("#inputPassword").val().length;  
   //alert(userInput);
   if(userInput >= 6 )
      {  	
        return true;  	
      }
   else
      {  	
	    alert("Please input atleast " +6+ " characters");  		
	    $("#inputPassword").val("");
        return false;  	
      }  
}
</script>
<script>
function password_match()
{
	//alert("hi pass");
	var pass1 = $("#inputClientPassword").val();
	var pass2 = $("#inputPasswordConfirm").val();
	var userName = $("#inputClientUsername").val();
	
	if(pass1 != "" && pass1 == pass2) {
		if(pass1 == userName) {
      		alert("Error: Password must be different from Username!");
      		$("#inputClientUsername").focus();
      		$("#inputClientPassword").val("");
  	  		//form.pwd1.focus();
      		return false;
    	}
		return true;
	}
	else{
		alert("Error:Password doesn't match");
		$("#inputClientPassword").focus();
		$("#inputClientPassword").val("");
		return false;
	}
    	
}
</script>
<script>
function AllowAlphabet(e)
{
  isIE = document.all ? 1 : 0
  keyEntry = !isIE ? e.which : event.keyCode;
  if (((keyEntry >= '65') && (keyEntry <= '90')) || ((keyEntry >= '97') && (keyEntry <= '122')) || (keyEntry == '46') || (keyEntry == '32') || keyEntry == '45' || keyEntry == '9' || keyEntry == '13' || keyEntry == '20' || keyEntry == '13' || keyEntry == '37' || keyEntry == '38' || keyEntry == '39' || keyEntry == '40' || keyEntry == '46' || keyEntry == '8')
     return true;
  else
	{
    	alert('Please Enter Only Character values.');
    	return false;
    }
}
</script>
<script type="text/javascript">
        var specialKeys = new Array();
        specialKeys.push(8); //Backspace
        specialKeys.push(107);
        specialKeys.push(13);
        function phoneValid(e) {
            var keyCode = e.which ? e.which : e.keyCode
            var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
            document.getElementById("phoneError").style.display = ret ? "none" : "inline";
            return ret;
        }
 </script>

 <script>
 function ValidateEmail() 
{
	 var mail = $("#inputClientEmail").val();
     if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail))
     {
       return (true)
     }
     alert("You have entered an invalid email address!")
     $("#inputEmail").val("");
     return (false)
}
 
 </script>




