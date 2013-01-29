class Customer < ActiveRecord::Base
  set_table_name(:customer)
  set_primary_key(:customer_id)

  has_many :rentals
  has_many :films, :through => :rentals, :source => :inventories
  belongs_to :address

  def self.highest_renting
    Customer.select('customer.*, COUNT(DISTINCT film_id) AS rental_count')
    .joins(:rentals => :inventories)
    .group(:customer_id)
    .order('rental_count DESC')
    .limit(5)
  end
end