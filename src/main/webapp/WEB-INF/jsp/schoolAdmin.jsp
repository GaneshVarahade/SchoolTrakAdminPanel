<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="http://formvalidation.io/vendor/formvalidation/js/formValidation.min.js"></script>
<script src="http://formvalidation.io/vendor/formvalidation/js/framework/bootstrap.min.js"></script>

<script>


var saveKara = 0;

function showBtn(){

	 if(saveKara == 0){
		 alert("Please select Atleast one School Admin");
	 }
	 else{
		
		 var result = confirm("Are you sure, you wan to delete school(s)?");
		 if(result){
			 window.location.href = "deleteSchoolAdminList?list="+saveKara;	 
		 }
		 	 
	 }
	 
}

 $(function(){
	    $('#browse_app').click(function(){
	        window.location='addClient';
	    });
	});
 
 
 
 $(document).on("click", ".open-AddBookDialog", function () {
	    var myBookId = $(this).data('id');
	    var data = myBookId.split(",");
	    var d = data[0];
	    var d1 = data[1];
	    var d2 = data[2];
	    var d3 = data[3];
	    var d4 = data[4];
	    var d5 = data[5];
	    var d6 = data[6];
	    var d7 = data[7];
	    var d8 = data[8];
	    var d9 = data[9];
	
	    
	    
	    
	    $(".modal-body #clientId").val( d );
	    $(".modal-body #clientUsername").val( d1 );
	    $(".modal-body #clientPassword").val( d2 );
	    $(".modal-body #clientName").val( d3 );
	    $(".modal-body #clientEmail").val( d4 );
	    $(".modal-body #clientMobile").val( d5 );
	    $(".modal-body #clientAddress").val( d6 );
	    $(".modal-body #clientCountry").val( d7 );
	    $(".modal-body #clientTimeZone").val( d8 );
	    $(".modal-body #skypeId").val( d9 );
	    
	});

 
</script>
<script type="text/javascript">

$(document).ready(function() {
    $('#example').DataTable();
} );


function edit(id){
	var id = id;
	window.location.href = "editClient?id="+id;
	}
	
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

function checkUniqueUsername(){
	
	var userName= "userName="+$("#username").val();
	
	$.ajax({
	    type : "POST",
	    url : "${pageContext.request.contextPath}/admin/checkUniqueUserName",
	    data : userName,
	    success : function(response) {	
	    	
	       
	       if(response){
	    	
	       $("#username").val("");
	       }
	    
	       //window.location.href="${pageContext.request.contextPath}/admin//schoolAdmin";
	    },
	    error : function(e) {
	      /*  alert("Please Enter Mandatory FIeld and UserName Should be Unique"); */
	    }
	});
}

function sendDataForRegistration(){
	 var email=$("#aEmail").val();
	 var username=$("#username").val();
	 if(email != null && email != '' && username != null && username != ''){
	 var name=$("#aName").val();
	 var address=$("#aAddress").val();
	 var password=$("#aPassword").val();
	 var age=$("#aAge").val();
	 var city=$("#aCity").val();
	 var school=$("#schoolId").val();
	 
	 var accountType=$("#accountType").val();
	 var allData = name+","+address+","+email+","+password+","+age+","+city+","+school+","+username+","+accountType;

	 
	 var formData = "accessList="+allData;
	 $.ajax({
		    type : "POST",
		    url : "${pageContext.request.contextPath}/admin/addSchoolAdmin",
		    data : formData,
		    success : function(response) {	       
		       alert("SchoolAdmin Profile Added Successfully");
		       window.location.href="${pageContext.request.contextPath}/admin//schoolAdmin";
		    },
		    error : function(e) {
		       alert("Please Enter Mandatory FIeld and UserName Should be Unique");
		    }
		});
	}else{
		 alert("Please Enter Mandatory FIeld and UserName Should be Unique");
	}
}

function malaDeleteKara(id){
	if(saveKara == 0){
		saveKara = id + ",";
	
	}
	else{
		saveKara = saveKara + id + ",";	
	
	}
	
}

function removeString(ch){
	ch = ch + ",";
	saveKara = saveKara.replace(ch,'');
	
}

function deleteAllRow(source){  	
		
 	 checkboxes = document.getElementsByName('myTextEditBox');
 	  for(var i=0, n=checkboxes.length;i<n;i++) {
 		var id = checkboxes[i].getAttribute( 'id' );
 	    checkboxes[i].checked = source.checked;
 	    malaDeleteKara(id);
 	  }	
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
	 var mail = $("#aEmail").val();
     if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail))
     {
       return (true)
     }
     $("#aEmail").val("");
     return (false)
}


function password_length_update()
{  	
  var userInput = $("#clientPassword").val().length;
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


$(document).ready(function() {
    $('#registerForm').formValidation({
        framework: 'bootstrap',
        excluded: ':disabled',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	name: {
                validators: {
                    notEmpty: {
                        message: 'The Admin Name is required'
                    }
                }
            },
            address: {
                validators: {
                    notEmpty: {
                        message: 'The address is required'
                    }
                }
            },
            username: {
                validators: {
                    notEmpty: {
                        message: 'UserName should be Unique'
                    }
                }
            },
            
            password: {
                validators: {
                    notEmpty: {
                        message: 'Please Enter Password'
                    }
                }
            },
            
            schoolName: {
                validators: {
                    notEmpty: {
                        message: 'Please select School'
                    }
                }
            },
            
            city: {
                validators: {
                    notEmpty: {
                        message: 'The city is required'
                    }
                }
            },
            accountType: {
                validators: {
                    notEmpty: {
                        message: 'Please select Account type'
                    }
                }
            },
            
            email: {
                validators: {
                    notEmpty: {
                        message: 'Please Enter Valid Email'
                    }
                }
            },
            age: {
                validators: {
                    notEmpty: {
                    	
                    	
                        message: 'Age should be a number'
      
                    }
                }
            }
            
            
        }
    });
});


