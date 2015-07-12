class App.Routers.Game extends Backbone.Router

  initialize: ->
    @mainView = new App.Views.Game.MainView
    @mainView.render()
