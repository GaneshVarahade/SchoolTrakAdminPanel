<!-- <style>
#userMenu{
  margin-left: 23px;
  margin-top: 40px;
}
</style>
<div id="userMenu" ng-app="userMenuApp" ng-controller="userMenuCtrl">
<input class="btn btn-primary btn-sm" type="button" value="Leave Apply" ng-click="leaveApply()" style="width: 140px"><br><br> 
<input class="btn btn-primary btn-sm" type="button" value="Leave Balance" ng-click="leaveBalance()" style="width: 140px"><br><br> 
<input class="btn btn-primary btn-sm" type="button" value="Holidays" ng-click="holidayList()" style="width: 140px"><br><br> 

</div>
<script>

 var app = angular.module('userMenuApp', []);
 app.controller('userMenuCtrl', ['$scope','$window',function($scope,$window) {
     $scope.leaveApply = function() {
        $window.location.href="leaveApply";
     };
     $scope.leaveBalance = function() {
         $window.location.href="leaveBalance";
     };
     $scope.holidayList = function() {
         $window.location.href="userHolidayList";
      };

          
}]);
 
 

</script> -->