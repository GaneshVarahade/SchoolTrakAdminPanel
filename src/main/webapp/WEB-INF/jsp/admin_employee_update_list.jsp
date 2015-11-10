<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<style>
td{

}

</style>

<c:forEach var="employee" items="${employeeList}">
<table>
 <tr>
  <th>First Name</th>
  <th>Last Name</th>
 </tr>
 <tr>
    <td style="text-align: center">${employee.firstName}</td>
    <td>${employee.lastName}</td>
 </tr> 
</table>
</c:forEach>