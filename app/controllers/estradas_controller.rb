class EstradasController < ApplicationController
  before_action :set_estrada, only: [:show, :edit, :update, :destroy]

  # GET /estradas
  # GET /estradas.json
  def index
    if params[:q] and !params[:q].empty?
      query = params[:q]
      @estradas = Estrada.where("descricao LIKE ? ", "%#{query}%")
      if @estradas.empty?
        @estradas = Estrada.all
        flash[:info] = 'Nenhuma estrada encontrada.'
      else
        flash[:info] = '';
      end
    else 
      flash[:error] = '';
      @estradas = Estrada.all
    end
  end

  # GET /estradas/1
  # GET /estradas/1.json
  def show
  end

  # GET /estradas/new
  def new
      @estradas = Estrada.all
    @estrada = Estrada.new
  end

  # GET /estradas/1/edit
  def edit
  end

  # POST /estradas
  # POST /estradas.json
  def create
    @estrada = Estrada.new(estrada_params)

    respond_to do |format|
      if @estrada.save
        format.html { redirect_to estradas_url, notice: 'Estrada criada com sucesso.' }
        format.json { render :show, status: :created, location: @estrada }
      else
        format.html { render :new }
        format.json { render json: @estrada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estradas/1
  # PATCH/PUT /estradas/1.json
  def update
    respond_to do |format|
      if @estrada.update(estrada_params)
        format.html { redirect_to estradas_url, notice: 'Estrada atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @estrada }
      else
        format.html { render :edit }
        format.json { render json: @estrada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estradas/1
  # DELETE /estradas/1.json
  def destroy
    @estrada.destroy
    respond_to do |format|
      format.html { redirect_to estradas_url, notice: 'Estrada deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estrada
      @estrada = Estrada.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estrada_params
      params.require(:estrada).permit(:descricao, :geom)
    end
end
