<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

 
<script type="text/javascript">

 function emailValidateUpdate() 
 {
 	 var mail = $("#email").val();
      if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail))
      {
        return (true)
      }
      alert("You have entered an invalid email address!")
      $("#email").val("");
      return (false)
 }

 function emailValidateRegistration() 
 {
 	 var mail = $("#eemail").val();
      if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail))
      {
        return (true)
      }
      alert("You have entered an invalid email address!")
      $("#eemail").val("");
      return (false)
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
      $("#phone").val("");
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
      $("#pphone").val("");
      return false;
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

 
 function password_length_update()
{  	
   var userInput = $("#password").val().length;  
   if(userInput >= 6 )
      {  	
        return true;  	
      }
   else
      {  	
	    alert("Please input atleast " +6+ " characters");  		
        return false;  	
      }  
}

function password_length_registration()
{  	
   var userInput = $("#ppassword").val().length;  
   //alert(userInput);
   if(userInput >= 6 )
      {  	
        return true;  	
      }
   else
      {  	
	    alert("Please input atleast " +6+ " characters");  		
	    $("#ppassword").val("");
        return false;  	
      }  
}
</script>
<script>
 var saveKara = 0;
  
 function showAlert(saveKara){
	 return saveKara;
 }
  
 function showBtn(){

	 if(saveKara == 0){
		 alert("Please select Atleast one employee for delete");
	 }
	 else{
		/*  bootbox.confirm("Are you sure?", function(result) {
			  Example.show("Confirm result: "+result);
			}); 
		 */
		 var result = confirm("want to delete?");
		 if(result){
			 window.location.href = "deleteSchoolList?list="+saveKara;	 
		 }
		 	 
	 }
	 
 }
</script>

<script type="text/javascript">

/*This code used for hide button on page load and show when check box is chechked
$(document).ready(function() {
    
    var $submit = $("#btn").hide(),
        $cbs = $('input[name="myTextEditBox"]').click(function() {
            $submit.toggle( $cbs.is(":checked") );
        });

}); */





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
    var d10 = data[10];
    var d11 = data[11];
    var d12 = data[12];
    var d13 = data[13];
    var d14 = data[14];
    var d15 = data[15];
    var d16 = data[16];
    var d17 = data[17];
    var d18 = data[18];
    var d19 = data[19];
    
    $(".modal-body #id").val( d );
    $(".modal-body #userName").val( d1 );
    $(".modal-body #password").val( d2 );
    $(".modal-body #firstName").val( d3 );
    $(".modal-body #lastName").val( d4 );
    $(".modal-body #birthDate").val( d5 );
    $(".modal-body #sex").val( d6 );
    $(".modal-body #maritalStatus").val( d7 );
    $(".modal-body #email").val( d8 );
    $(".modal-body #address").val( d9 );
    $(".modal-body #city").val( d10 );
    $(".modal-body #state").val( d11 );
    $(".modal-body #zip").val( d12 );
    $(".modal-body #country").val( d13 );
    $(".modal-body #phone").val( d14 );
    $(".modal-body #designation").val( d15 );
    $(".modal-body #userRole").val( d16 );
    $(".modal-body #rId").val( d17 );
    $(".modal-body #supervisor").val( d18 );
    $(".modal-body #sId").val( d19 );
  
});

$(document).ready(function() {

jQuery("#birthDate").datepicker({ dateFormat: 'yy-mm-dd'});
jQuery("#bbirthDate").datepicker({ dateFormat: 'yy-mm-dd'});
    $('#example').DataTable();
} );

function setDateFormat(manu){
	 menu = menu.substring(0,menu.length -11);
	 return menu;
}

function edit(id){
	var id = id;
	window.location.href = "editEmployee?id="+id;
	}
	
