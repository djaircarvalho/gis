class HomeController < ApplicationController
  def index
  	@quadras = Quadra.all
  	@rios = Rio.all
  	@logradouros = Logradouro.all
  end
end
