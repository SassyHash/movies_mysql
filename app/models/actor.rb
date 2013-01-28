class Actor < ActiveRecord::Base
  set_table_name(:actor)
  set_primary_key(:actor_id)

  has_many :film_actors
  has_many :films, :through => :film_actors
  has_many :categories

  def self.most_films
    Actor.select('actor.*, COUNT(*) AS film_count')
    .joins(:film_actors)
    .group(:actor_id)
    .order('film_count DESC')
    .limit(1)
  end

  def self.longest_career
    Actor.select('actor.*, MAX(release_year) - MIN(release_year) AS career_length')
    .joins(:films)
    .group(:actor_id)
    .order('career_length DESC')
    .limit(1)
  end

end
