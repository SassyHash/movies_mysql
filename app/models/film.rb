class Film < ActiveRecord::Base
  set_table_name(:film)
  set_primary_key(:film_id)

  has_many :film_actors
  has_many :actor, :through => :film_actor
  has_many :category

end