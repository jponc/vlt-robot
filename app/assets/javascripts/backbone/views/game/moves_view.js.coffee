class App.Views.Game.MovesView extends Backbone.View
  template: JST['moves_view']

  render: ->
    @setElement(@template())
    @
