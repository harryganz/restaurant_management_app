class WelcomeController < ApplicationController

  def index
    if logged_in?
      redirect_to orders_path
    end
  end
end
