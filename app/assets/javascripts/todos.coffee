# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#new-todo').click (event) ->
    event.preventDefault()
    $('#new_todo_form').toggle()

$(document).on 'click', '.delete-todo-button',  (event) ->
  event.preventDefault()
  new DeleteTodo($(@.form))