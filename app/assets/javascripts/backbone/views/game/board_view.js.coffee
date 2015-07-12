class App.Views.Game.BoardView extends Backbone.View
  template: JST['board_view']

  render: ->
    @setElement(@template())
    @
