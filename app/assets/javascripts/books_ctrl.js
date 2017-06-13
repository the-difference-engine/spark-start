(function(){
  "use strict";

  angular.module("app").controller("booksCtrl", function($scope){

    // function getQuestions() {
    //   $http.get('/api/v1/books.json').then(function(response){
    //     $scope.questions = response.data;
    //   });
    // }

    $scope.tabs = [{
            title: 'Question One',
            url: 'one.tpl.html'
        }, {
            title: 'Question Two',
            url: 'two.tpl.html'
        }, {
            title: 'Question Three',
            url: 'three.tpl.html'
    }];

    $scope.currentTab = 'one.tpl.html';

    $scope.onClickTab = function (tab) {
        $scope.currentTab = tab.url;
    }
    
    $scope.isActiveTab = function(tabUrl) {
        return tabUrl == $scope.currentTab;
    }

    window.scope = $scope;
  });
}());