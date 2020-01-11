module Datatable
  module DatatableHelper

    def datatable(dados = nil, columns = [])
      render "/layouts/datatable/datatable", dados: dados, columns: columns
    end
  end  
end