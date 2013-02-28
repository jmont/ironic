class MainPageController < ApplicationController

  def index
    @confessions = Confession.paginate(:page => params[:page], :per_page => 20)
  end

end
