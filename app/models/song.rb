class Song <ActiveRecord::Base
  belongs_to :albums
  belongs_to :artist
end