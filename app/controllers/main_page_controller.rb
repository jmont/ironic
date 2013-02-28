class MainPageController < ApplicationController

  def index
    @confessions = Confession.paginate(:page => params[:page], :per_page => 10)
    logger.debug @confessions.first
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @confessions }
    end
  end

end
