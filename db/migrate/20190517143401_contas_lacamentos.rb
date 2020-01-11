class ContasLacamentos < ActiveRecord::Migration[5.2]
  def change
    add_reference :lancamentos, :conta, foreign_key: true
  end
end
