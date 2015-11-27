<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script src="http://formvalidation.io/vendor/formvalidation/js/formValidation.min.js"></script>
<script src="http://formvalidation.io/vendor/formvalidation/js/framework/bootstrap.min.js"></script>

<script type="text/javascript">

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
        	driverName: {
                validators: {
                    notEmpty: {
                        message: 'Driver Name Should not be Empty'
                    }
                }
            },
            
            address: {
                validators: {
                    notEmpty: {
                        message: 'Address is Required'
                    }
                }
            },
            
            city: {
                validators: {
                    notEmpty: {
                        message: 'City is Required'
                    }
                }
            },
            
            licenseNo: {
                validators: {
                    notEmpty: {
                        message: 'License Number is Required'
                    }
                }
            },
            
            
            age: {
                validators: {
                    notEmpty: {
                        message: 'Age should be number '
                    }
                }
            },
            
            experiance: {
                validators: {
                    notEmpty: {
                        message: 'Driver should have Experiance '
                    }
                }
            },
            
        }     
    });
    
    
    $('#editForm').formValidation({
        framework: 'bootstrap',
        excluded: ':disabled',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	driverName: {
                validators: {
                    notEmpty: {
                        message: 'Driver Name Should not be Empty'
                    }
                }
            },
            
            address: {
                validators: {
                    notEmpty: {
                        message: 'Address is Required'
                    }
                }
            },
            
            city: {
                validators: {
                    notEmpty: {
                        message: 'City is Required'
                    }
                }
            },
            
            license: {
                validators: {
                    notEmpty: {
                        message: 'License Number is Required'
                    }
                }
            },
            
            
            age: {
                validators: {
                    notEmpty: {
                        message: 'Age should be number '
                    }
                }
            },
            
            experience: {
                validators: {
                    notEmpty: {
                        message: 'Driver should have Experiance '
                    }
                }
            },
            
        }     
    });
    
    
});


var saveKara = 0;
$(document).on("click", ".open-AddBookDialog", function () {
	
});
</script>

<script type="text/javascript">
var saveKara = 0;

function showBtn(){
	 if(saveKara == 0){
		 alert("Please select Atleast one Driver for delete");
	 }
	 else{
		 var result = confirm("Are you sure, you want to delete driver(s)?");
		 if(result){
			 window.location.href = "deleteBusDriverList?list="+saveKara;	 
		 }
		 	 
	 }
	 
}

$(document).ready(function() {
    $('#routeDataTable').DataTable();
});


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

