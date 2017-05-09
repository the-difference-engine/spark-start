(function() {
  "user strict";

  angular.module("app").controller("profile", function($scope){

    $scope.deleteImage = function(image){
      image.destroy;

    };
  });
}());