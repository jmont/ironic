class SmsController < ApplicationController

  def create 
    if !params[:Body].empty?
  	  c = Confession.new
  	  c.txt = params[:Body]
  	  c.save
  end
end
