(function(){
  "use strict";

  angular.module("app").controller("booksCtrl", function($scope, $http){
    $scope.setup = function() {
      getQuestions();
    };

    function getQuestions() {
      $http.get('/api/v1/books.json').then(function(response){
        $scope.questions = response.data;
      });
    }

    $scope.tabs = [{
            title: 'One',
            url: 'one.tpl.html'
        }, {
            title: 'Two',
            url: 'two.tpl.html'
        }, {
            title: 'Three',
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