class Film < ActiveRecord::Base
  set_table_name(:film)
  set_primary_key(:film_id)

  has_many :film_actors
  has_many :actors, :through => :film_actors
  has_many :categories

  has_many :inventories
  has_many :stores, :through => :inventories
  has_many :rentals, :through => :inventories

  def self.largest_cast
    Film.select('film.*, COUNT(*) AS cast_count')
    .joins(:film_actors)
    .group(:film_id)
    .order('cast_count DESC')
    .limit(1)
  end

  def self.most_stores
    Film.select('film.*, COUNT(DISTINCT store_id) AS store_count')
    .joins(:inventories)
    .group(:film_id)
    .order('store_count DESC')
    .limit(1)
  end

  def self.largest_inventory
    Film.select('film.*, COUNT(*) AS film_count')
    .joins(:inventories)
    .group(:film_id)
    .order('film_count DESC')
    .limit(1)
  end

  def self.most_watched
    Film.select('film.*, COUNT(DISTINCT customer_id) AS film_count')
    .joins(:rentals)
    .group(:film_id)
    .order('film_count DESC')
    .limit(1)
  end


end