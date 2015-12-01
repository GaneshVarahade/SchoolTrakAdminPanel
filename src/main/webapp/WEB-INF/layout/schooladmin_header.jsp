<ul class="nav navbar-nav long">
	<li id="homeActive" class="active" onclick="homeActive()"><a href="${pageContext.request.contextPath}/schoolAdmin/home">Home</a></li>
	<li id="routesActive"   onclick="routesActive()"><a href="${pageContext.request.contextPath}/route/routeMap">Routes</a></li>
  	<li id="parentActive" ><a href="${pageContext.request.contextPath}/schoolAdmin/parentList">Parents</a></li>
	<li id="studentActive"><a href="${pageContext.request.contextPath}/schoolAdmin/studentList">Students</a></li>
	<li id="vehicleActive"><a href="${pageContext.request.contextPath}/route/busList">Vehicles</a></li>
 	<li id="driveractive"><a href="${pageContext.request.contextPath}/route/driverList">Drivers</a></li>
 	<li id="extintoractive"><a href="${pageContext.request.contextPath}/extintor/extintorList">Extintor</a></li>
 	<li id="newsSletteractive"><a href="${pageContext.request.contextPath}/newsletter/newsletterList">Newsletter</a></li>
 	<li id="deviceactive"><a href="${pageContext.request.contextPath}/device/deviceList">Device</a></li>
</ul>
<script type="text/javascript">
$(function(){
	if("${homeActive}" == 'homeActive'){
		$("#homeActive").addClass("active");
	}else if("${routesActive}" == 'routesActive'){
		$("#routesActive").addClass("active");
	}else if(("${parentActive}" == 'parentActive')){
		$("#parentActive").addClass("active");
	}else if(("${studentActive}" == 'studentActive')){
		$("#studentActive").addClass("active");
	}else if(("${vehicleActive}" == 'vehicleActive')){
		$("#vehicleActive").addClass("active");
	}else if(("${driveractive}" == 'driveractive')){
		$("#driveractive").addClass("active");
	}else if(("${extintoractive}" == 'extintoractive')){
		$("#extintoractive").addClass("active");
	}else if(("${newsSletteractive}" == 'newsSletteractive')){
		$("#newsSletteractive").addClass("active");
	}else if(("${deviceactive}" == 'deviceactive')){
		$("#deviceactive").addClass("active");
	}
	
})
</script>

