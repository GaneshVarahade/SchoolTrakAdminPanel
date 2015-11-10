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


<script type="text/javascript">

$(document).ready(function() {
    $('#example').DataTable();
} );

	
function leaveApproved(id,wDays,empId){
	var id = id;
	var wDays = wDays;
	var empId = empId;
	window.location.href = "leaveApproved?id="+id+"&wDays="+wDays+"&empId="+empId;
}


function leaveReject(id){
	var id = id;
	window.location.href = "leaveReject?id="+id;
}	

</script>

</head>
<body >

<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Employee</th>
                <th>Leave Start</th>
                <th>Leave End</th>
                <th>Working Days</th>
                <th>Supervisor</th>
                <th>Status</th>
                <th>Approved</th>
          		<th>Reject</th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th>Employee</th>
                <th>Leave Start</th>
                <th>Leave End</th>
                <th>Working Days</th>
                <th>Supervisor</th>
                <th>Status</th>
                <th>Approved</th>
           		<th>Reject</th>
            </tr>
        </tfoot>
 
        <tbody>
        <c:forEach var="leave" items="${leaveList}">
            <tr>
  
	                <td>${leave.employee.firstName}</td>
	                <td>${leave.leaveStart}</td>
	                <td>${leave.leaveEnd}</td>
	                <td id="wDays">${leave.workingDays}</td>
	                <td>${leave.supervisor.superVisorId}</td>
	                <td>${leave.leaveStatus}</td>
	                <td id="${leave.leavesAppliedId}" onClick="leaveApproved(this.id,${leave.workingDays},${leave.employee.id})"><img src='${pageContext.request.contextPath}/resources/images/Pencil-icon.png'  style="height: 26px;"></td> 
	               <td id="${leave.leavesAppliedId}" onClick="leaveReject(this.id)"><img src='${pageContext.request.contextPath}/resources/images/Pencil-icon.png'  style="height: 26px;"></td>
            	
            </tr>
         </c:forEach>
         </tbody>
</table>
</body>
</html>




