class Transaction < ApplicationRecord
  belongs_to :customer
  belongs_to :input_currency, class_name: 'Currency', foreign_key: 'currency_id'
  belongs_to :output_currency, class_name: 'Currency', foreign_key: 'currency_id'
end
