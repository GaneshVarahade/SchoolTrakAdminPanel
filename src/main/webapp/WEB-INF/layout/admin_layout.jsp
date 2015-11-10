<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"  
"http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  

 
<!--   <meta charset="utf-8"> -->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
  <meta name="viewport" content="width=device-width, initial-scale=1">
  

    
         
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <script src= "https://ajax.googleapis.com/ajax/libs/angularjs/1.2.27/angular.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.27/angular-resource.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/list.jsp"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/bower_components/jquery/jquery.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/bower_components/moment/min/moment.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/bower_components/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/form/sky-forms.css" type="text/css" media="all">	
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" type="text/css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css" />
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/bower_components/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>  
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" />
<!-- mega menu -->
    <link href="${pageContext.request.contextPath}/resources/js/mainmenu/stickytwo.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/js/mainmenu/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/js/mainmenu/demo.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/js/mainmenu/menu.css" rel="stylesheet">





<!-- just remove the below comments witch color skin you want to use -->
   <link rel="stylesheet" href="css/colors/red.css" />
    <!--<link rel="stylesheet" href="css/colors/blue.css" />-->
    <!--<link rel="stylesheet" href="css/colors/cyan.css" />-->
    <!--<link rel="stylesheet" href="css/colors/orange.css" />-->
    <!--<link rel="stylesheet" href="css/colors/lightblue.css" />-->
    <!--<link rel="stylesheet" href="css/colors/pink.css" />-->
    <!--<link rel="stylesheet" href="css/colors/purple.css" />-->
    <!--<link rel="stylesheet" href="css/colors/bridge.css" />-->
    <!--<link rel="stylesheet" href="css/colors/slate.css" />-->
    <!--<link rel="stylesheet" href="css/colors/yellow.css" />-->
    <!--<link rel="stylesheet" href="css/colors/darkred.css" />-->

<!-- just remove the below comments witch bg patterns you want to use --> 
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-default.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-one.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-two.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-three.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-four.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-five.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-six.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-seven.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-eight.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-nine.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-ten.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-eleven.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-twelve.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-thirteen.css" />-->

</head>


<body>
	<table  cellpadding="2" cellspacing="2" align="center">
	    <tr>
	       <td width="20%" height="15%" colspan="2"><tiles:insertAttribute name="logo" /></td>
	    </tr>
		<tr>			
			<td width="80%" height="15%" colspan="2"><tiles:insertAttribute name="header" /></td>
		</tr>	
		<tr>
			<td width="20%" height="70%"><tiles:insertAttribute name="menu" /></td>
			<td width="80%" height="70%"><tiles:insertAttribute name="body" /></td>
		</tr>
		<tr>
			<td height="15%" colspan="2"><tiles:insertAttribute name="footer" /></td>
		</tr>
	</table>
</body>
</html>  