class SmsController < ApplicationController

  def create 
  	confessions = Confessions.new(params[:Body])
  	confessions.save
  end
end
