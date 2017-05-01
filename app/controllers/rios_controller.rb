class RiosController < ApplicationController
  before_action :set_rio, only: [:show, :edit, :update, :destroy]

  # GET /rios
  # GET /rios.json
  def index
    if params[:q] and !params[:q].empty?
      query = params[:q]
      @rios = Rio.where("descricao LIKE ? ", "%#{query}%")
      if @rios.empty?
        @rios = Rio.all
        flash[:error] = 'Nenhum rio encontrado.'
      else
        flash[:error] = '';
      end
    else 
      @rios = Rio.all
      flash[:error] = ''
    end
  end

  # GET /rios/1
  # GET /rios/1.json
  def show
  end

  # GET /rios/new
  def new
    @rio = Rio.new
  end

  # GET /rios/1/edit
  def edit
  end

  # POST /rios
  # POST /rios.json
  def create
    @rio = Rio.new(rio_params)

    respond_to do |format|
      if @rio.save
        format.html { redirect_to rios_url, notice: 'Rio criado com sucesso.' }
        format.json { render :index, status: :created, location: @rio }
      else
        format.html { render :new }
        format.json { render json: @rio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rios/1
  # PATCH/PUT /rios/1.json
  def update
    respond_to do |format|
      if @rio.update(rio_params)
        format.html { redirect_to rios_url, notice: 'Rio alterado com sucesso.' }
        format.json { render :index, status: :ok, location: @rio }
      else
        format.html { render :edit }
        format.json { render json: @rio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rios/1
  # DELETE /rios/1.json
  def destroy
    @rio.destroy
    respond_to do |format|
      format.html { redirect_to rios_url, notice: 'Rio deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rio
      @rio = Rio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rio_params
      params.require(:rio).permit(:descricao, :geom)
    end
end
