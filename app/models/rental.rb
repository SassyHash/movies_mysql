class Rental < ActiveRecord::Base
  set_table_name(:rental)
  set_primary_key(:rental_id)

  belongs_to :customer
  belongs_to :inventory
end