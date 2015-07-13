class App.Views.Game.BoardView extends Backbone.View
  templates:
    board: JST['board_view']
    icon: JST['icon_view']

  events:
    'click .square': 'squareClicked'

  initialize: ->
    @model.on 'positionChanged', @positionChanged, @

  render: ->
    @setElement(@templates.board())
    @

  squareClicked: ->
    @trigger 'squareClicked'

  positionChanged: ->
    @renderIcon()

  renderIcon: ->
    position = @model.currentPosition
    if !position.isNew()
      coords = position.coordinates()
      @$(".square[data-coord='#{coords}']").html(@templates.icon(position: position))
