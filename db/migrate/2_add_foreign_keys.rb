class AddForeignKeys < ActiveRecord::Migration
    def change
        change_table :sightings do |t|
            t.references :user
        end

        change_table :comments do |t|
          t.references :sighting
          t.references :user
        end
    end

end
