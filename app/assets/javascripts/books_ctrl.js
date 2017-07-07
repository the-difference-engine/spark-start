(function(){
  "use strict";

  angular.module("app").controller("booksCtrl", ["$scope", "$http", function($scope, $http){
    $scope.book_id = window.book_id;
    $scope.getBookData = function() {
        $http({
            url: "/book/" + $scope.book_id,
            method: "GET"
        }).then(function(data) {
            console.log(data.data);
            $scope.question = data.data;
        })
    };

    $scope.getBookData();



    $scope.test = "testing"

    $scope.showQuestion = function(question) {
        $scope.questionSelected = true;
        console.log(question);
    };




    // $scope.tabs = [
    //         {title: 'Question One',
    //         url: 'one.tpl.html'
    //     }, {
    //         title: 'Question Two',
    //         url: 'two.tpl.html'
    //     }, {
    //         title: 'Question Three',
    //         url: 'q3.tpl.html'
    //     }
    //         ];

    // $scope.currentTab = 'one.tpl.html';

    // $scope.onClickTab = function(tab) {
    //     $scope.currentTab = tab.url;
    // }
    
    // $scope.isActiveTab = function(tabUrl) {
    //     return tabUrl == $scope.currentTab;
    // }

    window.scope = $scope;
  }]);
}());