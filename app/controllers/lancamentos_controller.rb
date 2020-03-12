class LancamentosController < ApplicationController
  before_action :set_lancamento, only: [:show, :edit, :update, :destroy]
  before_action :set_titulo

  @@titulo = I18n.t('model.lancamento.titulo')

  # GET /lancamentos
  # GET /lancamentos.json
  def index
    @lancamento = Lancamento.new
    @lancamentos = Lancamento.paginate(page: params[:page], per_page: @@per_page)
  end

  # GET /lancamentos/1
  # GET /lancamentos/1.json
  def show
  end

  # GET /lancamentos/new
  def new
    @lancamento = Lancamento.new
  end

  # GET /lancamentos/1/edit
  def edit
  end

  # POST /lancamentos
  # POST /lancamentos.json
  def create
    @lancamento = Lancamento.new(lancamento_params)

    respond_to do |format|
      if @lancamento.save
        format.html { redirect_to lancamentos_path,  notice: @@titulo + t('msg.salva') }
        format.json { render :show, status: :created, location: @lancamento }
      else
        format.html { redirect_to lancamentos_path, alert: @lancamento.errors.messages }
        format.json { render json: @lancamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lancamentos/1
  # PATCH/PUT /lancamentos/1.json
  def update
    respond_to do |format|
      if @lancamento.update(lancamento_params)
        format.html { redirect_to @lancamento, notice: @@titulo + t('msg.update') }
        format.json { render :show, status: :ok, location: @lancamento }
      else
        format.html { render :edit }
        format.json { render json: @lancamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lancamentos/1
  # DELETE /lancamentos/1.json
  def destroy
    @lancamento.destroy
    respond_to do |format|
      format.html { redirect_to lancamentos_url, notice: @@titulo + t('msg.remove') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lancamento
      @lancamento = Lancamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lancamento_params
      params.require(:lancamento).permit(:nome, :descricao, :valor, :data, :categoria_id, :tipo_id, :conta_id)
    end
end
