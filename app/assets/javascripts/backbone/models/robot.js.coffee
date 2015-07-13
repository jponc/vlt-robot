class App.Models.Robot extends Backbone.Model

  initialize: ->
    @currentPosition = new App.Models.Position(@get('current_position') || {})

  changePosition: (params) ->
    _.extend(params, {move_type: 'place'})
    $.ajax
      url: "/api/robots/#{@id}/change_position"
      method: 'POST'
      data:
        position: params
      success: @successCallback

  actionSelected: (action) ->
    $.ajax
      url: "/api/robots/#{@id}/action"
      method: 'POST'
      data:
        movement: action
      success: @successCallback

  successCallback: (resp) =>
    if resp.success
      @setNewPosition(resp.new_position)
      @trigger 'positionChanged'
    else
      alert "#{resp.errors.join(', ')}"

  setNewPosition: (positionAttributes) ->
    @currentPosition.clear()
    @currentPosition.set(positionAttributes)

  reportCoordinate: ->
    $.ajax
      url: "/api/robots/#{@id}/report"
      success: (resp) ->
        alert(resp.msg)
