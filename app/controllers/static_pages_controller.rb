class StaticPagesController < ApplicationController

  def home
    if logged_in?
      redirect_to '/events'
    end
  end

end
