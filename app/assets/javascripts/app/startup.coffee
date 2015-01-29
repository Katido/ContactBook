requirejs.config
  baseUrl: "assets"
  paths:
    'jquery': 'libs/jquery'
    'backbone': 'libs/backbone'
    'marrionette': 'libs/backbone.marionette'
    'underscore':'libs/underscore'
    'json2': "libs/json2"
    'text':'libs/text'
  shim:
    'jquery':
      exports: '$'
    'backbone':
      exports: 'backbone'
      deps: ['jquery','json2']
    'marrionette':
      exports: 'backbone.marrionette'
      deps: ['backbone', 'underscore']
    'underscore':
      exports: '_'

require ['marrionette'],(Marrionette)->
  MyApp = Marrionette.Application.extend(
    regions:
      'menu-region': '#menu-region'
      'page-region': '#content-region'
  )
  window.app = new MyApp({container: "#app"})
  window.app.start();