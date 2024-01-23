class CreateUsers < ActiveRecord::Migration[7.1]
  def change
      create_table(:users, :id => false) do |t|
      t.bigint :userId, primary_key: true
      t.text :fname
      t.text :lname
      t.text :email
      t.datetime :created_at
      t.datetime :updated_at
      t.text :gender
      t.text :address
      t.text :dob
      t.text :password_digest
      t.text :managerId
      t.text :role_id #, :null => false
    end

    execute <<-SQL
      CREATE TRIGGER insert_artist
      AFTER INSERT ON users
      WHEN NEW.role_id = 'artist'
      BEGIN
        INSERT INTO artists (userId, managerId) VALUES (NEW.userId, new.managerId);
      END;
    SQL

    add_index :users, :email, unique: true
  end
end