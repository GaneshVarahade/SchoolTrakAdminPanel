<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>  
<head>  
<title>Admin Page | www.beingjavaguys.com</title>  
</head>  
<body>  
 <div id="adminBody">
  <c:url value="${pageContext.request.contextPath}/j_spring_security_logout" var="logoutUrl" /> 
   <h2>Admin | You are now logged in</h2>  
  <h3><a href="/j_spring_security_logout">Logout</a></h3>  
 </div>  
</body>  
</html> 