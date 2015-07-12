class App.Views.Game.MainView extends Backbone.View
  el: '#game-main-container'
  template: JST['main_view']

  initialize: ->
    @movesView = new App.Views.Game.MovesView
    @boardView = new App.Views.Game.BoardView

  render: ->
    @$el.html(@template())
    @renderViews()
    @

  renderViews: ->
    @$('.moves-container').html(@movesView.render().$el)
    @$('.board-container').html(@boardView.render().$el)
