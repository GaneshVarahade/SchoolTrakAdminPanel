<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<title>Leave Apply</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script type="text/javascript">
  $(function() {
    $( "#leaveStart" ).datepicker({ dateFormat: 'yy-mm-dd' , minDate: 0});
    $( "#leaveEnd" ).datepicker( 
    		{
    		
    			inline:true,            
    	        showOtherMonths: true,
    	        minDate: 0,
    	        altField: "#leaveEnd",
    	        altFormat: "yy-mm-dd",
    	        dateFormat: "yy-mm-dd",
    			onSelect: function dateFunction(dateText){
    			  var start = $("#leaveStart" ).val();
    			  var end = $("#leaveEnd" ).val();
    		     var startDate = new Date(Date.parse(start));
    			 var currentDate = new Date(startDate.getTime());
    			  var endDate = new Date(Date.parse(end));
    			  var lastDate = new Date(endDate.getTime());
    			  if (currentDate > lastDate) {
    				    alert("The first date is after the second date!");
    				    $("#leaveStart" ).val("");
    				    $("#leaveEnd" ).val("");
    				    
    				}
    			  else{
    			  var between = [];
    			  while (currentDate <= lastDate) {			
    				    between.push(new Date(currentDate));
    				    currentDate.setDate(currentDate.getDate() + 1);
    				}
    		     var dates=[];
    		     for(var j=0;j < between.length;j++){
    		    	 var isDay = between[j].getDay();
    		    	 if(isDay == 0 || isDay == 6){
    		    		 
    		    	 }
    		    	 else{
    		    		 var day;
    		        	 var d = between[j].getDate();
    		        	 if(d<9){
    		        		 day = "0"+between[j].getDate()
    		        	 }
    		        	 else{
    		        		 day = between[j].getDate();
    		        	 }
    		        	 var month;
    		        	 var m = between[j].getMonth()+1;
    		        	 if(m<10){
    		        		 month = "0"+m;
    		        	 }
    		        	 else{
    		        		 month = between[j].getMonth()+1;
    		        	 }
    		    	      var year = between[j].getFullYear();	
    		        	  dates.push(year+"-"+month+"-"+day)	 
    		    	 }
    			  }
    			  var list = dates;
    			  var formData = "accessList="+list;
    			  $.ajax({
    				    type : "POST",
    				    url : "${pageContext.request.contextPath}/user/testMethod",
    				    data : formData,
    				    success : function(response) {	       
    				       $("#workingDays").val(response);
    				    },
    				    error : function(e) {
    				       alert('Error: ' + e);
    				    }
    				});     			
    			}}});
  });
  

 </script>

<div id="formId">
	<form action="${pageContext.request.contextPath}/user/leaveApply"
		data-toggle="validator" role="form" id="sky-form" class="form-horizontal" 
		class="sky-form">
		
	
		<div class="form-group">
			<div class="col-xs-3">
				<input type="text" class="form-control" id="leaveStart" name="leaveStart" placeholder="Leave From" required="required" readonly/>
			</div>
		</div>

		<div class="form-group">
			<div class="col-xs-3">
				<input type="text" class="form-control" id="leaveEnd" name="leaveEnd" placeholder="Leave To" required="required" readonly/>
			</div>
		</div>
	
		<div class="form-group">
			<div class="col-xs-3">
				<input type="text" class="form-control" id="workingDays" name="workingDays" placeholder="Working Days" required="required" readonly />
			</div>
		</div>

	
		
		<div class="span6">
        <textarea class="field span12" id="leaveReason" rows="3" name="leaveReason" placeholder="Reason" required="required"></textarea>
    </div>

		<div class="form-group">
			<div class="col-xs-3">
			<input class="btn btn-default" type="submit" value="Apply">
			</div>
		</div> 


			

	</form>
	
</div>