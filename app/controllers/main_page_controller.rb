class MainPageController < ApplicationController

  def index
    @confessions = Confession.all
  end

end
