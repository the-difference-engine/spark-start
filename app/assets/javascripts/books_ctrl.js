(function(){
  "use strict";

  angular.module("app").controller("booksCtrl", function($scope){



    $scope.tabs = [
            {title: 'Question One',
            url: 'one.tpl.html'
        }, {
            title: 'Question Two',
            url: 'two.tpl.html'
        }, {
            title: 'Question Three',
            url: 'q3.tpl.html'
        }
            ];

    $scope.currentTab = 'one.tpl.html';

    $scope.onClickTab = function(tab) {
        $scope.currentTab = tab.url;
    }
    
    $scope.isActiveTab = function(tabUrl) {
        return tabUrl == $scope.currentTab;
    }

    window.scope = $scope;
  });
}());