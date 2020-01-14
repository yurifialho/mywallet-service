class ContasController < ApplicationController
  before_action :set_conta, only: [:show, :edit, :update, :destroy]
  before_action :set_titulo

  @@titulo = I18n.t('model.conta.titulo');

  # GET /conta
  # GET /conta.json
  def index
    @conta = Conta.new
    @contas = Conta.paginate(page: params[:page], per_page: @@per_page)
  end

  # GET /conta/1
  # GET /conta/1.json
  def show
  end

  # GET /conta/new
  def new
    @conta = Conta.new    
  end

  # GET /conta/1/edit
  def edit
    respond_to do |format|
      format.js {render layout: false}
    end
  end

  # POST /conta
  # POST /conta.json
  def create
    @conta = Conta.new(conta_params)

    respond_to do |format|
      if @conta.save
        format.html { redirect_to contas_path, notice: @@titulo + t('msg.salva')}
        format.json { render :index, status: :created, location: @conta }
      else
        format.html { redirect_to contas_path, alert: @conta.errors.messages }
        format.json { render json: @conta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conta/1
  # PATCH/PUT /conta/1.json
  def update
    respond_to do |format|
      if @conta.update(conta_params)
        format.html { redirect_to @conta, notice: @@titulo + t('msg.update') }
        format.json { render :show, status: :ok, location: @conta }
      else
        format.html { render :edit }
        format.json { render json: @conta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conta/1
  # DELETE /conta/1.json
  def destroy
    @conta.destroy
    params[:id] = nil
    respond_to do |format|
      format.html { redirect_to contas_path, notice: @@titulo + t('msg.remove') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conta
      @conta = Conta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conta_params
      params.require(:conta).permit(:nome)
    end
end
