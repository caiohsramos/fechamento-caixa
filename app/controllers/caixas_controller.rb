class CaixasController < ApplicationController
  before_action :set_caixa, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "user", password: "1234", except: :destroy
  http_basic_authenticate_with name: "admin", password: "1234", only: :destroy

  # GET /caixas
  # GET /caixas.json
  def index
    @caixas = Caixa.order(:data)
  end

  # GET /caixas/1
  # GET /caixas/1.json
  def show
  end

  # GET /caixas/new
  def new
    @caixa = Caixa.new
  end

  # GET /caixas/1/edit
  def edit
  end

  # POST /caixas
  # POST /caixas.json
  def create
    @caixa = Caixa.new(caixa_params)

    respond_to do |format|
      if @caixa.save
        format.html { redirect_to @caixa, notice: 'Caixa registrado' }
        format.json { render :show, status: :created, location: @caixa }
      else
        format.html { render :new }
        format.json { render json: @caixa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caixas/1
  # PATCH/PUT /caixas/1.json
  def update
    respond_to do |format|
      if @caixa.update(caixa_params)
        format.html { redirect_to @caixa, notice: 'Caixa atualizado.' }
        format.json { render :show, status: :ok, location: @caixa }
      else
        format.html { render :edit }
        format.json { render json: @caixa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caixas/1
  # DELETE /caixas/1.json
  def destroy
    @caixa.destroy
    respond_to do |format|
      format.html { redirect_to caixas_url, notice: 'Caixa deletado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caixa
      @caixa = Caixa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caixa_params
      params.require(:caixa).permit(:nome, :dinheiro, :troco_final, :troco_inicial, :cartao, :despesas, :data)
    end
end
