<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee List</title>

 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  
 
  <script src="https://cdn.datatables.net/1.10.8/css/dataTables.bootstrap.min.css"></script>
  <script src="https://cdn.datatables.net/1.10.8/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.8/js/dataTables.bootstrap.min.js"></script>


<script type="text/javascript">

$(document).ready(function() {
    $('#example').DataTable();
} );


$(function(){
	    $('#browse_app').click(function(){
	        window.location='addEmployeeProject';
	    });
	});

function edit(id){
	var id = id;
	window.location.href = "editEmpProject?id="+id;
	}
	
function deletel(id){
	//alert("delete "+id);
	var id = id;
	window.location.href = "deleteEmpProject?id="+id;
}	
</script>

</head>
<body >
<input class="btn btn-primary btn-lg raised pull-right " id = "browse_app" <%-- href = "${pageContext.request.contextPath}/webapp/WEB-INF/jsp/admin_employee_registration.jsp" --%> type="button" value="Assign Project" ng-click="addEmployee()" style="width: 140px"><br><br>
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Employee Id</th>
                <th>Employee Name</th>
                <th>Project Id</th>
                <th>Project Name</th>
                <th>EDIT</th>
                <th>DELETE</th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th>Employee Id</th>
                <th>Employee Name</th>
                <th>Project Id</th>
                <th>Project Name</th>
                <th>EDIT</th>
                <th>DELETE</th>
            </tr>
        </tfoot>
 
        <tbody>
        <c:forEach var="empProject" items="${empProjectList}">
            <tr>
  
	                <td>${empProject.employee.id}</td>
	                <td>${empProject.employee.firstName}</td>
	                <td>${empProject.project.projectId}</td>
	                <td>${empProject.project.projectName}</td>
	                <td id="${empProject.empProjectId}" onClick="edit(this.id)"><img src='${pageContext.request.contextPath}/resources/images/Pencil-icon.png'  style="height: 26px;"></td> 
	                <td id="${empProject.empProjectId}" onClick="deletel(this.id)"><img src='${pageContext.request.contextPath}/resources/images/delete.png'  style="height: 26px;"></td>
            	
            </tr>
         </c:forEach>
         </tbody>
</table>
</body>
</html>




