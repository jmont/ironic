class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #before_filter :log_ram # or use after_filter
  #def log_ram
  #  logger.warn 'RAM USAGE: ' + `pmap #{Process.pid} | tail -1`[10,40]
  #end
end
