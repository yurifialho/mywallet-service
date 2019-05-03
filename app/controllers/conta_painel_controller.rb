class ContaPainelController < ApplicationController
    before_action :set_titulo

    @@titulo = I18n.t('model.conta_painel.titulo');
  
    # GET /conta
    # GET /conta.json
    def index

    end

end
