class SmsController < ApplicationController

  def create 
  	confessions = Confession.new(params[:Body])
  	confessions.save
  end
end
