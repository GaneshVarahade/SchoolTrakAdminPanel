
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
     <!--  <a class="navbar-brand" href="#">WebSiteName</a> -->
    </div>
    <div class="collapse navbar-collapse" id="myNavbar" style="width: 1261px;">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${pageContext.request.contextPath}/schoolAdmin/home">Home</a></li>
        
        <li><a href="${pageContext.request.contextPath}/route/routeMap">Routes</a></li>
          <li><a href="${pageContext.request.contextPath}/schoolAdmin/parentList">Parents</a></li>
        <li><a href="${pageContext.request.contextPath}/schoolAdmin/studentList">Students</a></li>
        <li><a href="${pageContext.request.contextPath}/route/busList">Bus</a></li>
         <li><a href="${pageContext.request.contextPath}/route/driverList">Driver</a></li>
   
      </ul>
      <ul class="nav navbar-nav navbar-right">
       <!--  <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li> -->
        <li><a href="${pageContext.request.contextPath}/j_spring_security_logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      </ul> 
    </div>
  </div>
</nav>