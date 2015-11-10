<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
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
<!-- <link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">

<script type="text/javascript">
  $(function() {
    $( "#holidayDate" ).datepicker({ dateFormat: 'yy-mm-dd' });
</script> -->
<div class="reg_form">﻿
 <header>Holiday Creation</header>
<div id="formId">
<form:form action="${pageContext.request.contextPath}/admin/addHoliday" method="post" data-toggle="validator" role="form"  id="sky-form" class="sky-form" modelAttribute="holidayForm">
  <div class="form-group">
    <form:input path="holidayTitle" class="form-control" id="holidayTitle" placeholder="Holiday Title" required="required" onkeypress="return AllowAlphabet(event)"/>
     <div class="help-block with-errors"></div>
     <span id="err"> </span>
  </div>
   <div class="form-group">
     <form:input  path="holidayDate"  class="form-control" id="holidayDate" placeholder="holidayDate"  required="required" />
  </div>
  <div class="form-group">
    <form:input path="holidayDescription" class="form-control" id="holidayDescription" placeholder="holidayDescription" required="required" />
      <div class="help-block with-errors"></div>
  </div>
  <div class="form-group">
    <input type="submit" class="btn btn-primary" value="Register">
  </div>
  
</form:form>
</div>
</div>


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





