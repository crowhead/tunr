class CreateArtist < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.has_many :albums
      t.has_many :songs
    end
  end
end
