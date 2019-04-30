class CreateContas < ActiveRecord::Migration[5.2]
  def change
    create_table :contas do |t|
      t.string :nome

      t.timestamps
    end
  end
end
