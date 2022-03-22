class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries, id: :uuid do |t|
      t.string :name
      t.string :alpha2
      t.string :alpha3
      t.string :iso_number
      t.integer :currencies_iso_number, array: true, default: []

      t.timestamps
    end
    add_index :countries, :alpha2
    add_index :countries, :alpha3
    add_index :countries, :iso_number
  end
end
