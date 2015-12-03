 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%><head>
 
<script src="http://formvalidation.io/vendor/formvalidation/js/formValidation.min.js"></script>
<script src="http://formvalidation.io/vendor/formvalidation/js/framework/bootstrap.min.js"></script>
<script type="text/javascript">

function clearData() {
	 $('input').val('');
	 $('select').val('');
}

$(document).ready(function() {


    $('#routeDataTable').dataTable( {
        "aaSorting": [[1,'asc']],
         aoColumnDefs: [
                   {
                      bSortable: false,
                      aTargets: [ -1 ]
                   }
                 ]
      } );
} ); 

$(document).ready(function() {
	
	var arrayList='${extintorList}';
	if(arrayList.length==2){
		document.getElementById("deleteButton").disabled = true;  	
	}
	else
		{
		document.getElementById("deleteButton").enabled = true;  
		}
	
	
	 
    $('#registerForm').formValidation({
        framework: 'bootstrap',
        excluded: ':disabled',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	type: {
                validators: {
                    notEmpty: {
                        message: 'Extintor Type is required'
                    }
                }
            },
            
            status: {
                validators: {
                    notEmpty: {
                        message: 'Extintor is required'
                    }
                }
            },
            
            'bus.regNumber': {
                validators: {
                    notEmpty: {
                        message: 'Extintor is required'
                    }
                }
            }
            
        }
    });
    
    $('#editForm').formValidation({
        framework: 'bootstrap',
        excluded: ':disabled',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	type1: {
                validators: {
                    notEmpty: {
                        message: 'Extintor Type is required'
                    }
                }
            },
            
            status: {
                validators: {
                    notEmpty: {
                        message: 'Please select Status'
                    }
                }
            },
            
            regNumber: {
                validators: {
                    notEmpty: {
                        message: 'Please select Vehicle'
                    }
                }
            }
            
        }
    });
    
});

var saveKara = 0;

 
 $(document).on("click", ".open-AddBookDialog", function () {
	   
	    
	});

 
var saveKara = 0;

function showBtn(){

	 if(saveKara == 0){
		 alert("Please select Atleast one Extintor");
	 }
	 else{
		 var result = confirm("Are you sure, you want to delete extintor(s)?");
		 if(result){
			 window.location.href = "deleteExtintorList?list="+saveKara;	 
		 }
		 	 
	 }
	 
}



$(document).ready(function() {
    $('#routeDataTable').DataTable();
} );

