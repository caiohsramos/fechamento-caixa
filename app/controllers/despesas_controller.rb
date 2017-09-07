class DespesasController < ApplicationController
  before_action :set_despesa, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "user", password: "1234", except: :destroy
  http_basic_authenticate_with name: "admin", password: "1234", only: :destroy

  # GET /despesas
  # GET /despesas.json
  def index
    respond_to do |format|
      format.html {@despesas = Despesa.where(caixa_id: params[:caixa_id])}
      format.csv { send_data Despesa.joins(:caixa).order('caixas.data ASC').to_csv, filename: "despesas-#{Date.today}.csv" }
    end
  end

  # GET /despesas/1
  # GET /despesas/1.json
  def show

  end

  # GET /despesas/new
  def new
    @despesa = Despesa.new
    @caixa = Caixa.find(params[:caixa_id])
  end

  # GET /despesas/1/edit
  def edit
    @caixa = Caixa.find(params[:caixa_id])
  end

  # POST /despesas
  # POST /despesas.json
  def create
    params[:despesa][:caixa_id] = params[:caixa_id]
    @despesa = Despesa.new(despesa_params)

    respond_to do |format|
      if @despesa.save
        format.html { redirect_to caixa_path(@despesa.caixa), notice: 'Despesa criada.' }
        format.json { render :show, status: :created, location: @despesa }
      else
        format.html do
          @caixa = Caixa.find(params[:caixa_id])
          render :new
        end
        format.json { render json: @despesa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /despesas/1
  # PATCH/PUT /despesas/1.json
  def update
    params[:despesa][:caixa_id] = params[:caixa_id]
    respond_to do |format|
      if @despesa.update(despesa_params)
        format.html { redirect_to caixa_path(@despesa.caixa), notice: 'Despesa atualizada.' }
        format.json { render :show, status: :ok, location: @despesa }
      else
        format.html { render :edit }
        format.json { render json: @despesa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /despesas/1
  # DELETE /despesas/1.json
  def destroy
    Despesa.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to caixa_path(@despesa.caixa), notice: 'Despesa deletada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_despesa
      @despesa = Despesa.find(params[:id])
      @caixa = Caixa.find(params[:caixa_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def despesa_params
      params.require(:despesa).permit(:nome, :valor,:caixa_id)
    end
end
