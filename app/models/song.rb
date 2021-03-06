class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

 def notes_contents=(contents)
  song = self
  contents.each do |content|
    note = Note.find_or_create_by(content: content)
    self.notes << note
  end
 end
end
