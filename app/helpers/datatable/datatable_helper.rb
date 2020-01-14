module Datatable
  module DatatableHelper

    def datatable(dados = nil, columns = [], modal = true)
      render "/layouts/datatable/datatable", dados: dados, columns: columns
    end
  end  
end