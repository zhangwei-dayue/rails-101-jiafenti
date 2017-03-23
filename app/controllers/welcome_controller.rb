class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Welcome！"
  end
end
