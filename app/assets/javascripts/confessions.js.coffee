# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  succ = ->
    alert ('succ!')

  err = (e) ->
    alert e

  submitComment = ->
    obj = { "comment": {"txt": $('#newCommentTxtArea').val()}}
    $.ajax({
        type: "POST",
        data: JSON.stringify(obj, null, 2),
        url: ('/confessions/' + $('.confession').data('id') + '/comments'),
        contentType: "application/json"
        dataType: "json",
        success: succ,
        error: err })

  init = ->
    $('#commentBtn').click submitComment

  init()