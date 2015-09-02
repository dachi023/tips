global.$ = global.jQuery = require 'jquery'
global.m = require 'mithril'
bootstrap = require 'bootstrap'
global.app =
  config:
    appName: 'tips poi'
    base: './'
    disp:
      index: ''
      qiita: 'Qiita'
  pages:
    index:
      controller: require './controller/index'
      view: require './view/index'
    qiita:
      controller: require './controller/qiita'
      view: require './view/qiita'
$ ->
  $('[data-toggle="tooltip"]').tooltip()
  $('head title').html app.config.appName
