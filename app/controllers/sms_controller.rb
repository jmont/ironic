class SmsController < ApplicationController

  def create 
  	confessions = Confessions.new
  	confessions.confession = params[:Body]
  	confessions.save
  	
  end
end
