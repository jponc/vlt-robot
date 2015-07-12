@App =
  Views: {}
  Routers: {}
  Collections: {}
  Models: {}

  initialize: ->
    Backbone.history.start()

declareNamespace = (ns, app) ->
  for key of app
    h = {}
    h[ns] = {}
    app[key] = _.extend app[key], h

declareNamespace 'Game', @App

$(document).ready ->
  App.initialize()

$(document).on 'page:load', ->
  Backbone.history.stop()
  App.initialize()
