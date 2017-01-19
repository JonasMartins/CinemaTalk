# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
highlight = (evt) ->
  $('#evtTarget').toggleClass 'highlighted'
  return
	$ ->
  $('#evtTarget').on 'mouseover mouseleave', highlight
  $('#evtTarget').on 'click', (evt) ->
    $('#evtTarget').off 'mouseover mouseleave', highlight
    $('#evtTarget').html '<p>You shut off the hover effect!</p>'
    return
  return
