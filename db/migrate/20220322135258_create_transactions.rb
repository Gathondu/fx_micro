class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions, id: :uuid do |t|
      t.references :customer, null: false, foreign_key: true, type: :uuid
      t.float :input_amount
      t.references :input_currency, references: :currencies,  null: false, foreign_key: {to_table: :currencies}, type: :uuid
      t.float :output_amount
      t.references :output_currency, references: :currencies,  null: false, foreign_key: {to_table: :currencies}, type: :uuid

      t.timestamps
    end
  end
end
