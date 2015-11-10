<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Project List</title>

 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  
 
  <script src="https://cdn.datatables.net/1.10.8/css/dataTables.bootstrap.min.css"></script>
  <script src="https://cdn.datatables.net/1.10.8/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.8/js/dataTables.bootstrap.min.js"></script>

<script>

$(function(){
	    $('#browse_app').click(function(){
	        window.location='addProject';
	    });
	});
</script>

<script type="text/javascript">

$(document).ready(function() {
    $('#example').DataTable();
} );


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
    $(".modal-body #projectId").val( d );
    $(".modal-body #projectName").val( d1 );
    $(".modal-body #projectDescription").val( d2 );
    $(".modal-body #projectTechnology").val( d3 );
    $(".modal-body #projectStartDate").val( d4 );
    $(".modal-body #projectEndDate").val( d5 );
    $(".modal-body #projectStatus").val( d6 );
    $(".modal-body #clientId").val( d7 );
  
});





function edit(id){
	var id = id;
	window.location.href = "editProject?id="+id;
	}
	
function deletel(id){
	//alert("delete "+id);
	var id = id;
	window.location.href = "deleteProject?id="+id;
}	
</script>

</head>

<body >
<input class="btn btn-primary btn-lg raised pull-right " id = "browse_app" <%-- href = "${pageContext.request.contextPath}/webapp/WEB-INF/jsp/admin_employee_registration.jsp" --%> type="button" value="Add Project"  style="width: 140px"><br><br>
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Name</th>
                <th>Description</th>
                <th>Technology</th>
                <th>Start Date</th>
                <th>Status</th>
                <th>Client Id</th>
                <th>Details</th>
                <th>EDIT</th>
                <th>DELETE</th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th>Name</th>
                <th>Description</th>
                <th>Technology</th>
                <th>Start Date</th>
                <th>Status</th>
                <th>Client Id</th>
                <th>Details</th>
                <th>EDIT</th>
                <th>DELETE</th>
            </tr>
        </tfoot>
 
        <tbody>
        <c:forEach var="project" items="${projectList}">
            <tr>
  
	                <td contenteditable='true'>${project.projectName}</td>
	                <td contenteditable='true'>${project.projectDescription}</td>
	                <td contenteditable='true'>${project.projectTechnology}</td>
	                <td contenteditable='true'>${project.projectStartDate}</td>
	                <td contenteditable='true'>${project.projectStatus}</td>
	                <td contenteditable='true'>${project.client.clientName}</td>

					 <td id="${project.projectId}" class="open-AddBookDialog btn btn-primary" data-toggle="modal"  data-id="${project.projectId},${project.projectName},${project.projectDescription},${project.projectTechnology},${project.projectStartDate},${project.projectEndDate},${project.projectStatus},${project.client.clientId}"  data-target="#myModal"><img src='${pageContext.request.contextPath}/resources/images/Pencil-icon.png'  style="height: 26px;"></td>
	                
					 <div class="container">  
				  		<div class="modal fade" id="myModal" role="dialog">
				    		<div class="modal-dialog">
				    
				      		<!-- Modal content-->
				      			<div class="modal-content">
				        			<div class="modal-header">
				          				<button type="button" class="close" data-dismiss="modal">&times;</button>
				          					<h4 class="modal-title">Employee Details</h4>
				        			</div>
				        			<div class="modal-body">
				       		 			<form class="form-horizontal" role="form">
				       		  				<div class="form-group">
				        						projectId&nbsp<input type="text" name="projectId" id="projectId" value=""/><br>
				        						projectName&nbsp<input type="text" name="projectName" id="projectName" value=""/><br>
				       							projectDescription&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="projectDescription" id="projectDescription" value=""/><br>
				        						projectTechnology&nbsp&nbsp&nbsp<input type="text" name="projectTechnology" id="projectTechnology" value=""/><br>
				        						projectStartDate&nbsp<input type="text" name="projectStartDate" id="projectStartDate" value=""/><br>
				        						projectEndDate&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="projectEndDate" id="projectEndDate" value=""/><br>	
				       							projectStatus<input type="text" name="projectStatus" id="projectStatus" value=""/><br>
				       							clientId<input type="text" name="clientId" id="clientId" value=""/><br>
				       						</div>
				       					</form>
				        			</div>
				        			<div class="modal-footer">
				          				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        			</div>
				      			</div>
				    	</div>
				  </div>
				</div>
	
				
	                <td id="${project.projectId}" onClick="edit(this.id)"><img src='${pageContext.request.contextPath}/resources/images/Pencil-icon.png'  style="height: 26px;"></td> 
	                <td id="${project.projectId}" onClick="deletel(this.id)"><img src='${pageContext.request.contextPath}/resources/images/delete.png'  style="height: 26px;"></td>
            	
            </tr>
         </c:forEach>
         </tbody>
</table>
</body>
</html>




