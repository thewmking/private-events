class StaticPagesController < ApplicationController

  def home
    if logged_in?
      redirect_to '/events/3'
    end
  end

end
