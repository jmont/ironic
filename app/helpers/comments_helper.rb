module CommentsHelper
  # Determines whether to show 'comment' or 'comments'
  
  def comment_count_text(size)
    if size == 1
      "Comment"
    else 
      "Comments"
    end
  end
  
  def view_comment_cookie(id)
    name = 'comment' + id.to_s()
    if !cookies[name].present? or cookies[name] == "0"
      cookies[name] = "0"
      return "Flag"
    else
      return "Unflag"
    end
  end

end
