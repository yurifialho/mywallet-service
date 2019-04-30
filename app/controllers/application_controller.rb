class ApplicationController < ActionController::Base

    @@titulo = ''
    @@per_page = 10;

    protected
    
    def set_titulo 
        @titulo = @@titulo
    end
end
