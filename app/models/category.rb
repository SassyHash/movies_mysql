class Category < ActiveRecord::Base
  set_table_name(:category)
  set_primary_key(:category_id)

  has_many :film_categories
  has_many :films, :through => :film_categories

  def self.most_popular
   Category.select('category.*, COUNT(*) AS category_count')
    .joins(:film_categories)
    .group(:category_id)
    .order('category_count DESC')
  end

  def self.most_rented
    Category.select('category.*, COUNT(*) AS category_count')
    .joins(:films => :rentals)
    .group(:category_id)
    .order('category_count DESC')
    .limit(1)
  end
end