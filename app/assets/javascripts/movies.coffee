# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# beautiful turbolinks
$(document).on 'turbolinks:load', ->
  $('#striped tr:even').addClass 'stripe1'
  $('#striped tr:odd').addClass 'stripe2'  
  return
