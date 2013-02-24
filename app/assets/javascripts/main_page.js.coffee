# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  detailTemplate = '<div id="confessionTxtDetail">{{txt}}</div>
                    <div id="confCommentForm">
                      <textarea id="newCommentTxtArea" />
                      <div id="commentBtn" class="btn btn-success">Comment</div>
                    </div>
                    <div id="confComments"></div>'

  succ = (confession) ->
    $('#mainDetailView').empty()
    $('#mainDetailView').append(Mustache.render(detailTemplate, confession))
    $('#confessionTxtDetail').html(confession.txt)
    for c in confession.comments
      $('#confComments').prepend('<div class="comment">' + c.txt + '</div>')

  err = (e) ->
    alert e

  getConfessionDetails = ->
    $.ajax({
        url: ('/confessions/' + $(this).data('id')),
        contentType: "application/json"
        dataType: "json",
        success: succ,
        error: err })

  init = ->
    $('.confession').click getConfessionDetails

  init()