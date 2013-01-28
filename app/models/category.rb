class Category < ActiveRecord::Base
  set_table_name(:category)
  set_primary_key(:category_id)

  has_many :film
  has_many :actor
end