<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#projectStartDate" ).datepicker({dateFormat: 'yy-mm-dd'});
  });
  
  $(function() {
	    $( "#projectEndDate" ).datepicker({dateFormat: 'yy-mm-dd'});
	  });
  </script>
</head>

        
        <div class="page-container">
            <div id="page-wrapper" class="wrapper-fluid">
                <div class="container-fluid">
                    <form class="form-horizontal" action="${pageContext.request.contextPath}/admin/updateProject" method="post" modelAttribute="projectUpdateForm" role="form" >
                      
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="fixed-page-header">
                                    <div class="page-header clearfix">
                                        <h1 class="page-head-text pull-left">Edit Project</h1>
                                        <button type="button" class="btn btn-sky btn-sm pull-right" onClick="window.location.href='user-profile.html'"><i class="fa fa-save"></i> Save</button>
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
                                            <span class="panel-head">Project Details</span>
                                        </div>
                                    </div>
                                    <!-- /.panel-heading -->
                                    <div class="panel-body">
                                        <div class="row">
                                            
                                            <div class="col-lg-10 col-md-9 col-sm-8">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="col-sm-5 control-label">projectId</label>
                                                            <div class="col-sm-7">
                                                              
                                                              <input type="text"  value="${project.projectId}" name="projectId" placeholder="projectId"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="col-sm-5 control-label">projectName</label>
                                                            <div class="col-sm-7">
                                                              <input type="text"  value="${project.projectName}" name="projectName" placeholder="projectName"/>
                                                            </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="col-sm-5 control-label">projectDescription</label>
                                                            <div class="col-sm-7">
                                                              <input type="text"  id="projectDescription" value="${project.projectDescription}" name="projectDescription" placeholder="projectDescription"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="col-sm-5 control-label">projectTechnology</label>
                                                            <div class="col-sm-7">
                                                               <input type="text" class="form-control" id="projectTechnology" value="${project.projectTechnology}" name="projectTechnology" placeholder="projectTechnology"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                                                <div class="row">
                                                <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="col-sm-5 control-label">projectStartDate</label>
                                                            <div class="col-sm-7">
                                                              <input type="text"  id="projectStartDate" value="${project.projectStartDate}" name="projectStartDate" placeholder="projectStartDate"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                           
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="col-sm-5 control-label">projectEndDate</label>
                                                            <div class="col-sm-7">
                                                               <input type="text" class="form-control" id="projectEndDate" value="${project.projectEndDate}" name="projectEndDate" placeholder="projectEndDate"/>
                                                            </div>
                                                        </div>
                                                    </div>                                               
                                                </div>
                                                <div class="row">   
                                                     <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="col-sm-5 control-label">projectStatus</label>
                                                            <div class="col-sm-7">
                                                               <input type="text" class="form-control" id="projectStatus" value="${project.projectStatus}" name="projectStatus" placeholder="projectStatus"/>
                                                            </div>
                                                        </div>
                                                    </div>   
                                                </div>       
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="col-sm-5 control-label">clientId</label>
                                                            <div class="col-sm-7">
                                                              <input type="text" class="form-control" id="clientId" value="${project.client.clientId}" name="clientId" placeholder="clientId"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    
                                                </div>
                                                
                                                
                                    <div class="panel-footer text-center">
                                    	<input type="submit" class="btn btn-primary" value="Update">
                                    </div>
                                </div>
                            </div>
                        </div>
                    <!-- / row -->   
                    </div>
                    </div>
                    </div>
                   </div>
                    </form>
                </div>
            </div>
        	<!-- /#page-wrapper -->
 		</div>
        
   

</html> 

	
 	 		