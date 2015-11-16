<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Parent List</title>

 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
 
  <script src="https://cdn.datatables.net/1.10.8/css/dataTables.bootstrap.min.css"></script>
  <script src="https://cdn.datatables.net/1.10.8/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.8/js/dataTables.bootstrap.min.js"></script>





<script>
var saveKara = 0;

function showBtn(){

	 if(saveKara == 0){
		 alert("Please select Atleast one client for delete");
	 }
	 else{
		
		 var result = confirm("want to delete?");
		 if(result){
			 window.location.href = "deleteParentList?list="+saveKara;	 
		 }
		 	 
	 }
	 
}

 $(function(){
	    $('#browse_app').click(function(){
	        window.location='addClient';
	    });
	});
 
 


 
</script>
<script type="text/javascript">

$(document).ready(function() {
      $('#example').DataTable({
    	  "paging":   false
      }
    		  
      ); 
} );


function deletel(id){
	
	var id = id;
	window.location.href = "deleteClient?id="+id;
}	

function sendDataForUpdation(){
	
	
	 var clientId = $("#clientId").val();
	 var clientUsername = $("#clientUsername").val();
	 var clientPassword = $("#clientPassword").val();
	 var clientName = $("#clientName").val();
	 var clientEmail = $("#clientEmail").val();
	 var clientMobile = $("#clientMobile").val();
	 var clientAddress = $("#clientAddress").val();
	 var clientCountry = $("#clientCountry").val();
	 var clientTimeZone = $("#clientTimeZone").val();
	 var skypeId = $("#skypeId").val();
	 
	 if(clientId == null || clientId == "" || clientUsername == null || clientUsername == "" || clientPassword == null || clientPassword == "" || clientName == null || clientName == "" || clientEmail == null || clientEmail == "" || clientMobile == null || clientMobile == "" || clientAddress == null || clientAddress == "" || clientCountry == null || clientCountry == "" || clientTimeZone == null || clientTimeZone == "" || skypeId == null || skypeId == "" ){
			alert("some fields are empty");
		}
	 else{
	 var allData = clientId+","+clientUsername+","+clientPassword+","+clientName+","+clientEmail+","+clientMobile+","+clientAddress+","+clientCountry+","+clientTimeZone+","+skypeId;
	 
	 var formData = "accessList="+allData;
	 $.ajax({
		    type : "POST",
		    url : "${pageContext.request.contextPath}/admin/updateClient",
		    data : formData,
		    success : function(response) {	       
		       alert("Client Profile Updated");
		    },
		    error : function(e) {
		       alert('Error: ' + e);
		    }
		});
	}
}

function sendDataForRegistration(){

	 
	 var name=$("#aName").val();
	 var address=$("#aAddress").val();
	 var email=$("#aEmail").val();
	 var password=$("#aPassword").val();
	 var age=$("#aAge").val();
	 var city=$("#aCity").val();
	var school=$("#schoolId").val();
	var username=$("#username").val();
	var accountType=$("#accountType").val();

	 var allData = name+","+address+","+email+","+password+","+age+","+city+","+school+","+username+","+accountType;

	 
	 var formData = "accessList="+allData;
	 $.ajax({
		    type : "POST",
		    url : "${pageContext.request.contextPath}/admin/addSchoolAdmin",
		    data : formData,
		    success : function(response) {	       
		       alert("Parent Added");
		    },
		    error : function(e) {
		       alert('Error: ' + e);
		    }
		});
	}


function malaDeleteKara(id){
	if(saveKara == 0){
		saveKara = id + ",";
	//	alert(saveKara);
	}
	else{
		saveKara = saveKara + id + ",";	
	//	alert(saveKara);
	}
	//showAlert(saveKara);
}

function removeString(ch){
	ch = ch + ",";
	saveKara = saveKara.replace(ch,'');
//	alert(saveKara);
//	showAlert(saveKara);
}

function displayNote(evt){
	
	var el = evt.target || evt.srcElement;

	  if (el && el.type == 'checkbox' && el.checked == true) {
	   
	   	    malaDeleteKara(el.id);
	  }
	  else if(el && el.type == 'checkbox' && el.checked == false){
		  removeString(el.id);
	  }
	 
}

function AllowAlphabet(e)
{
  isIE = document.all ? 1 : 0
  keyEntry = !isIE ? e.which : event.keyCode;
  if (((keyEntry >= '65') && (keyEntry <= '90')) || ((keyEntry >= '97') && (keyEntry <= '122')) || (keyEntry == '46') || (keyEntry == '32') || keyEntry == '45' || keyEntry == '9' || keyEntry == '13' || keyEntry == '20' || keyEntry == '13' || keyEntry == '37' || keyEntry == '38' || keyEntry == '39' || keyEntry == '40' || keyEntry == '46' || keyEntry == '8'|| keyEntry == '11' || keyEntry == '9')
     return true;
  else
	{
    	alert('Please Enter Only Character values.');
    	//$("#password").val("");	
    	return false;
    }
}

function AllowNumber(e)
{
  isIE = document.all ? 1 : 0
  keyEntry = !isIE ? e.which : event.keyCode;
  if (((keyEntry >= '48') && (keyEntry <= '57')) || ((keyEntry >= '96') && (keyEntry <= '105')) || (keyEntry == '46') || (keyEntry == '37') || keyEntry == '39' || keyEntry == '9' || keyEntry == '8'  || keyEntry == '13' || keyEntry == '38' || keyEntry == '39' || keyEntry == '40' || keyEntry == '46' )
     return true;
  else
	{
    	alert('Please Enter Only numbers .');
    	return false;
    }
}

function phoneValidUpdate(inputtxt)
{
  var phoneno = /^\d{10}$/;
  if(inputtxt.value.match(phoneno))
  {
      return true;
  }
  else
  {
     alert("Not a valid Phone Number");
     $("#clientPhone").val("");
     return false;
  }
}

