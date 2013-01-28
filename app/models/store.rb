class Store < ActiveRecord::Base
  set_table_name(:store)
  set_primary_key(:store_id)

  has_many :inventory
  has_many :films, :through => :inventory

end