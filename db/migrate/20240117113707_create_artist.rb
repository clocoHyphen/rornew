class CreateArtist < ActiveRecord::Migration[7.1]
  def change
    create_table(:artists, :id => false) do |t|
      t.integer :userId
      t.bigint :artistId , primary_key: true
      t.text :first_release_year
      t.text :no_of_albums
      t.integer    :managerId
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
