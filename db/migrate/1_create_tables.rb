class CreateTables < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.timestamps
    end

    create_table :movies do |t|
      t.string :title
      t.string :director
      t.string :country
      t.string :synopsis
      t.integer :run_length
      t.string :mpaa_rating
      t.date :release_date
      t.timestamps
    end

    create_table :reviews do |t|
#      t.integer :user_id
#      t.integer :movie_id
      t.string :review
      t.integer :star_rating
      t.timestamps
    end

  end

end