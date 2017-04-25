class RiosController < ApplicationController
  before_action :set_rio, only: [:show, :edit, :update, :destroy]

  # GET /rios
  # GET /rios.json
  def index
    @rios = Rio.all
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
        format.html { redirect_to @rio, notice: 'Rio was successfully created.' }
        format.json { render :show, status: :created, location: @rio }
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
        format.html { redirect_to @rio, notice: 'Rio was successfully updated.' }
        format.json { render :show, status: :ok, location: @rio }
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
      format.html { redirect_to rios_url, notice: 'Rio was successfully destroyed.' }
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
