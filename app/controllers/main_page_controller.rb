class MainPageController < ApplicationController

  def index
    @confessions = Confession.all(:order => "created_at DESC")
  end

end
