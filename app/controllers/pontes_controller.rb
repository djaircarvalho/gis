class PontesController < ApplicationController
  before_action :set_ponte, only: [:show, :edit, :update, :destroy]

  # GET /pontes
  # GET /pontes.json
  def index
    if params[:q] and !params[:q].empty?
      query = params[:q]
      @pontes = Ponte.where("descricao LIKE ? ", "%#{query}%")
      if @pontes.empty?
        @pontes = Ponte.all
        flash[:error] = 'Nenhuma ponte encontrada.'
      else
        flash[:error] = '';
      end
    else 
      @pontes = Ponte.all
      flash[:error] = ''
    end
  end

  # GET /pontes/1
  # GET /pontes/1.json
  def show
  end

  # GET /pontes/new
  def new
    @ponte = Ponte.new
  end

  # GET /pontes/1/edit
  def edit
  end

  # POST /pontes
  # POST /pontes.json
  def create
    @ponte = Ponte.new(ponte_params)

    respond_to do |format|
      if @ponte.save
        format.html { redirect_to pontes_url, notice: 'Ponte criada com sucesso.' }
        format.json { render :show, status: :created, location: @ponte }
      else
        format.html { render :new }
        format.json { render json: @ponte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pontes/1
  # PATCH/PUT /pontes/1.json
  def update
    respond_to do |format|
      if @ponte.update(ponte_params)
        format.html { redirect_to pontes_url, notice: 'Ponte atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @ponte }
      else
        format.html { render :edit }
        format.json { render json: @ponte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pontes/1
  # DELETE /pontes/1.json
  def destroy
    @ponte.destroy
    respond_to do |format|
      format.html { redirect_to pontes_url, notice: 'Ponte deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ponte
      @ponte = Ponte.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ponte_params
      params.require(:ponte).permit(:descricao, :geom)
    end
end
