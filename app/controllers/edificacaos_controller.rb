class EdificacaosController < ApplicationController
  before_action :set_edificacao, only: [:show, :edit, :update, :destroy]

  # GET /edificacaos
  # GET /edificacaos.json
  def index

    if params[:q] and !params[:q].empty?
      query = params[:q]
      @edificacaos = Edificacao.where("descricao LIKE ? ", "%#{query}%")
      if @edificacaos.empty?
        @edificacaos = Edificacao.all
        flash[:error] = 'Nenhuma edificação encontrada.'
      else
        flash[:error] = ''
      end
    else 
      @edificacaos = Edificacao.all
      flash[:error] = ''
    end
  end

  # GET /edificacaos/1
  # GET /edificacaos/1.json
  def show
  end

  # GET /edificacaos/new
  def new
      @edificacaos = Edificacao.all
    @edificacao = Edificacao.new
  end

  # GET /edificacaos/1/edit
  def edit
  end

  # POST /edificacaos
  # POST /edificacaos.json
  def create
    @edificacao = Edificacao.new(edificacao_params)

    respond_to do |format|
      if @edificacao.save
        format.html { redirect_to edificacaos_url, notice: 'Edificação criada com sucesso.' }
        format.json { render :show, status: :created, location: @edificacao }
      else
        format.html { render :new }
        format.json { render json: @edificacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /edificacaos/1
  # PATCH/PUT /edificacaos/1.json
  def update
    respond_to do |format|
      if @edificacao.update(edificacao_params)
        format.html { redirect_to edificacaos_url, notice: 'Edificacao atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @edificacao }
      else
        format.html { render :edit }
        format.json { render json: @edificacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /edificacaos/1
  # DELETE /edificacaos/1.json
  def destroy
    @edificacao.destroy
    respond_to do |format|
      format.html { redirect_to edificacaos_url, notice: 'Edificacao deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edificacao
      @edificacao = Edificacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def edificacao_params
      params.require(:edificacao).permit(:descricao, :geom)
    end
end
