 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script>
var saveKara = 0;

 
 $(document).on("click", ".open-AddBookDialog", function () {
	   
	    
	});

 
</script>
<script type="text/javascript">

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
	window.location.href="${pageContext.request.contextPath}/route/addStop?id="+id;
	
}









</script>

</head>
<body>
	<button id="btn" class="open-AddBookDialog btn btn-primary"
		type="button" onClick="showBtn()">Delete</button>
	<button class="open-AddBookDialog btn btn-primary" data-toggle="modal"
		data-id="" data-target="#forClientRegistration">Add Route</button>
	<table id="routeDataTable" class="table table-striped table-bordered"
		cellspacing="0" width="100%">
		<thead>
			<tr>
				<th>DELETE</th>
				<th>Name</th>
				<th>Status</th>
				<th>Start Stop</th>
				<th>End Stop</th>
				<th>Add Stop</th>
				<th>Edit Route</th>
			</tr>
		</thead>

		<tfoot>
			<tr>
				<th>DELETE</th>
				<th>Name</th>
				<th>Status</th>
				<th>Start Stop</th>
				<th>End Stop</th>
				<th>Add Stop</th>
				<th>Edit Route</th>

			</tr>
		</tfoot>

		<tbody>
			<c:forEach var="route" items="${routeList}">
				<tr>
				   <td><input type="checkbox" ></td>
				   <td>${route.routeName}</td>  
				   <td>${route.routeStatus}</td> 
				   <td>${route.startStop}</td> 
				   <td>${route.endStop}</td> 
				   <td><input type="button" value="Add Stops" onclick="addStops(${route.routeNo})"></td>
				   <td><input type="button" value="Edit" onclick="editRoute()"></td>
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

											</div>
										</div>
									</section>
								</div>
							</div>
							<div class="modal-footer">
						     <input type="submit" value="Submit"/>
					        </div>
						</form:form>
						
					</div>
					
				</div>
			</div>
		</div>

	</div>
	<script src="script.js" type="text/javascript" defer="defer"></script>
</body>

