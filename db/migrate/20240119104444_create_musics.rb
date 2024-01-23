class CreateMusics < ActiveRecord::Migration[7.1]
  def change
    create_table :musics do |t|
      t.text :musicId
      t.text :artistId
      t.text :album
      t.text :title
      t.text :genre
      t.date :releaseDate
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end