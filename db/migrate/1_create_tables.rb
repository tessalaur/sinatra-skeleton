class CreateTables < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.timestamps
    end

    create_table :sightings do |t|
      t.string :species
      t.string :user_confidence
      t.string :location_desc
      t.datetime
      t.integer :animalnumber
      t.string :vessel
      t.timestamps
    end

  end

end
