'use strict'

angular.module("appName", [
  'restangular'
  'ui.router'
  'ui.bootstrap'
])
.config ($urlRouterProvider, $httpProvider, $stateProvider, RestangularProvider)->

  RestangularProvider.setBaseUrl('/api')
  RestangularProvider.setDefaultHeaders({'Content-Type':'application/json'})

  $urlRouterProvider.otherwise "/"
  # $httpProvider.interceptors.push('authInterceptor')
  # $httpProvider.interceptors.push('errorInterceptor')

  $stateProvider
  .state 'anon',
    template: "<ui-view/>"
    abstract: true
    data:
      access: 'anon'
  .state 'anon.login',
    url: "/login"
    templateUrl: "modules/auth/login.html"
    controller: 'LoginCtrl'

  .state 'app.logout',
    url: "/logout"
    controller: 'LogoutCtrl'

  .state 'app',
    url: '/'
    template: "<ui-view/>"
    abstract: true
  .state 'app.index',
    url: ""
    templateUrl: "modules/core/app.html"
    controller: 'ApplicationCtrl'


.run ($rootScope, $state)->
  console.log "Hello World!"
