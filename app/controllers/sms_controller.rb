class SmsController < ApplicationController

  def create 
  	c = Confession.new
  	c.txt = params[:Body]
  	c.save
  end
end
