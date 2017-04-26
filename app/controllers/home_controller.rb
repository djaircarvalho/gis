class HomeController < ApplicationController
  def index
  	@quadras = Quadra.all
  	@rios = Rio.all
  end
end
