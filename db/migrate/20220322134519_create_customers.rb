class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.references :country, null: false, foreign_key: true, type: :uuid
      t.text :address

      t.timestamps
    end
  end
end