function useHTML(id,data){
	 var id = "#" + id;
	var text = "";
	for (i = 0; i < data.length; i++) { 
		if(data[i] == "<"){
  	text += "<<span>";
		}else if(data[i] == ">"){
			text += "</span>>";
		}
		else{
			text += data[i];
		}
	}
	 $(id).val(text);
}



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

 function editExtintors(id,type,status,regNumber){
	$("#id").val(id);
	$("#type").val(type);
	$("#status1").val(status);
	$("#regNumber1").val(regNumber);
	$('#edit').modal({backdrop: 'static', keyboard: false});
	$("#edit").modal('show');
	
	
}

 function editExtintor(){
	var id = $("#id").val();
	var type=$("#type").val();
	var status=$("#status1").val();
	var busNo=$("#regNumber1").val();
	 var allData=id+","+type+","+status+","+busNo;
	var formData="list="+allData;
	 $.ajax({
	    type : "POST",
	    url : "${pageContext.request.contextPath}/extintor/editExtintor",
	    data : formData,
	    success : function(response) {	 
	    	 $("#edit").modal('hide');
	       alert("Extintor Updated Successfully!");
	       location.reload();
	      },
	    error : function(e) {
	    	$("#edit").modal('hide');
	    	 alert("Extintor Updated Successfully!");
		       location.reload();
	    	 
	      
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

	

	function deleteAllRow(source){  	
	 	 checkboxes = document.getElementsByName('myTextEditBox');
	 	  for(var i=0, n=checkboxes.length;i<n;i++) {
	 		var id = checkboxes[i].getAttribute('id' );
	 	    checkboxes[i].checked = source.checked;
	 	    if(source.checked){
	 	    malaDeleteKara(id);
	 	    }else{
	 	    	removeString(id);
	 	    }
	 	  }	
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
                    <h1 class="page-head-text pull-left">Extintor</h1>    
                    <button type="submit" class="btn btn-inverse btn-sm pull-right" data-toggle="modal" onclick="clearData()" data-target="#addExtintor"><i class="fa fa-plus-circle"></i>  Add Extintor</button>                    
                    <button type="submit" class="btn btn-brown btn-sm pull-right" id = "deleteButton" onClick="showBtn()" ><i class="fa fa-trash-o"></i> Delete</button>
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
                        <span class="panel-head">Extintor List</span>
                    </div>                                        
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table id="routeDataTable" class="table table-bordered table-striped table-hover">
                          <thead>
                            <tr>
                            	<th width="2%" class="text-center no-sort"><input type="checkbox" onClick="deleteAllRow(this)"></th>
                                <th width="20%">Extintor Type</th>
                                <th width="20%">Status</th>
                                <th width="20%">Vehicle Number</th>
                                <th width="20%">Action</th>
                            </tr>
                          </thead>
                            <tbody>
                                <c:forEach var="extintor" items="${extintorList}">
                                    <tr>
                                       <td><input type="checkbox" id="${extintor.id}" name="myTextEditBox" value="" onClick="displayNote(event)" style="width: 27px;"></td>
                                       <td>${extintor.type}</td>  
                                       <c:choose>
                                        <c:when test="${extintor.status==true}">
                                        	<td>ON</td>
                                        </c:when>    
                                        <c:otherwise>
                                        	<td>OFF</td>
                                        </c:otherwise>
                                      </c:choose>
                                       <td>${extintor.bus.regNumber}</td> 
                                       <td><button type="submit" class="btn btn-default btn-sm" onClick="editExtintors('${extintor.id}','${extintor.type}','${extintor.status}','${extintor.bus.regNumber}');"><i class="fa fa-pencil-square-o"></i> Edit</button></td>
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

<form id="editForm">
<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="delete-domain" aria-hidden="true">
   	<div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Edit Extintor</h4>
          </div>
          <div class="modal-body">   
          	<div class="form-horizontal">
				<div class="form-group">
					<label class="col-sm-3 control-label">* Extintor ID :</label>
                    <div class="col-sm-8">
						<input type="text" name="name" id="id" class="form-control" readOnly>
                  	</div>
				</div>			  
			  	<div class="form-group">
					<label class="col-sm-3 control-label">* Extintor TYPE :</label>
                    <div class="col-sm-8">
						<input type="text" name="type1" id="type" maxlength="50" class="form-control" onblur = "useHTML(this.id,document.getElementById('type').value)">
                  	</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label">* Status</label>
                    <div class="col-sm-8">
					 	<select name="status" id="status1" class="form-control" >
               			<option value="true">ON</option>
                        <option value="false">OFF</option>
                  </select>
					</div>						
				</div>
				
						
				<div class="form-group">
					<label class="col-sm-3 control-label">* Bus Number</label>
                    <div class="col-sm-8">
					 	<select name="regNumber" id="regNumber1" class="form-control" >  													
                            <c:forEach var="bus" items="${busList}">
                                <option value="${bus.regNumber}">${bus.regNumber}</option>
                            </c:forEach>
				 		</select> 
					</div>						
				</div>
			</div>
            
            <div class="modal-footer text-center">                
                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-sky btn-sm" onClick="editExtintor();">Save</button>
             </div>
    	</div>
  </div>
</div>
</div>
</form>

<div class="modal fade" id="addExtintor" tabindex="-1" role="dialog" aria-labelledby="delete-domain" aria-hidden="true">
   	<div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Add Extintor</h4>
          </div>            
          	<form:form id="registerForm" class="form-horizontal" method="post" name="registerForm" action="${pageContext.request.contextPath}/extintor/extintorList" commandName="extintor">
				      
          	<div class="modal-body"> 
                <div class="form-group">
                    <form:label path="type" class="col-sm-3 control-label">* Extintor Type</form:label>
                    <div class="col-sm-8">
                    	
                    	<form:input path="type" id="type1" value="" maxlength="50" class="form-control" onblur = "useHTML(this.id,document.getElementById('type1').value)"/>
                   	</div>
                </div>
    			
                <div class="form-group">
                    <form:label path="status" class="col-sm-3 control-label">* Status</form:label>
                    <div class="col-sm-8">
                        <form:select path="status" id="status" class="form-control">
                        	<option value="">Select</option>  
                            <form:option value="0">ON</form:option>
                            <form:option value="1">OFF</form:option>
                        </form:select>
                   	</div>
                </div>
    
                 <div class="form-group">
                    <form:label path="bus.regNumber" class="col-sm-3 control-label">* Vehicle Number</form:label>
                    <div class="col-sm-8">
                        <form:select path="bus.regNumber" name="regNumber" id="bus.regNumber" class="form-control">
                        	<form:option value="">Please select Bus</form:option>                    
                            <c:forEach var="bus" items="${busList}">
                                <form:option value="${bus.regNumber}">${bus.regNumber}</form:option>
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


