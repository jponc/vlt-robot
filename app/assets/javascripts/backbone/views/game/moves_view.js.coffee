class App.Views.Game.MovesView extends Backbone.View
  template: JST['moves_view']

  events:
    'submit .change-position-form': 'changePositionForm'
    'click .possible-action-container .btn': 'actionSelected'

  initialize: ->
    @setupListeners()

  render: ->
    @setElement(@template())
    @

  setupListeners: ->
    @model.on 'positionChanged', @positionChanged, @

  positionChanged: ->
    @hidePlaceForm()

  afterShow: ->
    coordinates = [{id: '0', text: '0'}, {id: '1', text: '1'},  {id: '2', text: '2'}, {id: '3', text: '3'}, {id: '4', text: '4'}]

    @$('.coords-input').select2
      data: coordinates

    facingData = [{id: 'north', text: 'North'}, {id: 'east', text: 'East'}, {id: 'south', text: 'South'}, {id: 'west', text: 'West'}]
    @$('#facing-input').select2
      data: facingData

  changePositionForm: (event) ->
    event.preventDefault()
    params = $(event.currentTarget).serializeObject()
    @model.changePosition(params)

  actionSelected: (event) ->
    action = $(event.currentTarget).data('action')
    if action is 'place'
      @showPlaceForm()
    else if action is 'report'
      @model.reportCoordinate()
    else
      @model.actionSelected(action)

  showPlaceForm: ->
    @$('.place-container').show()

  hidePlaceForm: ->
    @$('.place-container').hide()
