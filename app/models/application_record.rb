class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  # since we are using uuid's for ids, this returns more predictable results with finder methods
  # https://github.com/rails/rails/pull/34480
  self.implicit_order_column = "created_at"
end