function phoneValidRegistration(inputtxt)
{
  var phoneno = /^\d{10}$/;
  if(inputtxt.value.match(phoneno))
  {
      return true;
  }
  else
  {
     alert("Not a valid Phone Number");
     $("#cclientPhone").val("");
     return false;
  }
}

function emailValidateUpdate() 
{
	 var mail = $("#clientEmail").val();
     if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail))
     {
       return (true)
     }
     alert("You have entered an invalid email address!")
     $("#clientEmail").val("");
     return (false)
}

function emailValidateRegistration() 
{
	 var mail = $("#cclientEmail").val();
     if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail))
     {
       return (true)
     }
     alert("You have entered an invalid email address!")
     $("#cclientEmail").val("");
     return (false)
}


function password_length_update()
{  	
  var userInput = $("#clientPassword").val().length;
  //alert(userInput);
  if(userInput >= 6 )
     {  	
       return true;  	
     }
  else
     {  	
	    alert("Please input atleast " +6+ " characters");  	
	    $("#clientPassword").val("");
       return false;  	
     }  
}

function password_length_registration()
{  	
  var userInput = $("#cclientPassword").val().length;  
  //alert(userInput);
  if(userInput >= 6 )
     {  	
       return true;  	
     }
  else
     {  	
	    alert("Please input atleast " +6+ " characters");  		
	    $("#cclientPassword").val("");
       return false;  	
     }  
}

</script>
<style>.button{
    border-left-width: 0px;
    width: 108px;
    height: 27px;
    padding-left: 0px;
    margin-left: 0px;
    background-color : #F5BE0A;
}
</style>
</head>
<body >
<button id="btn"  class="button" type="submit" onClick="showBtn()" >Delete</button>&nbsp;
<button  class="button" data-toggle="modal"  data-id=""  data-target="#forClientRegistration">Add Parent</button>
<hr style="border-top-width: 0px;">
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
            <tr>
            	<th></th>
                <th>Name</th>
                <th>School Name</th>
                <th>Address</th>
                <th>Email</th>
                <th>Age</th>
                <th>City</th>
                
               
            </tr>
        </thead>
 
        <tfoot>
            <tr>
            	<th></th>
                <th>Name</th>
                <th>School Name</th>
                <th>Address</th>
                <th>Email</th>
                <th>Age</th>
                <th>City</th>
                
               
            </tr>
        </tfoot>
 
        <tbody>
        <c:forEach var="schoolAdmin" items="${schoolAdminList}">
            <tr>
  				<c:if test= "${schoolAdmin.accountType eq 'Parent'}">
  
  					<td>
          				  <input type="checkbox" id="${schoolAdmin.id}"  name="myTextEditBox" value="" onClick="displayNote(event)"/>
          			</td>
	                <td>${schoolAdmin.name}</td>
	                <td>${schoolAdmin.school.schoolName}</td>
	                <td>${schoolAdmin.address}</td>
	                <td>${schoolAdmin.email}</td>
	                <td>${schoolAdmin.age}</td>
	                <td>${schoolAdmin.city}</td>
	               </c:if> 
	                     </tr>
	               
         </c:forEach>
         </tbody>
</table>
	              
       
	 <div class="container">  
				  		<div class="modal fade" id="forClientRegistration" role="dialog">
				    		<div class="modal-dialog">
				    
				      		<!-- Modal content-->
				      			<div class="modal-content">
				        			<div class="modal-header">
				          				<button type="button" class="close" data-dismiss="modal">&times;</button>
				          					<h4 class="modal-title">Parent Details</h4>
				        			</div>
				        			<div class="modal-body">
				       		 			<form id="registerForm"  class="form-horizontal" role="form" name="registerForm">
				       		  				<div class="form-group">
											<div class="container-fluid">
											<section class="container">
											<div class="container-page">
											<div class="col-md-6">
												<h3 class="dark-grey">School Admin Registration</h3>
				       		  				
				       		  					
				       		  					
												<div>
													<label>User Name</label>
													<input type="text" name="username" id="username" value="" class="form-control">
												</div>
												
												<div >
													<label>Account Type</label>
													<select name="accountType" id="accountType" class="form-control" >
													
													<option value="Parent">Parent</option>
													
													</select>
												</div>
												
												<div >
													<label>Admin Name</label>
													<input type="text" name="name" id="aName" value="" class="form-control">
												</div>
												
												<div>
													<label>Admin Password</label>
													<input type="text" name="password" id="aPassword" value="" class="form-control" ">
												</div>
												
												<div>
													<label>School Name</label>
												<select name="schoolName" id="schoolId" class="form-control" >
  													
  													<c:forEach var="school" items="${schoolList}">
  															<option value="${school.schoolName}">${school.schoolName}</option>
												</c:forEach>
												</select>
												
												<div>
													<label>Address</label>
													<input type="text" name="address" id="aAddress" value="" class="form-control" >
												</div>
												
												<div>
													<label>Email</label>
													<input type="text" name="email" id="aEmail" value="" class="form-control" >
												</div>
												
												<div>
													<label>Age</label>
													<input type="text" name="age" id="aAge" value="" class="form-control" >
												</div>
												
												<div>
													<label>City</label>
													<input type="text" name="city" id="aCity" value="" class="form-control">
												</div>
												
											
				       					</div>
				       					</div>
				       					</section>
				       					</div>
				       					</div>
				       					</form>
				        			</div>
				        			<div class="modal-footer">
				          				<button type="submit" class="button" onclick="sendDataForRegistration();" data-dismiss="modal">Submit</button>
				        			</div>
				      			</div>
				    	</div>
				  </div>
				 
			</div>


