require 'pry'

class Song
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = Song.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    artist = filename.split(" - ")[0]
    name = filename.split(" - ")[1].delete_suffix(".mp3")
    song = self.new
    song.name = name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

  attr_accessor :name, :artist_name

  def save
    self.class.all << self
  end
end