module CommentsHelper
  # Determines whether to show 'comment' or 'comments'
  
  def comment_count_text(size)
    if size == 1
      "Comment"
    else 
      "Comments"
    end
  end

end
