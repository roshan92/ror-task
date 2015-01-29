class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.date :date
      t.string :code
      t.decimal :value, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
