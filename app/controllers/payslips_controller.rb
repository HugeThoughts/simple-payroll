class PayslipsController < ApplicationController

	before_action :authenticate_user! #, :except => [:index]
  def index
  	if current_user
     session[:email] = current_user.email
   	end
  end
  private
  def show

  end
end
