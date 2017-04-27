class LagosController < ApplicationController
  before_action :set_lago, only: [:show, :edit, :update, :destroy]

  # GET /lagos
  # GET /lagos.json
  def index
    @lagos = Lago.all
  end

  # GET /lagos/1
  # GET /lagos/1.json
  def show
  end

  # GET /lagos/new
  def new
    @lago = Lago.new
  end

  # GET /lagos/1/edit
  def edit
  end

  # POST /lagos
  # POST /lagos.json
  def create
    @lago = Lago.new(lago_params)

    respond_to do |format|
      if @lago.save
        format.html { redirect_to @lago, notice: 'Lago was successfully created.' }
        format.json { render :show, status: :created, location: @lago }
      else
        format.html { render :new }
        format.json { render json: @lago.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lagos/1
  # PATCH/PUT /lagos/1.json
  def update
    respond_to do |format|
      if @lago.update(lago_params)
        format.html { redirect_to @lago, notice: 'Lago was successfully updated.' }
        format.json { render :show, status: :ok, location: @lago }
      else
        format.html { render :edit }
        format.json { render json: @lago.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lagos/1
  # DELETE /lagos/1.json
  def destroy
    @lago.destroy
    respond_to do |format|
      format.html { redirect_to lagos_url, notice: 'Lago was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lago
      @lago = Lago.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lago_params
      params.require(:lago).permit(:geom)
    end
end
