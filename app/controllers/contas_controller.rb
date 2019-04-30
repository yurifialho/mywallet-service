class ContasController < ApplicationController
  before_action :set_conta, only: [:show, :edit, :update, :destroy]

  # GET /conta
  # GET /conta.json
  def index
    @conta = Conta.paginate(page: params[:page], per_page: 5)
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
  end

  # POST /conta
  # POST /conta.json
  def create
    @conta = Conta.new(conta_params)

    respond_to do |format|
      if @conta.save
        format.html { redirect_to contas_path, notice: 'Conta was successfully created.' }
        format.json { render :index, status: :created, location: @conta }
      else
        format.html { render :new }
        format.json { render json: @conta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conta/1
  # PATCH/PUT /conta/1.json
  def update
    respond_to do |format|
      if @conta.update(conta_params)
        format.html { redirect_to @conta, notice: 'Conta was successfully updated.' }
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
    respond_to do |format|
      format.html { redirect_to conta_url, notice: 'Conta was successfully destroyed.' }
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
