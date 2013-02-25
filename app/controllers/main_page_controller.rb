class MainPageController < ApplicationController

  def index
    @confessions = Confession.paginate(:page => params[:page], :per_page => 30)
  end

end
