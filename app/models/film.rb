class Film < ActiveRecord::Base
  set_table_name(:film)
  set_primary_key(:film_id)

  has_many :film_actors
  has_many :actors, :through => :film_actors
  has_many :categories

  def self.largest_cast
    Film.select('film.*, COUNT(*) AS cast_count')
    .joins(:film_actors)
    .group(:film_id)
    .order('cast_count DESC')
    .limit(1)
  end

end