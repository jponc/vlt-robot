class App.Views.Game.MainView extends Backbone.View
  el: '#game-main-container'
  template: JST['main_view']

  initialize: ->
    @model = vlt.robot
    @movesView = new App.Views.Game.MovesView(model: @model)
    @boardView = new App.Views.Game.BoardView(model: @model)
    @setupListeners()

  render: ->
    @$el.html(@template())
    @renderViews()
    @

  renderViews: ->
    @$('.moves-container').html(@movesView.render().$el)
    @movesView.afterShow()
    @$('.board-container').html(@boardView.render().$el)
    @boardView.renderIcon()

  setupListeners: ->
    console.log 'test'
