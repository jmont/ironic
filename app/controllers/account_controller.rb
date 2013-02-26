class AccountController < ApplicationController
  before_filter :authenticate_account!

  def index
    
  end

end
