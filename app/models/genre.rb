class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    self.songs.count
  end

  def artist_count
    result = []
    self.songs.each do |song|
      result << song.artist
    end
    result.uniq.count
  end

  def all_artist_names
    result = []
    self.songs.each do |song|
      result << song.artist.name
    end
    result
  end
end
