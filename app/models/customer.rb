class Customer < ActiveRecord::Base
  set_table_name(:customer)
  set_primary_key(:customer_id)

  has_many :rentals
  # has_many :inventory, :through => :rentals
  has_many :films, :through => :rentals, :source => :inventory

  def self.most_movie_loving
    Customer.select('customer.*, COUNT(DISTINCT film_id) AS rental_count')
    .joins(:rentals => :inventory)
    .group(:customer_id)
    .order('rental_count DESC')
    .limit(5)
  end
end