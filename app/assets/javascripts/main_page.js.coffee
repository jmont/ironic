# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  replaceTextForTag = (txt) ->
    if txt && txt.match(/#\d+/g) != null
      tag = txt.match(/#\d+/g)[0]
      link = '<a href="confessions/'  +  tag.match(/\d+/g)[0] + '">' + tag + '</a>'
      txt = txt.replace(tag, link)
    txt

  renderTags = (className) ->
    $.each($(className), (i, v) ->
      txt =  $(this).html()
      $(this).html(replaceTextForTag(txt)))


  detailTemplate = '<div id="confessionTxtDetail">{{txt}}</div>
                    <div id="confCommentForm">
                      <textarea id="newCommentTxtArea" />
                      <div id="commentBtn" class="btn btn-success">Comment</div>
                    </div>
                    <div id="confComments"></div>'

  newConfessionTemplate = '<div id="newConfessionForm">
                       <br>Post Your Tufts Confession... </br></br>
                      <textarea id="newConfessionTxtArea" /></div>
                      <div id="confessBtn" class="btn btn-success">Post</div>
                    '

  postedComment = (c) ->
    $('#newCommentTxtArea').val('')
    $('#confComments').prepend('<div class="comment">' + c.txt + '<div class="created_at">'+ c.created_at + '</div></div>')

  didntPostComment = (e) -> alert 'Couln\'t sumbit confession!'

  submitComment = ->
    obj = { "comment": {"txt": $('#newCommentTxtArea').val()}}
    $.ajax({
        type: "POST",
        data: JSON.stringify(obj, null, 2),
        url: ('/confessions/' + $('.confession').data('id') + '/comments'),
        contentType: "application/json"
        dataType: "json",
        success: postedComment,
        error: didntPostComment })

  gotConfession = (confession) ->
    $('#mainDetailView').empty()
    $('#mainDetailView').append(Mustache.render(detailTemplate, confession))
    $('#commentBtn').click submitComment
    $('#confessionTxtDetail').html(confession.txt)
    for c in confession.comments
      $('#confComments').prepend('<div class="comment">' + replaceTextForTag(c.txt) + '<div class="created_at">'+ c.created_at + '</div></div>')

  render = ->
    $('#mainDetailView').empty()
    $('#mainDetailView').append(Mustache.render(newConfessionTemplate, confession))

  getConfessionDetails = ->
    $.ajax({
        url: ('/confessions/' + $(this).data('id')),
        contentType: "application/json"
        dataType: "json",
        success: gotConfession})

  init = ->
    $('.confession').click getConfessionDetails
    renderTags('.confession')

  init()
  getConfessionDetails()