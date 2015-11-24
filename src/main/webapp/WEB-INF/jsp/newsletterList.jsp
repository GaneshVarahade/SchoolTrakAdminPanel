 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%><head>
 
<script type="text/javascript">
var saveKara = 0;

 
 $(document).on("click", ".open-AddBookDialog", function () {
	   
	    
	});


var saveKara = 0;

function showBtn(){

	 if(saveKara == 0){
		 alert("Please select Atleast one NewsLetter for delete");
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
		}
		else{
			saveKara = saveKara + id + ",";	
		}
	}

	function removeString(ch){
		ch = ch + ",";
		saveKara = saveKara.replace(ch,'');

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
                    <h1 class="page-head-text pull-left">Newsletter</h1>
                    <button type="submit" class="btn btn-inverse btn-sm pull-right" data-toggle="modal" data-target="#addNewsletter"><i class="fa fa-plus-circle"></i>  Add Newsletter</button>                    
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
                        <span class="panel-head">Newsletter List</span>
                    </div>                                        
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table id="routeDataTable" class="table table-bordered table-striped table-hover">
                          <thead>
                            <tr>
                            	<th width="10%" class="text-center no-sort"><input type="checkbox"></th>
                                <th width="60%">News</th>
                                <th width="30%">Date</th>
                            </tr>
                          </thead>
                            <tbody>
                                <c:forEach var="newsletter" items="${newsletterList}">
                                    <tr>
                                       <td class="text-center"><input type="checkbox" id="${newsletter.id}" name="myTextEditBox" value="" onClick="displayNote(event)"></td>
                                       <td>${newsletter.news}</td>  
                                       <td>${newsletter.date}</td> 
                                      
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

<div class="modal fade" id="addNewsletter" tabindex="-1" role="dialog" aria-labelledby="delete-domain" aria-hidden="true">
    <div class="modal-dialog">
    	<!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Add NewsLetter</h4>
            </div>
            <form:form id="registerForm" class="form-horizontal" method="post" name="registerForm" action="${pageContext.request.contextPath}/newsletter/addNewsletter" commandName="newsletter">
                <div class="modal-body">            
                    <div class="form-group">
                        <form:label path="news" class="col-sm-3 control-label">News</form:label>
                        <div class="col-sm-8">
                            <form:input path="news" id="news" value="" class="form-control" />
                        </div>
                    </div>
               	</div>
                <div class="modal-footer text-center">                
            		<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>
                  	<button type="submit" class="btn btn-sky btn-sm">Save</button>
                </div>
            </form:form>
        </div>
	</div>
</div>
					
<script src="script.js" type="text/javascript" defer="defer"></script>
