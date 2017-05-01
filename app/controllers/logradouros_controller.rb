class LogradourosController < ApplicationController
  before_action :set_logradouro, only: [:show, :edit, :update, :destroy]

  # GET /logradouros
  # GET /logradouros.json
  def index

    if params[:q] and !params[:q].empty?
      query = params[:q]
      @logradouros = Logradouro.where("descricao LIKE ? ", "%#{query}%")
      @quadras = Quadra.all
      if @logradouros.empty?
        @logradouros = Logradouro.all
        @quadras = Quadra.all
        flash[:error] = 'Nenhum logradouro encontrado.'
      else
        flash[:error] = '';
      end
    else 
      @logradouros = Logradouro.all
      @quadras = Quadra.all
      flash[:error] = ''
    end
    
  end

  # GET /logradouros/1
  # GET /logradouros/1.json
  def show
  end

  # GET /logradouros/new
  def new
    @logradouros = Logradouro.all
    @quadras = Quadra.all
    @logradouro = Logradouro.new
  end

  # GET /logradouros/1/edit
  def edit
    @logradouros = Logradouro.all
    @quadras = Quadra.all
  end

  # POST /logradouros
  # POST /logradouros.json
  def create
    @logradouro = Logradouro.new(logradouro_params)

    respond_to do |format|
      if @logradouro.save
        format.html { redirect_to @logradouro, notice: 'Logradouro criado com sucesso.' }
        format.json { render :show, status: :created, location: @logradouro }
      else
        format.html { render :new }
        format.json { render json: @logradouro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logradouros/1
  # PATCH/PUT /logradouros/1.json
  def update
    respond_to do |format|
      if @logradouro.update(logradouro_params)
        format.html { redirect_to @logradouro, notice: 'Logradouro atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @logradouro }
      else
        format.html { render :edit }
        format.json { render json: @logradouro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logradouros/1
  # DELETE /logradouros/1.json
  def destroy
    @logradouro.destroy
    respond_to do |format|
      format.html { redirect_to logradouros_url, notice: 'Logradouro deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logradouro
      @logradouro = Logradouro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def logradouro_params
      params.require(:logradouro).permit(:descricao, :localizacao,
        :quadra_direita_id,:quadra_esquerda_id,
        :numeracao_direita, :numeracao_esquerda, :infraestrutura_existente)
    end
end
