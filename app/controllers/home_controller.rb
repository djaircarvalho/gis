class HomeController < ApplicationController
  def index
  	@quadras = Quadra.all
  	@rios = Rio.all
  	@logradouros = Logradouro.all
  	@edificacaos = Edificacao.all
  end
end
