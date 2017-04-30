class QuadrasController < ApplicationController
  before_action :set_quadra, only: [:show, :edit, :update, :destroy]

  # GET /quadras
  # GET /quadras.json
  def index
     if params[:q] and !params[:q].empty?
      query = params[:q]
      @quadras = Quadra.where("descricao LIKE ? ", "%#{query}%")
    else 
      @quadras = Quadra.all
    end
  end

  # GET /quadras/1
  # GET /quadras/1.json
  def show
  end

  # GET /quadras/new
  def new
    @quadra = Quadra.new
  end

  # GET /quadras/1/edit
  def edit
  end

  # POST /quadras
  # POST /quadras.json
  def create
    @quadra = Quadra.new(quadra_params)
    respond_to do |format|
      if @quadra.save
        format.html { redirect_to quadras_url, notice: 'Quadra criada com sucesso.' }
        format.json { render :show, status: :created, location: @quadra }
      else
        format.html { render :new }
        format.json { render json: @quadra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quadras/1
  # PATCH/PUT /quadras/1.json
  def update
    respond_to do |format|
      if @quadra.update(quadra_params)
        format.html { redirect_to quadras_url, notice: 'Quadra atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @quadra }
      else
        format.html { render :edit }
        format.json { render json: @quadra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quadras/1
  # DELETE /quadras/1.json
  def destroy
    @quadra.destroy
    respond_to do |format|
      format.html { redirect_to quadras_url, notice: 'Quadra deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quadra
      @quadra = Quadra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quadra_params
      params.require(:quadra).permit(:descricao, :localizacao)
    end
end
