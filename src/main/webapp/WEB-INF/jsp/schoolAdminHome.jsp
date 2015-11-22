<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="container-fluid">
    <div class="page-dashboard">
        <div class="row">
            <div class="col-md-2 col-md-offset-1 col-sm-3">
           		<a href="${pageContext.request.contextPath}/route/routeMap" class="menu-link">
                    <div class="menu-block m-block1">
                        <div class="menu-icon"><i class="fa fa-map-marker"></i></div>
                        <div class="menu-name">Routes</div>
                    </div>
                </a>
            </div>
            
            <div class="col-md-2 col-sm-3">
            	<a href="${pageContext.request.contextPath}/schoolAdmin/parentList" class="menu-link">
                    <div class="menu-block m-block2">
                        <div class="menu-icon"><i class="fa fa-users"></i></div>
                        <div class="menu-name">Parents</div>
                    </div>
                </a>
            </div>
            
            <div class="col-md-2 col-sm-3">
            	<a href="${pageContext.request.contextPath}/schoolAdmin/studentList" class="menu-link">
                    <div class="menu-block m-block3">
                        <div class="menu-icon"><i class="fa fa-male"></i></div>
                        <div class="menu-name">Students</div>
                    </div>
                </a>
            </div>
            
            <div class="col-md-2 col-sm-3">
            	<a href="${pageContext.request.contextPath}/route/busList" class="menu-link">
                    <div class="menu-block m-block4">
                        <div class="menu-icon"><i class="fa fa-bus"></i></div>
                        <div class="menu-name">Bus</div>
                    </div>
                </a>
            </div>
            
            <div class="col-md-2 col-md-offset-0 col-sm-3 col-sm-offset-5">
               <a href="${pageContext.request.contextPath}/route/driverList" class="menu-link">
                    <div class="menu-block m-block5">
                        <div class="menu-icon"><i class="fa fa-user"></i></div>
                        <div class="menu-name">Driver</div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>