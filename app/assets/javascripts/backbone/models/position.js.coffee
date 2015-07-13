class App.Models.Position extends Backbone.Model

  xPos: ->
    @get 'x_pos'

  yPos: ->
    @get 'y_pos'

  facingPos: ->
    @get 'facing'

  coordinates: ->
    "#{@xPos()},#{@yPos()}"

  glyphClass: ->
    pos =
      switch @facingPos()
        when 'north' then 'up'
        when 'east' then 'right'
        when 'south' then 'down'
        when 'west' then 'left'

    "glyphicon-chevron-#{pos}"
