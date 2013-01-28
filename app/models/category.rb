class Category < ActiveRecord::Base
  set_table_name(:category)
  set_primary_key(:category_id)

  has_many :film_categories
  has_many :films, :through => :film_categories

  def self.popular_categories
   Category.select('category.*, COUNT(*) AS category_count')
    .joins(:film_categories)
    .group(:category_id)
    .order('category_count DESC')
  end
end