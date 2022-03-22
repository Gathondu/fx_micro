class CreateCurrencies < ActiveRecord::Migration[7.0]
  def change
    create_table :currencies, id: :uuid do |t|
      t.string :name
      t.string :iso_code
      t.integer :iso_number

      t.timestamps
    end
    add_index :currencies, [:iso_code, :iso_number]
  end
end
