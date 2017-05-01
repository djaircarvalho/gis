class RodoviaController < ApplicationController
  before_action :set_rodovium, only: [:show, :edit, :update, :destroy]

  # GET /rodovia
  # GET /rodovia.json
  def index
    if params[:q] and !params[:q].empty?
      query = params[:q]
      @rodovia = Rodovium.where("descricao LIKE ? ", "%#{query}%")
      if @rodovia.empty?
        @rodovia = Rodovium.all
        flash[:info] = 'Nenhuma rodovia encontrada.'
      else
        flash[:info] = '';
      end
    else 
      flash[:error] = '';
      @rodovia = Rodovium.all
    end
  end

  # GET /rodovia/1
  # GET /rodovia/1.json
  def show
  end

  # GET /rodovia/new
  def new
    @rodovium = Rodovium.new
  end

  # GET /rodovia/1/edit
  def edit
  end

  # POST /rodovia
  # POST /rodovia.json
  def create
    @rodovium = Rodovium.new(rodovium_params)

    respond_to do |format|
      if @rodovium.save
        format.html { redirect_to rodovia_url, notice: 'Rodovia criada com sucesso.' }
        format.json { render :show, status: :created, location: @rodovium }
      else
        format.html { render :new }
        format.json { render json: @rodovium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rodovia/1
  # PATCH/PUT /rodovia/1.json
  def update
    respond_to do |format|
      if @rodovium.update(rodovium_params)
        format.html { redirect_to rodovia_url, notice: 'Rodovia atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @rodovium }
      else
        format.html { render :edit }
        format.json { render json: @rodovium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rodovia/1
  # DELETE /rodovia/1.json
  def destroy
    @rodovium.destroy
    respond_to do |format|
      format.html { redirect_to rodovia_url, notice: 'Rodovia deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rodovium
      @rodovium = Rodovium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rodovium_params
      params.require(:rodovium).permit(:descricao, :geom)
    end
end
