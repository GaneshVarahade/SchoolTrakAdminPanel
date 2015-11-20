 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <head>
 <script src="https://cdn.datatables.net/1.10.10/js/.dataTables.min.js" type="text/javascript"></script>
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.10/css/.dataTables.min.css">
</head>
<script>
var saveKara = 0;

 
 $(document).on("click", ".open-AddBookDialog", function () {
	   
	    
	});

 
</script>
<script type="text/javascript">
var saveKara = 0;

function showBtn(){

	 if(saveKara == 0){
		 alert("Please select Atleast one client for delete");
	 }
	 else{
		 var result = confirm("want to delete?");
		 if(result){
			 window.location.href = "deleteRouteList?list="+saveKara;	 
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

 function editRoute(id,name,status,start,stop,corridorId){
	 
	$("#routeId").val(id);
	$("#routeName").val(name);
	$("#status").val(status);
	$("#start").val(start);
	$("#stop").val(stop);
	$("#corridorId").val(corridorId);
	$("#edit").modal('show');
	
	
}

 function editRoutes(){

	 
	
	var routeId = $("#routeId").val();
	 var routeName=$("#routeName").val();
	var status=$("#status").val();
	var start=$("#start").val();
	var stop=$("#stop").val();
	var busNo=$("#regNumber").val();
	var driverName=$("#driverName").val();
	var corridorId=$("#corridorId").val();
	 var allData=routeId+","+routeName+","+status+","+start+","+stop+","+busNo+","+driverName+","+corridorId;
	var formData="list="+allData;
	 $.ajax({
	    type : "POST",
	    url : "${pageContext.request.contextPath}/route/editRoute",
	    data : formData,
	    success : function(response) {	 
	    	 $("#edit").modal('hide');
	       alert("Route Updated Successfully!");
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
	<button id="btn" class="button"
		type="submit" onClick="showBtn()">Delete</button>&nbsp;
	<button class="button" data-toggle="modal"
		data-id="" data-target="#forClientRegistration">Add Route</button>
		<hr style="border-top-width: 0px;">
	<table id="routeDataTable" class="table table-striped table-bordered"
		cellspacing="0" width="100%">
		<thead>
			<tr>
				<th></th>
				<th>Name</th>
				<th>Status</th>
				<th>Start Stop</th>
				<th>End Stop</th>
				<th>Corridor ID</th>
				<th>Bus Number</th>
				<th>Driver Name</th>
				<th style="width: 125px;">Add Stop</th>
				<th style="width: 125px;">Edit Route</th>
			</tr>
		</thead>

		<tfoot>
			<tr>
				<th></th>
				<th>Name</th>
				<th>Status</th>
				<th>Start Stop</th>
				<th>End Stop</th>
				<th>Corridor ID</th>
				<th>Bus Number</th>
				<th>Driver Name</th>
				<th>Add Stop</th>
				<th>Edit Route</th>

			</tr>
		</tfoot>

		<tbody>
			<c:forEach var="route" items="${routeList}">
				<tr>
				   <td><input type="checkbox" id="${route.routeNo}" name="myTextEditBox" value="" onClick="displayNote(event)"></td>
				   <td>${route.routeName}</td>  
				   <td>${route.routeStatus}</td> 
				   <td>${route.startStop}</td> 
				   <td>${route.endStop}</td>
				   <td>${route.corridorId}</td>
				   <td>${route.bus.regNumber}</td> 
				   <td>${route.busDriver.driverName}</td>
				   <td><input type="submit" class="button" value="Add Stops" onclick="addStops(${route.routeNo})"></td>
				   <td><input type="submit" class="button" value="Edit" onclick="editRoute('${route.routeNo}','${route.routeName}','${route.routeStatus}','${route.startStop}','${route.endStop}','${route.corridorId}');"></td>
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
					<label>Route Number :</label>
						<input type="text" name="name" id="routeId" class="form-control" readOnly>
				</div>			  
			  	<div>
					<label>Route Name :</label>
						<input type="text" name="name" id="routeName" class="form-control">
				</div>
				
				<div>
					<label>Route Status :</label>
						<input type="text" name="status" id="status" class="form-control">
				</div>
				
				<div>
					<label>Start Stop :</label>
						<input type="text" name="start" id="start" class="form-control">
				</div>
				
				<div>
					<label>End Stop :</label>
						<input type="text" name="end" id="stop" class="form-control">
				</div>
				
				<div>
					<label>Corridor Id :</label>
						<input type="text" name="corridorId" id="corridorId" class="form-control">
				</div>
												
			
				<div>
					<label>Bus Number</label>
					 <select name="regNumber" id="regNumber" class="form-control" >
  													
  					<c:forEach var="bus" items="${busList}">
  						<option value="${bus.regNumber}">${bus.regNumber}</option>
					</c:forEach>
				 	</select> 
												
				</div>
												
												
				<div>
					<label> Driver </label>
					 <select id="driverName" class="form-control" >
  													
  						<c:forEach var="busDriver" items="${busDriverList}">
  							<option value="${busDriver.driverName}">${busDriver.driverName}</option>
						</c:forEach>
				 	</select> 
												
				</div>
				
				
				<div><br>
					<input type="submit" class="button" value="Submit" onclick="editRoutes();">
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
						<h4 class="modal-title">Parent Details</h4>
					</div>
					<div class="modal-body">
						<form:form id="registerForm" class="form-horizontal" method="post"
							name="registerForm" action="${pageContext.request.contextPath}/route/addRoute" commandName="route">
							<div class="form-group">
								<div class="container-fluid">
									<section class="container">
										<div class="container-page">
											<div class="col-md-6">
												<h3 class="dark-grey">Add Route</h3>

												<div>
													<form:label path="routeNo" >Route No.</form:label>
													<form:input  path="routeNo" id="routeNo"
														value="" class="form-control" />
												</div>
												<div>
													<form:label  path="routeName">Name</form:label>
													<form:input  path="routeName" id="routeName"
														value="" class="form-control" />
												</div>

												<div>
													<form:label path="routeStatus">Status</form:label>
													<form:select path="routeStatus" id="routeStatus"
														class="form-control">
														<form:option value="1">ON</form:option>
														<form:option value="0">OFF</form:option>
													</form:select>
												</div>

												<div>
													<form:label path="startStop" >Start Stop</form:label>
													<form:input path="startStop" id="startStop"
														value="" class="form-control" />
												</div>

												<div>
													<form:label path="endStop">End Stop</form:label>
													<form:input path="endStop" id="endStop"
														value="" class="form-control" />
												</div>
												
												<div>
													<form:label path="corridorId">Corridor ID</form:label>
													<form:input path="corridorId" id="corridorId"
														value="" class="form-control" />
												</div>
												
												<div>
													<form:label path="bus.regNumber">Bus Number</form:label>
													<form:select path="bus.regNumber" name="regNumber" id="bus.regNumber" class="form-control" >
  													
  													<c:forEach var="bus" items="${busList}">
  													<form:option value="${bus.regNumber}">${bus.regNumber}</form:option>
													</c:forEach>
				 									</form:select>
												
												</div>
												
												
												<div>
													<form:label path="busDriver.driverName"> Driver </form:label>
													<form:select path="busDriver.driverName" id="busDriver.driverName" class="form-control" >
  													
  													<c:forEach var="busDriver" items="${busDriverList}">
  													<form:option value="${busDriver.driverName}">${busDriver.driverName}</form:option>
													</c:forEach>
				 									</form:select>
												
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
	<script src="script.js" type="text/javascript" defer="defer"></script>
</body>

