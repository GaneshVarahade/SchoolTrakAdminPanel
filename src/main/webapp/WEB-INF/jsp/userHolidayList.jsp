<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="input.css"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee List</title>

 <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  $(document).ready(function() {

	 $.ajax({
		    type : "POST",
		    url : "${pageContext.request.contextPath}/user/dateSelect",
		   // data : formData,
		   contentType: "application/json",
		   dataType: "text",
		    success : function(response) {	       
		       //alert(response)
		    	//console.log(response);
		    	var menuList = response.split(',');
		    	//alert(menuList[0]);
		    	 var SelectedDates = {};
		    	 var dates = [];
		    	for(var i=0;i<menuList.length;i++){
		    		 alert(menuList[i]);
		    		 var menu = menuList[i];
		    		 menu = menu.substring(0,menu.length -11);
		    		 alert(menu);
		    	
		    		    var startDate = new Date(Date.parse(menu));
    			 	var currentDate = new Date(startDate.getTime());
    			 	alert(currentDate);
    			 	dates.push(currentDate);
    			 
		    	}
		    	alert(dates);
		    	jQuery('#datepicker').datepicker({
		            beforeShowDay: function( date ) {
		                var highlight = dates[date];
		                if( highlight ) {
		                     return [true, "event", highlight];
		                } else {
		                     return [true, '', ''];
		                }
		             }
		        });
		    
		    },
		    error : function(e) {		    	
		       alert('Error: ' + e);
		    }
		}); 
  })
		   
  </script>

<script type="text/javascript">

$(document).ready(function() {
    $('#example').DataTable();
} );



</script>

</head>
<body >

<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Title</th>
                <th>Date</th>
                <th>Description</th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th>Title</th>
                <th>Date</th>
                <th>Description</th>
            </tr>
        </tfoot>
 
        <tbody>
        <c:forEach var="holiday" items="${holidayList}">
            <tr>
  
	                <td>${holiday.holidayTitle}</td>
	                <td>${holiday.holidayDate}</td>
	                <td>${holiday.holidayDescription}</td>
            	
            </tr>
         </c:forEach>
         </tbody>
</table>
<p>Date: <input type="text" id="datepicker"></p>
</body>
</html>