function addStops(id){

	var id=id;
	window.location.href="${pageContext.request.contextPath}/route/addNewStops?routeId="+id;
	
}

 function editBusDriver(id,name,address,city,license,experiance,age){
	$("#driverId").val(id);
	$("#driverName").val(name);
	$("#address").val(address);
	$("#city").val(city);
	$("#license").val(license);
	$("#experiance").val(experiance);
	$("#age").val(age);
	$("#edit").modal('show');
	
}

 function editDriver(){

	var driverId = $("#driverId").val();
	var driverName=$("#driverName").val();
	var address=$("#address").val();
	var city=$("#city").val();
	var license=$("#license").val();
	var experiance=$("#experiance").val();
	var age=$("#age").val();
	var allData=driverId+","+driverName+","+address+","+city+","+license+","+experiance+","+age;
	var formData="list="+allData;
	 $.ajax({
	    type : "POST",
	    url : "${pageContext.request.contextPath}/route/editBusDriver",
	    data : formData,
	    success : function(response) {	 
		   $("#edit").modal('hide');
	       alert("Driver Updated Successfully!");
	       location.reload();
	      },
	    error : function(e) {
	    	 $("#edit").modal('hide');
	    	 location.reload();
	    }
	});   
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
	  		var id = checkboxes[i].getAttribute('id' );
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

	
	
</script>


<div class="form-horizontal">
    <div class="row">
        <div class="col-lg-12">
            <div class="fixed-page-header">
                <div class="page-header clearfix">
                    <h1 class="page-head-text pull-left"> Driver</h1>                    
                    <button type="submit" class="btn btn-inverse btn-sm pull-right" data-toggle="modal" data-target="#addDriver"><i class="fa fa-plus-circle"></i>  Add Bus Driver</button>                    
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
                        <span class="panel-head">Driver List</span>
                    </div>                                        
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table id="example" class="table table-bordered table-striped table-hover">
                          <thead>
                            <tr>
                            	<th width="5%" class="text-center no-sort"><input type="checkbox" onClick="deleteAllRow(this)"></th>
                                <th width="10%">Name</th>
                                <th width="20%">Address</th>
                                <th width="10%">City</th>
                                <th width="10%">License Number</th>
                                <th width="15%">Experience</th>
                                <th width="10%">Age</th>
                                <th width="15%">Action</th>                  
                            </tr>
                          </thead>
                        	<tbody>
                                <c:forEach var="driver" items="${busDriverList}">
                                    <tr>
                                       <td><input type="checkbox" id="${driver.driverId}" name="myTextEditBox" value="" onClick="displayNote(event)"></td>
                                       <td>${driver.driverName}</td>  
                                       <td>${driver.address}</td> 
                                       <td>${driver.city}</td>
                                       <td>${driver.licenseNo}</td> 
                                       <td>${driver.experiance}</td>
                                       <td>${driver.age}</td>
                                       <td><button type="button" class="btn btn-default btn-sm" onClick="editBusDriver('${driver.driverId}','${driver.driverName}','${driver.address}','${driver.city}','${driver.licenseNo}','${driver.experiance}','${driver.age}')"> <i class="fa fa-pencil-square-o"></i> Edit</button></td>
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

<form id="editForm">
<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="delete-domain" aria-hidden="true">
   	<div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title"><center>Edit Driver</center></h4>
          </div>
          <div class="modal-body">   
          	<div class="form-horizontal"> 			  
				<!-- <div class="form-group">
                    <label class="col-sm-3 control-label">* Driver Id :</label>
                    <div class="col-sm-8"> -->
						<input type="hidden" name="name" id="driverId" class="form-control" readOnly>
                 <!--  	</div>
				</div> -->
			  	<div class="form-group">
                    <label class="col-sm-3 control-label">* Driver Name :</label>
                    <div class="col-sm-8">
						<input type="text" name="driverName" id="driverName" class="form-control">
                  	</div>
				</div>
				
				<div class="form-group">
                    <label class="col-sm-3 control-label">* Address:</label>
                    <div class="col-sm-8">
						<input type="text" name="address" id="address" class="form-control">
                  	</div>
				</div>
				
				<div class="form-group">
                    <label class="col-sm-3 control-label">* City :</label>
                    <div class="col-sm-8">
						<input type="text" name=city id="city" class="form-control">
                  	</div>
				</div>
				
				<div class="form-group">
                    <label class="col-sm-3 control-label">* License :</label>
                    <div class="col-sm-8">
						<input type="text" name=license id="license" class="form-control">
                  	</div>
				</div>
				
				<div class="form-group">
                    <label class="col-sm-3 control-label">* Experience :</label>
                    <div class="col-sm-8">
						<input type="text" name=experiance id="experiance" class="form-control">
                  	</div>
				</div>
				
				<div class="form-group">
                    <label class="col-sm-3 control-label">* Age :</label>
                    <div class="col-sm-8">
						<input type="number" name=age id="age" class="form-control">
                  	</div>
				</div>
           	</div>
      	</div>
    	<div class="modal-footer text-center">
            <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-sky btn-sm" onClick="editDriver();">Save</button>
        </div>
    </div>
  </div>
</div>
</form>

<div class="modal fade" id="addDriver" tabindex="-1" role="dialog" aria-labelledby="delete-domain" aria-hidden="true">
   	<div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title"><center>Add Driver</center></h4>
          </div>                
 
       		<form:form id="registerForm" class="form-horizontal" method="post" name="registerForm" action="${pageContext.request.contextPath}/route/addDriver" commandName="busDriver">
            <div class="modal-body">   
                <div class="form-group">
                    <form:label path="driverName" class="col-sm-3 control-label">* Driver Name : </form:label>
                    <div class="col-sm-8">
                    	<form:input  path="driverName" id="driverName" value="" class="form-control" maxlength="50" />
                   	</div>
                </div>
                <div class="form-group">
                    <form:label path="address" class="col-sm-3 control-label">* Address : </form:label>
                    <div class="col-sm-8">
                    	<form:input path="address" id="address" value="" class="form-control" maxlength="80"/>
                   	</div>
              	</div>

                <div class="form-group">
                    <form:label path="city" class="col-sm-3 control-label">* City :</form:label>
                    <div class="col-sm-8">
                    	<form:input path="city" id="city" value="" class="form-control" maxlength="25" />       
                   	</div>         
                </div>

                <div class="form-group">
                    <form:label path="licenseNo" class="col-sm-3 control-label">* License :</form:label>
                    <div class="col-sm-8">
                    	<form:input path="licenseNo" id="licenseNo" value="" class="form-control" maxlength="15"/>
                   	</div>
                </div>
                
                <div class="form-group">
                    <form:label path="experiance" class="col-sm-3 control-label">* Experience :</form:label>
                    <div class="col-sm-8">
                   		<form:input path="experiance" id="experiance" value="" class="form-control" maxlength="10"/>
                   	</div>
                </div>
                
                <div class="form-group">
                    <form:label path="age" class="col-sm-3 control-label">* Age :</form:label>
                    <div class="col-sm-8">
                    	<form:input path="age" type="number" id="age" value="" class="form-control" />
                   	</div>
                </div>
            </div>
            <div class="modal-footer text-center">
                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-sky btn-sm">Save</button>
            </div>
      	</form:form>
    </div>
  </div>
</div>