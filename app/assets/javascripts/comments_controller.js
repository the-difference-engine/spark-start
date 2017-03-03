(function(){
  "use strict";

  angular.module("app").controller("commentsController", function($scope){


    $scope.showComment = false;
    $scope.showFirstComment = false;
    $scope.showForm = function(buttonId){
      $scope.showComment = buttonId;
      console.log(buttonId);
    };
    $scope.showFirst = function(){
      $scope.showFirstComment = !$scope.showFirstComment;
    };


  });
}());