 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <head>
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css">
</head>
<script>
var saveKara = 0;

 
 $(document).on("click", ".open-AddBookDialog", function () {
	   
	    
	});

 
</script>
<script type="text/javascript">
var saveKara = 0;

function showBtn(){
	alert(saveKara);
	 if(saveKara == 0){
		 alert("Please select Atleast one Driver for delete");
	 }
	 else{
		 var result = confirm("want to delete?");
		 if(result){
			 window.location.href = "deleteBusDriverList?list="+saveKara;	 
		 }
		 	 
	 }
	 
}



$(document).ready(function() {
    $('#routeDataTable').DataTable();
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
//		alert(saveKara);
//		showAlert(saveKara);
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
<style>
.button{
    border-left-width: 0px;
    width: 108px;
    height: 27px;
    padding-left: 0px;
    margin-left: 0px;
    background-color : #F5BE0A;
}
</style>
</head>
<body>
	<button id="btn" class="button" type="submit" onClick="showBtn()">Delete</button>&nbsp;
	<button class="button" data-toggle="modal"
		data-id="" data-target="#forClientRegistration">Add Bus Driver</button>
		<hr style="border-top-width: 0px;">
	<table id="routeDataTable" class="table table-striped table-bordered"
		cellspacing="0" width="100%">
		<thead>
			<tr>
				<th></th>
				<th>Name</th>
				<th>Address</th>
				<th>City</th>
				<th>License Number</th>
				<th>Experiance</th>
				<th>Age</th>
				<th style="width: 125px;">Edit Driver</th>
			</tr>
		</thead>

		<tfoot>
			<tr>
				<th></th>
				<th>Name</th>
				<th>Address</th>
				<th>City</th>
				<th>License Number</th>
				<th>Experiance</th>
				<th>Age</th>
				<th style="width: 125px;">Edit Driver</th>
			</tr>
		</tfoot>

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
				   <td><input type="submit" class="button" value="Edit" onclick="editBusDriver('${driver.driverId}','${driver.driverName}','${driver.address}','${driver.city}','${driver.licenseNo}','${driver.experiance}','${driver.age}')"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	 <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
           <div class="modal-dialog">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">Edit </h4>
			  </div>
			  <div class="modal-body">
			  
				<div>
					<label>Driver Id :</label>
						<input type="text" name="name" id="driverId" class="form-control" readOnly>
				</div>			  
			  	<div>
					<label>Driver Name :</label>
						<input type="text" name="driverName" id="driverName" class="form-control">
				</div>
				
				<div>
					<label>Address:</label>
						<input type="text" name="address" id="address" class="form-control">
				</div>
				
				<div>
					<label>City :</label>
						<input type="text" name=city id="city" class="form-control">
				</div>
				
				<div>
					<label>License :</label>
						<input type="text" name=license id="license" class="form-control">
				</div>
				
				<div>
					<label>Experiance :</label>
						<input type="text" name=experiance id="experiance" class="form-control">
				</div>
				
				<div>
					<label>Age :</label>
						<input type="text" name=age id="age" class="form-control">
				</div>
				<div><br>
					<input type="submit" class="button" value="Submit" onclick="editDriver();">
				</div>
			  </div>
			 </div>
			</div>
	</div>

 
	<div class="container">
		<div class="modal fade" id="forClientRegistration" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Driver Details</h4>
					</div>
					<div class="modal-body">
					 	<form:form id="registerForm" class="form-horizontal" method="post"
							name="registerForm" action="${pageContext.request.contextPath}/route/addDriver" commandName="busDriver">
							<div class="form-group">
								<div class="container-fluid">
									<section class="container">
										<div class="container-page">
											<div class="col-md-6">
												<h3 class="dark-grey">Add Route</h3>

												<div>
													<form:label path="driverName" >Driver Name</form:label>
													<form:input  path="driverName" id="driverName"
														value="" class="form-control" />
												</div>
												<div>
													<form:label  path="address">Address</form:label>
													<form:input  path="address" id="address"
														value="" class="form-control" />
												</div>

												<div>
													<form:label path="city">City</form:label>
													<form:input path="city" id="city"
													value="" class="form-control" />
												
												</div>

												<div>
													<form:label path="licenseNo">License Number</form:label>
													<form:input path="licenseNo" id="licenseNo"
														value="" class="form-control" />
												</div>
												
												<div>
													<form:label path="experiance">Experiance</form:label>
													<form:input path="experiance" id="experiance"
														value="" class="form-control" />
												</div>
												
												<div>
													<form:label path="age">Age</form:label>
													<form:input path="age" id="age"
														value="" class="form-control" />
												</div>
												
											</div>
										</div>
									</section>
								</div>
							</div>
							<div class="modal-footer">
						     <input class="button" type="submit" value="Submit"/>
					        </div>
						</form:form>
						
					</div>
					
				</div>
			</div>
		</div>

	</div>
	
	<script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js" type="text/javascript"></script>
</body>

