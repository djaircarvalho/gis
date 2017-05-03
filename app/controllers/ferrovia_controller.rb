class FerroviaController < ApplicationController
  before_action :set_ferrovium, only: [:show, :edit, :update, :destroy]

  # GET /ferrovia
  # GET /ferrovia.json
  def index
    if params[:q] and !params[:q].empty?
      query = params[:q]
      @ferrovia = Ferrovium.where("descricao LIKE ? ", "%#{query}%")
      if @ferrovia.empty?
        @ferrovia = Ferrovium.all
        flash[:info] = 'Nenhuma ferrovia encontrada.'
      else
        flash[:info] = '';
      end
    else 
       flash[:error] = '';
       @ferrovia = Ferrovium.all
    end
   
  end

  # GET /ferrovia/1
  # GET /ferrovia/1.json
  def show
  end

  # GET /ferrovia/new
  def new
       @ferrovia = Ferrovium.all
    @ferrovium = Ferrovium.new
  end

  # GET /ferrovia/1/edit
  def edit
  end

  # POST /ferrovia
  # POST /ferrovia.json
  def create
    @ferrovium = Ferrovium.new(ferrovium_params)

    respond_to do |format|
      if @ferrovium.save
        format.html { redirect_to ferrovia_url, notice: 'Ferrovia criada com sucesso.' }
        format.json { render :show, status: :created, location: @ferrovium }
      else
        format.html { render :new }
        format.json { render json: @ferrovium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ferrovia/1
  # PATCH/PUT /ferrovia/1.json
  def update
    respond_to do |format|
      if @ferrovium.update(ferrovium_params)
        format.html { redirect_to ferrovia_url, notice: 'Ferrovia atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @ferrovium }
      else
        format.html { render :edit }
        format.json { render json: @ferrovium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ferrovia/1
  # DELETE /ferrovia/1.json
  def destroy
    @ferrovium.destroy
    respond_to do |format|
      format.html { redirect_to ferrovia_url, notice: 'Ferrovia deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ferrovium
      @ferrovium = Ferrovium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ferrovium_params
      params.require(:ferrovium).permit(:descricao, :geom)
    end
end
