class StaticPagesController < ApplicationController

  def home
    if logged_in?
      redirect_to '/events/1'
    end
  end

end
