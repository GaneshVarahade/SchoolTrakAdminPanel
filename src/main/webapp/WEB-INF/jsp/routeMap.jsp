<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script>
var saveKara = 0;

 
 $(document).on("click", ".open-AddBookDialog", function () {
	   
	    
	});

 
</script>
<script type="text/javascript">
var saveKara = 0;

function showBtn(){

	 if(saveKara == 0){
		 alert("Please select Atleast one Route for delete");
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


function addStops(id){

	var id=id;
	window.location.href="${pageContext.request.contextPath}/route/addNewStops?routeId="+id;
	
}

 function editRoute(id,name,status,start,stop,regNo,driverName,corridorId){
	 
	$("#routeId").val(id);
	$("#routeName").val(name);
	$("#status").val(status);
	$("#start").val(start);
	$("#stop").val(stop);
	$("#regNumber").val(regNo);
	$("#driverName").val(driverName);
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
//	       location.reload();
	       window.location.href="${pageContext.request.contextPath}/route/routeMap";
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
                    <h1 class="page-head-text pull-left">Route</h1>                    
                    <button type="submit" class="btn btn-inverse btn-sm pull-right" data-toggle="modal" data-target="#addRoutes"><i class="fa fa-plus-circle"></i>  Add Route</button>                    
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
                        <span class="panel-head">Route List</span>
                    </div>                                        
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table id="routeDataTable" class="table table-bordered table-striped table-hover">
                          <thead>
                            <tr>
                              <th width="3%" class="text-center no-sort"><input type="checkbox"></th>
                              <th width="12%">Name</th>
                              <th width="10%">Status</th>
                              <th width="10%">Start Stop</th>
                              <th width="10%">End Stop</th>
                              <th width="10%">Corridor ID</th>
                              <th width="10%">Bus Number</th>
                              <th width="15%">Driver Name</th>
                              <th width="10%">Add Stop</th>
                              <th width="10%">Edit Route</th>
                            </tr>
                          </thead>
                          <tbody>
                            <c:forEach var="route" items="${routeList}">
                              <tr>
                                <td class="text-center"><input type="checkbox" id="${route.routeNo}" name="myTextEditBox" value="" onClick="displayNote(event)"></td>
                                <td>${route.routeName}</td>
                                <td>${route.routeStatus}</td>
                                <td>${route.startStop}</td>
                                <td>${route.endStop}</td>
                                <td>${route.corridorId}</td>
                                <td>${route.bus.regNumber}</td>
                                <td>${route.busDriver.driverName}</td>
                                <td><button type="submit" class="btn btn-default btn-sm" onClick="addStops(${route.routeNo})"><i class="fa fa-plus-circle"></i> Add Stops</button></td>
                                <td><button type="submit" class="btn btn-default btn-sm" onClick="editRoute('${route.routeNo}','${route.routeName}','${route.routeStatus}','${route.startStop}','${route.endStop}','${route.bus.regNumber}','${route.busDriver.driverName}','${route.corridorId}');"><i class="fa fa-pencil-square-o"></i> Edit</button></td>
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
        <h4 class="modal-title">Edit Route </h4>
      </div>
      
      <form method="post" action="${pageContext.request.contextPath}/route/editRoute">
      <div class="modal-body">
      	<div class="form-horizontal">
            <div class="form-group">
             <!-- 	<label class="col-sm-3 control-label">Route Number :</label> -->
                <div class="col-sm-8">
                  <input type="hidden" name="routeId" id="routeId" class="form-control" readOnly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Route Name :</label>
                <div class="col-sm-8">
                  <input type="text" name="routeName" id="routeName" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Route Status :</label>
                <div class="col-sm-8">
                  <input type="text" name="status" id="status" class="form-control">
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-sm-3 control-label">Start Stop :</label>
                <div class="col-sm-8">
                  <input type="text" name="start" id="start" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">End Stop :</label>
                <div class="col-sm-8">
                  <input type="text" name="stop" id="stop" class="form-control">
                </div>
            </div>
            <div class="form-group">
            <!--     <label class="col-sm-3 control-label">Corridor Id :</label> -->
                <div class="col-sm-8">
                  <input type="hidden" name="corridorId" id="corridorId" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Bus Number</label>
                <div class="col-sm-8">
                	
                  <select name="regNumber" id="regNumber" class="form-control" >
                    <c:forEach var="bus" items="${busList}">
                      <option value="${bus.regNumber}">${bus.regNumber}</option>
                    </c:forEach>
                  </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Driver </label>
                <div class="col-sm-8">
                  <select id="driverName" class="form-control" >
                    <c:forEach var="busDriver" items="${busDriverList}">
                      <option value="${busDriver.driverName}">${busDriver.driverName}</option>
                    </c:forEach>
                  </select>
                </div>
            </div>
      	</div>
        <div class="modal-footer text-center">
            <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>
            <input type="submit" class="btn btn-sky btn-sm"  value="Save">
        </div>
    </div>
    </form> 
  </div>
</div>
</div>

<div class="modal fade" id="addRoutes" tabindex="-1" role="dialog" aria-labelledby="delete-domain" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Add Route</h4>
      </div>
      	 <form:form id="registerForm" class="form-horizontal" method="post" name="registerForm" action="${pageContext.request.contextPath}/route/addRoute" commandName="route">            
      	<div class="modal-body">
            
            <div class="form-group">
              <%--   <form:label path="routeNo" class="col-sm-3 control-label">Route No.</form:label> --%>
                <div class="col-sm-8">
                	<form:input type="hidden" path="routeNo" id="routeNo" value="" class="form-control" />
               	</div>
           	</div>
            <div class="form-group">
                <form:label  path="routeName" class="col-sm-3 control-label">Name</form:label>
                <div class="col-sm-8">
                	<form:input  path="routeName" id="routeName" value="" class="form-control" />
               	</div>
            </div>
            <div class="form-group">
                <form:label path="routeStatus" class="col-sm-3 control-label">Status</form:label>
                <div class="col-sm-8">
                    <form:select path="routeStatus" id="routeStatus" class="form-control">
                      <form:option value="1">isTrackON</form:option>
                      <form:option value="0">isTrackOFF</form:option>
                    </form:select>
               	</div>
            </div>
            <div class="form-group">
                <form:label path="startStop" class="col-sm-3 control-label">Start Stop</form:label>
                <div class="col-sm-8">
                	<form:input path="startStop" id="startStop" value="" class="form-control" />
               	</div>
            </div>
            <div class="form-group">
                <form:label path="endStop" class="col-sm-3 control-label">End Stop</form:label>
                <div class="col-sm-8">
                	<form:input path="endStop" id="endStop" value="" class="form-control" />
               	</div>
            </div>
            <div class="form-group">
                <%-- <form:label path="corridorId" class="col-sm-3 control-label">Corridor ID</form:label> --%>
                <div class="col-sm-8">
                	<form:input type = "hidden" path="corridorId" id="corridorId" value="" class="form-control" />
               	</div>
            </div>
            <div class="form-group">
                <form:label path="bus.regNumber" class="col-sm-3 control-label">Bus Number</form:label>
                <div class="col-sm-8">
                    <form:select path="bus.regNumber" name="regNumber" id="bus.regNumber" class="form-control" >
                      <c:forEach var="bus" items="${busList}">
                        <form:option value="${bus.regNumber}">${bus.regNumber}</form:option>
                      </c:forEach>
                    </form:select>
               	</div>
             </div>
             <div class="form-group">
                <form:label path="busDriver.driverName" class="col-sm-3 control-label"> Driver </form:label>
                <div class="col-sm-8">
                    <form:select path="busDriver.driverName" id="busDriver.driverName" class="form-control" >
                      <c:forEach var="busDriver" items="${busDriverList}">
                        <form:option value="${busDriver.driverName}">${busDriver.driverName}</form:option>
                      </c:forEach>
                    </form:select>
               	</div>
              </div>
            </div>
         	<div class="modal-footer text-center">
            	<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>
            	<button type="submit" class="btn btn-sky btn-sm" >Save</button>
            </div>          
            
          </form:form>
        </div>
      </div>
    </div>

<script src="script.js" type="text/javascript" defer="defer"></script>
