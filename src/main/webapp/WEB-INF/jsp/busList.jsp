 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%><head>
 
 
<script>
var saveKara = 0;

 
 	$(document).on("click", ".open-AddBookDialog", function () {	    
	});
	
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

<div class="form-horizontal">
    <div class="row">
        <div class="col-lg-12">
            <div class="fixed-page-header">
                <div class="page-header clearfix">
                    <h1 class="page-head-text pull-left">Vehicle</h1>
                    
                    <button type="submit" class="btn btn-inverse btn-sm pull-right" data-toggle="modal" data-target="#forClientRegistration"><i class="fa fa-plus-circle"></i>  Add Bus</button>                    
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
                        <span class="panel-head">Vehicle List</span>
                    </div>                                        
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table id="example" class="table table-bordered table-striped table-hover">
                          <thead>
                            <tr>
                            	<th width="5%" class="text-center no-sort"><input type="checkbox"></th>
                                <th width="25%">Vehicle Number</th>
                                <th width="25%">Vehicle Type</th>
                                <th width="20%">Vehicle Capacity</th>
                                <th width="20%">Edit Vehicle</th>                  
                            </tr>
                          </thead>
                        	<tbody>
                                <c:forEach var="bus" items="${busList}">
                                    <tr>
                                       <td><input type="checkbox" id="${bus.busId}" name="myTextEditBox" value="" onClick="displayNote(event)"></td>
                                       <td>${bus.regNumber}</td>  
                                       <td>${bus.busType}</td> 
                                       <td>${bus.capacity}</td> 
                                       <td><button type="button" class="btn btn-default btn-sm" value="Edit" onClick="editBus('${bus.busId}','${bus.regNumber}','${bus.busType}','${bus.capacity}')"><i class="fa fa-pencil-square-o"></i> Edit</button></td>
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

<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="delete-domain" aria-hidden="true">
   	<div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Edit Vehicle</h4>
          </div>
          <div class="modal-body">   
          	<div class="form-horizontal">   
                <div class="form-group">
                    <label class="col-sm-3 control-label">Vehicle Id :</label>
                    <div class="col-sm-8">
                        <input type="text" name="name" id="busId" class="form-control" readOnly>
                    </div>
                </div>			  
                <div class="form-group">
                    <label class="col-sm-3 control-label">Vehicle Register Number :</label>
                    <div class="col-sm-8">
                        <input type="text" name="regNo" id="regNo" class="form-control">
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-sm-3 control-label">Vehicle Type:</label>
                    <div class="col-sm-8">
                        <input type="text" name="type" id="type" class="form-control">
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-sm-3 control-label">Vehicle Capacity :</label>
                    <div class="col-sm-8">
                        <input type="text" name="capacity" id="capacity" class="form-control">
                    </div>
                </div>
            </div>
      	</div>
    	<div class="modal-footer text-center">
            <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-sky btn-sm" onClick="editBuses();" data-dismiss="modal">Save</button>
        </div>
    </div>
  </div>
</div>

 
<div class="modal fade" id="forClientRegistration" tabindex="-1" role="dialog" aria-labelledby="delete-domain" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Add Vehicle</h4>
        </div>
        <form:form id="registerForm" class="form-horizontal" method="post" name="registerForm" action="${pageContext.request.contextPath}/route/addBus" commandName="bus">
            <div class="modal-body">
                <div class="form-group">
                    <form:label path="busId" class="col-sm-3 control-label">Vehicle ID.</form:label>
                    <div class="col-sm-8">
                        <form:input  path="busId" id="routeNo" value="" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <form:label  path="regNumber" class="col-sm-3 control-label">Vehicle Register Number</form:label>
                    <div class="col-sm-8">
                        <form:input  path="regNumber" id="regNumber" value="" class="form-control" />
                    </div>
                </div>

                <div class="form-group">
                    <form:label path="busType" class="col-sm-3 control-label">Vehicle Type</form:label>
                    <div class="col-sm-8">
                        <form:input path="busType" id="busType" value="" class="form-control" />   
                    </div>                 
                </div>

                <div class="form-group">
                    <form:label path="capacity" class="col-sm-3 control-label">Capacity</form:label>
                    <div class="col-sm-8">
                        <form:input path="capacity" id="capacity" value="" class="form-control" />
                    </div>
                </div>
            </div>
            <div class="modal-footer text-center">
                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>                    
                <button type="submit" class="btn btn-sky btn-sm" />Save</button>
            </div>
            </form:form>
        </div>
      </div>
    </div>

