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

	 if(saveKara == 0){
		 alert("Please select Atleast one client for delete");
	 }
	 else{
		alert(saveKara);
		 var result = confirm("want to delete?");
		 if(result){
			 window.location.href = "deleteBusList?list="+saveKara;	 
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

 function editBus(id,regNo,type,capacity){
	$("#busId").val(id);
	$("#regNo").val(regNo);
	$("#type").val(type);
	$("#capacity").val(capacity);
	$("#edit").modal('show');
	
}

 function editBuses(){

	var busId = $("#busId").val();
	 var regNo=$("#regNo").val();
	var type=$("#type").val();
	var capacity=$("#capacity").val();
	var allData=busId+","+regNo+","+type+","+capacity;
	var formData="list="+allData;
	 $.ajax({
	    type : "POST",
	    url : "${pageContext.request.contextPath}/route/editBus",
	    data : formData,
	    success : function(response) {	 
	    	 $("#edit").modal('hide');
	       alert("Bus Updated Successfully!");
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
		data-id="" data-target="#forClientRegistration">Add Bus</button>
		<hr style="border-top-width: 0px;">
	<table id="routeDataTable" class="table table-striped table-bordered"
		cellspacing="0" width="100%">
		<thead>
			<tr>
				<th></th>
				<th>Bus Number</th>
				<th>Bus Type</th>
				<th>Bus Capacity</th>
				<th style="width: 125px;">Edit Bus</th>
			</tr>
		</thead>

		<tfoot>
			<tr>
				<th></th>
				<th>Bus Number</th>
				<th>Bus Type</th>
				<th>Bus Capacity</th>
				<th>Edit Bus</th>

			</tr>
		</tfoot>

		<tbody>
			<c:forEach var="bus" items="${busList}">
				<tr>
				   <td><input type="checkbox" id="${bus.busId}" name="myTextEditBox" value="" onClick="displayNote(event)"></td>
				   <td>${bus.regNumber}</td>  
				   <td>${bus.busType}</td> 
				   <td>${bus.capacity}</td> 
				   <td><input type="submit" class="button" value="Edit" onclick="editBus('${bus.busId}','${bus.regNumber}','${bus.busType}','${bus.capacity}')"></td>
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
					<label>Bus Id :</label>
						<input type="text" name="name" id="busId" class="form-control" readOnly>
				</div>			  
			  	<div>
					<label>Bus Register Number :</label>
						<input type="text" name="regNo" id="regNo" class="form-control">
				</div>
				
				<div>
					<label>Bus Type:</label>
						<input type="text" name="type" id="type" class="form-control">
				</div>
				
				<div>
					<label>Bus Capacity :</label>
						<input type="text" name="capacity" id="capacity" class="form-control">
				</div>
				
				
				
				<div><br>
					<input type="submit" class="button" value="Submit" onclick="editBuses();">
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
							name="registerForm" action="${pageContext.request.contextPath}/route/addBus" commandName="bus">
							<div class="form-group">
								<div class="container-fluid">
									<section class="container">
										<div class="container-page">
											<div class="col-md-6">
												<h3 class="dark-grey">Add Route</h3>

												<div>
													<form:label path="busId" >Bus ID.</form:label>
													<form:input  path="busId" id="routeNo"
														value="" class="form-control" />
												</div>
												<div>
													<form:label  path="regNumber">Bus Register Number</form:label>
													<form:input  path="regNumber" id="regNumber"
														value="" class="form-control" />
												</div>

												<div>
													<form:label path="busType">Bus Type</form:label>
													<form:input path="busType" id="busType"
													value="" class="form-control" />
												
												</div>

												<div>
													<form:label path="capacity" >Capacity</form:label>
													<form:input path="capacity" id="capacity"
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

