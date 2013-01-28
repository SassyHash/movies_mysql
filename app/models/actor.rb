class Actor < ActiveRecord::Base
  set_table_name(:actor)
  set_primary_key(:actor_id)

  has_many :film_actors
  has_many :films, :through => :film_actors
  has_many :categories

  def self.most_films
    actors = Actor.select('actor.*, COUNT(*) AS film_count')
    .joins(:film_actors)
    .group(:actor_id)
    .order('film_count DESC')
    actors.first
  end

  
end