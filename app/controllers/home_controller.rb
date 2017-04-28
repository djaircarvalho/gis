class HomeController < ApplicationController
  def index
  	@quadras = Quadra.all
  	@rios = Rio.all
  	@logradouros = Logradouro.all
  	@edificacaos = Edificacao.all
  	@lagos = Lago.all
  	@ferrovia = Ferrovium.all
  	@pontes = Ponte.all
  end
end