</script>


<div class="form-horizontal">
    <div class="row">
        <div class="col-lg-12">
            <div class="fixed-page-header">
                <div class="page-header clearfix">
                    <h1 class="page-head-text pull-left">School Admin </h1>
                    
                    <button type="submit" class="btn btn-inverse btn-sm pull-right" data-id=""  data-toggle="modal" data-target="#schoolAdminId"><i class="fa fa-plus-circle"></i>  Add School Admin</button>                    
                    <button type="submit" class="btn btn-brown btn-sm pull-right" onClick="showBtn()" ><i class="fa fa-trash-o"></i> Delete</button>
                </div>                                    
            </div>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
           
    <div class="row">                        
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading clearfix">
                   <div class="panel-name">
                        <span class="panel-head">School Admin List</span>
                    </div>                                        
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table id="example" class="table table-bordered table-striped table-hover">
                          <thead>
                            <tr>
                            	<th width="3%" class="text-center no-sort"><input type="checkbox" onClick="deleteAllRow(this)"></th>
                            	<th width="20%">Name</th>
                                <th width="20%">School Name</th>
                                <th width="25%">Address</th>
                                <th width="15%">Email</th>
                                <th width="10%">Age</th>
                                <th width="10%">City</th>                               
                            </tr>
                          </thead>
                          <tbody>
                          	<c:forEach var="schoolAdmin" items="${schoolAdminList}">
                                <c:if test= "${schoolAdmin.accountType eq 'SchoolAdmin'}">
                                    <tr>
                                        <td class="text-center"><input type="checkbox" id="${schoolAdmin.id}"  name="myTextEditBox" value="" onClick="displayNote(event)"/></td>
                                        <td>${schoolAdmin.name}</td>
                                        <td>${schoolAdmin.school.schoolName}</td>
                                        <td>${schoolAdmin.address}</td>
                                        <td>${schoolAdmin.email}</td>
                                        <td>${schoolAdmin.age}</td>
                                        <td>${schoolAdmin.city}</td>
                                        
                                    </tr>
                                </c:if>
                             </c:forEach>                                                                  
                          </tbody>
                        </table>
                    </div>
                </div>                                    
            </div>
        </div>
    </div>
<!-- / row -->   
</div>   
       
<div class="modal fade" id="schoolAdminId" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">School Admin Details</h4>
            </div>
            <div class="modal-body">
                <form id="registerForm"  class="form-horizontal" role="form" name="registerForm">
                
                
                <div class="form-group">
                        <label class="col-sm-3 control-label">Admin Name &#42;</label>
                        <div class="col-sm-8">
                        	<input type="text" name="name" id="aName" value="" class="form-control" maxlength="50">
                        </div>
                   	</div>
              
                  	<div class="form-group">
                        <label class="col-sm-3 control-label">Account Type &#42;</label>
                        <div class="col-sm-8">
                        	<select name="accountType" id="accountType" class="form-control" >
                            	<option value="SchoolAdmin">School Admin</option>
                            </select>
                     	</div>
                    </div>
                    
                    <div class="form-group">
                       	<label class="col-sm-3 control-label">User Name &#42;</label>
                        <div class="col-sm-8">
                            <input type="text" name="username" id="username" value="" class="form-control" maxlength="10" onblur = "checkUniqueUsername()">
                      	</div>
                    </div>
                  	
                  	<div class="form-group">
                        <label class="col-sm-3 control-label">Admin Password &#42;</label>
                        <div class="col-sm-8">
                        	<input type="text" name="password" id="aPassword" value="" class="form-control" maxlength="10">
                        </div>
                    </div>
                    
                  	<div class="form-group">
                        <label class="col-sm-3 control-label">School Name &#42;</label>
                        <div class="col-sm-8">
                        	<select name="schoolName" id="schoolId" class="form-control" >
                            	<c:forEach var="school" items="${schoolList}">
                               	<option value="${school.schoolName}">${school.schoolName}</option>
                        		</c:forEach>
                        	</select>
                       </div>
                    </div>
                    
                  	<div class="form-group">
                        <label class="col-sm-3 control-label">Address &#42;</label>
                        <div class="col-sm-8">
                            <input type="text" name="address" id="aAddress" value="" class="form-control" >
                        </div>
                    </div>
                    
                  	<div class="form-group">
                        <label class="col-sm-3 control-label">Email &#42;</label>
                        <div class="col-sm-8">
                            <input type="email" name="email" id="aEmail" value="" class="form-control" onblur="emailValidateRegistration();">
                        </div>
                   	</div>
                    
                  	<div class="form-group">
                        <label class="col-sm-3 control-label">Age &#42;</label>
                        <div class="col-sm-8">
                        	<input type="number" name="age" id="aAge" value="" class="form-control" >
                        </div>
                    </div>
                    
                  	<div class="form-group">
                        <label class="col-sm-3 control-label">City &#42;</label>
                        <div class="col-sm-8">
                        	<input type="text" name="city" id="aCity" value="" class="form-control">
                        </div>
                    </div>
                    
                   
            		<div class="modal-footer text-center">
                    <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-sky btn-sm" onClick="sendDataForRegistration();" data-dismiss="modal">Save</button>
                </div> 
                </form>               
			</div>
                   
				
       		</div>
			
		</div>
	</div>
</div>

