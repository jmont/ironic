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

  succ = (confession) ->
    $('#mainDetailView').empty()
    $('#mainDetailView').append(Mustache.render(detailTemplate, confession))
    $('#confessionTxtDetail').html(confession.txt)
    for c in confession.comments
      $('#confComments').prepend('<div class="comment">' + replaceTextForTag(c.txt) + '</div>')

  getConfessionDetails = ->
    $.ajax({
        url: ('/confessions/' + $(this).data('id')),
        contentType: "application/json"
        dataType: "json",
        success: succ})

  init = ->
    $('.confession').click getConfessionDetails
    renderTags('.confession')
    
  init()