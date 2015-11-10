<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <script type="text/javascript">
var app = angular.module('formApp', []);
app.controller('formCtrl', function($scope) {
   
});
</script>
<body id="body">
<div id="formId" style="margin-top: 250px;">
<h2 style="text-align:center" >Login</h2>
<h4 style="background-color: thistle;text-align: center;margin-left: 232px;">${message}</h4> 
<form  method="post" action="j_spring_security_check" ng-app="formApp"  ng-controller="formCtrl" style="text-align:center" id="form" name="loginForm" novalidate method="post">
    <input type="text"  placeholder="Username" name="username"    ng-minlength=3  ng-maxlength=20 required /></br></br>
    <input type="password"  placeholder="Password" name="password"    ng-minlength=3  ng-maxlength=20 required /></br>
 <button type="submit"  id="login"  style="background-color: #0000ff; border-color: -moz-menuhover;">Login</button>
</form>
</div> --%>
﻿﻿<!doctype html>
<!--[if IE 7 ]>    <html lang="en-gb" class="isie ie7 oldie no-js"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en-gb" class="isie ie8 oldie no-js"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en-gb" class="isie ie9 no-js"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en-gb" class="no-js"> <!--<![endif]-->

<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<!-- <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="keywords" content="text/html" />
	<meta name="description" content="text/html" /> -->
    
    

    
 
	
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css" />
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome/css/font-awesome.min.css">
    
  


<!-- just remove the below comments witch bg patterns you want to use --> 
   <%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bg-patterns/pattern-default.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bg-patterns/pattern-one.css" /> 
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bg-patterns/pattern-two.css" />
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bg-patterns/pattern-three.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bg-patterns/pattern-four.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bg-patterns/pattern-five.css" />
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bg-patterns/pattern-six.css" /> --%>
  <!--    <link rel="stylesheet" href="css/bg-patterns/pattern-seven.css" />
    <link rel="stylesheet" href="css/bg-patterns/pattern-eight.css" />
    <link rel="stylesheet" href="css/bg-patterns/pattern-nine.css" />
    <link rel="stylesheet" href="css/bg-patterns/pattern-ten.css" />
    <link rel="stylesheet" href="css/bg-patterns/pattern-eleven.css" />
    <link rel="stylesheet" href="css/bg-patterns/pattern-twelve.css" />
    <link rel="stylesheet" href="css/bg-patterns/pattern-thirteen.css" />-->
    
    <!-- mega menu -->
    <link href="${pageContext.request.contextPath}/resources/js/mainmenu/stickytwo.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/js/mainmenu/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/js/mainmenu/demo.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/js/mainmenu/menu.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css" />
   
    
	
    <!-- forms -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/form/sky-forms.css" type="text/css" media="all">

<style>
#logo {
	margin-left: 454px;
    width: 309px;
    height: 104px;
}

#loginForm{
    margin-left: 480px;
    margin-top: 45px;
    
}
.inputForm{
    width: 277px;
    height: 41px;
    
}
.button{
    border-left-width: 0px;
    width: 108px;
    height: 27px;
    padding-left: 0px;
    margin-left: 67px;
    background-color : #F5BE0A;
}   

#message{

}

</style>

</head>

<body>



<div class="container">
   
	<div id="loginPage">
     <img src="${pageContext.request.contextPath}/resources/images/logo/schoolTrackLogo.png" id="logo">
      <div id="loginBox" >		
        <label id ="message" style = "margin-left: 553px; color: red" class="label col col-4">${message}</label>
			<form id="loginForm" action="${pageContext.request.contextPath}/loginAuth/authenticate" method="post">
			  
				<label style = "margin-left: -15; " class="label col col-4">Enter your Login ID and Password</label>
				<fieldset>		
				    <section>
						<div class="row">
							<label class="label col col-4">Account</label>
							<div class="col col-8">
								<label class="input">
									<input class="inputForm" type="text" name="account">
								</label>
							</div>
						</div>
					</section>			
					<section>
						<div class="row">
							<label class="label col col-4">User</label>
							<div class="col col-8">
								<label class="input">
									<input class="inputForm" type="text" name="username">
								</label>
							</div>
						</div>
					</section>
					
					<section>
						<div class="row">
							<label class="label col col-4">Password</label>
							<div class="col col-8">
								<label class="input">
									<input class="inputForm" type="password" name="password">
								</label>
								<!-- <div class="note"><a href="#sky-form2" class="modal-opener">Forgot password?</a></div> -->
							</div>
						</div>
					</section>
					
					<section>
						<div class="row">
							<div class="col col-4"></div>
							<div class="col col-8">
								<!-- <label class="checkbox"><input type="checkbox" name="remember" checked><i></i>Keep me logged in</label> -->
							</div>
						</div>
					</section>
				</fieldset>
				<footer>
					<div class="fright">
                    <!-- <a href="register.html" class="button button-secondary">Register</a> -->
                    <br>
                    <button type="submit" class="button" >Log in</button>
                    </div>
					
				</footer>
			</form>			
		</div>
        
		<form action="demo-recovery.php" id="sky-form2" class="sky-form sky-form-modal">
			<header>Password recovery</header>
			
			<fieldset>					
				<section>
					<label class="label">E-mail</label>
					<label class="input">
						<i class="icon-append icon-user"></i>
						<input type="email" name="email" id="email">
					</label>
				</section>
			</fieldset>
			
			<footer>
				<button type="submit" name="submit" class="button">Submit</button>
				<a href="#" class="button button-secondary modal-closer">Close</a>
			</footer>
				
			<div class="message">
				<i class="icon-ok"></i>
				<p>Your request successfully sent!<br><a href="#" class="modal-closer">Close window</a></p>
			</div>
		</form>

	</div>

</div><!-- end content area -->
<p  style="text-align:center; margin-top: 145px;">Copyright  2010-2015 FidelItServices.com</p>
</body>
</html>

