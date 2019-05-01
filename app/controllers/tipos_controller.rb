class TiposController < ApplicationController
  before_action :set_tipo, only: [:show, :edit, :update, :destroy]
  before_action :set_titulo

  @@titulo = I18n.t('model.tipo.titulo');

  # GET /tipos
  # GET /tipos.json
  def index
    @tipo = Tipo.new
    @tipos = Tipo.paginate(page: params[:page], per_page: @@per_page)
  end

  # GET /tipos/1
  # GET /tipos/1.json
  def show
  end

  # GET /tipos/new
  def new
    @tipo = Tipo.new
  end

  # GET /tipos/1/edit
  def edit
  end

  # POST /tipos
  # POST /tipos.json
  def create
    @tipo = Tipo.new(tipo_params)

    respond_to do |format|
      if @tipo.save
        format.html { redirect_to tipos_path,  notice: @@titulo + t('msg.salva') }
        format.json { render :show, status: :created, location: @tipo }
      else
        format.html { redirect_to tipos_path, alert: @tipo.errors.messages }
        format.json { render json: @tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipos/1
  # PATCH/PUT /tipos/1.json
  def update
    respond_to do |format|
      if @tipo.update(tipo_params)
        format.html { redirect_to @tipo, notice: @@titulo + t('msg.update') }
        format.json { render :show, status: :ok, location: @tipo }
      else
        format.html { render :edit }
        format.json { render json: @tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos/1
  # DELETE /tipos/1.json
  def destroy
    @tipo.destroy
    respond_to do |format|
      format.html { redirect_to tipos_url, notice: @@titulo + t('msg.remove') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo
      @tipo = Tipo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_params
      params.require(:tipo).permit(:descricao)
    end
end
