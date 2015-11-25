 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%><head>
<div class="form-horizontal">
    <div class="row">
        <div class="col-lg-12">
            <div class="fixed-page-header">
                <div class="page-header clearfix">
                    <h1 class="page-head-text pull-left">Device</h1>    
                    <button type="submit" class="btn btn-inverse btn-sm pull-right" data-toggle="modal" data-target="#addExtintor"><i class="fa fa-plus-circle"></i>  Add Device</button>                    
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
                        <span class="panel-head">Device List</span>
                    </div>                                        
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table id="routeDataTable" class="table table-bordered table-striped table-hover">
                          <thead>
                            <tr>
                            	<th width="10%" class="text-center no-sort"><input type="checkbox" onClick="deleteAllRow(this)"></th>
                                <th width="10%">Device Id</th>
                                <th width="20%">Unique Id</th>
                                <th width="20%">Status</th>
                                <th width="30%">Description</th>
                                <th width="30%">AllowNotify</th>
                            </tr>
                          </thead>
                            <tbody>
                                <c:forEach var="device" items="${deviceList}">
                                    <tr>
                                       <td><input type="checkbox" id="${device.uniqueID}" name="myTextEditBox" value="" onClick="displayNote(event)"></td>
                                       <td>${device.deviceID}</td>  
                                       <td>${device.uniqueID}</td>  
                                       <c:choose>
                                        <c:when test="${device.isActive=='1'}">
                                        	<td>ON</td>
                                        </c:when>    
                                        <c:otherwise>
                                        	<td>OFF</td>
                                        </c:otherwise>
                                      </c:choose>
                                       <td>${device.description}</td> 
                                       <td>${device.allowNotify}</td> 
                                       <td><button type="submit" class="btn btn-default btn-sm" onClick="editDevice('${device.uniqueID}');"><i class="fa fa-pencil-square-o"></i> Edit</button></td>
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
            <h4 class="modal-title">Edit Extintor</h4>
          </div>
          <div class="modal-body">   
          	<div class="form-horizontal">
				<div class="form-group">
					<label class="col-sm-3 control-label">Extintor ID :</label>
                    <div class="col-sm-8">
						<input type="text" name="name" id="id" class="form-control" readOnly>
                  	</div>
				</div>			  
			  	<div class="form-group">
					<label class="col-sm-3 control-label">Extintor TYPE :</label>
                    <div class="col-sm-8">
						<input type="text" name="name" id="type" class="form-control">
                  	</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">Status</label>
                    <div class="col-sm-8">
						<select id="status" class="form-control">
                            <option value="1">ON</option>
                            <option value="0">OFF</option>
						</select>
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
			</div>
            
            <div class="modal-footer text-center">                
                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-sky btn-sm" onClick="editExtintor();">Save</button>
             </div>
    	</div>
  </div>
</div>
</div>


<div class="modal fade" id="addExtintor" tabindex="-1" role="dialog" aria-labelledby="delete-domain" aria-hidden="true">
   	<div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Add Device</h4>
          </div>            
          	<form:form id="registerForm" class="form-horizontal" method="post" name="registerForm" action="${pageContext.request.contextPath}/device/addDevice" commandName="device">
          	<div class="modal-body"> 
                <div class="form-group">
                    <form:label path="deviceID" class="col-sm-3 control-label">Device Id</form:label>
                    <div class="col-sm-8">
                    	<form:input path="deviceID" id="type"  class="form-control" />
                   	</div>
                </div>
                <div class="form-group">
                    <form:label path="uniqueID" class="col-sm-3 control-label">Unique Id</form:label>
                    <div class="col-sm-8">
                    	<form:input path="uniqueID" id="type"  class="form-control" />
                   	</div>
                </div>
    
                <div class="form-group">
                    <form:label path="isActive" class="col-sm-3 control-label">Status</form:label>
                    <div class="col-sm-8">
                        <form:select path="isActive" id="isActive" class="form-control">
                            <form:option value="1">ON</form:option>
                            <form:option value="0">OFF</form:option>
                        </form:select>
                   	</div>
                </div>
                <div class="form-group">
                    <form:label path="description" class="col-sm-3 control-label">Description</form:label>
                    <div class="col-sm-8">
                    	<form:input path="description" id="type"  class="form-control" />
                   	</div>
                </div>
                <div class="form-group">
                    <form:label path="allowNotify" class="col-sm-3 control-label">AllowNotify</form:label>
                    <div class="col-sm-8">
                        <form:select path="allowNotify" id="allowNotify" class="form-control">
                            <form:option value="1">YES</form:option>
                            <form:option value="0">NO</form:option>
                        </form:select>
                   	</div>
                </div>
    
           	</div>
			<div class="modal-footer text-center">
                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>                    
                <button type="submit" class="btn btn-sky btn-sm" />Save</button>
            </div>
         </form:form>
    	</div>
	</div>
</div>