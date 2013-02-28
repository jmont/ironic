module MainPageHelper

  def show_comment(c) 
    if c.flags.nil? or c.flags < 5
      true
    else
      false
    end
  end

end
