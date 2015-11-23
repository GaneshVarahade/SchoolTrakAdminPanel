 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <head>
 <script src="https://cdn.datatables.net/1.10.10/js/.dataTables.min.js" type="text/javascript"></script>
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.10/css/.dataTables.min.css">
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
		 var result = confirm("want to delete?");
		 if(result){
			 window.location.href = "deleteNewsletterList?list="+saveKara;	 
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

 function editExtintors(id,type,status){
	 
	$("#id").val(id);
	$("#type").val(type);
	$("#status").val(status);
	$("#edit").modal('show');
	
	
}

 function editExtintor(){
	var id = $("#id").val();
	var type=$("#type").val();
	var status=$("#status").val();
	var busNo=$("#regNumber").val();
	 var allData=id+","+type+","+status+","+busNo;
	var formData="list="+allData;
	 $.ajax({
	    type : "POST",
	    url : "${pageContext.request.contextPath}/extintor/editExtintor",
	    data : formData,
	    success : function(response) {	 
	    	 $("#edit").modal('hide');
	       alert("Route Updated Successfully!");
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
	<button id="btn" class="button"
		type="submit" onClick="showBtn()">Delete</button>&nbsp;
	<button class="button" data-toggle="modal"
		data-id="" data-target="#addNewsletter">Add Newsletter</button>
		<hr style="border-top-width: 0px;">
	<table id="routeDataTable" class="table table-striped table-bordered"
		cellspacing="0" width="100%">
		<thead>
			<tr>
				<th></th>
				<th> News </th>
				<th>Date</th>

			</tr>
		</thead>

		<tfoot>
			<tr>
				<th></th>
				<th> News </th>
				<th>Date</th>

			</tr>
		</tfoot>

		<tbody>
			<c:forEach var="newsletter" items="${newsletterList}">
				<tr>
				   <td><input type="checkbox" id="${newsletter.id}" name="myTextEditBox" value="" onClick="displayNote(event)"></td>
				   <td>${newsletter.news}</td>  
				   <td>${newsletter.date}</td> 
				   
				  
				  </tr>
			</c:forEach>
		</tbody>
	</table>

	


	<div class="container">
		<div class="modal fade" id="addNewsletter" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Add Extintor</h4>
					</div>
					<div class="modal-body">
						<form:form id="registerForm" class="form-horizontal" method="post"
							name="registerForm" action="${pageContext.request.contextPath}/newsletter/addNewsletter" commandName="newsletter">
							<div class="form-group">
								<div class="container-fluid">
									<section class="container">
										<div class="container-page">
											<div class="col-md-6">
												<h3 class="dark-grey">Add NewsLetter</h3>

												
												<div>
													<form:label  path="news">News</form:label>
													<form:input  path="news" id="news"
														value="" class="form-control" />
												</div>
												
											
												
												
												</div> 
												
											</div>
										</div>
									</section>
								</div>
							</div>
							<div class="modal-footer">
						     <input class="button" type="submit" value="Push Notification"/>
					        </div>
						</form:form>
						
					</div>
					
				</div>
			</div>
		</div>

	</div>
	<script src="script.js" type="text/javascript" defer="defer"></script>
</body>