function deletel(id){
	var id = id;
	window.location.href = "deleteEmployee?id="+id;
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
var saveKara = 0;
function malaDeleteKara(id){
	if(saveKara == 0){
		saveKara = id + ",";
	}
	else{
		saveKara = saveKara + id + ",";	
	}
	showAlert(saveKara);
}

function removeString(ch){
	ch = ch + ",";
	saveKara = saveKara.replace(ch,'');
	showAlert(saveKara);
}

console.log(saveKara);


</script>

<script type="text/javascript">



//called when user clicks login
function sendDataForUpdation(){
	var id = $("#id").val(); 
	
	 var userName = $("#userName").val();
	 var password = $("#password").val();
	 var firstName = $("#firstName").val();
	 var lastName = $("#lastName").val();
	 var birthDate = $("#birthDate").val();
	 var sex = $("#sex").val();
	 var maritalStatus = $("#maritalStatus").val();
	 var email = $("#email").val();
	 var address = $("#address").val();
	 var city = $("#city").val();
	 var state = $("#state").val();
	 var zip = $("#zip").val();
	 var country = $("#country").val();
	 var phone = $("#phone").val();
	 var designation = $("#designation").val();
	 var userRole = $("#userRole").val();
	 var rId = $("#rId").val();
	 var supervisor = $("#supervisor").val();
	 var sId = $("#sId").val();
	 if(id == null || id == "" || userName == null || userName == "" || password == null || password == "" || firstName == null || firstName == "" || lastName == null || lastName == "" || birthDate == null || birthDate == "" || sex == null || sex == "" || maritalStatus == null || maritalStatus == "" || email == null || email == "" || address == null || address == "" || city == null || city == "" || state == null || state == "" || zip == null || zip == "" || country == null || country == "" || phone == null || phone == "" || designation == null || designation == "" || userRole == null || userRole == ""){
			alert("some fields are empty");
		}else{
	 
	 var allData = id+","+userName+","+password+","+firstName+","+lastName+","+birthDate+","+sex+","+maritalStatus+","+email+","+address+","+city+","+state+","+zip+","+country+","+phone+","+designation+","+userRole+","+rId+","+supervisor+","+sId;
	 var formData = "accessList="+allData;
	 $.ajax({
		    type : "POST",
		    url : "${pageContext.request.contextPath}/admin/updateEmployee",
		    data : formData,
		    success : function(response) {	       
		       alert("Employee Profile Updated");
		    },
		    error : function(e) {
		       alert('Error: ' + e);
		    }
		});
	}
}


function sendDataForRegistration(){
	 var name=$("#schoolName").val();
	 var address=$("#address").val();
	 var details=$("#details").val();
	 var location=$("#location").val();
	 var city=$("#city1").val();
	 var allData = name+","+address+","+details+","+location+","+city;
	 
	 var formData = "accessList="+allData;
	 
	 $.ajax({
		    type : "POST",
		    url : "${pageContext.request.contextPath}/admin/addSchool",
		    data : formData,
		    success : function(response) {	       
		
		       alert("School Added"+response);
		    },
		    error : function(e) {
		       alert('Error: ' + e);
		    }
		});
	}




$('.dropdown-menu a').on('click', function(){    
    $('.dropdown-toggle').html($(this).html() + '<span class="caret"></span>');    
});



function checkUsernameUpdate(){

	 var userName = $("#userName").val(); 
    $.ajax({url: "checkUserName?userName="+userName, 
    	dataType: "text",
    	
    	success: function(result){
        
        	if(result == "true"){
        		alert("This username "+ userName + " is not allowed.")
        		$("#userName").val("");
        		
        	}
        	else{
        		$("#err").text("");
        	}
    			
    }});
// }); 
}

function checkUsernameRegister(){

		 var userName = $("#uuserName").val(); 
	    $.ajax({url: "checkUserName?userName="+userName, 
	    	dataType: "text",
	    	
	    	success: function(result){
	        
	        	if(result == "true"){
	        		alert("This username "+ userName + " is not allowed.")
	        		$("#uuserName").val("");
	        	}
	        	else{
	        		$("#err").text("");
	        	}
	    			
	    }});
	}



</script>

<div class="form-horizontal">
    <div class="row">
        <div class="col-lg-12">
            <div class="fixed-page-header">
                <div class="page-header clearfix">
                    <h1 class="page-head-text pull-left">Schools</h1>
                    
                    <button type="submit" class="btn btn-inverse btn-sm pull-right" data-toggle="modal" data-target="#schoolAdd"><i class="fa fa-plus-circle"></i>  Add School</button>                    
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
                        <span class="panel-head">Schools List</span>
                    </div>                                        
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table id="example" class="table table-bordered table-striped table-hover">
                          <thead>
                            <tr>
                            	<th width="3%" class="text-center no-sort"><input type="checkbox"></th>
                                <th width="20%">School Name</th>
                                <th width="25%">Address</th>
                                <th width="22%">Details</th>
                                <th width="15%">City</th>
                                <th width="15%">Location</th>                                
                            </tr>
                          </thead>
                          <tbody>
                          	<c:forEach var="school" items="${schoolList}">
                                <tr>
                                  	<td class="text-center"><input type="checkbox" id="${school.id}"  name="myTextEditBox" value="" onClick="displayNote(event)"/></td>
                                    <td>${school.schoolName}</td>
                                    <td>${school.address}</td>
                                    <td>${school.details}</td>
                                    <td>${school.location}</td>
                                    <td>${school.city}</td>
                                 </tr>
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

<div class="modal fade" id="schoolAdd" tabindex="-1" role="dialog" aria-labelledby="delete-domain" aria-hidden="true">
    <div class="modal-dialog">
    	<!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">School Details</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" > 
                    <div class="form-group">
                        <label class="col-sm-3 control-label">School Name</label>
                        <div class="col-sm-8">
                       		<input type="text" name="schoolName" id="schoolName" value="" class="form-control" >
                       	</div>
                    </div>
                  	<div class="form-group">
                        <label class="col-sm-3 control-label">Address</label>
                        <div class="col-sm-8">
                            <input type="text" name="address" id="address" value="" class="form-control" >
                      	</div>
                   	</div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Details</label>
                        <div class="col-sm-8">
                            <input type="text" name="details" id="details" value="" class="form-control" >
                      	</div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Location</label>
                        <div class="col-sm-8">
                            <input type="text" name="location" id="location" value="" class="form-control">
                     	</div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">City</label>
                     	<div class="col-sm-8">
                            <input type="text" name="city" id="city1" value="" class="form-control" >
                      	</div>
                    </div>
                                            
                  	<!--<div class="form-group">
                    	<label class="col-sm-3 control-label">Sex</label>
                      	<div class="col-sm-8">
                            <input type="text" name="ssex" id="ssex" value="" class="form-control" >
                       	</div>
                 	</div>-->
                </form>
            </div>
            <div class="modal-footer text-center">
            	<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>
            	<button type="submit" class="btn btn-sky btn-sm" onClick="sendDataForRegistration()">Save</button>
            </div>
        </div>
	</div>
</div>


	