<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Create a polyline using Geolocation and Google Maps API</title>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
     <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <style type="text/css">
     #stopList{
   
        margin-top: -400px; 
        left: 813px; 
        width: 495px; 
        height: 394px;
        position: absolute
     }
    
    </style>
    <script>
      $(document).ready(function() {
        // If the browser supports the Geolocation API
        if (typeof navigator.geolocation == "undefined") {
          $("#error").text("Your browser doesn't support the Geolocation API");
          return;
        }
        // Save the positions' history
        var path = [];

        var array =  "${coordinateList}".split(",");
        
      
        for(var i=0,j=1;i < array.length-1;i++,j++){
        	 path.push(new google.maps.LatLng(array[i], array[j]));
        	 j=j+1;
        	 i=i+1;
        }
        navigator.geolocation.watchPosition(function(position) {
          // Save the current position
        	 /* if(array.length == 1){
        		   alert("current zero");
        		 navigator.geolocation.getCurrentPosition(function(position) {
        			 path.push(new google.maps.LatLng(position.coords.latitude, position.coords.longitude));
        	      }, function(error) {
        	        alert('Unable to get location: ' + error.message);
        	});
        		
        
             } */

          // Create the map
          var myOptions = {
            zoom : 16,
            center : path[0],
            mapTypeId : google.maps.MapTypeId.ROADMAP
          }
          var map = new google.maps.Map(document.getElementById("map"), myOptions);
        
          
          /* for(var i=0;i< array.length;i++){
        	alert("array"+array[0].stopName);
              
          } */
         // Uncomment this block if you want to set a path

         /* path.push(
              new google.maps.LatLng(
                position.coords.latitude + (Math.random() / 10 * ((i % 2) ? 1 : -1)),
                position.coords.longitude 
              )
            ); */
          // Create the polyline's points
         /*  for(var i = 0; i < 5; i++) {
            // Create a random point using the user current position and a random generated number.
            // The number will be once positive and once negative using based on the parity of i
            // and to reduce the range the number is divided by 10
            path.push(
              new google.maps.LatLng(
                position.coords.latitude + (Math.random() / 10 * ((i % 2) ? 1 : -1)),
                position.coords.longitude + (Math.random() / 10 * ((i % 2) ? 1 : -1))
              )
            );
          } */
          

          // Create the array that will be used to fit the view to the points range and
          // place the markers to the polyline's points
          var latLngBounds = new google.maps.LatLngBounds();
          for(var i = 0; i < path.length; i++) {
            latLngBounds.extend(path[i]);
            // Place the marker
            new google.maps.Marker({
              map: map,
              position: path[i],
              title: "Point " + (i + 1)
            });
          }
          // Creates the polyline object
          var polyline = new google.maps.Polyline({
            map: map,
            path: path,
            strokeColor: '#0000FF',
            strokeOpacity: 0.7,
            strokeWeight: 1
          });
          // Fit the bounds of the generated points
          map.fitBounds(latLngBounds);
        },
        function(positionError){
          $("#error").append("Error: " + positionError.message + "<br />");
        },
        {
          enableHighAccuracy: true,
          timeout: 10 * 1000 // 10 seconds
        });
      });
    </script>
    <style type="text/css">
      #map {
        width: 500px;
        height: 400px;
        margin-top: 10px;
      }
    </style>
  </head>
  <body>
  
    <h1>Create a polyline</h1>
    <div id="map">
    
    </div>
    <div id="stopList">
    <table id="routeDataTable" class="table table-striped table-bordered"
		cellspacing="0" width="100%">
		<thead>
			<tr>
			
				<th>Stop No</th>
				<th>Name</th>
				<th>Latitude</th>
				<th>Longitude</th>
				<th>Edit Stop</th>
			</tr>
		</thead>

		<tfoot>
			<tr>
				
			    <th>Stop No</th>
				<th>Name</th>
				<th>Latitude</th>
				<th>Longitude</th>
				<th>Edit Stop</th>

			</tr>
		</tfoot>

		<tbody>
			<c:forEach var="stop" items="${stopList}">
				<tr>
				   
				   <td>${stop.stopNo}</td>  
				   <td>${stop.stopName}</td> 
				   <td>${stop.latitude}</td> 
				   <td>${stop.longitude}</td> 
				   <td><input type="button" value="Edit" onclick="editRoute()"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
    <p id="error"></p>

  </body>
</html>