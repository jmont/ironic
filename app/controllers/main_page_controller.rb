class MainPageController < ApplicationController

  def index
    @comments = Comment.all
  end

end
