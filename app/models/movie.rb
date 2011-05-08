class Movie < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :genre_id

  belongs_to :genre

  has_many :movie_tags
  has_many :tags, :through => :movie_tags

  has_many :movie_events
  has_many :events, :through => :movie_events

  has_many :votes


  named_scope :by_genres, lambda { |genres|
    if genres === Integer # we were just given a genre
      *genres = genres
    end

    if !genres or genres.length < 1
      return { :conditions => [""] }
    end

    genres_str = "(" + genres.join(", ") + ")"
    { :conditions => ['genre_id in ' + genres_str] }
  }

  named_scope :by_tags, lambda { |tags, matchAll|
    if tags === Integer # we were just given a tag
      *tags = tags
    end

    if !tags or tags.length < 1
      return { :conditions => [""] }
    end

    join_base = lambda { |number| "INNER JOIN movie_tags mt" + number.to_s +
                                  " ON movies.id = mt" + number.to_s + ".movie_id" }
    join_str = join_base.call(0)

    # defaults to match any tag
    conditions = ["mt0.tag_id in (" + tags.join(", ") + ")"]
    if matchAll
      conditions = [""]
      tags.sort!
      tags.each_index do |index|
        movie_tags_alias = "mt" + index.to_s
        prev_movie_tags_alias = "mt" + (index-1).to_s
        unless index == 0
          join_str = join_str + " " + join_base.call(index) +
                     " AND " + movie_tags_alias + ".tag_id > " + prev_movie_tags_alias + ".tag_id "
        end
        conditions[0] = conditions[0] + " AND" if conditions[0].length > 0
        conditions[0] = conditions[0] + " " + movie_tags_alias + ".tag_id = ?"
        conditions.push(tags[index])
      end
    end

    {
      :select => "movies.*",
      :joins => join_str,
      :conditions => conditions,
      :group => "movies.id",
      :order => "movies.title"
    }
  }

end
