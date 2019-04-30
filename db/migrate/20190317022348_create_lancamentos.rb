class CreateLancamentos < ActiveRecord::Migration[5.2]
  def change
    create_table :lancamentos do |t|
      t.string :nome
      t.string :descricao
      t.float :valor
      t.datetime :data
      t.references :categoria, foreign_key: true
      t.references :tipo, foreign_key: true

      t.timestamps
    end
  end
end
