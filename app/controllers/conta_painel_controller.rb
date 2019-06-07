class ContaPainelController < ApplicationController
    before_action :set_titulo, :set_conta

    @@titulo = I18n.t('model.conta_painel.titulo');
  
    # GET /conta
    # GET /conta.json
    def index
        
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_conta
      @conta = params[:conta] ? Conta.find(params[:conta]) : Conta.first()
    end

end
